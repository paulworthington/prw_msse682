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
        <p>
            <asp:LoginView ID="LoginView1" runat="server">
                <AnonymousTemplate>
                    Please click the Login link to sign in and access personalized content.
                </AnonymousTemplate>
                <LoggedInTemplate>
                    <h3>Welcome, <asp:LoginName ID="LoginName1" runat="server" /></h3>
                </LoggedInTemplate>
            </asp:LoginView>
        </p>

        <article>
            <p><br /><br /></p>
            <h2>Action Menu</h2>
            <p>
                <br />
                <br />
            </p>
            <ul class="round">
                <li class="one"><strong><asp:LoginStatus ID="LoginStatus2" runat="server" /></strong><br />
                    - authenticate using asp:Login web control and direct .NET membership
                </li>
                <li class="one"><strong><asp:HyperLink ID="socketLoginHyperLink" runat="server" NavigateUrl="~/SocketLogin.aspx">Socket Login</asp:HyperLink></strong><br />
                    - authenticate using external socket-based authentication server that uses .NET membership<br />
                </li>
                <li class="one"><strong><asp:HyperLink ID="wcfLoginHyperLink" runat="server" NavigateUrl="~/WcfLogin.aspx">WCF Login</asp:HyperLink></strong><br />
                    - authenticate using external WCF-based authentication service that defaults to true<br />
                </li>
                <li class="two"><strong><asp:HyperLink ID="adminHyperLink" runat="server" NavigateUrl="~/Restricted/Admin.aspx">Admin page for editors</asp:HyperLink></strong><br />
                    - use this after using Login.aspx
                </li>
                <li class="three"><strong><asp:HyperLink ID="itemGridHyperLink" runat="server" NavigateUrl="~/ItemGrid.aspx">List All Items</asp:HyperLink></strong></li>
                <li class="four"><strong><asp:HyperLink ID="alphaListHyperLink" runat ="server" NavigateUrl ="~/AlphaList.aspx">Browse Items Alphabetically </asp:HyperLink></strong></li>
                <li class="five"><strong><asp:HyperLink ID ="spoilerFilterHyperLink" runat ="server" NavigateUrl ="~/SetSpoilerFilter.aspx">Set Spoiler Filter </asp:HyperLink></strong></li>
            </ul>
        </article>
    </div>
    </form>
</body>
</html>
