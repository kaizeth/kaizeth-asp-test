<%@ Page Title="" Language="C#" MasterPageFile="~/LevelOV.Master" AutoEventWireup="true" CodeBehind="LevelOverview.aspx.cs" Inherits="FYPSite.LevelOverview" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
            <%--http://msdn.microsoft.com/en-us/library/system.web.ui.webcontrols.xmldatasource(v=vs.80).aspx--%>
            <HeaderTemplate>
            </HeaderTemplate>
            <ItemTemplate>
        <div class="function2">
            <a href="#" onClick="history.go(-1);return false;">
                <div class="func2button2">
                    Back
                </div>
            </a>
            <a href='<%# "LevelPlay.aspx?path=" +Eval("mazepath")+ "&id=" +Eval("LevelID")+ "&sx=" +Eval("xStart")+ "&sy=" +Eval("yStart")+ "&ex=" +Eval("xEnd")+ "&ey=" +Eval("yEnd") %>'>
                <div class="func2button2">
                    Play
                </div>
            </a>
        </div>
                <table style="border-collapse: collapse">
                    <tr>
                        <td width="20%">
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/maze/" +Eval("mazepath")+ ".gif" %>' Width="100" Height="100" />
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
            </ItemTemplate>
            <FooterTemplate>
            </FooterTemplate>
        </asp:Repeater>

        
        <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource2">
            <%--http://msdn.microsoft.com/en-us/library/system.web.ui.webcontrols.xmldatasource(v=vs.80).aspx--%>
            <HeaderTemplate>
                <table border=1 style="border-collapse: collapse" width="100%">
                <tr>
                    <td>
                        Name
                    </td>
                    <td>
                        Best Time (seconds)
                    </td>
                    <td>
                        Best Distance
                    </td>
                </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr onclick="DoNav('<%# "ProfileView.aspx?id=" + Eval("AccountID") %>');" onmouseover="ChangeColor(this, true);"
                    onmousedown="ChangeColor(this, true);" onmouseout="ChangeColor(this, false);">
                    <td>
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("username") %>' />
                    </td>
                    <td>
                        <asp:Label runat="server" ID="Label2" Text='<%# Eval("bestTime") %>' />
                    </td>
                    <td>
                        <asp:Label runat="server" ID="Label4" Text='<%# Eval("bestDist") %>' />
                    </td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>

    <asp:Label ID="Label9" runat="server" Text="Label" Visible="False"></asp:Label>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:cs %>" 
            
            
            SelectCommand="SELECT Level.LevelID, Level.LevelTitle, Level.PlayCount, CONVERT (varchar, Level.date, 101) AS Date, Level.Description, Level.mazepath, Account.username AS Contributor, Level.xStart, Level.yStart, Level.xEnd, Level.yEnd FROM Level INNER JOIN Account ON Level.Contributor = Account.AccountID WHERE (Level.LevelID = @LevelID)">
        <SelectParameters>
            <asp:ControlParameter ControlID="Label9" DefaultValue="0" Name="LevelID" 
                PropertyName="Text" Type="Int32" />
        </SelectParameters>
        </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:cs %>" 
            
            SelectCommand="SELECT Account.AccountID, Account.username, MIN(PlayLog.Time) AS bestTime, MIN(PlayLog.Distance) AS bestDist, PlayLog.LevelID FROM Account INNER JOIN PlayLog ON Account.AccountID = PlayLog.AccountID WHERE (PlayLog.LevelID = @levelID) GROUP BY Account.AccountID, Account.username, PlayLog.LevelID ORDER BY bestTime">
        <SelectParameters>
            <asp:ControlParameter ControlID="Label9" Name="levelID" PropertyName="Text" />
        </SelectParameters>
        </asp:SqlDataSource>
</asp:Content>
