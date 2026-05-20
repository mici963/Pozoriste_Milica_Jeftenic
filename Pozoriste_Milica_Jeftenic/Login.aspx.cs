using System;
using System.Data;

namespace Pozoriste
{
    public partial class Login : System.Web.UI.Page
    {
        protected void btnLogin_Click(
            object sender,
            EventArgs e)
        {
            Konekcija db =
                new Konekcija();

            DataTable dt =
                db.ProveraKorisnika(
                    txtUser.Text,
                    txtPass.Text
                );

            if (dt.Rows.Count > 0)
            {
                Session["KorisnikId"] =
                    dt.Rows[0]["korisnik_id"];

                Session["Uloga"] =
                    dt.Rows[0]["uloga"].ToString();

                Session["Korisnik"] =
                    dt.Rows[0]["korisnicko_ime"].ToString();


                if (dt.Rows[0]["uloga"].ToString() == "admin")
                {
                    Response.Redirect(
                        "Admin.aspx"
                    );
                }

           
                else
                {
                    Response.Redirect(
                        "Predstave.aspx"
                    );
                }
            }
            else
            {
                lblMsg.Text =
                    "Pogrešan login";
            }
        }
    }
}