
// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace Data.Models
{
    using System;
    using System.Collections.Generic;

    public partial class Buonutzungsart
    {
        public Buonutzungsart()
        {
            ExterneNutzungsarten = new HashSet<ExterneNutzungsart>();
        }

        public long Id { get; set; }
        public string Bezeichnung { get; set; }
        public Guid Guid { get; set; }
        public DateTime? ErstelltAm { get; set; }
        public DateTime? AktualisiertAm { get; set; }

        public virtual ICollection<ExterneNutzungsart> ExterneNutzungsarten { get; set; }
    }
}
