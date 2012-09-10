<%@ Page Title="" Language="C#" MasterPageFile="~/RankingSite.Master" AutoEventWireup="true" CodeBehind="RankingLevel.aspx.cs" Inherits="FYPSite.RankingLevel" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="Label9" runat="server" Text="Search For Level Name: "></asp:Label>
    <asp:TextBox ID="txt_search" runat="server"></asp:TextBox>
    <asp:Button ID="Button1" runat="server" Text="Search" 
    onclick="Button1_Click" />
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:cs %>" 
        
        SelectCommand="SELECT Level.LevelID, Level.LevelTitle, Level.PlayCount, CONVERT (varchar, Level.date, 101) AS Date, Level.Description, Level.mazepath, Account.username AS Contributor FROM Level INNER JOIN Account ON Level.Contributor = Account.AccountID WHERE (Level.LevelTitle LIKE '%' + @LevelTitle + '%')">
        <SelectParameters>
            <asp:ControlParameter ControlID="txt_search" DefaultValue="" Name="LevelTitle" 
                PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
