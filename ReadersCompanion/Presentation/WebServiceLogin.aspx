<%@ Page Language="C#" AutoEventWireup="true" CodeFile="WebServiceLogin.aspx.cs" Inherits="WebServiceLogin" %>

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
        <strong>Note:</strong> this form relies on an external Web Service to authenticate using the .NET membership API.
        <br />
        <br />

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
        <asp:Label ID="loginLabel" runat="server" style="z-index: 1; left: 10px;"></asp:Label>
        <br />
        <br />
        <asp:Button ID ="Button1" runat ="server" type ="submit" Text ="Login" OnClick ="LoginButton_Click" />
        <br />
        <br />
        <br />
        <br />
   
    </article>

    <aside>
        <h3>Navigation</h3>
        <ul>
            <li><asp:HyperLink ID ="HyperLink1" runat ="server" NavigateUrl ="~/Default.aspx">Back To Main </asp:HyperLink></li>
            <li><asp:HyperLink ID ="HyperLink2" runat ="server" NavigateUrl ="~/ItemGrid.aspx">List All Items </asp:HyperLink></li>
            <li><asp:HyperLink ID="HyperLink3" runat ="server" NavigateUrl ="~/AlphaList.aspx">Browse Items Alphabetically </asp:HyperLink></li>
            <li><asp:HyperLink ID ="HyperLink4" runat ="server" NavigateUrl ="~/AddItem.aspx">Add An Item </asp:HyperLink></li>
            <li><asp:HyperLink ID ="HyperLink5" runat ="server" NavigateUrl ="~/SetSpoilerFilter.aspx">Set Spoiler Filter </asp:HyperLink></li>
        </ul>
    </aside>
    
    </div>
    </form>
</body>
</html>
