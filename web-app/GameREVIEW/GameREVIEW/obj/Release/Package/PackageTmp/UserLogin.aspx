<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UserLogin.aspx.cs" Inherits="GameREVIEW.UserLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-5 mt-4 mx-auto">

                <div class="row">
                    <div class="col">
                        <center>
                                <img width="72" src="imgs/computer-game-logo-removebg.png" />
                            </center>
                    </div>
                </div>

                <div class="row">
                    <div class="col">
                        <center>
                                <h3>User Login</h3>
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
                            <asp:TextBox ID="UNameTextBox" CssClass="form-control" runat="server" placeholder="Username"></asp:TextBox>
                        </div>
                        <div class="form-group mb-1">
                            <asp:TextBox ID="PwTextBox" CssClass="form-control" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                        </div>
                        <div class="d-grid d-md-flex justify-content-md-end">
                            <asp:Button ID="Forgetbtn" class="btn btn-link" runat="server" Text="Forget Password?" OnClick="Forgetbtn_Click" />
                        </div>
                    </div>
                </div>
                <%-- Form End --%>

                <%-- Buttons Here --%>
                <div class="row">
                    <div class="col-10 mx-auto">
                        <div class="d-grid gap-1">
                            <asp:Button ID="LogInBtn" class="btn btn-primary" runat="server" Text="Login" OnClick="LogInBtn_Click" />
                            <asp:Button ID="SignUpBtn" class="btn btn-success" runat="server" Text="Sign Up" OnClick="SignUpBtn_Click" />
                        </div>
                    </div>
                </div>
            <%-- Buttons End --%>
            </div>
        </div>
    </div>
</asp:Content>
