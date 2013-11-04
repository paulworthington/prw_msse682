<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h1>Welcome to the Reader's Companion</h1>
        <p>
            The Reader’s Companion serves as a guide to the works of an author, whether that’s<br />
            one novel or a series of related novels. It’s a sort of encyclopedia that readers<br />
            can use to gain a deeper understanding of a body of work.
        </p>
        <article>
            <h2>Action Menu</h2>
            <ul class="round">
                <li class="one">
                    <h3><asp:HyperLink ID="itemGridHyperLink" runat="server" NavigateUrl="~/ItemGrid.aspx">List All Items</asp:HyperLink></h3>
                </li>
                <li class="two">
                    <h3><asp:HyperLink ID="loginHyperLink" runat="server" NavigateUrl="~/Login.aspx">Login</asp:HyperLink></h3>
                </li>
            </ul>
        </article>
    </div>
    </form>
</body>
</html>
