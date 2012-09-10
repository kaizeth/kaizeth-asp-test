<%@ Page Title="" Language="C#" MasterPageFile="~/LevelSite.Master" AutoEventWireup="true"
    CodeBehind="MostPlayed.aspx.cs" Inherits="FYPSite.MostPlayed" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
        <%--http://msdn.microsoft.com/en-us/library/system.web.ui.webcontrols.xmldatasource(v=vs.80).aspx--%>
        <HeaderTemplate>
            <table>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <table  style="border-collapse: collapse" onclick="DoNav('<%# "LevelOverview.aspx?id=" + Eval("LevelID") %>');" onmouseover="ChangeColor(this, true);"
                onmousedown="ChangeColor(this, true);" onmouseout="ChangeColor(this, false);">
                    <tr>
                        <td width="20%">
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/maze/" +Eval("mazepath")+".gif" %>' Width="100" Height="100" />
                        </td>
                        <td>
                            <asp:Label runat="server" ID="Label1" Text='<%# Eval("LevelTitle") %>' Font-Bold="True"
                                Font-Underline="True" />
                            <br />
                            <asp:Label runat="server" ID="Label2" Text='<%# Eval("Description") %>' />
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td style="border-bottom-style: solid; border-bottom-width: medium; border-bottom-color: #000000;">
                            <asp:Label runat="server" ID="Label5" Text="Date Added:" />
                            <br />
                            <asp:Label runat="server" ID="Label4" Text="Contributor:" />
                            <br />
                            <asp:Label runat="server" ID="Label3" Text="No. of plays:" />
                            <br />
                        </td>
                        <td style="border-bottom-style: solid; border-bottom-width: medium; border-bottom-color: #000000;">
                            <asp:Label runat="server" ID="Label6" Text='<%# Eval("Date") %>' />
                            <br />
                            <asp:Label runat="server" ID="Label7" Text='<%# Eval("Contributor") %>' />
                            <br />
                            <asp:Label runat="server" ID="Label8" Text='<%# Eval("PlayCount") %>' />
                            <br />
                        </td>
                    </tr>
                </table>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
    </asp:Repeater>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cs %>"
        SelectCommand="SELECT Level.LevelID, Level.LevelTitle, Level.PlayCount, CONVERT (varchar, Level.date, 101) AS Date, Level.Description, Level.mazepath, Account.username AS Contributor FROM Level INNER JOIN Account ON Level.Contributor = Account.AccountID ORDER BY Level.PlayCount DESC"
        ViewStateMode="Disabled"></asp:SqlDataSource>
</asp:Content>
