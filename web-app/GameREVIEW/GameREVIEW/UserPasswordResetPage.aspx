<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UserPasswordResetPage.aspx.cs" Inherits="GameREVIEW.UserPasswordResetPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container-fluid">
         <div class="row">
            <div class="col mt-3">
                <asp:Button ID="BackButton1" class="btn btn-outline-secondary" runat="server" Text="<< Login"  />
            </div>
        </div>
        <div class="row">
            <div class="col-md-5 mt-3 mx-auto">

                <div class="row">
                    <div class="col">
                        <center>
                                <h3>Change Password</h3>
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
                    <div class="col-7 mx-auto">
                        <div class="form-group mb-3">
                            <asp:Label ID="Label1" runat="server" Text="Enter User Name*"></asp:Label>
                            <asp:TextBox ID="UNameTextBox" CssClass="form-control" runat="server" placeholder="Username"></asp:TextBox>
                        </div>
                        <div class="form-group mb-1">
                            <asp:Label ID="Label2" runat="server" Text="Enter New Password*"></asp:Label>
                            <asp:TextBox ID="PwTextBox" CssClass="form-control" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                        </div>
                        <div class="form-group mb-3">
                            <asp:TextBox ID="ConfirmBox" CssClass="form-control" runat="server" placeholder="Confirm Password" TextMode="Password"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <%-- Form End --%>

                <%-- Buttons Here --%>
                <div class="row">
                    <div class="col-7 mx-auto">
                        <div class="d-grid gap-1">
                            <asp:Button ID="ResetPWBtn" class="btn btn-warning" runat="server" Text="RESET" OnClick="ResetPWBtn_Click"/>
                        </div>
                    </div>
                </div>
            <%-- Buttons End --%>
            </div>
        </div>
    </div>
</asp:Content>
