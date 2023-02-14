<%@ Page Title="" Language="C#" MasterPageFile="~/Design.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Seminarski_zadatak.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
                <header>
        <div class="hero-image hi-1">
            <div class="txt-username">
            <asp:Label ID="username" runat="server" Text="User: "></asp:Label>


            </div>
        </div>
    </header>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    Home page
    <video autoplay muted loop class="video">
        <source src="img/ComputerKeyboard.mp4" type="video/mp4"/>
    </video>
</asp:Content>
