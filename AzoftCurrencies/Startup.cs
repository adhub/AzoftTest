using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(AzoftCurrencies.Startup))]
namespace AzoftCurrencies
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
