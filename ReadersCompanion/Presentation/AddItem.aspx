<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddItem.aspx.cs" Inherits="AddItem" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>



        <h1> Add New Item </h1>
        <h2> - add a new item to the database </h2>

    <article>
        <table>
            <tr>
                <td>Name</td>
                <td><asp:TextBox ID ="TextBox1" runat ="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Type of Item</td>
                <td>
                    <asp:DropDownList ID ="DropDownList1" runat ="server">
                        <asp:ListItem Value="person">Person</asp:ListItem>
                        <asp:ListItem Value="place">Place</asp:ListItem>
                        <asp:ListItem Value="thing">Thing</asp:ListItem>
                        <asp:ListItem Value="event">Event</asp:ListItem>
                        <asp:ListItem Value="essay">Essay</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>Book where first mentioned</td>
                <td>
                    <asp:DropDownList ID ="DropDownList2" runat ="server">
                        <asp:ListItem Value ="1">Book 1</asp:ListItem>
                        <asp:ListItem Value ="2">Book 2</asp:ListItem>
                        <asp:ListItem Value ="3">Book 3</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>Chapter where first mentioned</td>
                <td>
                    <asp:DropDownList ID ="DropDownList3" runat ="server">
                        <asp:ListItem Value ="1">1</asp:ListItem>
                        <asp:ListItem Value ="2">2</asp:ListItem>
                        <asp:ListItem Value ="3">3</asp:ListItem>
                        <asp:ListItem Value ="4">4</asp:ListItem>
                        <asp:ListItem Value ="5">5</asp:ListItem>
                        <asp:ListItem Value ="6">6</asp:ListItem>
                        <asp:ListItem Value ="7">7</asp:ListItem>
                        <asp:ListItem Value ="8">8</asp:ListItem>
                        <asp:ListItem Value ="9">9</asp:ListItem>
                        <asp:ListItem Value ="10">10</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
        </table>
        <table>
            <tr><td>&nbsp;</td><td>&nbsp;</td></tr>
            <tr>
                <td>Description as of book number:</td>
                <td>
                    <asp:DropDownList ID ="DropDownList4" runat ="server">
                        <asp:ListItem Value ="1">Book 1</asp:ListItem>
                        <asp:ListItem Value ="2">Book 2</asp:ListItem>
                        <asp:ListItem Value ="3">Book 3</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td>Description</td>
                <td>

                    <asp:TextBox ID="TextBox3" runat="server" style="z-index: 1; left: 105px; top: 271px; position: absolute; height: 80px; width: 310px;" TextMode="MultiLine"></asp:TextBox>

                </td>
            </tr>
        </table>
        <br />
        <br />
        <asp:Button ID ="Button1" runat ="server" type ="submit" Text ="Add" OnClick ="Button1_Click" />
        <br />
        <br />
        <br />
         <asp:ObjectDataSource ID ="ObjectDataSource2" runat ="server" SelectMethod ="GetAll"  TypeName ="Business.ItemTypeMgr"></asp:ObjectDataSource>
   
    </article>

    <aside>
        <h3>Navigation</h3>
        <ul>
            <li><asp:HyperLink ID ="defaultHyperLink" runat ="server" NavigateUrl ="~/Default.aspx">Back To Main </asp:HyperLink></li>
            <li><asp:HyperLink ID ="itemGridHyperLink" runat ="server" NavigateUrl ="~/ItemGrid.aspx">List All Items </asp:HyperLink></li>
            <li><asp:HyperLink ID ="spoilerFilterHyperLink" runat ="server" NavigateUrl ="~/SetSpoilerFilter.aspx">Set Spoiler Filter </asp:HyperLink></li>
        </ul>
    </aside>




    
    </div>
    </form>
</body>
</html>
