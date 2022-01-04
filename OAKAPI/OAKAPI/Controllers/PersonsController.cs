using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using OAKAPI.Model;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace OAKAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PersonsController : ControllerBase
    {
        public IActionResult GetPersons()
        {
            var db = new APIDbContext();
            var list = db.Persons.Include(x => x.Salary).Include(x => x.Position)
                   .ThenInclude(x => x.Department)
                   .Select(x => new PersonALL()
                   {
                       Id = x.Id,
                       Name = x.Name,
                       PositionName = x.Position.Name,
                       Salary = x.Salary.Amount,
                       DepartmentName = x.Position.Department.DepartmentName
                   }).ToList();
            return Ok(list);
        }
        [HttpGet("{Id}")]
        public IActionResult Get(int Id)
        {
            var db = new APIDbContext();
            Person person = db.Persons.FirstOrDefault(x => x.Id == Id);
            if (person == null)
                return NotFound();
            else
                return Ok(person);

        }
        [HttpPost]
        public IActionResult Post(Person person)
        {
            if (ModelState.IsValid)
            {
                var db = new APIDbContext();
                db.Persons.Add(person);
                db.SaveChanges();
                return Created("", person);
            }
            else
                return BadRequest();
        }
        [HttpPost("upload")]
        public async Task<IActionResult> FileUpload([FromForm] IFormFile file)
        {
            string filename = Guid.NewGuid().ToString() + file.FileName;
            var filepath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/" + filename);
            FileStream stream = new FileStream(filepath, FileMode.Create);
            await file.CopyToAsync(stream);
            return Created("", file);
        }

        [HttpPut]
        public IActionResult UpdatePerson(Person person)
        {

            if (ModelState.IsValid)
            {
                var db = new APIDbContext();
                Person updateperson = db.Persons.Find(person.Id);
                updateperson.Adress = person.Adress;
                updateperson.Age = person.Age;
                updateperson.Email = person.Email;
                updateperson.Name = person.Name;
                updateperson.Password = person.Password;
                updateperson.PositionId = person.PositionId;
                updateperson.SalaryId = person.SalaryId;
                updateperson.Surname = person.Surname;
                db.SaveChanges();
                return NoContent();
            }
            else
                return BadRequest();
        }
        [HttpPost("uploadfile")]
        public async Task<IActionResult> Uploadfile([FromForm] IFormFile file)
        {
            string filename = Guid.NewGuid().ToString() + file.FileName;
            var filepath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/" + filename);
            FileStream stream = new FileStream(filepath, FileMode.Create);
            await file.CopyToAsync(stream);
            return Created("", null);
        }
    }
}
