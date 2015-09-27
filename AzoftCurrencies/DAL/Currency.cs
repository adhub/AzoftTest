namespace AzoftCurrencies.DAL
{
    using Newtonsoft.Json;
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Currency
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Currency()
        {
            CurrenciesUsers = new HashSet<CurrencyUser>();
            ExchangeRatesRub = new HashSet<ExchangeRateRub>();
        }

        public int Id { get; set; }

        [Required]
        [StringLength(3)]
        public string CodeIso4217 { get; set; }

        [JsonIgnore]
        [Required]
        [StringLength(10)]
        public string CodeCbr { get; set; }

        [Required]
        public string NameEn { get; set; }

        [Required]
        public string NameRu { get; set; }

        [JsonIgnore]
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CurrencyUser> CurrenciesUsers { get; set; }

        [JsonIgnore]
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ExchangeRateRub> ExchangeRatesRub { get; set; }
    }
}
