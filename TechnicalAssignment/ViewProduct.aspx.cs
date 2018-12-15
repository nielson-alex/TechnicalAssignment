using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Xml;
using System.Xml.Linq;

public partial class ViewProduct : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        populateForm();

    }

    protected void populateForm()
    {
        string productsDoc = Server.MapPath("/Files/Products.xml");
        if (File.Exists(productsDoc))
        {
            string thisThing = Request.QueryString["id"];
            thisThing = thisThing.Replace("%20", " ");
            XDocument doc = XDocument.Load(Server.MapPath("/Files/Products.xml"));

            // Get the product information by the product id
            XElement elementToChange = doc.Element("Products").Elements("Product")
                .Single(x => (string)x.Attribute("id") == Request.QueryString["id"]);

            tbName.Text = elementToChange.Element("Name").Value;
            tbCategory.Text = elementToChange.Element("Category").Value;
            tbPrice.Text = elementToChange.Element("Price").Value;
            tbQuantity.Text = elementToChange.Element("Quantity").Value;
        }
    }
}