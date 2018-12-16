using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Xml;
using System.Xml.Linq;

public partial class View : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string productID = Request.QueryString["id"];
        XDocument doc = XDocument.Load(Server.MapPath("/Files/Products.xml"));
        // Get the product information by the product id
        XElement product = doc.Element("Products").Elements("Product")
            .Single(x => (string)x.Attribute("id") == Request.QueryString["id"]);

        h1.InnerHtml = product.Element("Name").Value;
        populateForm(product);
    }

    // Populate the form with the product's details
    protected void populateForm(XElement product)
    {
        string productsDoc = Server.MapPath("/Files/Products.xml");
        if (File.Exists(productsDoc))
        {
            tbName.Text = product.Element("Name").Value;
            tbCategory.Text = product.Element("Category").Value;
            tbPrice.Text = product.Element("Price").Value;
            tbQuantity.Text = product.Element("Quantity").Value;
        }
    }

    /**********************
     * 1. btnBack         *
     *********************/
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
}