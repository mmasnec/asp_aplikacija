<%@ Page Title="" Language="C#" MasterPageFile="~/Design.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="Seminarski_zadatak.Users" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
            <header>
        <div class="hero-image hi-2">
            <div class="txt-username">
            <asp:Label ID="username" runat="server" Text="User: "></asp:Label>

            </div>
        </div>
    </header>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h1 class="text-center fw-bold">Company's Users</h1>
        <div class="container-fluid">
    <div class="row">
        
    <div class="col-lg-6 col-sm-12 d-flex justify-content-center">

                        <asp:GridView ID="GridView1"  runat="server" DataSourceID="UsersData" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" />
                        </Columns>
                        </asp:GridView>
         

        </div>
    <div class="col-lg-6 col-sm-12 d-flex justify-content-center">
        <asp:Label ID="Label1" runat="server" Text="Selected User: "></asp:Label>
        <asp:TextBox ID="TxtUser" runat="server" ></asp:TextBox>
        <br />
        </div>
        </div>
            </div>
            <br />
        <br />
        <br />

    <div class="ps-2 pe-2 pb-2">
            <asp:Button ID="BtnAdd" OnClick="BtnAdd_Click" runat="server" Text="Add New User" />
    <asp:Button ID="BtnUpdate" OnClick="BtnUpdate_Click" runat="server" Text="Update User" />
    </div>

    <asp:MultiView ID="MultiView1" runat="server">

        <asp:View ID="AddUser" runat="server">
            <br />

            <div class="row">
                <div class="col-lg-6 col-sm-10 ps-5 pb-5">
                    <h3>Add User</h3>
            <br />
            <asp:Label ID="LblNewUser" runat="server" Text="Username"></asp:Label>
            <asp:TextBox ID="TxtNewUser" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="LblNewPass" runat="server" Text="Password"></asp:Label>
            <asp:TextBox ID="TxtNewPass" TextMode="Password" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:CheckBox ID="ChkNewUsr" runat="server" />&nbsp;<asp:Label runat="server" ID="LblChk" Text="I understand"></asp:Label>
            &nbsp; <asp:Button ID="BtnCreate" runat="server" OnClick="BtnCreate_Click" Text="Create!" />
            <br />
            <br />
            <asp:Label runat="server" ID="LblFill" Text=""></asp:Label>
                </div>
                <div class="col-6">

                </div>
            </div>
            
        </asp:View>
        <asp:View ID="UpdateUser" runat="server">
            <asp:Button ID="BtnAdmin" runat="server" OnClick="BtnAdmin_Click" Text="Update Other User Account" />
            <asp:Button ID="BtnUser" runat="server" OnClick="BtnUser_Click" Text="Update User Account" />

            <asp:MultiView ID="MWUpdate" runat="server">
                <asp:View ID="ViewUpdateSelf" runat="server">
                    <br />
                    <asp:Label ID="LblUser" runat="server" Text=""></asp:Label>

                    <asp:HyperLink ID="LinkUsername" NavigateUrl="~/ChangeUsername.aspx" runat="server">Change Username</asp:HyperLink>&nbsp;
                    <asp:HyperLink ID="LinkPass" NavigateUrl="~/ChangePassword.aspx" runat="server">Change Password</asp:HyperLink>
                </asp:View>
                <asp:View ID="ViewUpdateUser" runat="server">
                    <br />
                    Update User
                    <br />
                </asp:View>

            </asp:MultiView>
        </asp:View>

    </asp:MultiView>


    <asp:SqlDataSource runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename='C:\Users\Marko\OneDrive\Radna površina\asp_seminar\Seminarski_zadatak\Seminarski_zadatak\App_Data\Company.mdf';Integrated Security=True;Connect Timeout=30" ID="UsersData" SelectCommand="SELECT Username FROM Users"></asp:SqlDataSource>
</asp:Content>

