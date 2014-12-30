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

public partial class admin_vehicle_type : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        elts_lorry_Entities ele = new elts_lorry_Entities();

        vehicle_type vt = new vehicle_type();  

        string sql = "INSERT INTO vehicle_type(type_name,status)VALUES(@P0,@P1)";

        List<object> parameterList = new List<object>();
        parameterList.Add(txtType.Text);  
        parameterList.Add("yes");

        object[] parameters1 = parameterList.ToArray();

        int result = ele.Database.ExecuteSqlCommand(sql, parameters1);

        ScriptManager.RegisterStartupScript(Page, GetType(), "MyScript", "savemsgbox('Vehicle Type Saved Successfully.','http://localhost/elts_lorry/admin/vehicle_type','Success');", true);
        
    }
}