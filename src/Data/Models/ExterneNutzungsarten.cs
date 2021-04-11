﻿using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace Data.Models
{
    public partial class ExterneNutzungsarten
    {
        public long Id { get; set; }
        public string Bezeichnung { get; set; }
        public Guid Guid { get; set; }
        public DateTime? ErstelltAm { get; set; }
        public DateTime? AktualisiertAm { get; set; }
        public long? DebitorengruppenId { get; set; }
        public long? BuonutzungsartenId { get; set; }

        public virtual Buonutzungsarten Buonutzungsarten { get; set; }
        public virtual Debitorengruppen Debitorengruppen { get; set; }
    }
}
