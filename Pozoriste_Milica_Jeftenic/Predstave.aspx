<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Predstave.aspx.cs" Inherits="Pozoriste.Predstave" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Predstave</title>

    <link href="style.css" rel="stylesheet" />
</head>
<body>

<form id="form1" runat="server">

    <div class="container">

        <h1>Predstave</h1>

        <div class="nav">

            <asp:HyperLink ID="HyperLink1"
                runat="server"
                NavigateUrl="~/MojeRezervacije.aspx">
                Moje rezervacije
            </asp:HyperLink>

            <asp:HyperLink ID="HyperLink2"
                runat="server"
                NavigateUrl="~/Login.aspx">
                Logout
            </asp:HyperLink>

        </div>

        <br /><br />

        <asp:GridView ID="gvPredstave"
            runat="server"
            AutoGenerateColumns="false"
            CssClass="grid">

            <Columns>

                <asp:BoundField
                    DataField="termin_id"
                    HeaderText="Termin ID" />

                <asp:BoundField
                    DataField="naziv"
                    HeaderText="Predstava" />

                <asp:BoundField
                    DataField="zanr"
                    HeaderText="Žanr" />

                <asp:BoundField
                    DataField="trajanje_min"
                    HeaderText="Trajanje" />

                <asp:BoundField
                    DataField="opis"
                    HeaderText="Opis" />

                <asp:BoundField
                    DataField="datum"
                    HeaderText="Datum" />

                <asp:BoundField
                    DataField="sala"
                    HeaderText="Sala" />

                <asp:TemplateField HeaderText="Rezervacija">

                    <ItemTemplate>

                        <asp:Button ID="btnRezervisi"
                            runat="server"
                            Text="Rezerviši"
                            CssClass="btn"
                            CommandArgument='<%# Eval("termin_id") %>'
                            OnCommand="btnRezervisi_Command" />

                    </ItemTemplate>

                </asp:TemplateField>

            </Columns>

        </asp:GridView>

        <br /><br />

        <h3>Broj karata</h3>

        <asp:TextBox ID="txtBrojKarata"
            runat="server"
            placeholder="Unesite broj karata">
        </asp:TextBox>

        <br /><br />

        <asp:Label ID="lblMsg"
            runat="server">
        </asp:Label>

    </div>

</form>

</body>
</html>