using System;

namespace Pozoriste
{
    public partial class UpravljanjePredstavama : System.Web.UI.Page
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
                LoadPredstave();
            }
        }

        private void LoadPredstave()
        {
            gvPredstave.DataSource =
                db.PrikaziPredstave();

            gvPredstave.DataBind();
        }

        protected void btnDodaj_Click(
            object sender,
            EventArgs e)
        {
            db.DodajPredstavu(
                txtNaziv.Text,
                txtZanr.Text,
                Convert.ToInt32(
                    txtTrajanje.Text
                ),
                txtOpis.Text
            );

            lblMsg.Text =
                "Predstava uspešno dodata.";

            LoadPredstave();

            txtNaziv.Text = "";
            txtZanr.Text = "";
            txtTrajanje.Text = "";
            txtOpis.Text = "";
        }

        protected void btnObrisi_Command(
            object sender,
            System.Web.UI.WebControls.CommandEventArgs e)
        {
            int id =
                Convert.ToInt32(
                    e.CommandArgument
                );

            db.ObrisiPredstavu(id);

            lblMsg.Text =
                "Predstava obrisana.";

            LoadPredstave();
        }
    }
}