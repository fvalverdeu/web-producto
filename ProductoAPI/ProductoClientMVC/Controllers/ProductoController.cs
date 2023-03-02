using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ProductoClientMVC.Models;
using System.Net.Http;
using System.Net.Http.Headers;
using Newtonsoft.Json;

namespace ProductoClientMVC.Controllers
{
    public class ProductoController : Controller
    {
        string Baseurl = "https://localhost:44317/";
        public async Task<ActionResult> Index()
        {
            List<Producto> ProdInfo = new List<Producto>();
            using (var client = new HttpClient())
            {
                //Passing service base url
                client.BaseAddress = new Uri(Baseurl);
                client.DefaultRequestHeaders.Clear();
                //Define request data format
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                //Sending request to find web api REST service resource GetAllProductos using HttpClient
                HttpResponseMessage Res = await client.GetAsync("api/producto");
                //Checking the response is successful or not which is sent using HttpClient
                if (Res.IsSuccessStatusCode)
                {
                    //Storing the response details recieved from web api
                    var ProdResponse = Res.Content.ReadAsStringAsync().Result;
                    //Deserializing the response recieved from web api and storing into the Producto list
                    ProdInfo = JsonConvert.DeserializeObject<List<Producto>>(ProdResponse);
                }
                //returning the Producto list to view
                return View(ProdInfo);
            }
        }
    }
}
