<%@ Page Title="" Language="C#" MasterPageFile="~/NewsSite.Master" AutoEventWireup="true" CodeBehind="NewsDetail.aspx.cs" Inherits="FYPSite.NewsDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
            <%--http://msdn.microsoft.com/en-us/library/system.web.ui.webcontrols.xmldatasource(v=vs.80).aspx--%>
            <HeaderTemplate>
            </HeaderTemplate>
            <ItemTemplate>
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
            </ItemTemplate>
            <FooterTemplate>
            </FooterTemplate>
        </asp:Repeater>
    <asp:Label ID="Label5" runat="server" Text="Label" Visible="False"></asp:Label>
    <asp:Label ID="Label6" runat="server" Text='Label' Visible="False"></asp:Label>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:cs %>" 
            
            SelectCommand="SELECT [NewsTitle], CONVERT (varchar, NewsDate, 101) AS NewsDate, [TimesRead], [NewsContent] FROM [News] WHERE ([NewsID] = @NewsID)" 
            UpdateCommand="UPDATE News SET TimesRead = @Times WHERE (NewsID = @NewsID)">
        <SelectParameters>
            <asp:ControlParameter ControlID="Label5" DefaultValue="0" Name="NewsID" 
                PropertyName="Text" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="Label6" Name="Times" PropertyName="Text" />
            <asp:ControlParameter ControlID="Label5" Name="NewsID" PropertyName="Text" />
        </UpdateParameters>
        </asp:SqlDataSource>
</asp:Content>
