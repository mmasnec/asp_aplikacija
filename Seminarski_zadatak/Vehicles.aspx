<%@ Page Title="" Language="C#" MasterPageFile="~/Design.Master" AutoEventWireup="true" CodeBehind="Vehicles.aspx.cs" Inherits="Seminarski_zadatak.Vehicles" %>
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
    <h2 class="text-center text-lime">Vehicles page</h2>


    <div class="container-fluid">
    <div class="row">
        
    <div class="col-lg-12 col-sm-12 d-flex justify-content-center">

                        <asp:GridView ID="GridView1"  runat="server" DataSourceID="VehiclesData" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" class="table table-bordered table-condensed table-responsive table-hover table-light" AllowSorting="True" AutoGenerateColumns="False">
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="Manufacturer" HeaderText="Manufacturer" SortExpression="Manufacturer" />
                            <asp:BoundField DataField="Model" HeaderText="Model" SortExpression="Model" />
                            <asp:BoundField DataField="Engine" HeaderText="Engine" SortExpression="Engine" />
                            <asp:BoundField DataField="Registration" HeaderText="Registration" SortExpression="Registration" />
                            <asp:BoundField DataField="Registration_Expire" DataFormatString="{0:D}" HeaderText="Registration_Expire" SortExpression="Registration_Expire" />
                            <asp:BoundField DataField="Available" HeaderText="Available" NullDisplayText="Unknown" SortExpression="Available" />
                        </Columns>
                            <EditRowStyle BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" Height="10px" HorizontalAlign="Right" VerticalAlign="Middle" Width="70px" />
                            <RowStyle BorderStyle="Solid" />
                        </asp:GridView>
         

        </div>
        <br />
        <br />
    <div class="col-lg-12 col-sm-12 d-flex justify-content-center">
        <asp:Label ID="LblVehicle" runat="server" class="text-lime" Text="Selected Vehicle: "></asp:Label>&nbsp;
        <asp:TextBox ID="TxtVehicleMan" runat="server"  Height="25px"></asp:TextBox>


        </div>
        <br />
        <br />
        <div class="col-lg-12 col-sm-12 d-flex justify-content-center">
            <asp:Button ID="BtnReg" class="btn btn-primary" runat="server" OnClick="BtnReg_Click" Text="Change registration" />&nbsp;
            <asp:Button ID="BtnExp" class="btn btn-primary" runat="server" OnClick="BtnExp_Click" Text="Change expiration" />&nbsp;
            <asp:Button ID="Button1" class="btn btn-primary" runat="server" OnClick="BtnAva_Click" Text="Change availability" />&nbsp;
            <asp:Button ID="BtnNew" class="btn btn-primary" runat="server" OnClick="BtnNew_Click" Text="Add new vehicle" />&nbsp;
            &nbsp;&nbsp;
            <asp:Button ID="BtnWrite_off" class="btn btn-danger" runat="server" OnClick="BtnWrite_off_Click" Text="Write-off vehicle" />

        </div>
        </div>
            </div>

    <asp:MultiView ID="MultiView1" runat="server">

        <asp:View ID="ViewReg" runat="server">
            Registration
            <div class="row">
                <div class="col-lg-12 col-sm-12 d-flex justify-content-center">
                    <asp:Label ID="Label1" runat="server" Text="Enter new registration: "></asp:Label>
                    <asp:TextBox ID="TxtNewReg" runat="server"></asp:TextBox>
                </div>
                <div class="col-lg-12 col-sm-12 d-flex justify-content-center">
                    <asp:Button ID="BtnChReg" OnClick="BtnChReg_Click" runat="server" Text="Change registration" />
                </div>
            </div>
        </asp:View>
        <asp:View ID="ViewExp" runat="server">
            Expiration
            <div class="row">
                <div class="col-lg-4 col-sm-12 d-flex justify-content-center">
                    <asp:Label ID="Label2" runat="server" Text="Enter expiration date: "></asp:Label>
                </div>

                <div class="col-lg-4 col-sm-12 d-flex justify-content-center">

                    <asp:TextBox ID="TxtExpChange" TextMode="Date" runat="server"></asp:TextBox>
                </div>
                <br />
                <div class="col-lg-12 col-sm-12 d-flex justify-content-center">
                    <asp:Button ID="BtnNewExp" OnClick="BtnNewExp_Click" runat="server" Text="Change date" />
                </div>
            </div>
        </asp:View>
        <asp:View ID="ViewAva" runat="server">
            Available
            <div class="row">
                <div class="col-lg-12 col-sm-12 d-flex justify-content-center">
                    <asp:Label ID="Label3" runat="server" Text="Select vehicle and choose: "></asp:Label>
                    &nbsp;
                    <asp:DropDownList ID="DDList" runat="server">
                        <asp:ListItem Value="False">Unavailable</asp:ListItem>
                        <asp:ListItem Value="True">Available</asp:ListItem>
                    </asp:DropDownList>
                    <asp:Button ID="BtnToggleAv" OnClick="BtnToggleAv_Click" runat="server" Text="Send" />
                </div>
                <asp:Label ID="LblAvailable" runat="server" Text=""></asp:Label>
            </div>
        </asp:View>
        <asp:View ID="ViewNew" runat="server">
            New vehicle
            <div class="row">
                <div class="col-lg-12 col-sm-12 d-flex justify-content-center text-center">

                    <table class="table">
                        <tr>
                            <td>
                                <asp:Label ID="Label4" runat="server" Text="Manufacturer"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBoxManufacturer" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label5" runat="server" Text="Model"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBoxModel" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label6" runat="server" Text="Engine type"></asp:Label>

                            </td>
                            <td>
                                <asp:DropDownList ID="DropDownList2" runat="server">
                                    <asp:ListItem>Petrol</asp:ListItem>
                                    <asp:ListItem>Diesel</asp:ListItem>
                                    <asp:ListItem>Electric</asp:ListItem>
                                    <asp:ListItem>Hybrid</asp:ListItem>
                                    <asp:ListItem>Other</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label7" runat="server" Text="Registration"></asp:Label>

                            </td>
                            <td>
                                <asp:TextBox ID="TxtReg" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label8" runat="server" Text="Registration Expires"></asp:Label>

                            </td>
                            <td>
                                <asp:TextBox ID="TxtExpDate" TextMode="Date" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>Available</td>
                            <td><asp:DropDownList ID="DropDownList1" runat="server">
                                <asp:ListItem Value="True">Yes</asp:ListItem>
                                <asp:ListItem Value="False">No</asp:ListItem>
                                </asp:DropDownList></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox ID="CheckBox" runat="server" />&nbsp;I understand.
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="LblMsg" runat="server" Text=""></asp:Label>
                            </td>
                            <td><asp:Button ID="BtnAddNewVehicle" runat="server" OnClick="BtnAddNewVehicle_Click" Text="Add new vehicle" Width="150px" /></td>
                        </tr>
                    </table>

                </div>
            </div>
        </asp:View>
    </asp:MultiView>
    <asp:Label ID="LblFill" runat="server" Text=""></asp:Label>

    <asp:SqlDataSource runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ID="VehiclesData" SelectCommand="SELECT [Manufacturer], [Model], [Engine], [Registration], [Registration_Expire], [Available] FROM [Vehicles]"></asp:SqlDataSource>

</asp:Content>
