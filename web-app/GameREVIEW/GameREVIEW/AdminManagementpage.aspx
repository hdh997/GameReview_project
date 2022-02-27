<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminManagementpage.aspx.cs" Inherits="GameREVIEW.AdminManagementpage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {

            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();

            $('.modal').on('hidden.bs.modal', function(){
                window.top.location.reload();
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Modal -->
    <div class="modal fade bd-example-modal-lg" id="UserInfoModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="exampleModalLabel">Users Administration</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <div class="container-fluid">
                                <%-- form here --%>
                                <div class="row mt-3">
                                    <div class="col-md-12 mx-auto">

                                        <div class="row g-3">
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <div class="input-group">
                                                        <asp:TextBox ID="UserNametbox" CssClass="form-control" placeholder="Search User Name" runat="server"></asp:TextBox>
                                                        <asp:LinkButton ID="SearchLinkButton" CssClass="btn btn-secondary" runat="server" OnClick="SearchLinkButton_Click"><i class="fas fa-search"></i></asp:LinkButton>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-sm-2">
                                                <div class="form-group">
                                                    <asp:TextBox ID="IdTextBox" CssClass="form-control" placeholder="ID" runat="server" ReadOnly="True"></asp:TextBox>
                                                </div>
                                            </div>

                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <asp:Label ID="errorLabel" runat="server" Text="Label" Visible="False"></asp:Label>
                                                </div>
                                            </div>

                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <asp:TextBox ID="FullNametbox" CssClass="form-control" placeholder="Full Name" runat="server" ReadOnly="True"></asp:TextBox>
                                                </div>
                                            </div>

                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <asp:TextBox ID="Contacttbox" CssClass="form-control" placeholder="Contact Number" runat="server" ReadOnly="True"></asp:TextBox>
                                                </div>
                                            </div>

                                            <div class="col-sm-7">
                                                <div class="form-group">
                                                    <asp:TextBox ID="Emailtbox" CssClass="form-control" placeholder="Email" runat="server" ReadOnly="True" TextMode="Email"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>

                                        <%-- Buttons here--%>
                                        <div class="row mt-3">
                                            <div class="col-3 mx-auto">
                                                <div class="d-grid gap-1">
                                                    <asp:Button ID="DeleteUserbtn" CssClass="btn btn-danger" runat="server" Text="Delete" ToolTip="Delete User Permanently" OnClick="DeleteUserbtn_Click" />
                                                </div>
                                            </div>
                                        </div>
                                        <%-- Buttons end--%>
                                    </div>
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <div class="modal-footer">
                </div>
            </div>
        </div>
    </div>
    <!-- Modal -->

    <div class="container-fluid">
        <div class="row mt-3">
            <div class="col-md-9 mx-auto">
                <div class="row">
                    <div class="col">
                        <center>
                            <h4>Administration</h4>
                        </center>
                    </div>
                </div>
                <%-- user info linkbtn --%>
                <div class="row">
                    <div class="col">
                        <asp:LinkButton ID="UserInfoLinkBtn" CssClass="btn btn-outline-success" runat="server" ToolTip="User Info" data-bs-toggle="modal" data-bs-target="#UserInfoModal"><i class="far fa-user"></i></asp:LinkButton>
                    </div>
                </div>

                <div class="row">
                    <div class="col">
                        <hr />
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12 mx-auto">

                        <asp:GridView ID="GridView1" CssClass="table table-striped table-hover table-borderless table-responsive-lg" runat="server" AutoGenerateColumns="False" ShowHeaderWhenEmpty="true" DataKeyNames="contentID" OnRowDeleting="GridView1_RowDeleting" BorderStyle="None" CellSpacing="5" GridLines="None">
                            <Columns>
                                <asp:TemplateField HeaderText="ID" InsertVisible="False" SortExpression="contentID">
                                    <ItemTemplate>
                                        <div class="row me-5">
                                            <div class="col">
                                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("contentID") %>'></asp:Label>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Creater" SortExpression="userName">
                                    <ItemTemplate>
                                        <div class="row me-5">
                                            <div class="col">
                                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("userName") %>'></asp:Label>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Contents" SortExpression="content_title">
                                    <ItemTemplate>
                                        <div class="row">
                                            <div class="col-lg-10">
                                                Title -
                                                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Larger" Text='<%# Eval("content_title") %>' ClientIDMode="Inherit" Enabled="False"></asp:Label>

                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-10">
                                                Details -
                                                <asp:Label ID="Label2" runat="server" Font-Size="Large" Text='<%# Eval("content_main") %>' Font-Italic="True"></asp:Label>

                                            </div>
                                        </div>
                                        <div class="row mb-3">
                                            <div class="col-lg-10">
                                                Genre -
                                                <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="Medium" Text='<%# Eval("genre") %>'></asp:Label>

                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <div class="row m-auto">
                                            <div class="col-lg-4">
                                                <asp:LinkButton ID="DeleteLinkButton" runat="server" CssClass="btn btn-danger" OnClientClick="return confirm('Delete Confirmation?')" CommandName="Delete" ToolTip="Delete"><i class="far fa-trash-alt"></i></asp:LinkButton>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>

                            </Columns>
                            <HeaderStyle Font-Size="Large" />
                        </asp:GridView>
                    </div>
                </div>
                <br />
                <br />
                <br />
            </div>
        </div>
    </div>
</asp:Content>
