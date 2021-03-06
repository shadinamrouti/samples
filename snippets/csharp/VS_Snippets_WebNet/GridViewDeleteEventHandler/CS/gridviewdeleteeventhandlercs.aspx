<!-- <Snippet1> -->

<%@ Page language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script runat="server">

  void Page_Load(Object sender, EventArgs e)
  {
        
    // Create a new GridView control.
    GridView customersGridView = new GridView();
         
    // Set the GridView control's properties.          
    customersGridView.ID = "CustomersGridView";
    customersGridView.DataSourceID = "CustomersSqlDataSource"; 
    customersGridView.AutoGenerateColumns = true;
    customersGridView.AutoGenerateDeleteButton = true;
    customersGridView.DataKeyNames = new String[] {"CustomerID"};
       
    // Programmatically register the event-handling methods.
    customersGridView.RowDeleting += new GridViewDeleteEventHandler(this.CustomersGridView_RowDeleting);
        
    // Add the GridView object to the Controls collection
    // of the PlaceHolder control.
    GridViewPlaceHolder.Controls.Add(customersGridView);
        
  }
    
  void CustomersGridView_RowDeleting(Object sender, GridViewDeleteEventArgs e)
  {

    // User the sender parameter to retrieve the GridView control
    // that raised the event.
    GridView customersGridView = (GridView)sender;
    
    // Cancel the delete operation if the user attempts to remove
    // the last record from the GridView control.
    if (customersGridView.Rows.Count <= 1)
    {
        
      e.Cancel = true;
      Message.Text = "You must keep at least one record.";
            
    }
    
  }  

</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
  <head runat="server">
    <title>GridViewDeleteEventHandler Example</title>
</head>
<body>
    <form id="form1" runat="server">
        
      <h3>GridViewDeleteEventHandler Example</h3>
            
      <asp:label id="Message"
        forecolor="Red"          
        runat="server"/>
                
      <br/>
      
      <asp:placeholder id="GridViewPlaceHolder"
        runat="server"/>
            
      <!-- This example uses Microsoft SQL Server and connects  -->
      <!-- to the Northwind sample database. Use an ASP.NET     -->
      <!-- expression to retrieve the connection string value   -->
      <!-- from the Web.config file.                            -->
      <asp:sqldatasource id="CustomersSqlDataSource"  
        selectcommand="Select [CustomerID], [CompanyName], [Address], [City], [PostalCode], [Country] From [Customers]"
        deletecommand="Delete from Customers where CustomerID = @CustomerID"
        connectionstring="<%$ ConnectionStrings:NorthWindConnectionString%>"
        runat="server">
      </asp:sqldatasource>
      
    </form>
  </body>
</html>

<!-- </Snippet1> -->