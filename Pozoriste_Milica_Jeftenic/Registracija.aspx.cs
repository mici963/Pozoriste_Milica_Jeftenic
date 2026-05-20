using System;

namespace Pozoriste
{
    public partial class Registracija : System.Web.UI.Page
    {
        protected void btnRegister_Click(
            object sender,
            EventArgs e)
        {
            Konekcija db =
                new Konekcija();

            db.Registracija(
                txtUser.Text,
                txtPass.Text
            );

            lblMsg.Text =
                "Uspešna registracija.";

            txtUser.Text = "";
            txtPass.Text = "";
        }
    }
}