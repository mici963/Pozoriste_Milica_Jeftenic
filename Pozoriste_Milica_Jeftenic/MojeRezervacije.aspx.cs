using System;

namespace Pozoriste
{
    public partial class MojeRezervacije : System.Web.UI.Page
    {
        Konekcija db =
            new Konekcija();

        protected void Page_Load(
            object sender,
            EventArgs e)
        {
            if (Session["KorisnikId"] == null)
            {
                Response.Redirect(
                    "Login.aspx"
                );

                return;
            }

            if (!IsPostBack)
            {
                LoadRezervacije();
            }
        }

        private void LoadRezervacije()
        {
            int korisnikId =
                Convert.ToInt32(
                    Session["KorisnikId"]
                );

            gvRezervacije.DataSource =
                db.MojeRezervacije(
                    korisnikId
                );

            gvRezervacije.DataBind();
        }

        protected void btnObrisi_Command(
            object sender,
            System.Web.UI.WebControls.CommandEventArgs e)
        {
            int id =
                Convert.ToInt32(
                    e.CommandArgument
                );

            db.ObrisiRezervaciju(id);

            lblMsg.Text =
                "Rezervacija otkazana.";

            LoadRezervacije();
        }
    }
}