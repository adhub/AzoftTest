namespace AzoftCurrencies.DAL
{
    using Newtonsoft.Json;
    using System;
    using System.ComponentModel.DataAnnotations.Schema;

    /// <summary>
    /// ���� ������ �� ����.
    /// </summary>
    [Table("ExchangeRatesRub")]
    public partial class ExchangeRateRub
    {
        public int Id { get; set; }

        /// <summary>
        /// �� ������.
        /// </summary>
        public int CurrencyId { get; set; }

        /// <summary>
        /// ���� �����.
        /// </summary>
        [Column(TypeName = "date")]
        public DateTime Date { get; set; }

        /// <summary>
        /// �������� �����.
        /// </summary>
        [Column(TypeName = "money")]
        public decimal? Value { get; set; }

        [JsonIgnore]
        public virtual Currency Currency { get; set; }
    }
}
