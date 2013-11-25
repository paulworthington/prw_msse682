<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ItemGrid.aspx.cs" Inherits="ItemGrid" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h1> List All Items </h1>
        <h2> - list all items from the database in a GridView </h2>

        <article>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="itemID" DataSourceID="EntityDataSource1" style="z-index: 1; left: 10px; top: 15px; height: 133px; width: 187px">
                <Columns>
                    <asp:CommandField ShowEditButton="True" />
                    <asp:BoundField DataField="itemID" HeaderText="itemID" ReadOnly="True" SortExpression="itemID" />
                    <asp:BoundField DataField="itemName" HeaderText="itemName" SortExpression="itemName" />
                    <asp:BoundField DataField="itemType" HeaderText="itemType" SortExpression="itemType" />
                    <asp:BoundField DataField="firstMentionBook" HeaderText="firstMentionBook" SortExpression="firstMentionBook" />
                    <asp:BoundField DataField="firstMentionChapter" HeaderText="firstMentionChapter" SortExpression="firstMentionChapter" />
                    <asp:BoundField DataField="eventDate" HeaderText="eventDate" SortExpression="eventDate" />
                </Columns>
            </asp:GridView>
        </article>
        
        <aside>
            <h3>Navigation</h3>
            <ul>
                <li><asp:HyperLink ID ="defaultHyperLink" runat ="server" NavigateUrl ="~/Default.aspx">Back To Main </asp:HyperLink></li>
                <li><asp:LoginStatus ID="LoginStatus2" runat="server" /></li>
                <li><asp:HyperLink ID ="addItemHyperLink" runat ="server" NavigateUrl ="~/AddItem.aspx">Add An Item </asp:HyperLink></li>
                <li><asp:HyperLink ID="alphaListHyperLink" runat ="server" NavigateUrl ="~/AlphaList.aspx">Browse Items Alphabetically </asp:HyperLink></li>
                <li><asp:HyperLink ID ="spoilerFilterHyperLink" runat ="server" NavigateUrl ="~/SetSpoilerFilter.aspx">Set Spoiler Filter </asp:HyperLink></li>
            </ul>
        </aside>
    </div>

        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=readerDB01Entities" DefaultContainerName="readerDB01Entities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="Items">
        </asp:EntityDataSource>
    </form>
</body>
</html>
