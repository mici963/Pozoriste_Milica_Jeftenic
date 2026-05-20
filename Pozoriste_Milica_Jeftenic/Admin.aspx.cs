using System;

namespace Pozoriste
{
    public partial class Admin : System.Web.UI.Page
    {
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
        }
    }
}