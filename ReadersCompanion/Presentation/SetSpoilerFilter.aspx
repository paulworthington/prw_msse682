<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SetSpoilerFilter.aspx.cs" Inherits="SetSpoilerFilter" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h1> Set Spoiler Filter </h1>
        <h2> - choose which items and descriptions you see based on how far you've read in the series </h2>

    <article>
        <table>
            <tr>
                <td>Select the latest book you've read:</td>
                <td>
                    <asp:DropDownList ID ="DropDownList2" runat ="server">
                        <asp:ListItem Value ="1">Beyond the Pale</asp:ListItem>
                        <asp:ListItem Value ="2">The Keep of Fire</asp:ListItem>
                        <asp:ListItem Value ="3">The Dark Remains</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
        </table>
        <br />
        <br />
        <asp:Button ID ="Button1" runat ="server" type ="submit" Text ="Set Filter" OnClick ="Button1_Click" />
        <br />
        <br />
        <br />
        <asp:Label ID="spoilerFilterLabel" runat="server" style="z-index: 1; left: 10px; top: 226px; position: absolute"></asp:Label>
        <br />
   
    </article>

    <aside>
        <h3>Navigation</h3>
        <ul>
            <li><asp:HyperLink ID ="defaultHyperLink" runat ="server" NavigateUrl ="~/Default.aspx">Back To Main </asp:HyperLink></li>
            <li><asp:LoginStatus ID="LoginStatus2" runat="server" /></li>
            <li><asp:HyperLink ID ="itemGridHyperLink" runat ="server" NavigateUrl ="~/ItemGrid.aspx">List All Items </asp:HyperLink></li>
            <li><asp:HyperLink ID="alphaListHyperLink" runat ="server" NavigateUrl ="~/AlphaList.aspx">Browse Items Alphabetically </asp:HyperLink></li>
        </ul>
    </aside>
   
    </div>
    </form>
</body>
</html>
