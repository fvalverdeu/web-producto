using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ProductoAPI.Controllers
{
    public class ProductoVistaController : Controller
    {
        // GET: ProductoVistaController
        public ActionResult Index()
        {
            return View();
        }

        // GET: ProductoVistaController/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: ProductoVistaController/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: ProductoVistaController/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        // GET: ProductoVistaController/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: ProductoVistaController/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(int id, IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        // GET: ProductoVistaController/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: ProductoVistaController/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(int id, IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }
    }
}
