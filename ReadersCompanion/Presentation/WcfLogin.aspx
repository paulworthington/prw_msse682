<%@ Page Language="C#" AutoEventWireup="true" CodeFile="WcfLogin.aspx.cs" Inherits="WcfLogin" %>

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
        <strong>Note:</strong> this form relies on an external WCF-based authentication server<br />
        to authenticate, and it currently defaults to true.
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
        <asp:Button ID ="LoginButton" runat ="server" type ="submit" Text ="Login" OnClick ="LoginButton_Click" />
        <br />
        <br />
        <br />
        <br />
   
    </article>

    <aside>
        <h3>Navigation</h3>
        <ul>
            <li><asp:HyperLink ID ="defaultHyperLink" runat ="server" NavigateUrl ="~/Default.aspx">Back To Main </asp:HyperLink></li>
            <li><asp:HyperLink ID ="itemGridHyperLink" runat ="server" NavigateUrl ="~/ItemGrid.aspx">List All Items </asp:HyperLink></li>
            <li><asp:HyperLink ID="alphaListHyperLink" runat ="server" NavigateUrl ="~/AlphaList.aspx">Browse Items Alphabetically </asp:HyperLink></li>
            <li><asp:HyperLink ID ="addItemHyperLink" runat ="server" NavigateUrl ="~/AddItem.aspx">Add An Item </asp:HyperLink></li>
            <li><asp:HyperLink ID ="spoilerFilterHyperLink" runat ="server" NavigateUrl ="~/SetSpoilerFilter.aspx">Set Spoiler Filter </asp:HyperLink></li>
        </ul>
    </aside>




    
    </div>
    </form>
</body>
</html>
