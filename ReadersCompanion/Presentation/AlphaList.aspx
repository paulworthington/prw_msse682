<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AlphaList.aspx.cs" Inherits="AlphaList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>

        <h1>Browse Items Alphabetically</h1>
        <h2>- select a letter to start</h2>
    


    <article>
        <asp:HyperLink ID="HyperLink1" NavigateURL="~/AlphaList.aspx?letter=A" runat="server">A</asp:HyperLink>
        &nbsp;
        <asp:HyperLink ID="HyperLink2" NavigateURL="~/AlphaList.aspx?letter=B" runat="server">B</asp:HyperLink>
        &nbsp;
        <asp:HyperLink ID="HyperLink3" NavigateURL="~/AlphaList.aspx?letter=C" runat="server">C</asp:HyperLink>
        &nbsp;
        <asp:HyperLink ID="HyperLink4" NavigateURL="~/AlphaList.aspx?letter=D" runat="server">D</asp:HyperLink>
        &nbsp;
        <asp:HyperLink ID="HyperLink5" NavigateURL="~/AlphaList.aspx?letter=E" runat="server">E</asp:HyperLink>
        &nbsp;
        <asp:HyperLink ID="HyperLink6" NavigateURL="~/AlphaList.aspx?letter=f" runat="server">F</asp:HyperLink>
        &nbsp;
        <asp:HyperLink ID="HyperLink7" NavigateURL="~/AlphaList.aspx?letter=G" runat="server">G</asp:HyperLink>
        &nbsp;
        <asp:HyperLink ID="HyperLink8" NavigateURL="~/AlphaList.aspx?letter=H" runat="server">H</asp:HyperLink>
        &nbsp;
        <asp:HyperLink ID="HyperLink9" NavigateURL="~/AlphaList.aspx?letter=I" runat="server">I</asp:HyperLink>
        &nbsp;
        <asp:HyperLink ID="HyperLink10" NavigateURL="~/AlphaList.aspx?letter=J" runat="server">J</asp:HyperLink>
        &nbsp;
        <asp:HyperLink ID="HyperLink11" NavigateURL="~/AlphaList.aspx?letter=K" runat="server">K</asp:HyperLink>
        &nbsp;
        <asp:HyperLink ID="HyperLink12" NavigateURL="~/AlphaList.aspx?letter=L" runat="server">L</asp:HyperLink>
        &nbsp;
        <asp:HyperLink ID="HyperLink13" NavigateURL="~/AlphaList.aspx?letter=M" runat="server">M</asp:HyperLink>
        &nbsp;
        <asp:HyperLink ID="HyperLink14" NavigateURL="~/AlphaList.aspx?letter=N" runat="server">N</asp:HyperLink>
        &nbsp;
        <asp:HyperLink ID="HyperLink15" NavigateURL="~/AlphaList.aspx?letter=O" runat="server">O</asp:HyperLink>
        &nbsp;
        <asp:HyperLink ID="HyperLink16" NavigateURL="~/AlphaList.aspx?letter=P" runat="server">P</asp:HyperLink>
        &nbsp;
        <asp:HyperLink ID="HyperLink17" NavigateURL="~/AlphaList.aspx?letter=Q" runat="server">Q</asp:HyperLink>
        &nbsp;
        <asp:HyperLink ID="HyperLink18" NavigateURL="~/AlphaList.aspx?letter=R" runat="server">R</asp:HyperLink>
        &nbsp;
        <asp:HyperLink ID="HyperLink19" NavigateURL="~/AlphaList.aspx?letter=S" runat="server">S</asp:HyperLink>
        &nbsp;
        <asp:HyperLink ID="HyperLink20" NavigateURL="~/AlphaList.aspx?letter=T" runat="server">T</asp:HyperLink>
        &nbsp;
        <asp:HyperLink ID="HyperLink21" NavigateURL="~/AlphaList.aspx?letter=U" runat="server">U</asp:HyperLink>
        &nbsp;
        <asp:HyperLink ID="HyperLink22" NavigateURL="~/AlphaList.aspx?letter=V" runat="server">V</asp:HyperLink>
        &nbsp;
        <asp:HyperLink ID="HyperLink23" NavigateURL="~/AlphaList.aspx?letter=W" runat="server">W</asp:HyperLink>
        &nbsp;
        <asp:HyperLink ID="HyperLink24" NavigateURL="~/AlphaList.aspx?letter=X" runat="server">X</asp:HyperLink>
        &nbsp;
        <asp:HyperLink ID="HyperLink25" NavigateURL="~/AlphaList.aspx?letter=Y" runat="server">Y</asp:HyperLink>
        &nbsp;
        <asp:HyperLink ID="HyperLink26" NavigateURL="~/AlphaList.aspx?letter=Z" runat="server">Z</asp:HyperLink>

        <div>
            <!-- Content label -->
            <p>
                <asp:Label id="contentLabel" runat="server" />

            </p> 
        </div>

    </article>

    <aside>
        <h3>Navigation</h3>
        <ul>
            <li><asp:HyperLink ID="mainHyperLink" runat="server" NavigateUrl="~/Default.aspx">Back To Main</asp:HyperLink></li>
            <li><asp:LoginStatus ID="LoginStatus2" runat="server" /></li>
            <li><asp:HyperLink ID ="itemGridHyperLink" runat ="server" NavigateUrl ="~/ItemGrid.aspx">List All Items </asp:HyperLink></li>
            <li><asp:HyperLink ID ="spoilerFilterHyperLink" runat ="server" NavigateUrl ="~/SetSpoilerFilter.aspx">Set Spoiler Filter </asp:HyperLink></li>
        </ul>
    </aside>

            </div>
    </form>
</body>
</html>
