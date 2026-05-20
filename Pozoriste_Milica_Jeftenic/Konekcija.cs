using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Pozoriste
{
    public class Konekcija
    {
        private readonly string cs =
            ConfigurationManager
            .ConnectionStrings["veza"]
            .ConnectionString;



        private DataTable ExecuteReader(
            string sp,
            SqlParameter[] p)
        {
            using (SqlConnection conn =
                new SqlConnection(cs))
            using (SqlCommand cmd =
                new SqlCommand(sp, conn))
            {
                cmd.CommandType =
                    CommandType.StoredProcedure;

                if (p != null)
                    cmd.Parameters.AddRange(p);

                DataTable dt =
                    new DataTable();

                conn.Open();

                SqlDataAdapter da =
                    new SqlDataAdapter(cmd);

                da.Fill(dt);

                return dt;
            }
        }


        private void ExecuteNonQuery(
            string sp,
            SqlParameter[] p)
        {
            using (SqlConnection conn =
                new SqlConnection(cs))
            using (SqlCommand cmd =
                new SqlCommand(sp, conn))
            {
                cmd.CommandType =
                    CommandType.StoredProcedure;

                if (p != null)
                    cmd.Parameters.AddRange(p);

                conn.Open();

                cmd.ExecuteNonQuery();
            }
        }
        public DataTable ProveraKorisnika(
            string ime,
            string pass)
        {
            return ExecuteReader(
                "ProveraKorisnika",
                new[]
                {
                    new SqlParameter("@ime", ime),
                    new SqlParameter("@pass", pass)
                });
        }

 

        public void Registracija(
            string ime,
            string pass)
        {
            ExecuteNonQuery(
                "Registracija",
                new[]
                {
                    new SqlParameter("@ime", ime),
                    new SqlParameter("@pass", pass)
                });
        }


        public DataTable PrikaziPredstave()
        {
            return ExecuteReader(
                "PrikaziPredstave",
                null
            );
        }

        public void DodajPredstavu(
            string naziv,
            string zanr,
            int trajanje,
            string opis)
        {
            ExecuteNonQuery(
                "DodajPredstavu",
                new[]
                {
                    new SqlParameter("@naziv", naziv),
                    new SqlParameter("@zanr", zanr),
                    new SqlParameter("@trajanje", trajanje),
                    new SqlParameter("@opis", opis)
                });
        }

        public void ObrisiPredstavu(
            int id)
        {
            ExecuteNonQuery(
                "ObrisiPredstavu",
                new[]
                {
                    new SqlParameter("@id", id)
                });
        }

        public DataTable PrikaziTermine()
        {
            return ExecuteReader(
                "PrikaziTermine",
                null
            );
        }

        public void DodajTermin(
            int predstavaId,
            string datum,
            string sala,
            int brojMesta)
        {
            ExecuteNonQuery(
                "DodajTermin",
                new[]
                {
                    new SqlParameter("@predstava_id", predstavaId),
                    new SqlParameter("@datum", datum),
                    new SqlParameter("@sala", sala),
                    new SqlParameter("@broj_mesta", brojMesta)
                });
        }

        public void ObrisiTermin(
            int id)
        {
            ExecuteNonQuery(
                "ObrisiTermin",
                new[]
                {
                    new SqlParameter("@id", id)
                });
        }


        public void DodajRezervaciju(
            int korisnikId,
            int terminId,
            int brojKarata)
        {
            ExecuteNonQuery(
                "DodajRezervaciju",
                new[]
                {
                    new SqlParameter("@korisnik_id", korisnikId),
                    new SqlParameter("@termin_id", terminId),
                    new SqlParameter("@broj_karata", brojKarata)
                });
        }

        public DataTable MojeRezervacije(
            int korisnikId)
        {
            return ExecuteReader(
                "MojeRezervacije",
                new[]
                {
                    new SqlParameter("@korisnik_id", korisnikId)
                });
        }

        public void ObrisiRezervaciju(
            int id)
        {
            ExecuteNonQuery(
                "ObrisiRezervaciju",
                new[]
                {
                    new SqlParameter("@id", id)
                });
        }
    }
}