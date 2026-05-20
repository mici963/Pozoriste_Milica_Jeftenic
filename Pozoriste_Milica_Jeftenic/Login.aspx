<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Pozoriste.Login" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Login</title>

    <link href="style.css" rel="stylesheet" />
</head>
<body>

<form id="form1" runat="server">

    <div class="login-box">

        <h2>Prijava</h2>

        <asp:TextBox ID="txtUser"
            runat="server"
            placeholder="Korisničko ime">
        </asp:TextBox>

        <br /><br />

        <asp:TextBox ID="txtPass"
            runat="server"
            TextMode="Password"
            placeholder="Lozinka">
        </asp:TextBox>

        <br /><br />

        <asp:Button ID="btnLogin"
            runat="server"
            Text="Login"
            CssClass="btn"
            OnClick="btnLogin_Click" />

        <br /><br />

        <asp:HyperLink ID="HyperLink1"
            runat="server"
            NavigateUrl="~/Registracija.aspx">
            Nemate nalog? Registrujte se
        </asp:HyperLink>

        <br /><br />

        <asp:Label ID="lblMsg"
            runat="server">
        </asp:Label>

    </div>

</form>

</body>
</html>
