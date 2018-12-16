using System;
using System.Data;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Xml.Linq;

public partial class _Default : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        populateGV();
    }

    // Populate the gridview with the product catalog info
    protected void populateGV()
    {
        string productsDoc = Server.MapPath("/Files/Products.xml");

        if (File.Exists(productsDoc))
        {
            XDocument contactDoc = XDocument.Load(Server.MapPath("/Files/Products.xml"));
            //open the tender xml file  
            //XmlTextReader xmlreader = new XmlTextReader(Server.MapPath("C:/Users/alexn/Desktop/For Alex/Files/contacts.xml"));
            XmlTextReader xmlreader = new XmlTextReader(Server.MapPath("/Files/Products.xml"));
            //reading the xml data  
            DataSet ds = new DataSet();
            ds.ReadXml(xmlreader);
            xmlreader.Close();

            //if ds is not empty  
            if (ds.Tables.Count != 0)
            {
                //Bind Data to gridview  
                GridView1.DataSource = ds;
                GridView1.DataBind();
                GridView1.HeaderRow.Cells[0].Style["display"] = "none";
            }
        }
        else
        {
            //DataSet ds = new DataSet();
            //GridView1.DataSource = ds;
            GridView1.DataBind();
        }
    }

    // Hide the ProductID cells from the gridview
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        foreach (GridViewRow row in GridView1.Rows)
        {
            row.Cells[0].Style["display"] = "none";
        }
    }

    /**********************
     * 1. btnAdd          *
     *********************/
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        Response.Redirect("Add.aspx");
    }

    /**********************
     * 2. btnDetails      *
     *********************/
    protected void btnDetails_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        GridViewRow gvRow = (GridViewRow)btn.Parent.Parent;
        string id = gvRow.Cells[0].Text;
        Response.Redirect("View.aspx?id=" + id);
    }

    /**********************
     * 3. btnEdit         *
     *********************/
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        GridViewRow gvRow = (GridViewRow)btn.Parent.Parent;
        string id = gvRow.Cells[0].Text;
        Response.Redirect("Edit.aspx?id=" + id);
    }

    /**********************
     * 4. btnDelete       *
     *********************/
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        GridViewRow gvRow = (GridViewRow)btn.Parent.Parent;
        string id = gvRow.Cells[0].Text;
        Response.Redirect("Delete.aspx?id=" + id);
    }
}