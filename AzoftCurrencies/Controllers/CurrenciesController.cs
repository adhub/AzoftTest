using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using AzoftCurrencies.DAL;
using System.Threading.Tasks;
using System.Xml.Linq;
using System.Globalization;

namespace AzoftCurrencies.Controllers
{
    [Authorize]
    public class CurrenciesController : ApiController
    {
        private CurrenciesContext db = new CurrenciesContext();

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                this.db.Dispose();
            }

            base.Dispose(disposing);
        }

        public IHttpActionResult GetRegisteredCurrencies()
        {
            var userId = Microsoft.AspNet.Identity.IdentityExtensions.GetUserId(User.Identity);
            var userCurrencies = db.CurrenciesUsers.Where(x => x.UserId == userId).Select(x => x.Currency);
            return Ok(userCurrencies);
        }

        [HttpGet]
        public void RegisterCurrency(int currencyId)
        {
            var userId = Microsoft.AspNet.Identity.IdentityExtensions.GetUserId(User.Identity);
            var currencyUser = db.CurrenciesUsers.FirstOrDefault(x => x.CurrencyId == currencyId && x.UserId == userId);
            if (currencyUser == null)
            {
                currencyUser = new CurrencyUser { CurrencyId = currencyId, UserId = userId };
                db.CurrenciesUsers.Add(currencyUser);
                db.SaveChanges();
            }
        }

        [HttpGet]
        public void UnregisterCurrency(int currencyId)
        {
            var userId = Microsoft.AspNet.Identity.IdentityExtensions.GetUserId(User.Identity);
            var currencyUser = db.CurrenciesUsers.FirstOrDefault(x => x.CurrencyId == currencyId && x.UserId == userId);
            if (currencyUser != null)
            {
                db.CurrenciesUsers.Attach(currencyUser);
                db.CurrenciesUsers.Remove(currencyUser);
                db.SaveChanges();
            }
        }

        private const string CBR_RATES_DYNAMICS_URL = "http://www.cbr.ru/scripts/XML_dynamic.asp?date_req1={0}&date_req2={1}&VAL_NM_RQ={2}";
        private static readonly CultureInfo invariantCulture = CultureInfo.InvariantCulture;
        private static object rateLock = new Object();

        public async Task<IHttpActionResult> GetRates(
            int currencyId,
            int fromYear, int fromMonth, int fromDay,
            int tillYear, int tillMonth, int tillDay
        )
        {
            var currency = await db.Currencies.FindAsync(currencyId);
            if (currency == null)
            {
                return NotFound();
            }
            var from = new DateTime(fromYear, fromMonth, fromDay);
            var till = new DateTime(tillYear, tillMonth, tillDay);
            if (from > till)
            {
                throw new ArgumentException("Интервал дат задан неверно.");
            }
            IEnumerable<ExchangeRateRub> rates = currency.ExchangeRatesRub.Where(x => x.Date >= from && x.Date <= till).ToArray();
            //rates содержит коллекцию курсов с возможными "дырками"
            if (rates.Count() <= (till - from).TotalDays)
            {
                //в БД меньшее количество записей о курсах валюты и, значит, есть "дырки"
                //далее производится поиск начала первой "дырки" и конца последней
                //запрос курсов в сервисе ЦБ будет производиться для такого интервала,
                //чтобы не делать множество запросов, соответствующих потенциально многочисленным
                //"дыркам" в запрошенном интервале
                DateTime holeStart = default(DateTime), holeEnd = default(DateTime);
                bool isThereHole = false;
                var rateDates = new HashSet<DateTime>(rates.Select(x => x.Date));
                for (var d = from; d <= till; d = d.AddDays(1))
                {
                    if (!rateDates.Contains(d))
                    {
                        holeStart = d;
                        isThereHole = true;
                        break;
                    }
                }
                if (isThereHole)
                {
                    for (var d = till; d <= from; d = d.AddDays(-1))
                    {
                        if (!rateDates.Contains(d))
                        {
                            holeEnd = d;
                            break;
                        }
                    }

                    //запрос динамики курсов в сервисе ЦБ
                    var requestUrl = String.Format(
                        CBR_RATES_DYNAMICS_URL,
                        holeStart.ToString(@"dd\/MM\/yyyy"),
                        holeEnd.ToString(@"dd\/MM\/yyyy"),
                        currency.CodeCbr
                    );
                    var holeRatesInfo = XDocument.Load(requestUrl);
                    var ratesAdded = new List<ExchangeRateRub>();
                    lock (rateLock)
                    {
                        foreach (var holeRate in holeRatesInfo.Root.Elements("Record"))
                        {
                            var date = DateTime.ParseExact(holeRate.Attribute("Date").Value, "dd.MM.yyyy", invariantCulture);
                            var value = Decimal.Parse(holeRate.Element("Value").Value.Replace(',', '.'), invariantCulture);
                            var existingRate = db.ExchangeRatesRub.FirstOrDefault(x => x.CurrencyId == currencyId && x.Date == date);
                            if (existingRate == null)
                            {
                                var rate = new ExchangeRateRub
                                {
                                    CurrencyId = currencyId,
                                    Date = date,
                                    Rate = value
                                };
                                db.ExchangeRatesRub.Add(rate);
                                ratesAdded.Add(rate);
                            }
                        }
                        db.SaveChanges();
                    }
                    rates = rates.Union(ratesAdded);
                }
            }
            //TODO: после выбора способа вывода курсов, возможно, убрать сортировку, если она будет производиться на клиенте
            return Ok(rates.OrderBy(x => x.Date));
        }

        public IHttpActionResult GetSuggestions(string query)
        {
            var currenciesByCode = db.Currencies.Where(x => x.CodeIso4217.Contains(query));
            var currenciesByNemaRu = db.Currencies.Where(x => x.NameRu.Contains(query));
            var currenciesByNemaEn = db.Currencies.Where(x => x.NameEn.Contains(query));
            var suggestions = currenciesByCode.Union(currenciesByNemaRu).Union(currenciesByNemaEn);
            return Ok(suggestions);
        }
    }
}
