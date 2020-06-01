using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using WebAPI_PragueParking_Domain.Repository;
using WebAPI_PragueParking_Domain.Service;

namespace WebAPI_PragueParking
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddSingleton<ITicketsService, TicketsService>();
            services.AddSingleton<ITicketsRepository>(c => new TicketsRepository(Configuration["ConnectionString"]));

            services.AddSingleton<IVehicleTypesService, VehicleTypesService>();
            services.AddSingleton<IVehicleTypesRepository>(c => new VehicleTypesRepository(Configuration["ConnectionString"]));

            services.AddSingleton<IDepartmentsService, DepartmentsService>();
            services.AddSingleton<IDepartmentsRepository>(c => new DepartmentsRepository(Configuration["ConnectionString"]));

            services.AddSingleton<IParkingSpotsService, ParkingSpotsService>();
            services.AddSingleton<IParkingSpotsRepository>(c => new ParkingSpotsRepository(Configuration["ConnectionString"]));

            services.AddControllers();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            app.UseHttpsRedirection();

            app.UseRouting();

            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
