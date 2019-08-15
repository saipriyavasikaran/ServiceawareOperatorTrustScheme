<%@ Page Title="" Language="C#" MasterPageFile="~/home.Master" AutoEventWireup="true" CodeBehind="AdminHome.aspx.cs" Inherits="ServiceOperator.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br /><br />
<center>
            <table border="0" cellpadding="3" cellspacing="5">
                <tr>
                    <th colspan="3">
                        Login Page
                    </th>
                </tr>
                <tr>
                    <td style="height: 33px">
                        UserName
                    </td>
                    <td style="height: 33px">
                        <asp:TextBox runat="server" ID="txtLoginAdminName" ValidationGroup="LoginValidation"
                            Width="150px" />
                    </td>
                    <td style="height: 33px">
                        <asp:RequiredFieldValidator ForeColor="Red" ErrorMessage="*" ControlToValidate="txtLoginAdminName"
                            runat="server" ID="RequiredFieldValidator2" 
                            ValidationGroup="LoginValidation" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Password
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="txtLoginPassword" ValidationGroup="LoginValidation"
                            TextMode="Password" Width="150px" />
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ForeColor="Red" ErrorMessage="*"
                            ControlToValidate="txtLoginPassword" runat="server" ValidationGroup="LoginValidation" />
                    </td>
                </tr>
                <tr>
                    <td colspan="3" align="center">
                        <asp:Button ID="btnAdminLogin" Text="Login" Width="100" runat="server" 
                            ValidationGroup="LoginValidation" onclick="btnAdminLogin_Click"  />
                    </td>
                    
                </tr>
                
            </table>
        </center>
</asp:Content>
