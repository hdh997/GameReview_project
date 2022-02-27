<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UserReviewManagement.aspx.cs" Inherits="GameREVIEW.UserReviewManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {

            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();

            $('.modal').on('hidden.bs.modal', function () {
                window.top.location.reload(); // refresh page when exit modal
            });
        });

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Modal -->
    <div class="modal fade" id="ReviewCreateModal" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="exampleModalLabel">REVIEW</h4>
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
                                                    <label>Title*</label>
                                                    <div class="input-group">
                                                        <asp:TextBox ID="TitleTextBox" CssClass="form-control" runat="server" placeholder="Game's Title"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>


                                            <div class="col-sm-5">
                                                <div class="form-group">
                                                    <asp:Label ID="errorLabel" runat="server" Text="Label" Visible="False"></asp:Label>
                                                </div>
                                            </div>

                                            <div class="col-sm-6">
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


                                            <div class="col-sm-10">
                                                <label>Content*</label>
                                                <div class="form-group">
                                                    <asp:TextBox ID="ContentTextBox" CssClass="form-control" runat="server" placeholder="What do you think about it?" TextMode="MultiLine"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>

                                        <%-- Buttons here--%>
                                        <div class="row mt-3">
                                            <div class="col-3 mx-auto">
                                                <div class="d-grid gap-1">
                                                    <asp:Button ID="CreateReviewbtn" CssClass="btn btn-success" runat="server" Text="Create" ToolTip="Create REVIEW" OnClick="CreateReviewbtn_Click" />
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
            <div class="col">
                <asp:Button ID="BackButton1" class="btn btn-outline-secondary" runat="server" Text="<< Profile" OnClick="BackButton1_Click" />
            </div>
        </div>
        <div class="row mt-2">
            <div class="col-md-10 mx-auto">
                <div class="row">
                    <div class="col">
                        <center>
                            <h4>Your REVIEW</h4>
                        </center>
                    </div>
                </div>

                <%-- Create review btn here --%>
                <div class="row">
                    <div class="col">
                        <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                            <asp:LinkButton ID="UserInfoLinkBtn" CssClass="btn btn-outline-success" runat="server" ToolTip="Create Your New REVIEW" data-bs-toggle="modal" data-bs-target="#ReviewCreateModal"><i class="fas fa-plus"></i></i></asp:LinkButton>
                            <%--<asp:Button ID="CreateButton" class="btn btn-outline-success" runat="server" Text="REVIEW" ToolTip="Create Your New REVIEW" data-bs-toggle="modal" data-bs-target="#ReviewCreateModal" />--%>
                        </div>
                    </div>
                </div>

                <%-- Separate --%>
                <div class="row">
                    <div class="col">
                        <hr />
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <asp:GridView ID="GridView1" CssClass="table table-borderless table-striped table-responsive" runat="server" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True" DataKeyNames="contentID" OnRowUpdating="GridView1_RowUpdating" OnRowEditing="GridView1_RowEditing" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" GridLines="None" BorderStyle="None">

                            <Columns>
                                <asp:TemplateField HeaderText="Title">
                                    <ItemTemplate>
                                        <asp:Label ID="CTLabel" Text='<%# Eval("content_title") %>' runat="server" Font-Size="Large"></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="CTTExtBox" class="form-control" Text='<%# Eval("content_title") %>' runat="server"></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Genre">
                                    <ItemTemplate>
                                        <asp:Label ID="GLabel" Text='<%# Eval("genre") %>' runat="server" Font-Size="Large"></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:DropDownList class="form-control" ID="GenreDropDownListEdit" runat="server" SelectedValue='<%# Eval("genre") %>'>
                                            <asp:ListItem Text="Select" Value="NA"></asp:ListItem>
                                            <asp:ListItem Text="MOBA" Value="MOBA"></asp:ListItem>
                                            <asp:ListItem Text="Adv" Value="Adv"></asp:ListItem>
                                            <asp:ListItem Text="FPS" Value="FPS"></asp:ListItem>
                                            <asp:ListItem Text="Roguelike" Value="Roguelike"></asp:ListItem>
                                            <asp:ListItem Text="Others" Value="Others"></asp:ListItem>
                                        </asp:DropDownList>
                                    </EditItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Details">
                                    <ItemTemplate>
                                        <asp:Label ID="DTLabel" Text='<%# Eval("content_main") %>' runat="server" Font-Size="Medium"></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="DTextBox" class="form-control" Text='<%# Eval("content_main") %>' runat="server" TextMode="MultiLine" Font-Size="Medium"></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>

                                <%-- Commands --%>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <div class="d-grid gap-3 justify-content-center">
                                            <asp:LinkButton ID="ImageButtonEdit" CssClass="btn btn-warning btn-sm" CommandName="Edit" ToolTip="Edit" runat="server" Width="30"><i class="far fa-edit"></i></asp:LinkButton>

                                            <asp:LinkButton ID="ImageButtonDelete" CssClass="btn btn-danger btn-sm" CommandName="Delete" ToolTip="Delete" runat="server" Width="30" OnClientClick="return confirm('Delete Post Confirm?')"><i class="far fa-trash-alt"></i></asp:LinkButton>
                                        </div>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <div class="d-grid gap-2 justify-content-center">
                                            <asp:LinkButton ID="ImageButtonSave" CssClass="btn btn-success btn-sm" CommandName="Update" ToolTip="Update" runat="server" Width="30" OnClientClick="return confirm('Edit Post Confirm?')"><i class="far fa-save"></i></asp:LinkButton>
                                            <asp:LinkButton ID="ImageButtonCancel" CssClass="btn btn-secondary btn-sm" CommandName="Cancel" ToolTip="Cancel" runat="server" Width="30"><i class="fas fa-times"></i></asp:LinkButton>
                                        </div>

                                    </EditItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>


    </div>
</asp:Content>
