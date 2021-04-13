
namespace API.Controllers
{
    using Data.Models;
    using Microsoft.AspNetCore.Http;
    using Microsoft.AspNetCore.Mvc;
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Threading.Tasks;
    using Microsoft.EntityFrameworkCore;

    [Route("api/[controller]")]
    public class BuonutzungsartController : Controller
    {
        private readonly NutzungsartenContext _context;

        public BuonutzungsartController(NutzungsartenContext context)
        {
            this._context = context;
        }

        // GET: api/Buonutzungsart/
        [HttpGet()]
        public async Task<ActionResult<IEnumerable<Data.Models.Buonutzungsart>>> HoleBuonutzungsart()
        {
            return await this._context.Buonutzungsarten.ToListAsync();
        }



    }
}
