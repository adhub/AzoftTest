namespace AzoftCurrencies.DAL
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class CurrenciesContext : DbContext
    {
        public CurrenciesContext()
            : base("name=DefaultConnection")
        {
        }

        public virtual DbSet<Currency> Currencies { get; set; }
        public virtual DbSet<ExchangeRateRub> ExchangeRatesRub { get; set; }
        public virtual DbSet<CurrencyUser> CurrenciesUsers { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Currency>()
                .Property(e => e.CodeIso4217)
                .IsFixedLength();

            modelBuilder.Entity<Currency>()
                .Property(e => e.CodeCbr)
                .IsFixedLength();

            modelBuilder.Entity<Currency>()
                .HasMany(e => e.CurrenciesUsers)
                .WithRequired(e => e.Currency)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Currency>()
                .HasMany(e => e.ExchangeRatesRub)
                .WithRequired(e => e.Currency)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<ExchangeRateRub>()
                .Property(e => e.Rate)
                .HasPrecision(19, 4);
        }
    }
}
