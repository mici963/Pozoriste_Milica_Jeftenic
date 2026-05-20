using System;

namespace Pozoriste
{
    public partial class UpravljanjeTerminima : System.Web.UI.Page
    {
        Konekcija db =
            new Konekcija();

        protected void Page_Load(
            object sender,
            EventArgs e)
        {
            if (Session["Uloga"] == null)
            {
                Response.Redirect(
                    "Login.aspx"
                );

                return;
            }

            if (Session["Uloga"].ToString() != "admin")
            {
                Response.Redirect(
                    "Predstave.aspx"
                );

                return;
            }

            if (!IsPostBack)
            {
                LoadTermini();
            }
        }

        private void LoadTermini()
        {
            gvTermini.DataSource =
                db.PrikaziTermine();

            gvTermini.DataBind();
        }

        protected void btnDodaj_Click(
            object sender,
            EventArgs e)
        {
            db.DodajTermin(
                Convert.ToInt32(
                    txtPredstavaId.Text
                ),

                txtDatum.Text,

                txtSala.Text,

                Convert.ToInt32(
                    txtBrojMesta.Text
                )
            );

            lblMsg.Text =
                "Termin uspešno dodat.";

            LoadTermini();

            txtPredstavaId.Text = "";
            txtDatum.Text = "";
            txtSala.Text = "";
            txtBrojMesta.Text = "";
        }

        protected void btnObrisi_Command(
            object sender,
            System.Web.UI.WebControls.CommandEventArgs e)
        {
            int id =
                Convert.ToInt32(
                    e.CommandArgument
                );

            db.ObrisiTermin(id);

            lblMsg.Text =
                "Termin obrisan.";

            LoadTermini();
        }
    }
}