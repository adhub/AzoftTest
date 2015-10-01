namespace AzoftCurrencies.DAL
{
    using Newtonsoft.Json;
    using System;
    using System.ComponentModel.DataAnnotations.Schema;

    /// <summary>
    /// Курс валюты на дату.
    /// </summary>
    [Table("ExchangeRatesRub")]
    public partial class ExchangeRateRub
    {
        public int Id { get; set; }

        /// <summary>
        /// ИД валюты.
        /// </summary>
        public int CurrencyId { get; set; }

        /// <summary>
        /// Дата курса.
        /// </summary>
        [Column(TypeName = "date")]
        public DateTime Date { get; set; }

        /// <summary>
        /// Значение курса.
        /// </summary>
        [Column(TypeName = "money")]
        public decimal? Value { get; set; }

        [JsonIgnore]
        public virtual Currency Currency { get; set; }
    }
}
