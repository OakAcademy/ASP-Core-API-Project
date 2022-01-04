using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using OAKAPI.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace OAKAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LoginController : ControllerBase
    {
        [HttpPut]
        public IActionResult Get(LoginModel loginmodel)
        {
            if (ModelState.IsValid)
            {
                var db = new APIDbContext();
                Person person = db.Persons.FirstOrDefault(x => x.Email == loginmodel.Email && x.Password == loginmodel.Password);
                if (person == null)
                    return NotFound();
                else
                    return Ok();
            }
            else
                return BadRequest();
        }
    }
}
