<%@ Page Title="" Language="C#" MasterPageFile="~/RankingSite.Master" AutoEventWireup="true" CodeBehind="RankingOverall.aspx.cs" Inherits="FYPSite.RankingOverall" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
            <%--http://msdn.microsoft.com/en-us/library/system.web.ui.webcontrols.xmldatasource(v=vs.80).aspx--%>
            <HeaderTemplate>
                <table border=1 style="border-collapse: collapse" width="100%">
                <tr>
                    <td>
                        Ranking
                    </td>
                    <td>
                        Name
                    </td>
                    <td>
                        Total Unique Levels
                    </td>
                    <td>
                        Total Time (seconds)
                    </td>
                    <td>
                        Total Distance
                    </td>
                </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr onclick="DoNav('<%# "ProfileView.aspx?id=" + Eval("AccountID") %>');" onmouseover="ChangeColor(this, true);"
                    onmousedown="ChangeColor(this, true);" onmouseout="ChangeColor(this, false);">
                    <td>
                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("Ranking") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("username") %>' />
                    </td>
                    <td>
                        <asp:Label runat="server" ID="Label1" Text='<%# Eval("uLevels") %>' />
                    </td>
                    <td>
                        <asp:Label runat="server" ID="Label2" Text='<%# Eval("totalTime") %>' />
                    </td>
                    <td>
                        <asp:Label runat="server" ID="Label4" Text='<%# Eval("totalDist") %>' />
                    </td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:cs %>" 
            
            SelectCommand="SELECT rank() OVER (ORDER BY COUNT(DISTINCT PlayLog.LevelID) DESC) AS Ranking, Account.username, SUM(PlayLog.Time) AS totalTime, SUM(PlayLog.Distance) AS totalDist, COUNT(DISTINCT PlayLog.LevelID) AS uLevels, Account.AccountID FROM Account INNER JOIN PlayLog ON Account.AccountID = PlayLog.AccountID GROUP BY Account.username, Account.AccountID ORDER BY uLevels DESC">
        </asp:SqlDataSource>
</asp:Content>
