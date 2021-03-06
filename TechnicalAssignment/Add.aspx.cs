﻿using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Xml;
using System.Xml.Linq;

public partial class Add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            if (lblError.Text != string.Empty)
            {
                lblError.Text = string.Empty;
            }
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
     * 2. btnYes          *
     *********************/
    protected void btnYes_Click(object sender, EventArgs e)
    {
        string productsDoc = Server.MapPath("/Files/Products.xml");
        if (tbName.Text == string.Empty || ddlCategory.SelectedValue == null || tbPrice.Text == string.Empty || tbQuantity.Text == string.Empty)
        {
            lblError.Text = "Please fill out all required fields.";
        }
        else if (File.Exists(productsDoc) && alreadyExists(tbName.Text))
        {
            lblError.Text = "This product already exists";
        }
        else if (!(isPositive(tbQuantity.Text)))
        {
            lblError.Text = "Quantity must be a positive number";
        }
        else
        {
            if (File.Exists(productsDoc))
            {
                int productID = 0;
                XDocument doc = XDocument.Load(Server.MapPath("/Files/Products.xml"));
                XmlTextReader xmlreader = new XmlTextReader(Server.MapPath("/Files/Products.xml"));
                while (xmlreader.Read())
                {
                    if (xmlreader.Name == "ProductID")
                    {
                        productID = Convert.ToInt32(xmlreader.ReadElementContentAsString()) + 1;
                    }
                }
                //reading the xml data  
                xmlreader.Close();

                string price = "";
                if (!(tbPrice.Text.Contains(".")))
                {
                    price = "$" + tbPrice.Text + ".00";
                }

                XElement root = doc.Element("Products");
                IEnumerable<XElement> rows = root.Descendants("Product");
                XElement lastRow = rows.Last();
                lastRow.AddAfterSelf(
                    new XElement("Product",
                        new XAttribute("id", productID),
                        new XElement("ProductID", productID),
                        new XElement("Name", tbName.Text),
                        new XElement("Category", ddlCategory.SelectedValue),
                        new XElement("Description", tbDescription.Text),
                        new XElement("Price", price),
                        new XElement("Quantity", tbQuantity.Text)
                    )
                );
                doc.Save(Server.MapPath("/Files/Products.xml"));
            }
            else
            {
                XElement products = new XElement(
                    new XElement("Products",
                        new XElement("Product",
                            new XAttribute("id", 0),
                            new XElement("ProductID", 0),
                            new XElement("Name", tbName.Text),
                            new XElement("Category", ddlCategory.SelectedValue),
                            new XElement("Description", tbDescription.Text),
                            new XElement("Price", tbPrice.Text),
                            new XElement("Quantity", tbQuantity.Text)
                        )   
                    )
                );

                products.Save(Server.MapPath("/Files/Products.xml"));
            }
            Response.Redirect("Default.aspx");
        }
    }

    // Check to see if the product name is already in use
    protected bool alreadyExists(string name)
    {
        bool alreadyExists = false;
        XDocument doc = XDocument.Load(Server.MapPath("/Files/Products.xml"));
        XmlTextReader xmlreader = new XmlTextReader(Server.MapPath("/Files/Products.xml"));
        while (xmlreader.Read())
        {
            if (xmlreader.Value.ToLower() == name.ToLower())
            {
                alreadyExists = true;
            }
        }
        xmlreader.Close();
        return alreadyExists;
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