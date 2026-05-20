<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="Pozoriste.Admin" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Admin Panel</title>

    <link href="style.css" rel="stylesheet" />
</head>
<body>

<form id="form1" runat="server">

    <div class="container">

        <h1>Admin Panel</h1>

        <div class="nav">

            <asp:HyperLink ID="HyperLink1"
                runat="server"
                NavigateUrl="~/UpravljanjePredstavama.aspx">
                Upravljanje predstavama
            </asp:HyperLink>

            <asp:HyperLink ID="HyperLink2"
                runat="server"
                NavigateUrl="~/UpravljanjeTerminima.aspx">
                Upravljanje terminima
            </asp:HyperLink>

            <asp:HyperLink ID="HyperLink3"
                runat="server"
                NavigateUrl="~/Login.aspx">
                Logout
            </asp:HyperLink>

        </div>

        <br /><br />

        <h2>Dobrodošao admin</h2>

        <p>
            Ovde možeš upravljati predstavama i terminima.
        </p>

    </div>

</form>

</body>
</html>