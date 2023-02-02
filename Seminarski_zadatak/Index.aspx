<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Seminarski_zadatak.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="LblUsr" runat="server" Text=""></asp:Label>
            <br />
            <asp:HyperLink ID="HyperLink1" NavigateUrl="~/Home.aspx" runat="server">HyperLink</asp:HyperLink>
        </div>
    </form>
</body>
</html>
