using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Net;
using System.Net.Mail;

public partial class Registration : System.Web.UI.Page
{
    int cur_id = 0;
    string pass = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Request.QueryString["reg"] != null)
            {
                check_request();
                bind_state();
            }
            else
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "MyScript", "errormsgbox_reloc('Invalid Parameters','http://localhost/elts_lorry/','Error');", true);
            }
        }
    }  

    protected void check_request()
    {
        if (Request.QueryString["reg"] == "owner")
        {
            ddlRegister.SelectedValue = "Owner";
            ddlRegister.Enabled = false;
        }
        else if (Request.QueryString["reg"] == "agent")
        {
            ddlRegister.SelectedValue = "Agent";
            ddlRegister.Enabled = false;
        }
        else if (Request.QueryString["reg"] == "client")
        {
            ddlRegister.SelectedValue = "Client";
            ddlRegister.Enabled = false;
        }
        else
        {
            ScriptManager.RegisterStartupScript(Page, GetType(), "MyScript", "errormsgbox_reloc('Invalid Parameters','http://localhost/elts_lorry/','Error');", true);
        }
    }

    protected void bind_state()
    {
        elts_lorry_Entities ele = new elts_lorry_Entities();

        state_master sm = new state_master();

        var st_query = (from q in ele.state_master
                        orderby sm.state_name
                        select new { q.state_id, q.state_name }).ToList();
        ddlState.DataTextField = "state_name";
        ddlState.DataValueField = "state_id";
        ddlState.DataSource = st_query;
        ddlState.DataBind();

        ddlState.Items.Insert(0, new ListItem("Select", "0"));
        ddlCity.Items.Insert(0, new ListItem("Select", "0"));         
    }

    protected void ddlState_SelectedIndexChanged(object sender, EventArgs e)
    {
        int st = Convert.ToInt32(ddlState.SelectedValue);  

        using (elts_lorry_Entities dc = new elts_lorry_Entities())
        {
            var res = from c in dc.city_with_state_view
                      where (c.state_master_id == st)

                      select c;

            ddlCity.DataTextField = "city_name";
            ddlCity.DataValueField = "city_id";
            ddlCity.DataSource = res.ToList();
            ddlCity.DataBind();

            ddlCity.Items.Insert(0, new ListItem("Select", "0"));
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        elts_lorry_Entities ele = new elts_lorry_Entities();

        var up_query = (from c in ele.user_profile
                             where c.usr_name == txtUsername.Text
                     select c).FirstOrDefault();
        if (up_query != null)
        {
            ScriptManager.RegisterStartupScript(Page, GetType(), "MyScript", "warningmsgbox('Username Already Exists.','Warning');", true);
        }
        else
        {
            var em_query = (from d in ele.user_details
                            where d.email == txtEmail.Text || d.ph_no==txtPhone.Text
                            select d).FirstOrDefault();
            if (em_query != null)
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "MyScript", "warningmsgbox('Email Id or Phone No Already Exists.','Warning');", true);
            }
            else
            {

                var last_query = (from f in ele.user_details
                                  orderby f.pro_id descending
                                  select f).SingleOrDefault();
                if (last_query != null)
                {
                    cur_id = Convert.ToInt32(last_query.pro_id.ToString()) + 1;
                }
                else
                {
                    cur_id = 1;
                }

                pass = create_pass();
                
                string sql = "INSERT INTO user_details(full_name,email,ph_no,address_1,address_2,city,state,user_type,ct_dt,ct_by,status)VALUES(@P0,@P1,@p2,@p3,@p4,@p5,@p6,@p7,@p8,@p9,@p10)";

                List<object> parameterList = new List<object>();
                parameterList.Add(txtName.Text);
                parameterList.Add(txtEmail.Text);
                parameterList.Add(txtPhone.Text);
                parameterList.Add(txtAddress.Text);
                parameterList.Add(txtAddress2.Text);
                parameterList.Add(ddlCity.SelectedValue);
                parameterList.Add(ddlState.SelectedValue);
                parameterList.Add(ddlRegister.SelectedItem.ToString());                
                parameterList.Add(DateTime.UtcNow.ToString());
                parameterList.Add(cur_id);
                parameterList.Add("waiting");

                object[] parameters1 = parameterList.ToArray();

                int result = ele.Database.ExecuteSqlCommand(sql, parameters1);

                string sql_profile = "INSERT INTO user_profile(usr_id,usr_name,usr_pass,ispass_reset,isphone_verified,isemail_verified,isOnline,ct_dt,ct_by)VALUES(@P0,@P1,@p2,@p3,@p4,@p5,@p6,@p7,@p8)";

                List<object> parameterList1=new List<object>();
                parameterList1.Add(cur_id);
                parameterList1.Add(txtUsername.Text);
                parameterList1.Add(pass.ToString());
                parameterList1.Add(0);
                parameterList1.Add(0);
                parameterList1.Add(0);
                parameterList1.Add(0);
                parameterList1.Add(DateTime.UtcNow.ToString());
                parameterList1.Add(cur_id);

                object[] parameters2=parameterList1.ToArray();

                int resul1=ele.Database.ExecuteSqlCommand(sql_profile, parameters2);

                MailMessage mail1 = new MailMessage();
                mail1.From = new MailAddress("blue.blacky@live.com");
                mail1.To.Add(new MailAddress(txtEmail.Text));
                mail1.Subject = "Email Verification from ELTS";
                mail1.Body = "<p style='line-height:20px;'>This is a Welcome message from ELTS. </p><p style='line-height:20px;'>Your Registration in our Website is Successfully Completed. <br/>Your Login Details are listed below : <br/>Username : "+txtUsername.Text+"<br/>Password : "+pass.ToString()+"</p>";
                //mail1.Body = "<p>Your Email Verification is Completed.<br/>You will get a activation message within 24 hours.</p>";
                mail1.IsBodyHtml = true;

                SmtpClient smtp = new SmtpClient();
                smtp.Credentials = new NetworkCredential("blue.blacky@live.com", "Blue1Blacky2");
                smtp.Host = "smtp.live.com";
                smtp.Port = 587;
                smtp.EnableSsl = true;

                smtp.Send(mail1);

                ScriptManager.RegisterStartupScript(Page, GetType(), "MyScript", "savemsgbox('Registration Completed Successfully.','http://localhost/elts_lorry/','Success');", true);         
            }
        }
       
    }

    public string create_pass()
    {
        try
        {
            //// random generation
            var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789)*&^%$#@";
            var stringChars = new char[8];
            var random = new Random();

            for (int i = 0; i < stringChars.Length; i++)
            {
                stringChars[i] = chars[random.Next(chars.Length)];
            }

            var finalString = new String(stringChars);

            return finalString;
        }
        catch (Exception ee)
        {
            //ScriptManager.RegisterStartupScript(Page, GetType(), "MyScript", "errormsgbox('" + ee.Message + "','Error');", true);
            return ee.Message.ToString();
        }
    }
}