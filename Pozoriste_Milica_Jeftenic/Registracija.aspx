<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registracija.aspx.cs" Inherits="Pozoriste.Registracija" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Registracija</title>

    <link href="style.css" rel="stylesheet" />
</head>
<body>

<form id="form1" runat="server">

    <div class="login-box">

        <h2>Registracija</h2>

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

        <asp:Button ID="btnRegister"
            runat="server"
            Text="Registruj se"
            CssClass="btn"
            OnClick="btnRegister_Click" />

        <br /><br />

        <asp:HyperLink ID="HyperLink1"
            runat="server"
            NavigateUrl="~/Login.aspx">
            Već imate nalog? Login
        </asp:HyperLink>

        <br /><br />

        <asp:Label ID="lblMsg"
            runat="server">
        </asp:Label>

    </div>

</form>

</body>
</html>