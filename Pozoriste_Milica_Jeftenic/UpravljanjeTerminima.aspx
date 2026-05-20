<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpravljanjeTerminima.aspx.cs" Inherits="Pozoriste.UpravljanjeTerminima" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Upravljanje terminima</title>

    <link href="style.css" rel="stylesheet" />
</head>
<body>

<form id="form1" runat="server">

    <div class="container">

        <h1>Upravljanje terminima</h1>

        <div class="nav">

            <asp:HyperLink ID="HyperLink1"
                runat="server"
                NavigateUrl="~/Admin.aspx">
                Admin panel
            </asp:HyperLink>

            <asp:HyperLink ID="HyperLink2"
                runat="server"
                NavigateUrl="~/UpravljanjePredstavama.aspx">
                Upravljanje predstavama
            </asp:HyperLink>

        </div>

        <br /><br />

        <asp:GridView ID="gvTermini"
            runat="server"
            AutoGenerateColumns="false"
            CssClass="grid">

            <Columns>

                <asp:BoundField
                    DataField="termin_id"
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
                    DataField="broj_mesta"
                    HeaderText="Broj mesta" />

                <asp:TemplateField HeaderText="Akcija">

                    <ItemTemplate>

                        <asp:Button ID="btnObrisi"
                            runat="server"
                            Text="Obriši"
                            CssClass="btn"
                            CommandArgument='<%# Eval("termin_id") %>'
                            OnCommand="btnObrisi_Command" />

                    </ItemTemplate>

                </asp:TemplateField>

            </Columns>

        </asp:GridView>

        <br /><br />

        <h2>Dodaj termin</h2>

        <asp:TextBox ID="txtPredstavaId"
            runat="server"
            placeholder="ID predstave">
        </asp:TextBox>

        <br /><br />

        <asp:TextBox ID="txtDatum"
            runat="server"
            placeholder="2026-06-15 20:00">
        </asp:TextBox>

        <br /><br />

        <asp:TextBox ID="txtSala"
            runat="server"
            placeholder="Sala">
        </asp:TextBox>

        <br /><br />

        <asp:TextBox ID="txtBrojMesta"
            runat="server"
            placeholder="Broj mesta">
        </asp:TextBox>

        <br /><br />

        <asp:Button ID="btnDodaj"
            runat="server"
            Text="Dodaj termin"
            CssClass="btn"
            OnClick="btnDodaj_Click" />

        <br /><br />

        <asp:Label ID="lblMsg"
            runat="server">
        </asp:Label>

    </div>

</form>

</body>
</html>