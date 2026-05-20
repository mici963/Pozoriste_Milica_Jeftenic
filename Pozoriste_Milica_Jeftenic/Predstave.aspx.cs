using System;

namespace Pozoriste
{
    public partial class Predstave : System.Web.UI.Page
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
                LoadPredstave();
            }
        }

        private void LoadPredstave()
        {
            gvPredstave.DataSource =
                db.PrikaziTermine();

            gvPredstave.DataBind();
        }

        protected void btnRezervisi_Command(
            object sender,
            System.Web.UI.WebControls.CommandEventArgs e)
        {
            int korisnikId =
                Convert.ToInt32(
                    Session["KorisnikId"]
                );

            int terminId =
                Convert.ToInt32(
                    e.CommandArgument
                );

            int brojKarata =
                Convert.ToInt32(
                    txtBrojKarata.Text
                );

            db.DodajRezervaciju(
                korisnikId,
                terminId,
                brojKarata
            );

            lblMsg.Text =
                "Uspešno rezervisano.";
        }
    }
}