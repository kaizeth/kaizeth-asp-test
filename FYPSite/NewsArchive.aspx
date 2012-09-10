<%@ Page Title="" Language="C#" MasterPageFile="~/NewsSite.Master" AutoEventWireup="true" CodeBehind="NewsArchive.aspx.cs" Inherits="FYPSite.NewsArchive" %>
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
                <asp:Label runat="server" ID="Label5" Text='<%# " (Read " + Eval("TimesRead") + " Times)"%>' Font-Size="Small" ForeColor="#666666"></asp:Label>     
                <br />
                </div>
                </a>
            </ItemTemplate>
            <FooterTemplate>
            </FooterTemplate>
        </asp:Repeater>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:cs %>" 
            SelectCommand="SELECT [NewsID], [NewsTitle], CONVERT (varchar, NewsDate, 101) AS NewsDate, [TimesRead] FROM [News] ORDER BY [NewsDate] DESC"></asp:SqlDataSource>
</asp:Content>
