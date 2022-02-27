<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="PostCreatePage.aspx.cs" Inherits="GameREVIEW.PostCreatePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row mt-3">
            <div class="col">
                <asp:Button ID="BackButton1" class="btn btn-outline-secondary" runat="server" Text="<< Forum" OnClick="BackButton1_Click" />
                
            </div>
        </div>

        <div class="row mt-2">
            <div class="col-md-6 mx-auto">
                
                <div class="row">
                    <div class="col">
                        <center>
                            <h4>The REVIEW</h4>
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
                    <div class="col-sm-7">
                        <label>Title*</label>
                        <div class="form-group">
                            <asp:TextBox ID="TitleTextBox" CssClass="form-control" runat="server" placeholder="Game's Title"></asp:TextBox>
                        </div>
                    </div>
                    

                    <div class="col-sm-5">
                        <label>Genres</label>
                        <div class="form-group">
                                <asp:DropDownList class="form-control" ID="GenreDropDownList" runat="server">
                                            <asp:ListItem Text="Select" Value="NA"></asp:ListItem>
                                            <asp:ListItem Text="MOBA" Value="MOBA"></asp:ListItem>
                                            <asp:ListItem Text="Adv" Value="Adv"></asp:ListItem>
                                            <asp:ListItem Text="FPS" Value="FPS"></asp:ListItem>
                                            <asp:ListItem Text="Roguelike" Value="Roguelike"></asp:ListItem>
                                            <asp:ListItem Text="Others" Value="Others"></asp:ListItem>
                                </asp:DropDownList>
                        </div>
                    </div>

                    <div class="col-sm-12">
                        <label>Content*</label>
                        <div class="form-group">
                            <asp:TextBox ID="ContentTextBox" CssClass="form-control" runat="server" placeholder="What do you think about it?" TextMode="MultiLine"></asp:TextBox>
                        </div>
                    </div>

                </div>
                <br />
                <%-- Buttons here--%>
                <div class="row mb-5">
                    <div class="col-5 mx-auto">
                        <div class="d-grid gap-2">
                            <asp:Button ID="CreateBtn" class="btn btn-outline-success btn-lg" runat="server" Text="REVIEW" OnClick="CreateBtn_Click" />
                        </div>
                    </div>
                </div>
                <%-- Buttons end--%>
            </div>
        </div>
    </div>
</asp:Content>
