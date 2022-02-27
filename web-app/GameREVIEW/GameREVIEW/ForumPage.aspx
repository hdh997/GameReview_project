<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ForumPage.aspx.cs" Inherits="GameREVIEW.ForumPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {

            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
           
        });

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row mt-3">
            <div class="col-md-10 mx-auto">
                <div class="row">
                    <div class="col">
                        <center>
                             <h3>The Forum</h3>
                        </center>
                    </div>
                    <%-- create link btn --%>
                    <div class="row">
                        <div class="col">
                            <asp:LinkButton ID="GoCreateLinkButton" CssClass="btn btn-outline-success" runat="server" ToolTip="Create Your New REVIEW" OnClick="GoCreateLinkButton_Click" ><i class="fas fa-plus"></i></asp:LinkButton>
                          
                        </div>
                    </div>

                     <%-- Separate --%>
                    <div class="row">
                        <div class="col">
                            <hr />
                        </div>
                    </div>
                    <%-- Gridview from here --%>
                    <div class="row">
                        <div class="col-10 mx-auto">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:gamesREVIEWdbConnectionString %>" SelectCommand="SELECT [contentID], [userName], [content_title], [content_main], [genre] FROM [contents_tbl]"></asp:SqlDataSource>
                            <asp:GridView ID="GridView1" CssClass="table table-borderless table-striped table-hover table-responsive" runat="server" AutoGenerateColumns="False" DataKeyNames="contentID" DataSourceID="SqlDataSource1" GridLines="None" BorderStyle="None" style="text-align:justify" EmptyDataText="No Post Yet..." ShowHeaderWhenEmpty="True">
                                <Columns>
                                    <%--<asp:TemplateField HeaderText="Title" InsertVisible="False" SortExpression="content_title">
                                        <EditItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("content_title") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            
                                        </ItemTemplate>
                                    </asp:TemplateField>--%>
                                    
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                        <div class="container-fluid">
                                            <div class="row">
                                                <div class="col-lg-3">
                                                    <div class="row">
                                                        <div class="col-12">
                                                            <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="Larger" Text='<%# Bind("content_title") %>' ForeColor="#3B3B3B"></asp:Label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-9">
                                                    <div class="row">
                                                        <div class="col-10">
                                                            Details -
                                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("content_main") %>' Font-Size="Large" ForeColor="#3B3B3B"></asp:Label>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-12">
                                                            Genre -
                                                            <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Medium" Text='<%# Eval("genre") %>' ForeColor="#3B3B3B"></asp:Label>
                                                            &nbsp;| Author -&nbsp;<asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="Medium" Text='<%# Eval("userName") %>' ForeColor="#3B3B3B"></asp:Label>
                                                            &nbsp;</div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
</asp:Content>
