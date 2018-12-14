using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(TechnicalAssignment.Startup))]
namespace TechnicalAssignment
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
