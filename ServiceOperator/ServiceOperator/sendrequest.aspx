<%@ Page Title="" Language="C#" MasterPageFile="~/user.Master" AutoEventWireup="true" CodeBehind="sendrequest.aspx.cs" Inherits="ServiceOperator.WebForm7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br /><br />
<center>
            <table border="0" cellpadding="3" cellspacing="5">
                <tr>
                    <th colspan="3">
                        Send Request
                    </th>
                </tr>
                <tr>
                    <td style="height: 33px">
                       Subject
                    </td>
                    <td style="height: 33px">
                        <asp:TextBox runat="server" ID="txtsubject" 
                            Width="150px" />
                    </td>
                    <td style="height: 33px">
                        <asp:RequiredFieldValidator ForeColor="Red" ErrorMessage="*" ControlToValidate="txtsubject"
                            runat="server" ID="RequiredFieldValidator2" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Message
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="txtmessage" 
                             Width="200px" Height="150px" TextMode="MultiLine" />
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ForeColor="Red" ErrorMessage="*"
                            ControlToValidate="txtmessage" runat="server"  />
                    </td>
                </tr>
                <tr>
                    <td colspan="3" align="center">
                        <asp:Button ID="btnsend" Text="Send" Width="100" runat="server" onclick="btnsend_Click" 
                               />
                    </td>
                    
                </tr>
                
            </table>
        </center>
</asp:Content>
