<%@ Page Title="" Language="C#" MasterPageFile="~/cloudbroker.Master" AutoEventWireup="true" CodeBehind="userrequest.aspx.cs" Inherits="ServiceOperator.WebForm15" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br /><br />
<center><h3>User Request</h3>
<br />
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" 
        CellPadding="4" CellSpacing="2" ForeColor="Black" DataKeyNames="id">
    <Columns>
        <asp:BoundField DataField="id" HeaderText="Id" />
        <asp:BoundField DataField="username" HeaderText="UserName" />
        <asp:BoundField DataField="subject" HeaderText="Subject" />
        <asp:BoundField DataField="message" HeaderText="Message" />
        <asp:BoundField DataField="email" HeaderText="EmailId" />
        <asp:TemplateField HeaderText="Reply">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnk_reply" OnClick="lnk_replyclick" runat="server" Text="Reply"></asp:LinkButton></ItemTemplate>
                </asp:TemplateField>
    </Columns>
    <FooterStyle BackColor="#CCCCCC" />
    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
    <RowStyle BackColor="White" />
    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
    <SortedAscendingCellStyle BackColor="#F1F1F1" />
    <SortedAscendingHeaderStyle BackColor="#808080" />
    <SortedDescendingCellStyle BackColor="#CAC9C9" />
    <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>
    <asp:Panel ID="Panel1" runat="server" Visible="False">
        <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
            RepeatDirection="Horizontal">
            <asp:ListItem>Message</asp:ListItem>
            <asp:ListItem>Email</asp:ListItem>
        </asp:RadioButtonList>
        <table border="0" cellpadding="4" cellspacing="5" style="color: Black; font-size: medium">
        <tr>
                    <td style="height: 33px">
                      Message
                    </td>
                    <td style="height: 33px">
                        <asp:TextBox runat="server" ID="txtmessage" 
                            Width="150px" TextMode="MultiLine" />
                    </td>
                    <td style="height: 33px">
                        <asp:RequiredFieldValidator ForeColor="Red" ErrorMessage="*" ControlToValidate="txtmessage"
                            runat="server" ID="RequiredFieldValidator2"  />
                    </td>
                </tr>
                <tr>
                    <td colspan="3" align="center">
                        <asp:Button ID="btnsend" Text="Send" Width="100" 
                            runat="server" onclick="btnsend_Click"/>
                    </td>
                </tr>
        </table>
    </asp:Panel>
</center>
</asp:Content>
