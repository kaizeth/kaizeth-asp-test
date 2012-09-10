<%@ Page Title="" Language="C#" MasterPageFile="~/NewsSite.Master" AutoEventWireup="true"
    CodeBehind="RecentNews.aspx.cs" Inherits="FYPSite.RecentNews" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
            <%--http://msdn.microsoft.com/en-us/library/system.web.ui.webcontrols.xmldatasource(v=vs.80).aspx--%>
            <HeaderTemplate>
            </HeaderTemplate>
            <ItemTemplate>
            <a href='<%# "NewsDetail.aspx?id=" + Eval("NewsID") %>'>
            <div class="newsArticle" style="color: #000000">
                <asp:Label runat="server" ID="Label1" Text='<%# Eval("NewsTitle") %>' Font-Underline="True"
                    Font-Bold="True" />
                <asp:Label runat="server" ID="Label3" Text=' - '></asp:Label>
                <asp:Label runat="server" ID="Label4" Text='<%# Eval("NewsDate") %>'></asp:Label>
                <br />
                <asp:Label runat="server" ID="Label2" Text='     <%# Eval("NewsContent") %>' />
                <br />
                <br />
                </div>
                </a>
            </ItemTemplate>
            <FooterTemplate>
            </FooterTemplate>
        </asp:Repeater>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cs %>"
        
            SelectCommand="SELECT TOP 10 NewsTitle, CONVERT (varchar, NewsDate, 101) AS NewsDate, NewsContent, NewsID, NewsDate AS Expr1 FROM News ORDER BY Expr1"></asp:SqlDataSource>
</asp:Content>
