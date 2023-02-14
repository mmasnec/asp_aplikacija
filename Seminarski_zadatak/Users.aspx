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
        
    <div class="col-lg-8 col-sm-12 d-flex justify-content-center">

                        <asp:GridView ID="GridView1"  runat="server" DataSourceID="UsersData" class="table table-bordered table-condensed table-responsive table-hover table-light">
                        <Columns>
                           
                        </Columns>
                        </asp:GridView>
         

        </div>

                    <div class="col-lg-4 col-sm-12 d-flex justify-content-start ps-2 pe-2 pb-2">
            <asp:Button ID="BtnAdd" OnClick="BtnAdd_Click" runat="server" Height="30px" Width="150px" Text="Add New User" />
                        <br />
    <asp:Button ID="BtnUpdate" OnClick="BtnUpdate_Click" runat="server" Height="30px" Width="150px" Text="Update User" />
    </div>
        </div>
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
            <asp:Button ID="BtnAdmin" class="btn btn-dark" runat="server" OnClick="BtnAdmin_Click" Text="Update User's Account" />
            <asp:Button ID="BtnUser" class="btn btn-light" runat="server" OnClick="BtnUser_Click" Text="Update Self" />

            <asp:MultiView ID="MWUpdate" runat="server">
                <asp:View ID="ViewUpdateSelf" runat="server">
                    <br />
                    <asp:Label ID="LblUser" runat="server" Text=""></asp:Label>

                    <asp:HyperLink ID="LinkUsername" class="chnUsr" NavigateUrl="~/ChangeUsername.aspx" runat="server">Change Username</asp:HyperLink>&nbsp;
                    <asp:HyperLink ID="LinkPass" class="chnUsr" NavigateUrl="~/ChangePassword.aspx" runat="server">Change Password</asp:HyperLink>
                </asp:View>
                <asp:View ID="ViewUpdateUser" runat="server">
                    <br />
                    Update User 
                    
                    <br />


                            <div class="container-fluid">
    <div class="row">
        
    <div class="col-lg-6 col-sm-12 d-flex justify-content-center">

                        <asp:GridView ID="GridView2"  runat="server" DataSourceID="UsersData" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" class="table table-bordered table-condensed table-responsive table-hover table-light">
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" />
                        </Columns>
                        </asp:GridView>
         

        </div>

    <div class="col-lg-6 col-sm-12 d-flex justify-content-center">
        <div class="row">

        <asp:Label ID="Label2" runat="server" Text="Selected User: "></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server" Height="25px" Width="250px"></asp:TextBox>
        <br />     

            &nbsp;<asp:Button ID="BtnDltUsr" OnClick="BtnDltUsr_Click" class="btn btn-danger" runat="server" Height="40px" Width="200px" Text="Delete" />
        &nbsp;
        
            <div class="col-6">
                 <table class="w-100">
                     <tr>
                         <td>&nbsp;</td>
                         <td>
                             <asp:Button ID="BtnUpdPas" runat="server" class="btn btn-warning" OnClick="BtnUpdPas_Click" Height="35px" Text="Update Password" Width="150px" />
                         </td>
                     </tr>
                     <tr>
                         <td>&nbsp;</td>
                         <td>
                             <asp:Button ID="BtnUpdUsr" runat="server" class="btn btn-warning" OnClick="BtnUpdUsr_Click" Height="35px" Text="Update Username" Width="150px" />
                         </td>
                     </tr>
                 </table>
                 <br />
            </div>
            <asp:MultiView ID="MWAdmin" runat="server">
                <asp:View ID="ViewUsername" runat="server">

                    <table class="w-100">
                        <tr>
                            <td>
                                <asp:Label ID="Label3" runat="server" Text="Enter new username: "></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="TxtUsrAdm" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>
                                <asp:Button ID="BtnUsrAdm" OnClick="BtnUsrAdm_Click" runat="server" Text="Update Username" />
                            </td>
                        </tr>
                    </table>

                </asp:View>
                <asp:View ID="ViewPassword" runat="server">

                    <table class="w-100">
                        <tr>
                            <td>
                                <asp:Label ID="Label1" runat="server" Text="Enter new password:"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="TxtPasAdm" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>
                                <asp:Button ID="BtnPasAdm" OnClick="BtnPasAdm_Click" runat="server" Text="Update Password" />
                            </td>
                        </tr>
                    </table>


                </asp:View>
            </asp:MultiView>
        </div>
        
        </div>
        </div>
        </div>
          


                </asp:View>
               
            </asp:MultiView>
        </asp:View>

    </asp:MultiView>
    <br />
    <asp:Label ID="LabelAdminMessage" class="text-bg-danger" runat="server" Text=""></asp:Label>

    <asp:SqlDataSource runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename='C:\Users\Marko\OneDrive\Radna površina\asp_seminar\Seminarski_zadatak\Seminarski_zadatak\App_Data\Company.mdf';Integrated Security=True;Connect Timeout=30" ID="UsersData" SelectCommand="SELECT Username FROM Users"></asp:SqlDataSource>
</asp:Content>

