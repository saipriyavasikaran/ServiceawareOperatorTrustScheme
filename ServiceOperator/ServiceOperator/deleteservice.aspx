﻿<%@ Page Title="" Language="C#" MasterPageFile="~/provider.Master" AutoEventWireup="true" CodeBehind="deleteservice.aspx.cs" Inherits="ServiceOperator.WebForm14" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<br /><br />
<center><h3>Delete Service</h3>
<br />
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" 
        CellPadding="4" CellSpacing="2" ForeColor="Black" DataKeyNames="id">
    <Columns>
        <asp:BoundField DataField="id" HeaderText="Id" />
        <asp:BoundField DataField="username" HeaderText="UserName" />
        <asp:BoundField DataField="servicename" HeaderText="ServiceName" />
        <asp:BoundField DataField="policy" HeaderText="Policy" />
        <asp:BoundField DataField="aboutus" HeaderText="AboutUs" />
        <asp:TemplateField HeaderText="Delete">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnk_delete" OnClick="lnk_deleteclick" runat="server" Text="Delete"></asp:LinkButton></ItemTemplate>
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
</center>
</asp:Content>
