using Data.Models;
using System;
using Microsoft.EntityFrameworkCore;
using System.Threading.Tasks;

namespace TestConsole
{
    public class Program
    {
        public static async Task Main(string[] args)
        {
            NutzungsartenContext context = new NutzungsartenContext();
            var xxx = await context.Buonutzungsarten.ToListAsync();
            var bbb = "bbb";
        }
    }
}
