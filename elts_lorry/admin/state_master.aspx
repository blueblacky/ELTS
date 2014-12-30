<%@ Page Title="State Master | ELTS" Language="C#" MasterPageFile="~/admin/admin_master.master" AutoEventWireup="true" CodeFile="state_master.aspx.cs" Inherits="admin_state_master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="title">
        <h1>State</h1>
    </div>
    <fieldset>
        <div class="clearfix">
            <label for="name">
                <span class="valid">* Fields are Mandatory </span>
            </label>
            <div class="input">
            </div>
        </div>
        <div class="clearfix">
            <label for="name">
                <span>State Name<span class="valid">*</span> </span>
            </label>
            <div class="input">
                <asp:TextBox ID="txStatetName" runat="server" CssClass="input-xlarge" ValidationGroup="save_btn"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txStatetName" ValidationGroup="save_btn"
                    Display="Dynamic" CssClass="valid_display" ErrorMessage="State Required"></asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="actions">
            <asp:Button ID="btnSave" runat="server" CssClass="btn btn-success btn-large" Text="Save" ValidationGroup="save_btn"
                OnClick="btnSave_Click" />
        </div>

        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="state_id" DataSourceID="EntityDataSource1"
            CssClass="table table-striped table-bordered" GridLines="None">
            <RowStyle CssClass="RowStyle" />
            <EditRowStyle CssClass="RowStyle" />
            <SelectedRowStyle CssClass="SelectedRowStyle" />
            <PagerStyle CssClass="PagerStyle" />
            <HeaderStyle CssClass="HeaderStyle" />
            <AlternatingRowStyle CssClass="AltRowStyle" />
            <EmptyDataRowStyle CssClass="Empty" />
            <EmptyDataTemplate>
                <img src="http://localhost/Rtlx_Attendance1.0/images/no-records1.png" alt="No Record Found" />
            </EmptyDataTemplate>
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="state_id" HeaderText="state_id" ReadOnly="True" SortExpression="state_id" Visible="False" />
                <asp:BoundField DataField="state_name" HeaderText="state_name" SortExpression="state_name" />
                <asp:BoundField DataField="status" HeaderText="status" SortExpression="status" Visible="False" />
            </Columns>
        </asp:GridView>
        <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=elts_lorry_Entities" DefaultContainerName="elts_lorry_Entities" EnableDelete="True" EnableFlattening="False" EnableUpdate="True" EntitySetName="state_master">
        </asp:EntityDataSource>
    </fieldset>
</asp:Content>


