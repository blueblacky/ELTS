<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="admin_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">    
     <title>Admin Login | ELTS</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="http://localhost/elts_lorry/login_script/css/bootstrap.min.css"
        rel="stylesheet">
    <!--Google Fonts-->
    <link href='http://fonts.googleapis.com/css?family=Alef:400,700' rel='stylesheet'
        type='text/css'>
    <!--Bootshape-->
    <link href="http://localhost/elts_lorry/login_script/snippet.css" rel="stylesheet">
    <!-- Jquery Msgbox start -->
    <script src="http://localhost/elts_lorry/msgbox_scripts/Scripts/jquery-1.8.0.min.js"></script>
    <script src="http://localhost/elts_lorry/msgbox_scripts/Scripts/jquery.msgBox.js"
        type="text/javascript"></script>
    <link href="http://localhost/elts_lorry/msgbox_scripts/Styles/msgBoxLight.css"
        rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        function savemsgbox(cont, pname, tit) {
            $.msgBox({
                title: tit,
                content: cont,
                type: "info",
                buttons: [{ value: "Okay" }],
                afterClose: function () { window.location = pname; }

            });
        }

        function savemsgbox_open_wind(cont, pname, tit) {
            $.msgBox({
                title: tit,
                content: cont,
                type: "info",
                buttons: [{ value: "Okay" }],
                afterClose: function () { window.open(pname); }

            });
        }

        function errormsgbox(cont, tit) {
            $.msgBox({
                title: tit,
                content: cont,
                type: "error",
                buttons: [{ value: "Okay" }]

            });
        }

        function warningmsgbox(cont, tit) {
            $.msgBox({
                title: tit,
                content: cont,
                type: "alert",
                buttons: [{ value: "Okay" }]

            });
        }

        function errormsgbox_reloc(cont, loc, tit) {
            $.msgBox({
                title: tit,
                content: cont,
                type: "error",
                buttons: [{ value: "Okay" }],
                afterClose: function () { window.location = loc; }
            });
        }

        function warningMessage_y_no(t) {
            $.msgBox({

                title: "Are You Sure",
                content: t,
                type: "confirm",
                buttons: [{ value: "Yes" }, { value: "No" }, { value: "Cancel" }],
                success: function (result) {
                    var confirm_value = document.createElement("INPUT");
                    if (result == "Yes") {
                        confirm_value = "yes";
                        //alert("One cup of coffee coming right up!");
                        //HandleIT(confirm_value);
                    }
                    else if (result == "No") {
                        confirm_value = "No";
                    }
                    else if (result == "Cancel") {
                        confirm_value = "Cancel";
                    }

                }
            });

            document.forms[0].appendChild(confirm_value);
        }

    </script>
    <!-- Jquery Msgbox end-->
</head>
<body>
    <section>
        <div class="container bootshape">
            <form id="Form1" class="simple-login" role="form" runat="server">
            <asp:ScriptManager ID="scp1" runat="server"></asp:ScriptManager>
            <div id="login" runat="server">
                <h1>Admin Login</h1>
                <asp:UpdatePanel ID="up1" runat="server"><ContentTemplate>
                <asp:TextBox ID="txtUsername" runat="server" autofocus required placeholder="Username" class="form-control" AutoComplete="off" ></asp:TextBox>
                <asp:TextBox ID="txtPassword" runat="server" required placeholder="Password" class="form-control" AutoComplete="off" TextMode="Password"></asp:TextBox>                
                 <asp:Image ID="imgCaptcha" runat="server" /> <asp:ImageButton ID="ImageButton1" runat="server" Height="15px" CausesValidation="false"
                                ImageUrl="http://localhost/elts_lorry/img/refresh-16.png" OnClick="ImageButton1_Click" formnovalidate
                                Width="15px" ToolTip="Refresh" AlternateText="Refresh" /><asp:Label ID="lbl_capt_wrong" runat="server" Text="" ForeColor="#FF3300" Font-Bold="True"></asp:Label>
                 <asp:TextBox ID="txtCaptcha" runat="server" autofocus required placeholder="Captcha" class="form-control" AutoComplete="off"></asp:TextBox>
                <asp:Button ID="btn_login" class="btn btn-lg btn-primary btn-block" 
                    runat="server" Text="Login" onclick="btn_login_Click"></asp:Button>               
                <p class="forgot-password"><a href="http://localhost/elts_lorry/admin/default/pass">Forgot password?</a></p></ContentTemplate></asp:UpdatePanel>
</div>

  <div id="forgot" runat="server">
                <h1>Admin Forgot Password</h1>
                <asp:TextBox ID="txtusername_forgot" runat="server" autofocus required placeholder="Username" class="form-control" AutoComplete="off"></asp:TextBox>
               
                <asp:Button ID="btn_forgot" class="btn btn-lg btn-primary btn-block" 
                    runat="server" Text="Send Password" onclick="btn_forgot_Click"></asp:Button>               
               
</div>
            </form>
            <p class="footer">&copy; 2014 Admin Login. All Rights Reserved. Proudly created by  <img src="http://localhost/elts_lorry/img/rtlx-logo.png" alt="RTLx Groups" style="margin-top: -4px"></p>
        </div>
      </section>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://code.jquery.com/jquery.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="http://localhost/elts_lorry/login_script/js/bootstrap.min.js"></script>
    <script src="http://localhost/elts_lorry/login_script/snippet.js"></script>
</body>
</html>
