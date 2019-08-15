<%@ Page Title="" Language="C#" MasterPageFile="~/user.Master" AutoEventWireup="true" CodeBehind="downloaddata.aspx.cs" Inherits="ServiceOperator.WebForm10" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<br />
<center><h3>Download File</h3>
<br />
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" 
        CellPadding="4" CellSpacing="2" ForeColor="Black" DataKeyNames="id">
    <Columns>
        <asp:BoundField DataField="id" HeaderText="Id" />
        <asp:BoundField DataField="username" HeaderText="UserName" />
        <asp:BoundField DataField="filename" HeaderText="FileName" />        
        <asp:BoundField DataField="fileextension" HeaderText="FileType" />
        <asp:TemplateField HeaderText="Download">
            <ItemTemplate>
                        <asp:LinkButton ID="lnk_download" OnClick="lnk_downloadclick" runat="server" Text="Download"></asp:LinkButton></ItemTemplate>
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
    <asp:Panel ID="Panel1" runat="server">
        
            <table>
                <tr>
                    <td>
                        Decrypt Key
                    </td>
                    <td>
                        <asp:TextBox ID="txtverify" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <asp:Button ID="btnverify" runat="server"  Text="Decrypt" 
                            onclick="btnverify_Click">
                        </asp:Button>
                    </td>
                </tr>
            </table> </asp:Panel>
</center>
</asp:Content>
