<%@ Page Title="Embed Tile" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EmbedTile.aspx.cs" Inherits="PBIWebApp.EmbedTile" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">

        //This code is for sample purposes only.

        //Configure IFrame for the tile after you have an Access Token. See Default.aspx.cs to learn how to get an Access Token
        window.onload = function () {
            if ("" != document.getElementById('MainContent_accessToken').value)
            {
                var iframe = document.getElementById('iFrameEmbedTile');

                // To load a tile do the following:
                // Set the IFrame source to the EmbedUrl from the Get Tiles operation
                iframe.src = document.getElementById('MainContent_tileEmbedUrl').value;

                // Add an onload handler to submit the access token
                iframe.onload = postActionLoadTile;
            }
        };
        
        // Post the access token to the IFrame
        function postActionLoadTile() {

            // Construct the push message structure
            // This is where you assign the Access Token to get access to the tile visual
            var messageStructure = {
                action: "loadTile",
                accessToken: document.getElementById('MainContent_accessToken').value,
                height: 500,
                width: 500
            };
            message = JSON.stringify(messageStructure);

            // Push the message
            document.getElementById('iFrameEmbedTile').contentWindow.postMessage(message, "*");
        }
    </script>
    <asp:HiddenField ID="accessToken" runat="server" />

    <header>
        <h1>
            Power BI Embed Tile
            <br />
        </h1>
    </header>

    <asp:Textbox ID="tileEmbedUrl" TextMode="MultiLine" Rows="4" ReadOnly="true" style="display:none;"
            Text="https://msit.powerbi.com/embed?dashboardId=ab12b1b1-bd80-4905-bc9a-a44b9a6a818f&tileId=b1b52457-26c3-4cd2-8d86-ddeffe5f833d&config=eyJjbHVzdGVyVXJsIjoiaHR0cHM6Ly9ERi1NU0lULVNDVVMtcmVkaXJlY3QuYW5hbHlzaXMud2luZG93cy5uZXQifQ%3d%3d&$filter=Canadian_x0020_Towns/Province_x0020_Postal_x0020_Code eq 'AB'"
            runat="server" Width="900px"></asp:Textbox>
    <table>
        <tr><td>Tile Embed URL:</td><td>
            <pre>Unfiltered:

https://msit.powerbi.com/embed?dashboardId=ab12b1b1-bd80-4905-bc9a-a44b9a6a818f&tileId=b1b52457-26c3-4cd2-8d86-ddeffe5f833d&config=eyJjbHVzdGVyVXJsIjoiaHR0cHM6Ly9ERi1NU0lULVNDVVMtcmVkaXJlY3QuYW5hbHlzaXMud2luZG93cy5uZXQifQ%3d%3d

Works fine.


Filtered to show AB only:

https://msit.powerbi.com/embed?dashboardId=ab12b1b1-bd80-4905-bc9a-a44b9a6a818f&tileId=b1b52457-26c3-4cd2-8d86-ddeffe5f833d&config=eyJjbHVzdGVyVXJsIjoiaHR0cHM6Ly9ERi1NU0lULVNDVVMtcmVkaXJlY3QuYW5hbHlzaXMud2luZG93cy5uZXQifQ%3d%3d&$filter=Canadian_x0020_Towns/Province_x0020_Postal_x0020_Code eq 'AB'

Does not filter. Shows as unfiltered instead.

            </pre></td></tr>

        <tr><td></td><td><asp:Button ID="getTileButton" runat="server" OnClick="getTileButton_Click" Text="Embed Tile" /></td></tr>

        <tr><td>Dashboard Tile</td><td>
            <iframe ID="iFrameEmbedTile" height="500" width="900"></iframe>
        </td></tr>
    </table>
</asp:Content>
