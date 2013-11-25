<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Restricted_Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h1> Admin </h1>
        <h2> - Editors-only page for administrative functions </h2>

        <p>This page is only accessible by logged-in users with the editor role.</p>

        <aside>
            <ul>
                <li><asp:HyperLink ID ="defaultHyperLink" runat ="server" NavigateUrl ="~/Default.aspx">Back To Main </asp:HyperLink></li>
            </ul>
        </aside>
    
    </div>
    </form>
</body>
</html>
