<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UserSignUpPage.aspx.cs" Inherits="GameREVIEW.UserSignUpPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row mt-3">
            <div class="col-md-6 mx-auto">
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
                            <h4>User Sign up</h4>
                        </center>
                    </div>
                </div>
                <%-- Separate --%>
                <div class="row">
                    <div class="col">
                        <hr />
                    </div>
                </div>
                <%-- Form Here --%>
                <div class="row g-3">
                    <div class="col-sm-6">
                        <label>Full Name*</label>
                        <div class="form-group">
                            <asp:TextBox ID="FNTextBox" CssClass="form-control" runat="server" placeholder="Full Name"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <label>Date of Birth</label>
                        <div class="form-group">
                            <asp:TextBox ID="DoBTextBox" CssClass="form-control" runat="server" placeholder="DoB" TextMode="Date"></asp:TextBox>
                        </div>
                    </div>

                    <div class="col-sm-4">
                        <label>Gender</label>
                        <div class="form-group">
                            <asp:DropDownList class="form-control" ID="SexDropDownList" runat="server">
                                        <asp:ListItem Text="Select" Value="NA"></asp:ListItem>
                                        <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                                        <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                                        <asp:ListItem Text="Other" Value="Other"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>

                    <div class="col-sm-4">
                        <label>City</label>
                        <div class="form-group">
                            <asp:TextBox ID="CityTextBox" class="form-control" runat="server" placeholder="City" TextMode="SingleLine"></asp:TextBox>
                        </div>
                    </div>

                    <div class="col-sm-4">
                        <label>Country</label>
                        <div class="form-group">
                            <asp:TextBox ID="CountryTextBox" class="form-control" runat="server" placeholder="Country" TextMode="SingleLine"></asp:TextBox>
                        </div>
                    </div>

                    <div class="col-sm-6">
                        <label>Email Address</label>
                        <div class="form-group">
                            <asp:TextBox ID="EmailTextBox" CssClass="form-control" runat="server" placeholder="Email" TextMode="Email"></asp:TextBox>
                        </div>
                    </div>

                    <div class="col-sm-6">
                        <label>Contact</label>
                        <div class="form-group">
                            <asp:TextBox ID="PhoneTextBox" CssClass="form-control" runat="server" placeholder="Phone Number" TextMode="Number"></asp:TextBox>
                        </div>
                    </div>

                    <%-- separate --%>

                    <center>
                            <div class="col">
                                <span class="badge rounded-pill bg-success">Login Credentials</span>
                            </div>
                            </center>

                    <div class="col-sm-6">
                        <label>User Name*</label>
                        <div class="form-group">
                            <asp:TextBox ID="UserNameTextBox" class="form-control" runat="server" placeholder="UserName"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <label>Password*</label>
                        <div class="form-group">
                            <asp:TextBox ID="PwTextBox" class="form-control" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="d-grid d-md-flex justify-content-md-end">
                    <asp:Button ID="goLoginbtn" class="btn btn-link" runat="server" Text="Have an account already?" OnClick="goLoginbtn_Click"/>
                </div>
                <br />
                <%-- Buttons here--%>
                <div class="row mb-5">
                    <div class="col-8 mx-auto">
                        <div class="d-grid gap-2">
                            <asp:Button ID="SignUpBtn" class="btn btn-primary btn-lg" runat="server" Text="Sign Up" OnClick="SignUpBtn_Click" />
                        </div>
                    </div>
                </div>
                <%-- Buttons end--%>
            </div>
        </div>
    </div>
</asp:Content>
