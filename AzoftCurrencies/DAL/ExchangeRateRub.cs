namespace AzoftCurrencies.DAL
{
    using Newtonsoft.Json;
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ExchangeRatesRub")]
    public partial class ExchangeRateRub
    {
        public int Id { get; set; }

        public int CurrencyId { get; set; }

        [Column(TypeName = "date")]
        public DateTime Date { get; set; }

        [Column(TypeName = "money")]
        public decimal? Value { get; set; }

        [JsonIgnore]
        public virtual Currency Currency { get; set; }
    }
}
