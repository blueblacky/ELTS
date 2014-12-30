<%@ Page Title="City Master | ELTS" Language="C#" MasterPageFile="~/admin/admin_master.master" AutoEventWireup="true" CodeFile="city_master.aspx.cs" Inherits="city_master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <div class="title">
        <h1>City</h1>
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
                <asp:DropDownList ID="ddl_state" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_state_SelectedIndexChanged" DataSourceID="entitydatasoure_state_ddl" DataTextField="state_name" DataValueField="state_id">
                    <asp:ListItem Value="0">Select</asp:ListItem>
                </asp:DropDownList>
                <asp:EntityDataSource ID="entitydatasoure_state_ddl" runat="server" ConnectionString="name=elts_lorry_Entities" DefaultContainerName="elts_lorry_Entities" EnableFlattening="False" EntitySetName="state_master" Select="it.[state_id], it.[state_name]">
                </asp:EntityDataSource>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddl_state" ValidationGroup="save_btn" InitialValue="0"
                    Display="Dynamic" CssClass="valid_display" ErrorMessage="State Required"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="clearfix">
            <label for="name">
                <span>City Name<span class="valid">*</span> </span>
            </label>
            <div class="input">
                <asp:TextBox ID="txtcityname" runat="server" CssClass="input-xlarge" ValidationGroup="save_btn"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtcityname" ValidationGroup="save_btn"
                    Display="Dynamic" CssClass="valid_display" ErrorMessage="Name Required"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="actions">
            <asp:Button ID="btnSave" runat="server" CssClass="btn btn-success btn-large" Text="Save" ValidationGroup="save_btn"
                OnClick="btnSave_Click" />
        </div>

        <br />

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="city_id" AllowPaging="True" AllowSorting="True" DataSourceID="GridEntityDataSource1"  CssClass="table table-striped table-bordered" GridLines="None" OnRowUpdating = "UpdateCity">
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
                <asp:BoundField DataField="city_id" HeaderText="city_id" ReadOnly="True" SortExpression="city_id" Visible="False" />
                <asp:TemplateField HeaderText="City Name" SortExpression="city_name">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("city_name") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("city_name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                
                <asp:TemplateField HeaderText="State Name" SortExpression="state_id">
                    <EditItemTemplate>
                         <asp:DropDownList ID="ddl_state1" runat="server" AutoPostBack="True" SelectedValue='<%# Bind("state_id") %>'  DataSourceID="entitydatasoure_state_ddl" DataTextField="state_name" DataValueField="state_id">                    
                         </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("state_name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
           
        </asp:GridView>

        

        <asp:EntityDataSource ID="GridEntityDataSource1" runat="server" ConnectionString="name=elts_lorry_Entities" DefaultContainerName="elts_lorry_Entities" EnableDelete="True" EnableFlattening="False" EnableUpdate="True" EntitySetName="city_with_state_view"
            >
        </asp:EntityDataSource>

    
    </fieldset>
</asp:Content>

