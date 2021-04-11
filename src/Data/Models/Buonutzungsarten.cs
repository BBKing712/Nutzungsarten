using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace Data.Models
{
    public partial class Buonutzungsarten
    {
        public Buonutzungsarten()
        {
            ExterneNutzungsarten = new HashSet<ExterneNutzungsarten>();
        }

        public long Id { get; set; }
        public string Bezeichnung { get; set; }
        public Guid Guid { get; set; }
        public DateTime? ErstelltAm { get; set; }
        public DateTime? AktualisiertAm { get; set; }

        public virtual ICollection<ExterneNutzungsarten> ExterneNutzungsarten { get; set; }
    }
}
