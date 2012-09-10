<%@ Page Title="" Language="C#" MasterPageFile="~/LevelSite.Master" AutoEventWireup="true" CodeBehind="LevelMyRecent.aspx.cs" Inherits="FYPSite.LevelMyRecent" %>
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
                <br />
                <br />
                <br />
            </FooterTemplate>
        </asp:Repeater>
    <asp:Label ID="Label9" runat="server" Text="Label" Visible="False"></asp:Label>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:cs %>" 
            
            SelectCommand="SELECT TOP (5) PlayLog.LevelID, PlayLog.TimeStamp, PlayLog.AccountID, Level.LevelID AS Expr1, Level.LevelTitle, Level.PlayCount, CONVERT (varchar, Level.date, 101) AS Date, Level.Description, Level.mazepath, Account.username AS Contributor FROM Level INNER JOIN PlayLog ON Level.LevelID = PlayLog.LevelID INNER JOIN Account ON PlayLog.AccountID = Account.AccountID WHERE (PlayLog.AccountID = @userID) ORDER BY PlayLog.TimeStamp DESC">
        <SelectParameters>
            <asp:ControlParameter ControlID="Label9" Name="userID" PropertyName="Text" />
        </SelectParameters>
        </asp:SqlDataSource>
    </asp:Content>
