<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="GameREVIEW.UserProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid">
        <div class="row mt-3">
            <div class="col">
                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                <asp:Button ID="GoButton1" class="btn btn-outline-secondary" runat="server" Text="Your REVIEW >>" OnClick="GoButton1_Click" />
                </div>
            </div>
        </div>
        <div class="row mt-2">
           
            <div class="col-md-6 mx-auto">
                <%-- Status badge --%>
                <div class="row">
                    <div class="col">
                        <center>
                            <h4>User Profile Setting</h4>
                            <span>Rank -</span>
                            <asp:Label class="badge rounded-pill bg-info text-dark" ID="Label1" runat="server" Text="Your Rank"></asp:Label>

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
                            <asp:TextBox ID="FNTextBox" CssClass="form-control" runat="server" placeholder="Full Name" ReadOnly="True"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <label>Date of Birth</label>
                        <div class="form-group">
                            <asp:TextBox ID="DoBTextBox" CssClass="form-control" runat="server" placeholder="DoB" TextMode="Date" ReadOnly="True"></asp:TextBox>
                        </div>
                    </div>

                    <div class="col-sm-4">
                        <label>Gender</label>
                        <div class="form-group">
                            <asp:DropDownList CssClass="form-control" ID="SexDropDownList" runat="server" Visible="True" Enabled="False">
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
                            <asp:TextBox ID="CityTextBox" class="form-control" runat="server" placeholder="City" TextMode="SingleLine" ReadOnly="True"></asp:TextBox>
                        </div>
                    </div>

                    <div class="col-sm-4">
                        <label>Country</label>
                        <div class="form-group">
                            <asp:TextBox ID="CountryTextBox" class="form-control" runat="server" placeholder="Country" TextMode="SingleLine" ReadOnly="True"></asp:TextBox>
                        </div>
                    </div>

                    <div class="col-sm-6">
                        <label>Email Address</label>
                        <div class="form-group">
                            <asp:TextBox ID="EmailTextBox" CssClass="form-control" runat="server" placeholder="Email" TextMode="Email" ReadOnly="True"></asp:TextBox>
                        </div>
                    </div>

                    <div class="col-sm-6">
                        <label>Contact</label>
                        <div class="form-group">
                            <asp:TextBox ID="PhoneTextBox" CssClass="form-control" runat="server" placeholder="Phone Number" TextMode="Number" ReadOnly="True"></asp:TextBox>
                        </div>
                    </div>

                    <%-- username pw placeholders --%>

                    <%--<center>
                            <div class="col">
                                <span class="badge rounded-pill bg-success">Your Credentials</span>
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
                    </div>--%>
                </div>
                <br />
                <%-- Buttons here--%>
                <div class="row mb-5">
                    <div class="col-4 mx-auto">
                        <div class="d-grid gap-1">
                            <asp:Button ID="ChangeBtn" class="btn btn-primary btn-lg" runat="server" Text="Edit" OnClick="ChangeBtn_Click" />
                            <asp:Button ID="SaveBtn" class="btn btn-success btn-lg" runat="server" Text="Save" OnClick="SaveBtn_Click" Visible="False" />
                        </div>
                    </div>
                </div>
                <%-- Buttons end--%>
            </div>
        </div>
    </div>
    
</asp:Content>
