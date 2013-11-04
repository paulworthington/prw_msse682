<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>


        

        <h1> Login </h1>
        <h2> - login to access personalized features </h2>

    <article>
        <table>
            <tr>
                <td>Username</td>
                <td><asp:TextBox ID ="UsernameBox" runat ="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Password</td>
                <td><asp:TextBox ID="PasswordBox" runat="server" TextMode="Password"></asp:TextBox></td>
            </tr>
        </table>
        <br />
        <br />
        <asp:Button ID ="LoginButton" runat ="server" type ="submit" Text ="Login" OnClick ="LoginButton_Click" />
        <br />
        <br />
        <br />
   
    </article>

    <aside>
        <h3>Navigation</h3>
        <ul>
            <li><asp:HyperLink ID ="defaultHyperLink" runat ="server" NavigateUrl ="~/Default.aspx">Back To Main </asp:HyperLink></li>
            <li><asp:HyperLink ID ="itemGridHyperLink" runat ="server" NavigateUrl ="~/ItemGrid.aspx">List All Items </asp:HyperLink></li>
            <li><asp:HyperLink ID ="addItemHyperLink" runat ="server" NavigateUrl ="~/AddItem.aspx">Add An Item </asp:HyperLink></li>
        </ul>
    </aside>




    
    </div>
    </form>
</body>
</html>
