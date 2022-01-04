using APITest.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace APITest.Controllers
{
    public class PersonController : Controller
    {
        public async Task<IActionResult> Index()
        {
            HttpClient client = new HttpClient();
            HttpResponseMessage message = await client.GetAsync(" http://localhost:24537/api/persons");
            if(message.IsSuccessStatusCode)
            {
                var jstring = await message.Content.ReadAsStringAsync();
                List<PersonALL> list = JsonConvert.DeserializeObject<List<PersonALL>>(jstring);
                return View(list);
            }
            else
            return View(new List<PersonALL>());
        }
        public IActionResult Add()
        {
            Person person = new Person();
            return View(person);
        }
        [HttpPost]
        public async Task<IActionResult> Add(Person person)
        {
            if(ModelState.IsValid)
            {
                HttpClient client = new HttpClient();
                var jsonPerson = JsonConvert.SerializeObject(person);
                StringContent content = new StringContent(jsonPerson,Encoding.UTF8,"application/json");
                HttpResponseMessage message = await client.PostAsync("http://localhost:24537/api/persons", content);
                if(message.IsSuccessStatusCode)
                {
                    return RedirectToAction("Index");
                }
                else
                {
                    ModelState.AddModelError("", "There is an API Error");
                    return View(person);
                }

            }
            else
            {
                return View(person);
            }
        }

        public async Task<IActionResult> Update(int Id)
        {
            HttpClient client = new HttpClient();
            HttpResponseMessage message = await client.GetAsync("http://localhost:24537/api/persons/" + Id);
            if (message.IsSuccessStatusCode)
            {
                var jstring = await message.Content.ReadAsStringAsync();
                Person person = JsonConvert.DeserializeObject<Person>(jstring);
                return View(person);
            }
            else
                return RedirectToAction("Add");
        }
        [HttpPost]
        public async Task<IActionResult> Update(Person person)
        {
            if (ModelState.IsValid)
            {
                HttpClient client = new HttpClient();
                var jsonperson = JsonConvert.SerializeObject(person);
                StringContent content = new StringContent(jsonperson, Encoding.UTF8, "application/json");
                HttpResponseMessage message = await client.PutAsync("http://localhost:24537/api/persons",content);
                if(message.IsSuccessStatusCode)
                {
                    return RedirectToAction("Index");
                }
                else
                {
                    return View(person);
                }
            }
            else
                return View(person);
        }
        public IActionResult Upload()
        {
            return View();
        }
        [HttpPost]

        public async Task<IActionResult> Upload([FromForm]IFormFile file)
        {
            HttpClient client = new HttpClient();
            var bytes = await System.IO.File.ReadAllBytesAsync(file.FileName);
            ByteArrayContent content = new ByteArrayContent(bytes);
            MultipartFormDataContent data = new MultipartFormDataContent();
            data.Add(content, "file", file.FileName);
            HttpResponseMessage message = await client.PostAsync("http://localhost:24537/api/persons/uploadfile", data);
            if (message.IsSuccessStatusCode)
                return RedirectToAction("Index");
            else
            return View();
        }
      
       

    }
}
