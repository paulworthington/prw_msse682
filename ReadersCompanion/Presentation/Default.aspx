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
                <li class="one"><h3><asp:LoginStatus ID="LoginStatus2" runat="server" /></h3></li>
                <li class="two"><h3><asp:HyperLink ID="adminHyperLink" runat="server" NavigateUrl="~/Restricted/Admin.aspx">Admin page for editors</asp:HyperLink></h3></li>
                <li class="three"><h3><asp:HyperLink ID="itemGridHyperLink" runat="server" NavigateUrl="~/ItemGrid.aspx">List All Items</asp:HyperLink></h3></li>
                <li class="four"><h3><asp:HyperLink ID="alphaListHyperLink" runat ="server" NavigateUrl ="~/AlphaList.aspx">Browse Items Alphabetically </asp:HyperLink></h3></li>
                <li class="five"><h3><asp:HyperLink ID ="spoilerFilterHyperLink" runat ="server" NavigateUrl ="~/SetSpoilerFilter.aspx">Set Spoiler Filter </asp:HyperLink></h3></li>
            </ul>
        </article>
    </div>
    </form>
</body>
</html>
