<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpravljanjePredstavama.aspx.cs" Inherits="Pozoriste.UpravljanjePredstavama" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Upravljanje predstavama</title>

    <link href="style.css" rel="stylesheet" />
</head>
<body>

<form id="form1" runat="server">

    <div class="container">

        <h1>Upravljanje predstavama</h1>

        <div class="nav">

            <asp:HyperLink ID="HyperLink1"
                runat="server"
                NavigateUrl="~/Admin.aspx">
                Admin panel
            </asp:HyperLink>

            <asp:HyperLink ID="HyperLink2"
                runat="server"
                NavigateUrl="~/UpravljanjeTerminima.aspx">
                Upravljanje terminima
            </asp:HyperLink>

        </div>

        <br /><br />

        <asp:GridView ID="gvPredstave"
            runat="server"
            AutoGenerateColumns="false"
            CssClass="grid">

            <Columns>

                <asp:BoundField
                    DataField="predstava_id"
                    HeaderText="ID" />

                <asp:BoundField
                    DataField="naziv"
                    HeaderText="Naziv" />

                <asp:BoundField
                    DataField="zanr"
                    HeaderText="Žanr" />

                <asp:BoundField
                    DataField="trajanje_min"
                    HeaderText="Trajanje" />

                <asp:BoundField
                    DataField="opis"
                    HeaderText="Opis" />

                <asp:TemplateField HeaderText="Akcija">

                    <ItemTemplate>

                        <asp:Button ID="btnObrisi"
                            runat="server"
                            Text="Obriši"
                            CssClass="btn"
                            CommandArgument='<%# Eval("predstava_id") %>'
                            OnCommand="btnObrisi_Command" />

                    </ItemTemplate>

                </asp:TemplateField>

            </Columns>

        </asp:GridView>

        <br /><br />

        <h2>Dodaj predstavu</h2>

        <asp:TextBox ID="txtNaziv"
            runat="server"
            placeholder="Naziv">
        </asp:TextBox>

        <br /><br />

        <asp:TextBox ID="txtZanr"
            runat="server"
            placeholder="Žanr">
        </asp:TextBox>

        <br /><br />

        <asp:TextBox ID="txtTrajanje"
            runat="server"
            placeholder="Trajanje u minutima">
        </asp:TextBox>

        <br /><br />

        <asp:TextBox ID="txtOpis"
            runat="server"
            placeholder="Opis">
        </asp:TextBox>

        <br /><br />

        <asp:Button ID="btnDodaj"
            runat="server"
            Text="Dodaj predstavu"
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
