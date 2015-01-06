using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_area_master : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            bind_state();
        }
    }

    protected void bind_state()
    {
        elts_lorry_Entities ele=new elts_lorry_Entities();

        state_master sm=new state_master();

        var st_query = (from q in ele.state_master
                        orderby sm.state_name
                        select new { q.state_id, q.state_name }).ToList();
        ddl_state.DataTextField = "state_name";
        ddl_state.DataValueField = "state_id";
        ddl_state.DataSource = st_query;
        ddl_state.DataBind();

        ddl_state.Items.Insert(0, new ListItem("Select" , "0"));
        ddlCity.Items.Insert(0, new ListItem("Select", "0"));            
    }

    protected void ddl_state_SelectedIndexChanged(object sender, EventArgs e)
    {
        //elts_lorry_Entities ele = new elts_lorry_Entities();

        ////city_master cm = new city_master();

        //city_with_state_view cm = new city_with_state_view();

        ////city_with_state_view cm = new city_with_state_view();

        int st=Convert.ToInt32(ddl_state.SelectedValue);

        //var dt_query = (from c in ele.city_with_state_view
        //                where cm.state_master_id == st
        //                orderby cm.city_name
        //                select c);
        //ddlCity.DataTextField = "city_name";
        //ddlCity.DataValueField = "city_id";
        //ddlCity.DataSource = dt_query;
        //ddlCity.DataBind();

        //ddlCity.Items.Insert(0, "Select");

        using (elts_lorry_Entities dc = new elts_lorry_Entities()) 
        {
            var res = from c in dc.city_with_state_view
                      where (c.state_master_id==st)
                      
                      select c;

            ddlCity.DataTextField = "city_name";
            ddlCity.DataValueField = "city_id";
            ddlCity.DataSource = res.ToList();
            ddlCity.DataBind();

            ddlCity.Items.Insert(0, new ListItem("Select", "0"));
        }
    }

    //'table' does not contain a definition for 'column' and no extension method 'column' accepting a first argument of type 'table' could be found (are you missing a using directive or an assembly reference?)	


    protected void btnSave_Click(object sender, EventArgs e)
    {
        elts_lorry_Entities ele = new elts_lorry_Entities();

        area_master ma = new area_master();
        
        string sql = "INSERT INTO area_master(area_name,city_id,state_id,status)VALUES(@P0,@P1,@P2,@P3)";

        List<object> parameterList = new List<object>();
        parameterList.Add(txtArea.Text);
        parameterList.Add(ddlCity.SelectedValue.ToString());
        parameterList.Add(ddl_state.SelectedValue.ToString());
        parameterList.Add("yes");

        object[] parameters1 = parameterList.ToArray();

        int result = ele.Database.ExecuteSqlCommand(sql, parameters1);

        ScriptManager.RegisterStartupScript(Page, GetType(), "MyScript", "savemsgbox('Area Name Saved Successfully.','http://localhost/elts_lorry/admin/area_master','Success');", true);
    }

    protected void change_state(object sender, EventArgs e)
    {
        try
        {

            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                int state = Convert.ToInt32((GridView1.Rows[i].FindControl("ddl_state1") as DropDownList).SelectedItem.Value);
                DropDownList ddl_city1 = GridView1.Rows[i].FindControl("ddl_city1") as DropDownList;

                using (elts_lorry_Entities dc = new elts_lorry_Entities())
                {
                    var res = from c in dc.city_with_state_view
                              where (c.state_master_id == state)

                              select c;

                    ddl_city1.DataTextField = "city_name";
                    ddl_city1.DataValueField = "city_id";
                    ddl_city1.DataSource = res.ToList();
                    ddl_city1.DataBind();

                    //ddlCity.Items.Insert(0, new ListItem("Select", "0"));
                }
            }
            
                       
           
        }
        catch (Exception ee)
        {
            ScriptManager.RegisterStartupScript(Page, GetType(), "MyScript", "warningmsgbox('" + ee.Message + "','Warning');", true);
        }
    }

    protected void UpdateArea(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            string state = (GridView1.Rows[e.RowIndex].FindControl("ddl_state1") as DropDownList).SelectedItem.Value;
            string cityid = (GridView1.Rows[e.RowIndex].FindControl("ddl_city1") as DropDownList).SelectedItem.Value;
            string areaid = GridView1.DataKeys[e.RowIndex].Value.ToString();

            string areaname = (GridView1.Rows[e.RowIndex].FindControl("TextBox1") as TextBox).Text;

            elts_lorry_Entities ele = new elts_lorry_Entities();

            state_master sm = new state_master();

            string sql = "UPDATE area_master SET area_name=@P0,state_id=@P1,city_id=@p2 WHERE area_id=@p3";

            List<object> parameterList = new List<object>();
            parameterList.Add(areaname.ToString());
            parameterList.Add(state.ToString());
            parameterList.Add(cityid.ToString());
            parameterList.Add(areaid.ToString());

            object[] parameters1 = parameterList.ToArray();

            int result = ele.Database.ExecuteSqlCommand(sql, parameters1);

            Response.Redirect("http://localhost/elts_lorry/admin/area_master");
        }
        catch (Exception ee)
        {
            ScriptManager.RegisterStartupScript(Page, GetType(), "MyScript", "warningmsgbox('" + ee.Message + "','Warning');", true);
        }
    }

   
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            if (e.Row.DataItem != null)
            {
                if ((e.Row.RowState & DataControlRowState.Edit) > 0)
                {
                    DropDownList ddl_city1 = (DropDownList)e.Row.FindControl("ddl_city1");

                    DropDownList ddl_state1 = (DropDownList)e.Row.FindControl("ddl_state1");

                    int st = Convert.ToInt32(ddl_state1.SelectedValue);

                    using (elts_lorry_Entities dc = new elts_lorry_Entities())
                    {
                        var res = from c in dc.city_with_state_view
                                  where (c.state_master_id == st)

                                  select c;

                        ddl_city1.DataTextField = "city_name";
                        ddl_city1.DataValueField = "city_id";
                        ddl_city1.DataSource = res.ToList();
                        ddl_city1.DataBind();

                        ddl_city1.Items.Insert(0, new ListItem("Select", "0"));
                    }

                    Label lblArea_Id = (Label)e.Row.FindControl("lblArea_Id");

                    int area = Convert.ToInt32(lblArea_Id.Text);

                    elts_lorry_Entities ele = new elts_lorry_Entities();

                    area_master am = new area_master();

                    var query = (from c in ele.area_master
                                 where c.area_id == area
                                 select c).FirstOrDefault();
                    if (query != null)
                    {
                        ddl_city1.SelectedValue = query.city_id.ToString();
                    }

                   // ddl_city1.Items.Insert(0, new ListItem("Select", "0"));
                }
            }
        }
    }


    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        //if (e.CommandName == "Edit")
        //{

        //}
    }

    protected void fixtureSelected(object sender, EventArgs e)
    {
        DropDownList ddlState1 = sender as DropDownList;

        ddlState1.NamingContainer.FindControl("ddl_state1");

        DropDownList ddlCity1 = ddlState1.NamingContainer.FindControl("ddl_city1") as DropDownList;

        int state = Convert.ToInt32( ddlState1.SelectedValue.ToString());

        //int city = Convert.ToInt32(ddlCity1.SelectedValue.ToString());

        using (elts_lorry_Entities dc = new elts_lorry_Entities())
        {
            var res = from c in dc.city_with_state_view
                      where (c.state_master_id == state)

                      select c;

            ddlCity1.DataTextField = "city_name";
            ddlCity1.DataValueField = "city_id";
            ddlCity1.DataSource = res.ToList();
            ddlCity1.DataBind();

           // ddlCity1.SelectedValue = city.ToString();

            //ddlCity.Items.Insert(0, new ListItem("Select", "0"));

            ddlCity1.Items.Insert(0, new ListItem("Select", "0"));
        }
    }


}