<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangeUsername.aspx.cs" Inherits="Seminarski_zadatak.ChangeUsername" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>

        </div>
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label2" runat="server" Text="New username: "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TxtNewUsername" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label3" runat="server" Text="Confirm password: "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TxtConfirmPass" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>
                    <asp:Button ID="BtnChange" runat="server" OnClick="BtnChange_Click" Text="Change username" />
                </td>
            </tr>
        </table>
        <asp:Label ID="LblMsg" runat="server" Text=""></asp:Label>
    </form>
</body>
</html>
