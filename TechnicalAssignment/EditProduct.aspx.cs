using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Xml;
using System.Xml.Linq;

public partial class EditProduct : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        XDocument doc = XDocument.Load(Server.MapPath("/Files/Products.xml"));
        // Get the product information by the product id
        XElement product = doc.Element("Products").Elements("Product")
            .Single(x => (string)x.Attribute("id") == Request.QueryString["id"]);

        h1.InnerHtml = "Edit " + product.Element("Name");

        if (!IsPostBack)
        {
            populateForm(product);
        }
    }

    // Populate the form with the product details
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

    /**********************
     * 2. btnUpdate       *
     *********************/
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        string productsDoc = Server.MapPath("/Files/Products.xml");
        if (File.Exists(productsDoc))
        {
            string thisThing = Request.QueryString["id"];
            thisThing = thisThing.Replace("%20", " ");
            XDocument doc = XDocument.Load(Server.MapPath("/Files/Products.xml"));

            // Get the product information by the product id
            XElement product = doc.Element("Products").Elements("Product")
                .Single(x => (string)x.Attribute("id") == Request.QueryString["id"]);

            XElement element2 = product.Element("Name");
            product.SetElementValue("Name", tbName.Text);
            
            doc.Save(Server.MapPath("/Files/Products.xml"));
            populateForm(product);

            h1.InnerHtml = "Edit " + product.Element("Name");
        }
    }
}