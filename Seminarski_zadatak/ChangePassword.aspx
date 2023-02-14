<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="Seminarski_zadatak.ChangePassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <style type="text/css">
        .auto-style1 {
            width: 100%;
            border-color: #66CCFF;
            background-color: #669900;
        }
        .auto-style2 {
            width: 151px;
        }
    </style>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>

        </div>
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label2" runat="server" Text="Old password: "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TxtPassword" TextMode="Password" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label3" runat="server" Text="New password: "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TxtNewPass" TextMode="Password" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>
                    <asp:Button ID="BtnNewPass" runat="server" OnClick="BtnNewPass_Click" Text="Change password" />
                </td>
            </tr>
        </table>
        <asp:Label ID="LblMsg" runat="server" Text=""></asp:Label>
        <br />
        <asp:LinkButton ID="LinkButton1" PostBackUrl="~/Users.aspx" runat="server">Go back</asp:LinkButton>
    </form>
</body>
</html>
