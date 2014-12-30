using System;
using System.Collections.Generic;
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





public partial class city_master : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
           // bind_drop_state();
        }
    }
    protected void ddl_state_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        elts_lorry_Entities ele = new elts_lorry_Entities();

        state_master sm = new state_master();

        string sql = "INSERT INTO city_master(city_name,state_id,status)VALUES(@P0,@P1,@p2)";

        List<object> parameterList = new List<object>();
        parameterList.Add(txtcityname.Text);
        parameterList.Add(ddl_state.SelectedValue.ToString());
        parameterList.Add("yes");

        object[] parameters1 = parameterList.ToArray();

        int result = ele.Database.ExecuteSqlCommand(sql, parameters1);

        ScriptManager.RegisterStartupScript(Page, GetType(), "MyScript", "savemsgbox('City Name Saved Successfully.','http://localhost/elts_lorry/admin/city_master','Success');", true);
    }

    protected void UpdateCity(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            string state = (GridView1.Rows[e.RowIndex].FindControl("ddl_state1") as DropDownList).SelectedItem.Value;
            string cityid = GridView1.DataKeys[e.RowIndex].Value.ToString();

            string cityname = (GridView1.Rows[e.RowIndex].FindControl("TextBox1") as TextBox).Text;

            elts_lorry_Entities ele = new elts_lorry_Entities();

            state_master sm = new state_master();

            string sql = "UPDATE city_master SET city_name=@P0,state_id=@P1 WHERE city_id=@p2";

            List<object> parameterList = new List<object>();
            parameterList.Add(cityname.ToString());
            parameterList.Add(state.ToString());
            parameterList.Add(cityid.ToString());

            object[] parameters1 = parameterList.ToArray();

            int result = ele.Database.ExecuteSqlCommand(sql, parameters1);                      

            Response.Redirect("http://localhost/elts_lorry/admin/city_master.aspx");
        }
        catch (Exception ee)
        {
            ScriptManager.RegisterStartupScript(Page, GetType(), "MyScript", "warningmsgbox('" + ee.Message + "','Warning');", true);
        }
    }     

}