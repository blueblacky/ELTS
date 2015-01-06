<%@ Page Title="Registeration Authentication | ELTS" Language="C#" MasterPageFile="~/admin/admin_master.master" AutoEventWireup="true" CodeFile="Registration_Authentication.aspx.cs" Inherits="admin_Registration_Authentication" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <div class="title">
        <h1>Registration Authentication</h1>
    </div>

    <asp:GridView ID="GridView1" runat="server" DataSourceID="UserEntityDataSource1" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField DataField="pro_id" HeaderText="pro_id" ReadOnly="True" SortExpression="pro_id" />
            <asp:BoundField DataField="full_name" HeaderText="full_name" ReadOnly="True" SortExpression="full_name" />
            <asp:BoundField DataField="email" HeaderText="email" ReadOnly="True" SortExpression="email" />
            <asp:BoundField DataField="ph_no" HeaderText="ph_no" ReadOnly="True" SortExpression="ph_no" />
            <asp:BoundField DataField="address_1" HeaderText="address_1" ReadOnly="True" SortExpression="address_1" />
            <asp:BoundField DataField="address_2" HeaderText="address_2" ReadOnly="True" SortExpression="address_2" />
            <asp:BoundField DataField="user_type" HeaderText="user_type" ReadOnly="True" SortExpression="user_type" />
            <asp:BoundField DataField="ct_dt" HeaderText="ct_dt" ReadOnly="True" SortExpression="ct_dt" />
            <asp:BoundField DataField="status" HeaderText="status" ReadOnly="True" SortExpression="status" />
            <asp:BoundField DataField="usr_name" HeaderText="usr_name" ReadOnly="True" SortExpression="usr_name" />
            <asp:CheckBoxField DataField="ispass_reset" HeaderText="ispass_reset" ReadOnly="True" SortExpression="ispass_reset" />
            <asp:CheckBoxField DataField="isPhone_verified" HeaderText="isPhone_verified" ReadOnly="True" SortExpression="isPhone_verified" />
            <asp:CheckBoxField DataField="isEmail_verified" HeaderText="isEmail_verified" ReadOnly="True" SortExpression="isEmail_verified" />
            <asp:CheckBoxField DataField="isOnline" HeaderText="isOnline" ReadOnly="True" SortExpression="isOnline" />
            <asp:BoundField DataField="city_name" HeaderText="city_name" ReadOnly="True" SortExpression="city_name" />
            <asp:BoundField DataField="state_name" HeaderText="state_name" ReadOnly="True" SortExpression="state_name" />
        </Columns>
       
    </asp:GridView>
      <asp:EntityDataSource ID="UserEntityDataSource1" runat="server" ConnectionString="name=elts_lorry_Entities" DefaultContainerName="elts_lorry_Entities" EnableFlattening="False" EntitySetName="user_profile_with_user_details_view" Select="it.[pro_id], it.[full_name], it.[email], it.[ph_no], it.[address_1], it.[address_2], it.[user_type], it.[ct_dt], it.[status], it.[usr_name], it.[ispass_reset], it.[isPhone_verified], it.[isEmail_verified], it.[isOnline], it.[city_name], it.[state_name]">
      </asp:EntityDataSource>
</asp:Content>

