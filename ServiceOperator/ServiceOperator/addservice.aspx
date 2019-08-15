<%@ Page Title="" Language="C#" MasterPageFile="~/provider.Master" AutoEventWireup="true" CodeBehind="addservice.aspx.cs" Inherits="ServiceOperator.WebForm12" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<br /><br />
<center>
            <table border="0" cellpadding="3" cellspacing="5">
                <tr>
                    <th colspan="3">
                       Add Service
                    </th>
                </tr>
                <tr>
                    <td style="height: 33px">
                       Service Name
                    </td>
                    <td style="height: 33px">
                        <asp:TextBox runat="server" ID="txtservice" 
                            Width="150px" />
                    </td>
                    <td style="height: 33px">
                        <asp:RequiredFieldValidator ForeColor="Red" ErrorMessage="*" ControlToValidate="txtservice"
                            runat="server" ID="RequiredFieldValidator2" />
                    </td>
                </tr>
                <tr>
                    <td style="height: 33px">
                       Policy
                    </td>
                    <td style="height: 33px">
                        <asp:TextBox runat="server" ID="txtpolicy" 
                            Width="150px" />
                    </td>
                    <td style="height: 33px">
                        <asp:RequiredFieldValidator ForeColor="Red" ErrorMessage="*" ControlToValidate="txtpolicy"
                            runat="server" ID="RequiredFieldValidator1" />
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
                        <asp:Button ID="btnadd" Text="Add Service" Width="100" runat="server" onclick="btnadd_Click" 
                               />
                    </td>
                    
                </tr>
                
            </table>
        </center>
</asp:Content>
