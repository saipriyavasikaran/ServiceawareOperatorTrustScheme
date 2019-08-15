<%@ Page Title="" Language="C#" MasterPageFile="~/user.Master" AutoEventWireup="true"
    CodeBehind="uploaddata.aspx.cs" Inherits="ServiceOperator.WebForm9" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
        <br />
        <h3>
            Upload File</h3>
        <table>
            <tr>
                <td>
                    Select File
                </td>
                <td>
                    <asp:FileUpload ID="FileUpload1" runat="server"></asp:FileUpload>
                </td>
            </tr>
            <tr>
                <td>
                    Encrypt Key
                </td>
                <td>
                    <asp:TextBox ID="txtkey" runat="server" placeholder="enter 15 digi key"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <asp:Button ID="btn_upload" runat="server" Text="Upload" Height="30px" 
                        onclick="btn_upload_Click" Width="100px"></asp:Button>                        
                </td>
            </tr>
        </table><br />
        <asp:Panel ID="Panel1" runat="server">
            <table>
                <tr>
                    <td>
                        <asp:TextBox ID="txtpart1" runat="server" TextMode="MultiLine" Height="100px" 
                            Width="300px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="Encrypt" Height="30px" 
                            onclick="Button1_Click" Width="100px"></asp:Button>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txtpart2" runat="server" TextMode="MultiLine" Height="100px" 
                            Width="300px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="Button2" runat="server" Text="Encrypt" Height="31px" 
                            onclick="Button2_Click" Width="100px"></asp:Button>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txtpart3" runat="server" TextMode="MultiLine" Height="100px" 
                            Width="300px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="Button3" runat="server" Text="Encrypt" Height="30px" 
                            onclick="Button3_Click" Width="100px"></asp:Button>
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </center>
</asp:Content>
