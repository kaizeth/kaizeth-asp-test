<%@ Page Title="" Language="C#" MasterPageFile="~/ProfileSite.Master" AutoEventWireup="true" CodeBehind="ProfileView.aspx.cs" Inherits="FYPSite.ProfileView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
            <%--http://msdn.microsoft.com/en-us/library/system.web.ui.webcontrols.xmldatasource(v=vs.80).aspx--%>
            <HeaderTemplate>
            </HeaderTemplate>
            <ItemTemplate>
            <div class="newsArticle" style="color: #000000">
                <asp:Label runat="server" ID="Label1" Text='<%# "User Profile: " + Eval("username") %>' Font-Underline="True"
                    Font-Bold="True" />
                <br />
                <asp:Label runat="server" ID="Label2" Text='<%# "Global Ranking : #" + Eval("RankingNo") %>' />
                <br />
                <asp:Label runat="server" ID="Label3" Text='<%# "Total Levels Played : " + Eval("totalPlays") %>' />
                <br />
                <asp:Label runat="server" ID="Label10" Text='<%# "Total Unique Levels Played : " + Eval("uLevels") %>' />
                <br />
                <asp:Label runat="server" ID="Label4" Text='<%# "Total Distance : " + Eval("totalDist") %>' />
                <br />
                <asp:Label runat="server" ID="Label5" Text='<%# "Total Time Spent : " + Eval("totaltime") + " seconds" %>' />
                <br />
                <asp:Label runat="server" ID="Label11" Text='_____________________________' Font-Bold="True" Font-Size="Larger" />
                <br />
                </div>
            </ItemTemplate>
            <FooterTemplate>
            </FooterTemplate>
        </asp:Repeater>

    <asp:Repeater ID="Repeater3" runat="server" DataSourceID="SqlDataSource3">
        <%--http://msdn.microsoft.com/en-us/library/system.web.ui.webcontrols.xmldatasource(v=vs.80).aspx--%>
        <HeaderTemplate>
            <div class="newsArticle" style="color: #000000">
                <asp:Label runat="server" ID="Label1" Text='Achievement Obtained' Font-Underline="True"
                    Font-Bold="True" />
                <table>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td>
                    <asp:Label runat="server" ID="Label2" Text='<%# Eval("Title") %>' />
                </td>
                <td>
                    <asp:Label runat="server" ID="Label3" Text='<%# " - " + Eval("Description") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
            </table>
            <asp:Label runat="server" ID="Label11" Text='_____________________________' Font-Bold="True"
                Font-Size="Larger" />
            <br />
            </div>
        </FooterTemplate>
    </asp:Repeater>

    <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource2">
            <%--http://msdn.microsoft.com/en-us/library/system.web.ui.webcontrols.xmldatasource(v=vs.80).aspx--%>
            <HeaderTemplate>
                <br />
                <br />
                <asp:Label ID="Label9" runat="server" Text="Recent Plays" Font-Bold="True" Font-Size="Large"></asp:Label>
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
    <asp:Label ID="lbl_id" runat="server" Text="Label" Visible="False"></asp:Label>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:cs %>" 
            SelectCommand="SELECT * FROM (SELECT rank() OVER (ORDER BY COUNT(DISTINCT PlayLog.LevelID) DESC) AS RankingNo, Account.username, SUM(PlayLog.Time) AS totalTime, SUM(PlayLog.Distance) AS totalDist, COUNT(DISTINCT PlayLog.LevelID) AS uLevels, Account.AccountID, COUNT(PlayLog.LevelID) AS totalPlays FROM Account INNER JOIN PlayLog ON Account.AccountID = PlayLog.AccountID GROUP BY Account.username, Account.AccountID) AS RankingTable WHERE AccountID = @id">
        <SelectParameters>
            <asp:ControlParameter ControlID="lbl_id" Name="id" PropertyName="Text" />
        </SelectParameters>
        </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:cs %>" 
            SelectCommand="SELECT TOP (3) PlayLog.LevelID, PlayLog.TimeStamp, PlayLog.AccountID, Level.LevelID AS Expr1, Level.LevelTitle, Level.PlayCount, CONVERT (varchar, Level.date, 101) AS Date, Level.Description, Level.mazepath, Account.username AS Contributor FROM Level INNER JOIN PlayLog ON Level.LevelID = PlayLog.LevelID INNER JOIN Account ON PlayLog.AccountID = Account.AccountID WHERE (PlayLog.AccountID = @userID) ORDER BY PlayLog.TimeStamp DESC">
        <SelectParameters>
            <asp:ControlParameter ControlID="lbl_id" Name="userID" PropertyName="Text" />
        </SelectParameters>
        </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:cs %>" 
            SelectCommand="SELECT Goals.title AS Title, Goals.description AS Description, Achievement.accountID FROM Achievement INNER JOIN Goals ON Achievement.goalID = Goals.goalID WHERE (Achievement.accountID = @userID)">
        <SelectParameters>
            <asp:ControlParameter ControlID="lbl_id" Name="userID" PropertyName="Text" />
        </SelectParameters>
        </asp:SqlDataSource>
</asp:Content>
