<%@ Page Title="" Language="C#" MasterPageFile="~/LevelOV.Master" AutoEventWireup="true" CodeBehind="LevelSubmit.aspx.cs" Inherits="FYPSite.LevelSubmit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <div class="function2">
            <a href="#" onClick="history.go(-2);return false;">
                <div class="func2button2">
                    Back
                </div>
            </a>
                <div class="func2button2">
                    <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">Submit</asp:LinkButton>
                </div>
        </div>
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
            <%--http://msdn.microsoft.com/en-us/library/system.web.ui.webcontrols.xmldatasource(v=vs.80).aspx--%>
            <HeaderTemplate>
            </HeaderTemplate>
            <ItemTemplate>
            <div style="text-align: center">
                <asp:Label ID="Label9" runat="server" Text="CONGRATULATIONS!" Font-Size="Larger" Font-Bold="True" ></asp:Label>
                <br />
                <asp:Label ID="Label10" runat="server" Text="You've cleared the maze! Click Submit to save your score."></asp:Label>
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
                <table border=1>
                    <tr>
                        <td style="font-weight: bold">
                            <asp:Label ID="Label11" runat="server" Text="Your Stats"></asp:Label>
                        </td>
                        <td style="font-weight: bold">
                            <asp:Label ID="Label14" runat="server" Text="Achievement Obtained"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label12" runat="server" Text="Label"></asp:Label> <br />
                            <asp:Label ID="Label13" runat="server" Text="Label"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label16" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                </table>
    <asp:Label ID="lbl_accID" runat="server" Text="Label" Visible="False"></asp:Label>
    <asp:Label ID="lbl_levelID" runat="server" Text="Label" Visible="False"></asp:Label>
    <asp:Label ID="lbl_distance" runat="server" Text="L" Visible="False"></asp:Label>
    <asp:Label ID="lbl_time" runat="server" Text="Label" Visible="False"></asp:Label>
    <asp:Label ID="lbl_playcount" runat="server" Text="Label" Visible="False"></asp:Label>
    <asp:Label ID="lbl_timeStamp" runat="server" Text="Label" Visible="False"></asp:Label>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:cs %>" 
            SelectCommand="SELECT Level.LevelID, Level.LevelTitle, Level.PlayCount, CONVERT (varchar, Level.date, 101) AS Date, Level.Description, Account.username AS Contributor, Level.date AS Expr1, Level.mazepath FROM Level INNER JOIN Account ON Level.Contributor = Account.AccountID WHERE (Level.LevelID = @levelID)" 
            InsertCommand="INSERT INTO PlayLog(AccountID, LevelID, Time, Distance, TimeStamp) VALUES (@accID, @levelID, @time, @distance, @timeStamp)">
        <InsertParameters>
            <asp:ControlParameter ControlID="lbl_accID" Name="accID" PropertyName="Text" />
            <asp:ControlParameter ControlID="lbl_levelID" Name="levelID" 
                PropertyName="Text" />
            <asp:ControlParameter ControlID="lbl_time" Name="time" PropertyName="Text" />
            <asp:ControlParameter ControlID="lbl_distance" Name="distance" PropertyName="Text" />
            <asp:ControlParameter ControlID="lbl_timeStamp" Name="timeStamp" 
                PropertyName="Text" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="lbl_levelID" Name="levelID" 
                PropertyName="Text" />
        </SelectParameters>
        </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:cs %>" 
            DeleteCommand="DELETE FROM [Level] WHERE [LevelID] = @LevelID" 
            InsertCommand="INSERT INTO [Level] ([PlayCount]) VALUES (@PlayCount)" 
            SelectCommand="SELECT PlayCount, LevelID FROM Level WHERE (LevelID = @levelID)" 
            UpdateCommand="UPDATE [Level] SET [PlayCount] = @PlayCount WHERE [LevelID] = @LevelID">
        <DeleteParameters>
            <asp:Parameter Name="LevelID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="PlayCount" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="lbl_levelID" Name="levelID" 
                PropertyName="Text" />
        </SelectParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="lbl_playcount" Name="PlayCount" 
                PropertyName="Text" Type="Int32" />
            <asp:ControlParameter ControlID="lbl_levelID" Name="LevelID" 
                PropertyName="Text" Type="Int32" />
        </UpdateParameters>
        </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:cs %>" 
            SelectCommand="SELECT goalID, type, amount, condition, filter, title FROM Goals"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
            ConnectionString="<%$ ConnectionStrings:cs %>" 
            SelectCommand="SELECT AccountID, SUM(Time) AS totalTime, SUM(Distance) AS totalDist FROM PlayLog WHERE (AccountID = @accID) GROUP BY AccountID">
        <SelectParameters>
            <asp:ControlParameter ControlID="lbl_accID" Name="accID" PropertyName="Text" />
        </SelectParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
            ConnectionString="<%$ ConnectionStrings:cs %>" 
            SelectCommand="SELECT COUNT(PlayID) AS totalPlays, AccountID FROM PlayLog GROUP BY AccountID HAVING (AccountID = @id)">
            <SelectParameters>
                <asp:ControlParameter ControlID="lbl_accID" Name="id" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
            ConnectionString="<%$ ConnectionStrings:cs %>" 
            SelectCommand="SELECT COUNT(PlayID) AS totalPlays, AccountID, LevelID FROM PlayLog GROUP BY AccountID, LevelID HAVING (AccountID = @id) AND (LevelID = @maze)">
            <SelectParameters>
                <asp:ControlParameter ControlID="lbl_accID" Name="id" PropertyName="Text" />
                <asp:ControlParameter ControlID="lbl_levelID" Name="maze" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>

    </asp:Content>
