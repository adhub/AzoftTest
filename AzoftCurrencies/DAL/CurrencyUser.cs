namespace AzoftCurrencies.DAL
{
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    /// <summary>
    /// �������� ������� ����� ������������ � ������.
    /// </summary>
    [Table("CurrenciesUsers")]
    public partial class CurrencyUser
    {
        [Key]
        [Column(Order = 0)]
        public string UserId { get; set; }

        [Key]
        [Column(Order = 1)]
        public int CurrencyId { get; set; }

        public virtual Currency Currency { get; set; }
    }
}
