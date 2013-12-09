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
        <strong>Note:</strong> this form an asp:Login web control to authenticate using the .NET membership API.
        <br />
        <br />

    <article>

        <asp:Login ID="Login1" runat="server" PasswordLabelText="Password: " TitleText="Please enter your account information:" UserNameLabelText="User Name: ">
        </asp:Login>

    </article>

        <p>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
        </p>

    <aside>
        <h3>Navigation</h3>
        <ul>
            <li><asp:HyperLink ID ="defaultHyperLink" runat ="server" NavigateUrl ="~/Default.aspx">Back To Main </asp:HyperLink></li>
            <li><asp:HyperLink ID ="itemGridHyperLink" runat ="server" NavigateUrl ="~/ItemGrid.aspx">List All Items </asp:HyperLink></li>
            <li><asp:HyperLink ID ="alphaListHyperLink" runat ="server" NavigateUrl ="~/AlphaList.aspx">Browse Items Alphabetically </asp:HyperLink></li>
            <li><asp:HyperLink ID ="addItemHyperLink" runat ="server" NavigateUrl ="~/AddItem.aspx">Add An Item </asp:HyperLink></li>
            <li><asp:HyperLink ID ="spoilerFilterHyperLink" runat ="server" NavigateUrl ="~/SetSpoilerFilter.aspx">Set Spoiler Filter </asp:HyperLink></li>
        </ul>
    </aside>




    
    </div>
    </form>
</body>
</html>
