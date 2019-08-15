<%@ Page Title="" Language="C#" MasterPageFile="~/home.Master" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="ServiceOperator.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<br /><br />
<center>
            <table border="0" cellpadding="3" cellspacing="5">
                <tr>
                    <th colspan="3">
                        Forget Password
                    </th>
                </tr>
                <tr>
                    <td>
                        Email Id
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="txtEmailId" ValidationGroup="LoginValidation" Width="150px" />
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ForeColor="Red" ErrorMessage="EmailId Required"
                            ControlToValidate="txtEmailId" runat="server" ValidationGroup="LoginValidation" />
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td>
                        <asp:Button ID="btnEmail" runat="server" ValidationGroup="LoginValidation" 
                            Text="Submit" onclick="btnEmail_Click"
                             />
                    </td>
                    <td>
                        <asp:Label ID="lbl1Result" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
        </center>
</asp:Content>
