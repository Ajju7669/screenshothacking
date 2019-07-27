using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    SqlConnection con;
    SqlCommand cmd;

    protected void Button2_Click(object sender, EventArgs e)
    {
        con = new SqlConnection("data source=.;database=ScreenShot;integrated security=SSPI");
        cmd = new SqlCommand();
        con.Open();
       
        cmd.CommandType = CommandType.Text;
        if (DropDownList1.SelectedItem.Text == "Admin")
        {
            cmd.CommandText = "select * from EmpDetails where UserName=@uid and Password=@pwd and RoleID=1";
        }
        else if (DropDownList1.SelectedItem.Text == "Manager")
        {
            cmd.CommandText = "select * from EmpDetails where UserName=@uid and Password=@pwd and RoleID=2";
        }
       
        cmd.Parameters.AddWithValue("@uid", TextBox1.Text);
        cmd.Parameters.AddWithValue("@pwd", TextBox2.Text);
        cmd.Parameters.AddWithValue("@roleid",Convert.ToInt32(DropDownList1.SelectedItem.Value));
       cmd.Connection=con;

       SqlDataReader sdr= cmd.ExecuteReader();
       if(sdr.Read())
       {
            if (DropDownList1.SelectedItem.Text == "Admin")
            {

                Response.Redirect("~/Admin/Adminhome.aspx");
            }
            else
            {

                Response.Redirect("~/Manager/managerhome.aspx");

            }
        }
        else
            lblmsg.Text = "Invalid Credentials";
        lblmsg.Visible = true;
     
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        TextBox1.Text = "";
        TextBox2.Text = "";

    }
}
