<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="FYPSite.login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Login.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server" class="border">
        <fieldset>
            <legend><b>Maze Mania! Login</b></legend>
            <p>
                <asp:Label ID="lbl_user" runat="server" Text="Username: " CssClass="label"></asp:Label> 
                <asp:TextBox ID="txt_user" runat="server" CssClass="textbox"></asp:TextBox>  <!--input type="text" id="user" /-->
            </p>
            <p>
                <asp:Label ID="lbl_pass" runat="server" Text="Password: " CssClass="label"></asp:Label>
                <asp:TextBox ID="txt_pass" runat="server" CssClass="textbox" TextMode="Password"></asp:TextBox><!--input type="text" id="pass" /--><br />
            </p>
            <asp:Label ID="Label1" runat="server" Text="Login Failed!!" Visible="False" 
                ForeColor="Red"></asp:Label><br />
            <asp:Button ID="btn_login" runat="server" Text="Login" CssClass="submit" onclick="btn_login_Click"/>
            <asp:Button ID="Button1" runat="server" Text="Register" 
                onclick="Button1_Click" />
        </fieldset>
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:cs %>" 
            SelectCommand="SELECT * FROM [Account]"></asp:SqlDataSource>
    </form>
</body>
</html>
