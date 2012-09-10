<%@ Page Title="" Language="C#" MasterPageFile="~/NewsSite.Master" AutoEventWireup="true" CodeBehind="MostRead.aspx.cs" Inherits="FYPSite.MostRead" %>
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
                <asp:Label runat="server" ID="Label5" Text='<%# "Read " + Eval("TimesRead") + " Times"%>' Font-Size="Small" ForeColor="#666666"></asp:Label>                
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:cs %>" 
            
            
            SelectCommand="SELECT TOP (10) NewsTitle, TimesRead, NewsContent, CONVERT (varchar, NewsDate, 101) AS NewsDate, NewsID FROM News ORDER BY TimesRead DESC"></asp:SqlDataSource>
            <%--http://www.sqlusa.com/bestpractices2005/centurydateformat/--%>
</asp:Content>
