using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using OAKAPI.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace OAKAPI.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class WeatherForecastController : ControllerBase
    {
        private static readonly string[] Summaries = new[]
        {
            "Freezing", "Bracing", "Chilly", "Cool", "Mild", "Warm", "Balmy", "Hot", "Sweltering", "Scorching"
        };

        private readonly ILogger<WeatherForecastController> _logger;

        public WeatherForecastController(ILogger<WeatherForecastController> logger)
        {
            _logger = logger;
        }

        [HttpGet]
        public IEnumerable<WeatherForecast> Get()
        {
           
            using (APIDbContext db=new APIDbContext())
            {

                var list = db.Persons.Include(x => x.Salary).Include(x=>x.Position)
                    .ThenInclude(x=>x.Department)
                    .Select(x=>new PersonALL()
                    { 
                    Id=x.Id,
                    Name=x.Name,
                    PositionName=x.Position.Name,
                    Salary=x.Salary.Amount,
                    DepartmentName=x.Position.Department.DepartmentName
                    }).ToList();
                Person person = db.Persons.Find(1);
                //Department department = db.Departments.Find(1);
                //department.DepartmentName = "Department1Update";
                //db.SaveChanges();
                //Salary salary = db.Salaries.Find(4);
                //db.Salaries.Remove(salary);
                //db.SaveChanges();




                //Department department = new Department();
                //department.DepartmentName = "Department2";
                //db.Departments.Add(department);
                //db.SaveChanges();

            }

            var rng = new Random();
            return Enumerable.Range(1, 5).Select(index => new WeatherForecast
            {
                Date = DateTime.Now.AddDays(index),
                TemperatureC = rng.Next(-20, 55),
                Summary = Summaries[rng.Next(Summaries.Length)]
            })
            .ToArray();
        }
    }
}
