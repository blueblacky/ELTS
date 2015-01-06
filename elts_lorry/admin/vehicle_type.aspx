<%@ Page Title="Vechile Type Master | ELTS" Language="C#" MasterPageFile="~/admin/admin_master.master" AutoEventWireup="true" CodeFile="vehicle_type.aspx.cs" Inherits="admin_vehicle_type" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="title">
        <h1>Vehicle Type</h1>
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
                <span>Vehicle Type<span class="valid">*</span> </span>
            </label>
            <div class="input">
                <asp:TextBox ID="txtType" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtType" ValidationGroup="save_btn" InitialValue="0"
                    Display="Dynamic" CssClass="valid_display" ErrorMessage="Type Required"></asp:RequiredFieldValidator>
            </div>
        </div>
          <div class="actions">
            <asp:Button ID="btnSave" runat="server" CssClass="btn btn-success btn-large" Text="Save" ValidationGroup="save_btn"
                OnClick="btnSave_Click" />
        </div>

        <br />
        <asp:GridView ID="GridView1" runat="server" DataSourceID="EntityDataSource1" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="type_id" CssClass="table table-striped table-bordered" GridLines="None">
             <RowStyle CssClass="RowStyle" />
            <EditRowStyle CssClass="RowStyle" />
            <SelectedRowStyle CssClass="SelectedRowStyle" />
            <PagerStyle CssClass="PagerStyle" />
            <HeaderStyle CssClass="HeaderStyle" />
            <AlternatingRowStyle CssClass="AltRowStyle" />
            <EmptyDataRowStyle CssClass="Empty" />
            <EmptyDataTemplate>
                <img src="http://localhost/elts_lorry/img/no-records.png" alt="No Record Found" />
            </EmptyDataTemplate>
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="type_id" HeaderText="type_id" ReadOnly="True" SortExpression="type_id" Visible="False" />
                <asp:BoundField DataField="type_name" HeaderText="Vehicle Type" SortExpression="type_name" />
                <asp:BoundField DataField="status" HeaderText="status" SortExpression="status" Visible="False" />
            </Columns>
        </asp:GridView>
        <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=elts_lorry_Entities" DefaultContainerName="elts_lorry_Entities" EnableDelete="True" EnableFlattening="False" EnableUpdate="True" EntitySetName="vehicle_type">
        </asp:EntityDataSource>
    </fieldset>
</asp:Content>

