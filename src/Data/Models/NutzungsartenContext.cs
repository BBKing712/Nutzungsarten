using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace Data.Models
{
    public partial class NutzungsartenContext : DbContext
    {
        public NutzungsartenContext()
        {
        }

        public NutzungsartenContext(DbContextOptions<NutzungsartenContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Buonutzungsart> Buonutzungsarten { get; set; }
        public virtual DbSet<Debitorengruppe> Debitorengruppen { get; set; }
        public virtual DbSet<ExterneNutzungsart> ExterneNutzungsarten { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
                optionsBuilder.UseSqlServer("Server=MES-NB012;Database= Nutzungsarten;Trusted_Connection=True;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Buonutzungsart>(entity =>
            {
                entity.ToTable("BUONutzungsarten");

                entity.HasIndex(e => e.Bezeichnung)
                    .HasName("UQ_BUONutzungsarten_Bezeichnung")
                    .IsUnique();

                entity.HasIndex(e => e.Guid)
                    .HasName("UQ_BUONutzungsarten_Guid")
                    .IsUnique();

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.AktualisiertAm)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getutcdate())");

                entity.Property(e => e.Bezeichnung)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.ErstelltAm)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getutcdate())");

                entity.Property(e => e.Guid).HasDefaultValueSql("(newid())");
            });

            modelBuilder.Entity<Debitorengruppe>(entity =>
            {
                entity.HasIndex(e => e.Bezeichnung)
                    .HasName("UQ_Debitorengruppen_Bezeichnung")
                    .IsUnique();

                entity.HasIndex(e => e.Guid)
                    .HasName("UQ_Debitorengruppen_Guid")
                    .IsUnique();

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.AktualisiertAm)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getutcdate())");

                entity.Property(e => e.Bezeichnung)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.ErstelltAm)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getutcdate())");

                entity.Property(e => e.Guid).HasDefaultValueSql("(newid())");

                entity.Property(e => e.IstStandard).HasDefaultValueSql("((0))");
            });

            modelBuilder.Entity<ExterneNutzungsart>(entity =>
            {
                entity.HasIndex(e => e.Guid)
                    .HasName("UQ_ExterneNutzungsarten_Guid")
                    .IsUnique();

                entity.HasIndex(e => new { e.Bezeichnung, e.DebitorengruppenId })
                    .HasName("UQ_ExterneNutzungsarten_Bezeichnung_Debitorengruppen_ID")
                    .IsUnique();

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.AktualisiertAm)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getutcdate())");

                entity.Property(e => e.Bezeichnung)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.BuonutzungsartenId).HasColumnName("BUONutzungsarten_ID");

                entity.Property(e => e.DebitorengruppenId).HasColumnName("Debitorengruppen_ID");

                entity.Property(e => e.ErstelltAm)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getutcdate())");

                entity.Property(e => e.Guid).HasDefaultValueSql("(newid())");

                entity.HasOne(d => d.Buonutzungsarten)
                    .WithMany(p => p.ExterneNutzungsarten)
                    .HasForeignKey(d => d.BuonutzungsartenId)
                    .HasConstraintName("FK_ExterneNutzungsarten_BUONutzungsarten_ID");

                entity.HasOne(d => d.Debitorengruppen)
                    .WithMany(p => p.ExterneNutzungsarten)
                    .HasForeignKey(d => d.DebitorengruppenId)
                    .HasConstraintName("FK_ExterneNutzungsarten_Debitorengruppen_ID");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
