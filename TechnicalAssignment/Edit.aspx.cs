using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Xml;
using System.Xml.Linq;

public partial class Edit : System.Web.UI.Page
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
        else
        {
            if (lblError.Text != string.Empty)
            {
                lblError.Text = string.Empty;
            }
        }
    }

    // Populate the form with the product details
    protected void populateForm(XElement product)
    {
        string productsDoc = Server.MapPath("/Files/Products.xml");
        if (File.Exists(productsDoc))
        {
            tbName.Text = product.Element("Name").Value;
            ddlCategory.SelectedValue = product.Element("Category").Value;
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
        if (tbName.Text == string.Empty || ddlCategory.SelectedValue == null || tbPrice.Text == string.Empty || tbQuantity.Text == string.Empty)
        {
            lblError.Text = "Please fill out all required fields.";
        }
        else if (!(isPositive(tbQuantity.Text)))
        {
            lblError.Text = "Quantity must be a positive number";
        }
        else
        {
            if (File.Exists(productsDoc))
            {
                XDocument doc = XDocument.Load(Server.MapPath("/Files/Products.xml"));

                // Get the product information by the product id
                XElement product = doc.Element("Products").Elements("Product")
                    .Single(x => (string)x.Attribute("id") == Request.QueryString["id"]);

                string price = "";
                if (!(tbPrice.Text.Contains(".")))
                {
                    price = "$" + tbPrice.Text + ".00";
                }

                product.SetElementValue("Name", tbName.Text);
                product.SetElementValue("Category", ddlCategory.SelectedValue);
                product.SetElementValue("Price", price);
                product.SetElementValue("Quantity", tbQuantity.Text);
                doc.Save(Server.MapPath("/Files/Products.xml"));
                populateForm(product);

                h1.InnerHtml = "Edit " + product.Element("Name");
                Response.Redirect("Default.aspx");
            }
        }
    }

    // Check to see if tbQuantity.Text is a valid integer
    protected bool isPositive(string quantity)
    {
        bool isPositive = false;
        if (Convert.ToInt32(tbQuantity.Text) > 0)
        {
            isPositive = true;
        }
        return isPositive;
    }

    // Check to see that the number provided is an int
    protected bool isInt(string productID)
    {
        bool isInt = false;
        try
        {
            Convert.ToInt32(productID);
            isInt = true;
        }
        catch
        {

        }
        return isInt;
    }
}