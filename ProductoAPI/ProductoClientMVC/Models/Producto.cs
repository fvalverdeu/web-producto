﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ProductoClientMVC.Models
{
    public class Producto
    {
        public int Id { get; set; }
        public string Codigo { get; set; }
        public string Descripcion { get; set; }

        public string FechaRegistro { get; set; }
        public bool Estado { get; set; }
    }
}
