<%@ Page Title="Registration | ELTS" Language="C#" MasterPageFile="~/elts.master" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="title">
        <h1>Registration</h1>
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
                <span>Register As<span class="valid">*</span> </span>
            </label>
            <div class="input">
                <asp:DropDownList ID="ddlRegister" runat="server">
                    <asp:ListItem>Select</asp:ListItem>
                    <asp:ListItem>Owner</asp:ListItem>
                    <asp:ListItem>Agent</asp:ListItem>
                    <asp:ListItem>Client</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Register Type Required" ControlToValidate="ddlRegister" InitialValue="0" Display="Dynamic" CssClass="valid_display"  ></asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="clearfix">
            <label for="name">
                <span>Name<span class="valid">*</span> </span>
            </label>
            <div class="input">
                <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Name Required" ControlToValidate="txtName" Display="Dynamic" CssClass="valid_display" ></asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="clearfix">
            <label for="name">
                <span>Email<span class="valid">*</span> </span>
            </label>
            <div class="input">
                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Email Required" ControlToValidate="txtEmail" Display="Dynamic" CssClass="valid_display" ></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid Email" ControlToValidate="txtEmail" Display="Dynamic" CssClass="valid_display" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </div>
        </div>

        <div class="clearfix">
            <label for="name">
                <span>Phone No<span class="valid">*</span> </span>
            </label>
            <div class="input">
                <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Phone Required" ControlToValidate="txtPhone" Display="Dynamic" CssClass="valid_display" ></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Invalid Phone No" ControlToValidate="txtPhone" Display="Dynamic" CssClass="valid_display" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
            </div>
        </div>

        <div class="clearfix">
            <label for="name">
                <span>Address Line 1<span class="valid">*</span> </span>
            </label>
            <div class="input">
                <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Address Required" ControlToValidate="txtAddress" Display="Dynamic" CssClass="valid_display" ></asp:RequiredFieldValidator>
                
            </div>
        </div>

        <div class="clearfix">
            <label for="name">
                <span>Address Line 2 </span>
            </label>
            <div class="input">
                <asp:TextBox ID="txtAddress2" runat="server" TextMode="MultiLine"></asp:TextBox>
            </div>
        </div>

        <asp:UpdatePanel ID="ups1" runat="server">
            <ContentTemplate>

                <div class="clearfix">
                    <label for="name">
                        <span>State<span class="valid">*</span> </span>
                    </label>
                    <div class="input">
                        <asp:DropDownList ID="ddlState" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlState_SelectedIndexChanged"></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="State Required" ControlToValidate="ddlState" InitialValue="0" Display="Dynamic" CssClass="valid_display" ></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="clearfix">
                    <label for="name">
                        <span>City<span class="valid">*</span> </span>
                    </label>
                    <div class="input">
                        <asp:DropDownList ID="ddlCity" runat="server"></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="City Required" ControlToValidate="ddlCity" InitialValue="0" Display="Dynamic" CssClass="valid_display" ></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="clearfix">
                    <label for="name">
                        <span>Username</span>
                    </label>
                    <div class="input">
                        <asp:TextBox ID="txtUsername" runat="server" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Username Required" ControlToValidate="txtUsername" Display="Dynamic" CssClass="valid_display" ></asp:RequiredFieldValidator>
                    </div>
                </div>

            </ContentTemplate>
        </asp:UpdatePanel>

        <div class="actions">
            <asp:Button ID="btnSave" runat="server" CssClass="btn btn-success btn-large" Text="Save" 
                OnClick="btnSave_Click" />
        </div>
    </fieldset>


</asp:Content>

