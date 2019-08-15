<%@ Page Title="" Language="C#" MasterPageFile="~/home.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="ServiceOperator.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br /><br />
<div id="table">
        <center>
            <table border="0" cellpadding="4" cellspacing="5" style="color: Black; font-size: large">
                <tr>
                    <th align="center" colspan="3">
                        Registration Form
                    </th>
                </tr>
                <tr>
                    <td>
                        UserName
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="txtusername" Width="150px" ValidationGroup="Registration" />
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="UserName" runat="server" ControlToValidate="txtusername"
                            ErrorMessage="Field Required" ForeColor="Red" ValidationGroup="Registration">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        Password
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" Width="150px" ValidationGroup="Registration"
                            MaxLength="20" />
                    </td>
                     <td>
                    <asp:RequiredFieldValidator ID="Password" runat="server" 
                        ControlToValidate="txtpassword" ErrorMessage="Field Required" 
                        ForeColor="Red" ValidationGroup="Registration">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        Re-Type Password
                    </td>
                    <td class="style1">
                        <asp:TextBox runat="server" ID="txtrepass" TextMode="Password" Width="150px" ValidationGroup="Registration"
                            MaxLength="20" />
                    </td>
                    <td>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPassword"
                            ControlToValidate="txtrepass" ForeColor="Red" ErrorMessage="*"></asp:CompareValidator>
                    </td>                   
                </tr>
                <tr>
                    <td>
                        Email ID
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="txtemailid" Width="150px" ValidationGroup="Registration" />
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="EmailId" runat="server" ErrorMessage="Field Required"
                            ForeColor="Red" ControlToValidate="txtemailid" ValidationGroup="Registration">*</asp:RequiredFieldValidator>
                    
                        <asp:RegularExpressionValidator ID="validid" runat="server" ErrorMessage="*"
                            ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                            ControlToValidate="txtemailid" ValidationGroup="Registration"></asp:RegularExpressionValidator>
                    </td>
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
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlcloudservice"
                            ErrorMessage="Field Required" ForeColor="Red" 
                             ValidationGroup="Registration" InitialValue="--Select--">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                       Mobile
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="tbmobile" Width="150px" ValidationGroup="Registration" />
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbmobile"
                            ErrorMessage="Field Required" ForeColor="Red" ValidationGroup="Registration">*</asp:RequiredFieldValidator>
                    </td>
                </tr>               
                
                <tr>
                    
                    <td colspan="3" align="center">
                        <asp:Button ID="btnSubmit" Width="100px" runat="server" Text="submit" 
                            ValidationGroup="Registration" onclick="btnSubmit_Click" />
                       
                    </td>
                </tr>
            </table>
        </center>
    </div>
</asp:Content>
