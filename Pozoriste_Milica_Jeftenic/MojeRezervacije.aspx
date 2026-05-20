<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MojeRezervacije.aspx.cs" Inherits="Pozoriste.MojeRezervacije" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Moje rezervacije</title>

    <link href="style.css" rel="stylesheet" />
</head>
<body>

<form id="form1" runat="server">

    <div class="container">

        <h1>Moje rezervacije</h1>

        <div class="nav">

            <asp:HyperLink ID="HyperLink1"
                runat="server"
                NavigateUrl="~/Predstave.aspx">
                Nazad na predstave
            </asp:HyperLink>

            <asp:HyperLink ID="HyperLink2"
                runat="server"
                NavigateUrl="~/Login.aspx">
                Logout
            </asp:HyperLink>

        </div>

        <br /><br />

        <asp:GridView ID="gvRezervacije"
            runat="server"
            AutoGenerateColumns="false"
            CssClass="grid">

            <Columns>

                <asp:BoundField
                    DataField="rezervacija_id"
                    HeaderText="ID" />

                <asp:BoundField
                    DataField="naziv"
                    HeaderText="Predstava" />

                <asp:BoundField
                    DataField="datum"
                    HeaderText="Datum" />

                <asp:BoundField
                    DataField="sala"
                    HeaderText="Sala" />

                <asp:BoundField
                    DataField="broj_karata"
                    HeaderText="Broj karata" />

                <asp:BoundField
                    DataField="status_rezervacije"
                    HeaderText="Status" />

                <asp:TemplateField HeaderText="Akcija">

                    <ItemTemplate>

                        <asp:Button ID="btnObrisi"
                            runat="server"
                            Text="Otkaži"
                            CssClass="btn"
                            CommandArgument='<%# Eval("rezervacija_id") %>'
                            OnCommand="btnObrisi_Command" />

                    </ItemTemplate>

                </asp:TemplateField>

            </Columns>

        </asp:GridView>

        <br /><br />

        <asp:Label ID="lblMsg"
            runat="server">
        </asp:Label>

    </div>

</form>

</body>
</html>