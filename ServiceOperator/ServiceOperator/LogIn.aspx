<%@ Page Title="" Language="C#" MasterPageFile="~/home.Master" AutoEventWireup="true" CodeBehind="LogIn.aspx.cs" Inherits="ServiceOperator.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br /><br />
<center>
            <table border="0" cellpadding="4" cellspacing="5" style="color: Black; font-size: medium">
                <tr>
                    <th colspan="3">
                        Login Page
                    </th>
                </tr>
                <tr>
                    <td>
                        Cloud Service
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlcloudservice" Width="150px" runat="server">
                            <asp:ListItem>--Select--</asp:ListItem>
                            <asp:ListItem>Cloud Provider</asp:ListItem>
                            <asp:ListItem>User</asp:ListItem>                            
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlcloudservice"
                            ErrorMessage="Field Required" ForeColor="Red" 
                             ValidationGroup="Registration" InitialValue="--Select--">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="height: 33px">
                        User Name
                    </td>
                    <td style="height: 33px">
                        <asp:TextBox runat="server" ID="txtLoginUserName" ValidationGroup="LoginValidation"
                            Width="150px" />
                    </td>
                    <td style="height: 33px">
                        <asp:RequiredFieldValidator ForeColor="Red" ErrorMessage="*" ControlToValidate="txtLoginUserName"
                            runat="server" ID="RequiredFieldValidator2" ValidationGroup="LoginValidation" />
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
                        <asp:Button ID="btnLogin" Text="Login" Width="100" 
                            runat="server"                             ValidationGroup="LoginValidation" 
                            onclick="btnLogin_Click" />
                    </td>
                </tr>
                <tr>
                    <td colspan="3" align="center">
                        <asp:LinkButton ID="lnkforgetUser" Text="Forget Password ?" runat="server" 
                            onclick="lnkforgetUser_Click"  />
                    </td>
                </tr>
            </table>
        </center>
</asp:Content>
