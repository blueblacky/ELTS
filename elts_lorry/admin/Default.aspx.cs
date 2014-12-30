using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Configuration;
using System.Collections;
using System.Web.Security;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Text;
using System.Data.Entity;
using System.Data.Objects;

using eltsModel;

public partial class admin_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Redirect("http://localhost/elts_lorry/admin/state_master");

        if (!Page.IsPostBack)
        {
           

            if (Request.QueryString["id"] != null)
            {
                login.Visible = false;
                forgot.Visible = true;
            }
            else
            {
                login.Visible = true;
                forgot.Visible = false;

                FillCapctha();
            }
        }
    }

    void FillCapctha()
    {
        try
        {
            Random random = new Random();
            string combination = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
            StringBuilder captcha = new StringBuilder();
            for (int i = 0; i < 6; i++)
                captcha.Append(combination[random.Next(combination.Length)]);
            Response.Cookies["atten_captcha"].Value = captcha.ToString();
            Response.Cookies["atten_captcha"].Expires = DateTime.Now.AddDays(1);
            imgCaptcha.ImageUrl = "GenerateCaptcha.aspx?" + DateTime.Now.Ticks.ToString();
        }
        catch
        {

            throw;
        }
    }


    protected void btn_login_Click(object sender, EventArgs e)
    {
        lbl_capt_wrong.Text = "";
        int a = 0;

        string cap = Request.Cookies["atten_captcha"].Value.ToString();

        if (cap == txtCaptcha.Text)
        {
            a = 1;
        }
        else
        {
            ScriptManager.RegisterStartupScript(Page, GetType(), "MyScript", "errormsgbox('Incorrect Captcha.','Error');", true);

            a = 0;

            txtCaptcha.Text = ""; lbl_capt_wrong.Text = "Incorrect Captcha";

        }

        if (a == 1)
        {                      
            try
            {
                elts_lorry_Entities ele = new elts_lorry_Entities();
                var query = (from c in ele.tblAdmins
                             where c.UName == txtUsername.Text && c.UPass == txtPassword.Text
                             select c).FirstOrDefault();
                if (query != null)
                {
                }
                else
                {
                }
            }
            catch (Exception e2)
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "MyScript", "warningmsgbox('" + e2.Message + "','Warning');", true);
            }            
        }
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        FillCapctha(); lbl_capt_wrong.Text = "";
    }

    protected void btn_forgot_Click(object sender, EventArgs e)
    {
    }
}