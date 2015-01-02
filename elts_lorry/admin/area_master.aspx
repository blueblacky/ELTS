<%@ Page Title="Area Master | ELTS" Language="C#" MasterPageFile="~/admin/admin_master.master" AutoEventWireup="true" CodeFile="area_master.aspx.cs" Inherits="admin_area_master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="title">
        <h1>Area</h1>
    </div>
    <fieldset>
        <div class="clearfix">
            <label for="name">
                <span class="valid">* Fields are Mandatory </span>
            </label>
            <div class="input">
            </div>
        </div>
        <asp:UpdatePanel ID="ups" runat="server">
            <ContentTemplate>


                <div class="clearfix">
                    <label for="name">
                        <span>State Name<span class="valid">*</span> </span>
                    </label>
                    <div class="input">
                        <asp:DropDownList ID="ddl_state" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_state_SelectedIndexChanged">
                        </asp:DropDownList>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddl_state" ValidationGroup="save_btn" InitialValue="0"
                            Display="Dynamic" CssClass="valid_display" ErrorMessage="State Required"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="clearfix">
                    <label for="name">
                        <span>City Name<span class="valid">*</span> </span>
                    </label>
                    <div class="input">
                        <asp:DropDownList ID="ddlCity" runat="server"></asp:DropDownList>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlCity" ValidationGroup="save_btn" InitialValue="0"
                            Display="Dynamic" CssClass="valid_display" ErrorMessage="City Required"></asp:RequiredFieldValidator>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>

        <div class="clearfix">
            <label for="name">
                <span>Area Name<span class="valid">*</span> </span>
            </label>
            <div class="input">
                <asp:TextBox ID="txtArea" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtArea" ValidationGroup="save_btn"
                    Display="Dynamic" CssClass="valid_display" ErrorMessage="Area Required"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="actions">
            <asp:Button ID="btnSave" runat="server" CssClass="btn btn-success btn-large" Text="Save" ValidationGroup="save_btn"
                OnClick="btnSave_Click" />
        </div>

        <br />

        <asp:UpdatePanel ID="sup2" runat="server">
            <ContentTemplate>

                <asp:EntityDataSource ID="entitydatasoure_state_ddl" runat="server" ConnectionString="name=elts_lorry_Entities" DefaultContainerName="elts_lorry_Entities" EnableFlattening="False" EntitySetName="state_master" Select="it.[state_id], it.[state_name]"></asp:EntityDataSource>
                <asp:EntityDataSource ID="entitydatasoure_city_ddl" runat="server" ConnectionString="name=elts_lorry_Entities" DefaultContainerName="elts_lorry_Entities" EnableFlattening="False" EntitySetName="city_master" Select="it.[city_id], it.[city_name]"></asp:EntityDataSource>

                <asp:GridView ID="GridView1" runat="server" DataSourceID="AreaEntityDataSource1" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="area_id" CssClass="table table-striped table-bordered" GridLines="None" OnRowUpdating = "UpdateArea" OnRowDataBound="GridView1_RowDataBound" OnRowCommand="GridView1_RowCommand" >
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
                        <asp:BoundField DataField="area_id" HeaderText="area_id" ReadOnly="True" SortExpression="area_id" Visible="False" />
                        <asp:TemplateField HeaderText="Area Name" SortExpression="area_name">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("area_name") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("area_name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="city_id" HeaderText="city_id" SortExpression="city_id" Visible="False" />
                        <asp:BoundField DataField="state_id" HeaderText="state_id" SortExpression="state_id" Visible="False" />
                        <asp:TemplateField HeaderText="State Name" SortExpression="state_name">
                            <EditItemTemplate>
                               <asp:DropDownList ID="ddl_state1" runat="server" AutoPostBack="True" SelectedValue='<%# Bind("state_id") %>'  DataSourceID="entitydatasoure_state_ddl" DataTextField="state_name" DataValueField="state_id">                    
                         </asp:DropDownList>
                                
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("state_name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="City Name" SortExpression="city_name">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddl_city1" runat="server" AutoPostBack="True" SelectedValue='<%# Bind("city_id") %>'  DataSourceID="entitydatasoure_city_ddl" DataTextField="city_name" DataValueField="city_id">                    
                         </asp:DropDownList>
                                
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("city_name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                </asp:GridView>
                <asp:EntityDataSource ID="AreaEntityDataSource1" runat="server" ConnectionString="name=elts_lorry_Entities" DefaultContainerName="elts_lorry_Entities" EnableDelete="True" EnableFlattening="False" EnableUpdate="True" EntitySetName="area_city_state_view">
                </asp:EntityDataSource>
            </ContentTemplate>
        </asp:UpdatePanel>
    </fieldset>
</asp:Content>

