<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="GameREVIEW.AdminLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-5 mt-4 mx-auto">

                <div class="row">
                    <div class="col">
                        <center>
                            <img width="72" src="imgs/adminuser.png" />
                        </center>
                    </div>
                </div>

                <div class="row">
                    <div class="col">
                        <center>
                            <h3>Admin Login</h3>
                        </center>
                    </div>
                </div>

                <%-- Separate here --%>
                <div class="row">
                    <div class="col">
                        <hr />
                    </div>
                </div>
                <%-- Form Here --%>
                <div class="row">
                    <div class="col-10 mx-auto">
                        <div class="form-group mb-2">
                            <asp:TextBox ID="UnameTextBox" CssClass="form-control" runat="server" placeholder="Username"></asp:TextBox>
                        </div>
                        <div class="form-group mb-3">
                            <asp:TextBox ID="PwTextBox" CssClass="form-control" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <%-- Form End --%>

                <%-- Buttons Here --%>
                <div class="row">
                    <div class="col-10 mx-auto">
                        <div class="d-grid gap-1">
                            <asp:Button ID="LogInBtn" class="btn btn-primary" runat="server" Text="Login" OnClick="LogInBtn_Click" />
                            
                        </div>
                    </div>
                </div>
            <%-- Buttons End --%>
            </div>
        </div>
    </div>

</asp:Content>
