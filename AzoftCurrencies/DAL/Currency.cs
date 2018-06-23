namespace AzoftCurrencies.DAL
{
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using Newtonsoft.Json;

    /// <summary>
    /// ������.
    /// </summary>
    public partial class Currency
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Currency()
        {
            CurrenciesUsers = new HashSet<CurrencyUser>();
            ExchangeRatesRub = new HashSet<ExchangeRateRub>();
        }

        public int Id { get; set; }

        /// <summary>
        /// ��� ������ �� ��������� ISO 4217.
        /// </summary>
        [Required]
        [StringLength(3)]
        public string CodeIso4217 { get; set; }

        /// <summary>
        /// ��� ������ � ������� ���-�������� ��.
        /// </summary>
        [JsonIgnore]
        [Required]
        [StringLength(10)]
        public string CodeCbr { get; set; }

        /// <summary>
        /// �������� ������ �� ���������� �����.
        /// </summary>
        [Required]
        public string NameEn { get; set; }

        /// <summary>
        /// �������� ������ �� ������� �����.
        /// </summary>
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
