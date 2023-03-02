using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace ProductoAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductoController : ControllerBase
    {
        // GET: api/<ProductoController>
        [HttpGet]
        public IEnumerable<Producto> Get()
        {
            var lista = new List<Producto>();
            string cadenaConexion = "Data Source=DESKTOP-J47J4E2;Initial Catalog=BDPrueba;User ID=sa;Password=sql;Integrated Security=true";
            SqlConnection cn = new SqlConnection(cadenaConexion);
            cn.Open();
            SqlCommand cmd = new SqlCommand("USP_PRODUCTO_LIST", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader drlector = cmd.ExecuteReader();


            while (drlector.Read())
            {
                Producto oProducto = new Producto();
                oProducto.Id = Convert.ToInt32(drlector["id"]);
                oProducto.Codigo = drlector["codigo"].ToString().Trim();
                oProducto.Descripcion= drlector["descripcion"].ToString().Trim();
                oProducto.FechaRegistro = Convert.ToDateTime(drlector["fechaRegistro"]).ToString("dd/MM/yyyy");
                oProducto.Estado = Convert.ToBoolean(drlector["estado"]);
                lista.Add(oProducto);
            }
            return lista;
        }

        // GET api/<ProductoController>/5
        [HttpGet("{id}")]
        public string Get(int id)
        {
            return "value";
        }

        // POST api/<ProductoController>
        [HttpPost]
        public void Post([FromBody] Producto entidad)
        {
            var lista = new List<Producto>();
            string cadenaConexion = "Data Source=DESKTOP-J47J4E2;Initial Catalog=BDPrueba;User ID=sa;Password=sql;Integrated Security=true";
            SqlConnection cn = new SqlConnection(cadenaConexion);
            cn.Open();
            SqlCommand cmd = new SqlCommand("USP_PRODUCTO_INSERT", cn);
            cmd.Parameters.Add(new SqlParameter("@codigo", SqlDbType.VarChar, 100)).Value = entidad.Codigo;
            cmd.Parameters.Add(new SqlParameter("@descripcion", SqlDbType.VarChar, 200)).Value = entidad.Descripcion;
            cmd.Parameters.Add(new SqlParameter("@fechaRegistro", SqlDbType.DateTime)).Value = entidad.FechaRegistro;
            cmd.Parameters.Add(new SqlParameter("@estado", SqlDbType.Bit)).Value = entidad.Estado;

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.ExecuteNonQuery();
        }

        // PUT api/<ProductoController>/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE api/<ProductoController>/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
