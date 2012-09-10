<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="FYPSite.Register" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="Label1" runat="server" Text="Username: "></asp:Label>
        <asp:TextBox ID="txt_user" runat="server"></asp:TextBox> 
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ControlToValidate="txt_user" ErrorMessage="*Required. "></asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="Label2" runat="server" Text="Password: "></asp:Label>
        <asp:TextBox ID="txt_pass" runat="server" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
            ControlToValidate="txt_pass" ErrorMessage="*Required. "></asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="Label3" runat="server" Text="Confirm Password: "></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
            ControlToValidate="TextBox1" ErrorMessage="*Required. "></asp:RequiredFieldValidator>
        <asp:CompareValidator ID="CompareValidator1" runat="server" 
            ControlToCompare="txt_pass" ControlToValidate="TextBox1" 
            ErrorMessage="Password does not match!"></asp:CompareValidator>
        <br />
        <asp:Button ID="Button1" runat="server" Text="Confirm Registration" 
            onclick="Button1_Click" />
        <asp:Button ID="Button2" runat="server" Text="Back to Login" 
            onclick="Button2_Click" CausesValidation="False" />
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:cs %>" 
            DeleteCommand="DELETE FROM [Account] WHERE [AccountID] = @AccountID" 
            InsertCommand="INSERT INTO [Account] ([username], [password]) VALUES (@username, @password)" 
            SelectCommand="SELECT AccountID, username FROM Account WHERE (username = @user )" 
            UpdateCommand="UPDATE [Account] SET [username] = @username, [password] = @password WHERE [AccountID] = @AccountID">
            <DeleteParameters>
                <asp:Parameter Name="AccountID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="txt_user" Name="username" PropertyName="Text" 
                    Type="String" />
                <asp:ControlParameter ControlID="txt_pass" Name="password" PropertyName="Text" 
                    Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="txt_user" Name="user" PropertyName="Text" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="username" Type="String" />
                <asp:Parameter Name="password" Type="String" />
                <asp:Parameter Name="AccountID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
