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

    <asp:Button ID="getTileButton" runat="server" OnClick="getTileButton_Click" Text="Embed Tile" />  

    <table>
        <tr><td>Tile Embed URL</td> <td><asp:Textbox ID="tileEmbedUrl" TextMode="MultiLine" Rows="4"
            Text="https://msit.powerbi.com/embed?dashboardId=738b365e-9b22-4e78-ab3b-8292d1e4f2a4&tileId=0c645254-a04b-4bae-80d5-8a406a92ef3a&config=eyJjbHVzdGVyVXJsIjoiaHR0cHM6Ly9ERi1NU0lULVNDVVMtcmVkaXJlY3QuYW5hbHlzaXMud2luZG93cy5uZXQifQ%3d%3d"
            runat="server" Width="900px"></asp:Textbox></td></tr>

        <tr><td>Dashboard Tile</td><td></td></tr>
        <tr><td></td><td>
            <iframe ID="iFrameEmbedTile" height="500" width="900"></iframe>
        </td></tr>
    </table>
</asp:Content>
