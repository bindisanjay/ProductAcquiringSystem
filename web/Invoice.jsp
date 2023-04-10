
<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="database.connect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 

<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>PAS-Product Invoice </title> 
  <link rel="stylesheet" href="vendors/ti-icons/css/themify-icons.css">
  <link rel="stylesheet" href="vendors/css/vendor.bundle.base.css"> 
  <link rel="stylesheet" href="vendors/ti-icons/css/themify-icons.css">
  <link rel="stylesheet" type="text/css" href="js/select.dataTables.min.css"> 
  <link rel="stylesheet" href="css/vertical-layout-light/style.css"> 
  <link rel="shortcut icon" href="images/favicon.png" /> 
  <link rel="stylesheet" href="vendors/feather/feather.css">  
  <link rel="stylesheet" href="vendors/select2/select2.min.css">
  <link rel="stylesheet" href="vendors/select2-bootstrap-theme/select2-bootstrap.min.css">   
     <script>
        function printDiv() {
            var divContents = document.getElementById("GFG").innerHTML;
            var a = window.open('', '', 'height=500, width=500');
            a.document.write('<html>');
            a.document.write('<body > ');
            a.document.write('<h2><center><img src="images/logo.svg" class="mr-2" alt="logo"/></center></h2><br>');
            a.document.write('<body > <h1>Generated Invoice Report </h1><br>');
            a.document.write(divContents);
            a.document.write('</body></html>');
            a.document.close();
            a.print();
        }
    </script>
  
</head>
<body>
  <div class="container-scroller">
    <!-- partial:partials/_navbar.html -->
    <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
      <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
          <a class="navbar-brand brand-logo mr-5" href="managerhome.jsp"><img src="images/logo.svg" class="mr-2" alt="logo"/></a>
          <a class="navbar-brand brand-logo-mini" href="managerhome.jsp"><img src="images/logo-mini.svg" alt="logo"/></a>
      </div>
      <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
         <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
          <span class="icon-menu"></span>
        </button>
        <ul class="navbar-nav mr-lg-2">
           
        </ul>
      <ul class="navbar-nav navbar-nav-right">
            
          <li class="nav-item nav-profile dropdown">
            <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" id="profileDropdown">
              <img src="images/faces/face28.jpg" alt="profile"/>
            </a>
            <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="profileDropdown">
              
                <a class="dropdown-item" href="mlogout.jsp">
                <i class="ti-power-off text-primary"></i>
                Logout
              </a>
            </div>
          </li>
          
        </ul>
        <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
          <span class="icon-menu"></span>
        </button>
      </div>
    </nav>
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
      <!-- partial:partials/_settings-panel.html -->
     
              <%
String ss=request.getParameter("v");
if(ss!=null){
   if(ss.equalsIgnoreCase("Inserted")) {%>    
   <script>  window.alert("Invoice Added Successfully");</script>
 <% } else  if(ss.equalsIgnoreCase("NotInserted")) {%>    
   <script>  window.alert("Invoice Adding Failed");</script>    <% }
else  if(ss.equalsIgnoreCase("Deleted")) {%>    
   <script>  window.alert(" Invoice Delete Successfully");</script>    <% }
   else  if(ss.equalsIgnoreCase("NotDeleted")) {%>    
   <script>  window.alert(" Invoice Deleting Failed");</script>    <% }
else  if(ss.equalsIgnoreCase("Updated")) {%>    
   <script>  window.alert(" Invoice Updated Successfully");</script>    <% }
   else  if(ss.equalsIgnoreCase("NotUpdated")) {%>    
   <script>  window.alert(" Invoice Updating Failed");</script>    <% }



}  %>
      
      <nav class="sidebar sidebar-offcanvas" id="sidebar">
        <ul class="nav">
          <li class="nav-item">
            <a class="nav-link" href="Home.jsp">
              <i class="icon-grid menu-icon"></i>
              <span class="menu-title">PAS-Product</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
              <i class="icon-head menu-icon"></i>
              <span class="menu-title">Employee</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="ui-basic">
              <ul class="nav flex-column sub-menu"> 
                <li class="nav-item"> <a class="nav-link" href="addemployee.jsp">Add Employee</a></li>
                <li class="nav-item"> <a class="nav-link" href="deleteemployee.jsp">Delete Employee</a></li>
                <li class="nav-item"> <a class="nav-link" href="updateemployee.jsp">Update Employee</a></li>
                <li class="nav-item"> <a class="nav-link" href="viewemployee.jsp">View All Employee's</a></li>
              </ul>
            </div>
          </li>
           
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#authq" aria-expanded="false" aria-controls="authq">
              <i class="icon-head menu-icon"></i>
              <span class="menu-title">Category</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="authq">
              <ul class="nav flex-column sub-menu"> 
                 <li class="nav-item"> <a class="nav-link" href="category.jsp?st=add"> Add Category</a></li>
                <li class="nav-item"> <a class="nav-link" href="category.jsp?st=update"> Update Category</a></li>
                <li class="nav-item"> <a class="nav-link" href="category.jsp?st=delete"> Delete Category</a></li>
                <li class="nav-item"> <a class="nav-link" href="category.jsp?st=view"> View Category</a></li>
             </ul>
            </div>
          </li> 
          
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#autha" aria-expanded="false" aria-controls="autha">
              <i class="icon-head menu-icon"></i>
              <span class="menu-title">Items</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="autha">
              <ul class="nav flex-column sub-menu"> 
               <li class="nav-item"> <a class="nav-link" href="Items.jsp?st=add"> Add Items</a></li> 
                <li class="nav-item"> <a class="nav-link" href="Items.jsp?st=update">  Update Items</a></li> 
                <li class="nav-item"> <a class="nav-link" href="Items.jsp?st=delete">Delete  Items</a></li> 
                <li class="nav-item"> <a class="nav-link" href="Items.jsp?st=view"> View Items</a></li> 
               </ul>
            </div>
          </li> 
          
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#auths" aria-expanded="false" aria-controls="auths">
              <i class="icon-head menu-icon"></i>
              <span class="menu-title">Account</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="auths">
              <ul class="nav flex-column sub-menu">  
                <li class="nav-item"> <a class="nav-link" href="managerAccount.jsp?st=update">  Update Account</a></li> 
                <li class="nav-item"> <a class="nav-link" href="managerAccount.jsp?st=delete">Delete  Account</a></li> 
                <li class="nav-item"> <a class="nav-link" href="managerAccount.jsp?st=deactivate"> Deactivate Account</a></li> 
              </ul>
            </div>
          </li>
          
          
           <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#ui-basi" aria-expanded="false" aria-controls="ui-basi">
              <i class="icon-layout menu-icon"></i>
              <span class="menu-title">Orders</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="ui-basi">
              <ul class="nav flex-column sub-menu">
              <li class="nav-item"> <a class="nav-link" href="Orders.jsp?st=add">Add Orders</a></li>
                <li class="nav-item"> <a class="nav-link" href="Orders.jsp?st=update">Update Orders</a></li>
                <li class="nav-item"> <a class="nav-link" href="Orders.jsp?st=delete">Delete Orders</a></li>
                <li class="nav-item"> <a class="nav-link" href="Orders.jsp?st=view">View Orders</a></li>
               </ul>
            </div>
          </li>
          
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#ui-bas" aria-expanded="false" aria-controls="ui-bas">
              <i class="icon-layout menu-icon"></i>
              <span class="menu-title">Reports</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="ui-bas">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="Reports.jsp?st=expiry">Generate Expiry Reports</a></li> 
            <li class="nav-item"> <a class="nav-link" href="Reports.jsp?st=stock">Generate Stock Report</a></li> 
               </ul>
            </div>
          </li>
          
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#ui-ba" aria-expanded="false" aria-controls="ui-ba">
              <i class="icon-layout menu-icon"></i>
              <span class="menu-title">Invoice</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="ui-ba">
              <ul class="nav flex-column sub-menu">
                          <li class="nav-item"> <a class="nav-link" href="Invoice.jsp?st=generate">Generate Invoice</a></li> 
            <li class="nav-item"> <a class="nav-link" href="Invoice.jsp?st=update">Update Invoice</a></li> 
            <li class="nav-item"> <a class="nav-link" href="Invoice.jsp?st=delete">Delete Invoice</a></li> 
                <li class="nav-item"> <a class="nav-link" href="Discount.jsp?st=add">Add Discount</a></li> 
            <li class="nav-item"> <a class="nav-link" href="Discount.jsp?st=delete">Delete Discount</a></li> 
            <li class="nav-item"> <a class="nav-link" href="applyCoupon.jsp">Apply Coupon</a></li> 
            <li class="nav-item"> <a class="nav-link" href="orderSummary.jsp">Generate Order Summary</a></li>  

               </ul>
            </div>
          </li>
          
           <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#ui-b" aria-expanded="false" aria-controls="ui-b">
              <i class="icon-layout menu-icon"></i>
              <span class="menu-title">FeedBack</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="ui-b">
              <ul class="nav flex-column sub-menu">
                  
                <li class="nav-item"> <a class="nav-link" href="sendFeedback.jsp">Send Feedback</a></li> 
            <li class="nav-item"> <a class="nav-link" href="sendEmessage.jsp">Send Email-message</a></li>  
               </ul>
            </div>
          </li>
          
           <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#ui-bq" aria-expanded="false" aria-controls="ui-bq">
              <i class="icon-layout menu-icon"></i>
              <span class="menu-title">Shifts</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="ui-bq">
              <ul class="nav flex-column sub-menu">
                  
                <li class="nav-item"> <a class="nav-link" href="Shifts.jsp?st=add"> Add Shifts</a></li> 
                <li class="nav-item"> <a class="nav-link" href="Shifts.jsp?st=update"> Update Shifts</a></li> 
                <li class="nav-item"> <a class="nav-link" href="Shifts.jsp?st=delete"> Delete Shifts</a></li> 
                <li class="nav-item"> <a class="nav-link" href="calculatePay.jsp"> Calculate Pay</a></li> 
                <li class="nav-item"> <a class="nav-link" href="approveLeave.jsp">Approve Leave</a></li>    
               </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#ui-a" aria-expanded="false" aria-controls="ui-a">
              <i class="icon-layout menu-icon"></i>
              <span class="menu-title">Supplier</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="ui-a">
              <ul class="nav flex-column sub-menu">
                  
                <li class="nav-item"> <a class="nav-link" href="Suppliers.jsp?st=add"> Add Supplier</a></li> 
                <li class="nav-item"> <a class="nav-link" href="Suppliers.jsp?st=update"> Update Supplier</a></li> 
                <li class="nav-item"> <a class="nav-link" href="Suppliers.jsp?st=delete"> Delete Supplier</a></li> 
                <li class="nav-item"> <a class="nav-link" href="Suppliers.jsp?st=Deactivate"> Deactivate Supplier</a></li>      
               </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="createTasks.jsp">
              <i class="icon-paper menu-icon"></i>
              <span class="menu-title">Create Tasks</span>
            </a>
          </li>
           <li class="nav-item">
            <a class="nav-link" href="mlogout.jsp">
              <i class="icon-arrow-left menu-icon"></i>
              <span class="menu-title">Logout</span>
            </a>
          </li>
          
        </ul>
      </nav>
      <!-- partial -->
          <div class="main-panel">        
        <div class="content-wrapper">
          <div class="row">
           
             
            
            <div class="col-12 grid-margin">
              <div class="card">
                <div class="card-body">
                 <%
                 

String st=request.getParameter("st");
System.out.println("mmm::"+st);
 try{
          connect db=new connect();
          Connection connect=db.getConnection(); 
if(st!=null){ 
    
System.out.println("mmm::"+st);

   if(st.equalsIgnoreCase("sAFSSDF ")) {
       
%>
 <h4 class="card-title">generate Invoice </h4>
                  <form class="form-sample" action="./Items" method="post"  enctype="multipart/form-data" > 
                     
                            
                            
                      
                  </form>
                                

      <%} else  if(st.equalsIgnoreCase("generating")) {
         
       String id=request.getParameter("id");
                 long millis=System.currentTimeMillis();  
                     java.sql.Date cdate=new java.sql.Date(millis);  
                                System.out.println();
 String count="SELECT count(*) FROM invoice ";  
Statement stmt=connect.createStatement();
				 ResultSet rqs =stmt.executeQuery(count);
					 
				  rqs.next();
                                   
				     int iidd=rqs.getInt(1)+1; 
                                     String inid="IN000"+iidd;
    
    %>
                    
              
                          <h3 class="card-title">Generate Invoice   :-> Invoice ID;<%=inid%> </h3>
                    <div id="GFG" class="table-responsive">
                          <h4 class="card-title">Item Details</h4>
                    <table class="table table-striped">
                      <thead>
  <tr>  <th>  IID  </th>   <th>  Photo </th>  <th>  Name </th> 
  <th>  Category  </th>  
  <th>  Company  </th>  <th>  Price </th> 
  <th>  Discount  </th> <th>  Expiry Date  </th><th>  Count </th>    </tr>
                      </thead>
                      <tbody>
                 <%
                                                  
           String insql=" insert into invoice values (?,?,?)"; 
            PreparedStatement pss=connect.prepareStatement(insql);
            pss.setString(1, inid);
				    pss.setString(2, id); 
				    pss.setDate(3, cdate);
                        int i11=pss.executeUpdate(); 
                 
                 
                 
         // String sql="select it.id,it.photo,it.name,it.category,it.Pcompany,it.price,it.discount,it.edate from orderdetails as od, cart as ct , item as it  where  od.cartoderid= ct.caid and ct.iid= it.id and od.id= '"+id+"'GROUP BY  it.id";
           String sql="select it.id,it.photo,it.name,it.category,it.Pcompany,it.price,it.discount,it.edate,count(it.id) from orderdetails as od, cart as ct , item as it  where  od.cartoderid= ct.caid and ct.iid= it.id and od.id='"+id+"'GROUP BY  it.id";
 
				 ResultSet rs =stmt.executeQuery(sql);
					int utype=0;
while (rs.next()) {    utype+=Integer.parseInt(rs.getString(6));
%>                           
<tr>
  <td class="py-1"> <%=rs.getString(1)%> </td>  
  <td> <img src="<%=rs.getString(2)%>" alt="image"> </td> 
  <td> <%=rs.getString(3)%></td>  
  <td> <%=rs.getString(4)%></td>   
  <td> <%=rs.getString(5)%></td>  
  <td> <%=rs.getString(6)%></td>   
  <td> <%=rs.getString(7)%></td>    
  <td> <%=rs.getDate(8)%></td>     
  <td> <%=rs.getInt(9)%></td>      
</tr>                
<%}%>    </tbody>  </table> <br><br> 
 <h4 class="card-title">Customer Details </h4>  
  <table class="table table-striped">
                     
                      <tbody>
                 <%
               String sqll="select * from orderdetails   where id= '"+id+"'";
        ResultSet rss =stmt.executeQuery(sqll);
					 
                while (rss.next()) {       
%>                           
<tr>
   <tr> <th>  ID  </th>   <td class="py-1"> <%=rss.getString(1)%> </td>   </tr> 
 <tr> <th>  username </th>  <td> <%=rss.getString(2)%></td>  </tr> 
 <tr> <th> Email ID </th>   <td> <%=rss.getString(3)%></td> </tr>  
 <tr>  <th>  Address  </th> <td> <%=rss.getString(4)%></td>  </tr> 
<tr> <th>  Phone </th>  <td> <%=rss.getString(5)%></td>  </tr> 
<tr>  <th>  Payment Method  </th>  <td> <%=rss.getString(6)%></td>   </tr> 
<tr>  <th>  Total Price </th>  <td> <%=rss.getString(7)%></td>  </tr>   
 <tr>   <th>  Payment Details  </th>  <td> <%=rss.getString(8)%></td> </tr>    
  
 <tr> <th>  CartOderid  </th>  <td>  
   <a href="Orders.jsp?st=viewcartde&oid=<%=rss.getString(9)%>"><%=rss.getString(9)%> </a> 
  </td>   </tr>  
 <tr>  <th>  Created Date  </th><td> <%=rss.getString(10)%></td>    
 
</tr>                
<%}%>    </tbody>  </table> <br><br>
<h2 style="align:center" > 
<h3><center>Total Price :: <%=utype%></center></h3>
                    </div>    
                    <center> <input class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" type="button" value="Print Report" onclick="printDiv()"> </center>
              
<% }else  if(st.equalsIgnoreCase("delete")) {
    %> 
     <h4 class="card-title">Delete Invoice</h4>
                    <div class="table-responsive">
                    <table class="table table-striped">
                      <thead>
  <tr>  
      
      <th>  IID  </th> <th>  OrderId  </th>       <th>  Action </th>  </tr>
                      </thead>
                      <tbody>
                 <% 
          String sql="SELECT * FROM invoice";
          Statement stmt=connect.createStatement();
				 ResultSet rs =stmt.executeQuery(sql);
					String utype="";
				 while (rs.next()) {        
%>                           
<tr>
  <td class="py-1"> <%=rs.getString(1)%> </td>   
  <td> <%=rs.getString(2)%></td>   
  <td>   <form class="form-sample" action="./Invoice" method="post"  enctype="multipart/form-data" > 
                     <input type="hidden"  name="type"  value="delete"/>          
          <input  type="hidden" name="id" value="<%=rs.getString(1)%>">
                     <input type="hidden"  name="type"  value="MANAGER"/> 
         
   <input class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" type="submit" value="Delete">
      </form>  </td>  
</tr>                
<%}  %>  
  </tbody>  </table>  </div>
    
      <%}else  if(st.equalsIgnoreCase("generate")) {
    %> 

     <h4 class="card-title">Generate  Invoice</h4> 
                 <% 
          String sql="SELECT * FROM orderdetails ";
          Statement stmt=connect.createStatement();
				 ResultSet rs =stmt.executeQuery(sql);
					String idname="";
                                        %>
                                         <div class="row">
                                             <form action="Invoice.jsp?st=generating" method="post">
                       
                           <select name="id" class="form-control" required>
                              <option value="">Select Item</option>
                 <%
				 while (rs.next()) {       
                    idname=rs.getString(1)+"  -  "+rs.getString(2);
%>      
<option value="<%=rs.getString(1)%>"><%=idname%></option> 
                       <%}%>     </select>
                               <input class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" type="submit" value="Select">
        </form>  </div> 
    
<%}else  if(st.equalsIgnoreCase("update")) {
    %> 

     <h4 class="card-title">update  Invoice</h4> 
                 <% 
          String sql="SELECT * FROM invoice ";
          String oosql="SELECT * FROM orderdetails ";
          Statement stmt=connect.createStatement();
				 ResultSet rs =stmt.executeQuery(sql);
					String idname="";
                                        %> 
                    <div class="table-responsive">
                    <table class="table table-striped">
                      <thead> <tr>    <th>  ID  </th>   <th>  Orderid </th>  <th>  Date </th>    <th>  Action </th>  </tr>  </thead>
 <tbody>  <% while (rs.next()) {     idname=rs.getString(1)+"  -  "+rs.getString(2);   %>   
<tr> 
    <form class="form-sample" action="./Invoice" method="post"  enctype="multipart/form-data" >   
 
 <td class="py-1">  <input type="hidden"  name="type"  value="update"/>    
     <input  type="hidden" name="id" value="<%=rs.getString(1)%>"> <%=rs.getString(1)%> </td>  
  <td>  
      <input type="text"  name="oid"  value="<%=rs.getString(2)%>" required=""/> 
  </td>
  <td>  <input  type="date" name="date" value="<%=rs.getString(3)%>" required="">  
          </td> 
  <td>  
                     <input type="hidden"  name="typse"  value="MANAGER"/>  <input class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" type="submit" value="Update">  </td> 

    </form></tr>  
 
<%}%>
 
 </tbody>         
                    </table>
                    </div>
                             
    
<%}else  if(st.equalsIgnoreCase("updated")) {
      
String id=request.getParameter("id"); 
          Statement stmt=connect.createStatement();
         String updatesql="SELECT * FROM item where id='"+id+"'";   
	ResultSet rs1 =stmt.executeQuery(updatesql);
          if (rs1.next()) { 
    %> 
   <br>
   <h4 class="card-title">Update Item :: <%=id%> --<%=rs1.getString(2)%> </h4> 
         <form class="form-sample" action="./Items" method="post"  enctype="multipart/form-data" > 
                    <div class="row">
                      <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">Items Name</label>
                          <div class="col-sm-9">
                              <input type="hidden"  name="type"  value="update"/>
                               <input type="hidden"  name="id"  value="<%=rs1.getString(1)%>"/>
                              <input type="text" class="form-control" name="name" value="<%=rs1.getString(2)%>" required />
      
                          </div>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">Category</label>
                          <div class="col-sm-9">
                              <select name="cat" class="form-control" required>
                              <option value="<%=rs1.getString(3)%>"><%=rs1.getString(3)%></option>
                            <%
  String sql="SELECT * FROM category";
          Statement stm=connect.createStatement();
				 ResultSet rss =stm.executeQuery(sql);
					String utype="";
				 while (rss.next()) {                           
%>  
                    <option value="<%=rss.getString(2)%>"><%=rss.getString(2)%></option> 
                   <%}%>
                            </select>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">Description</label>
                          <div class="col-sm-9">
                               <textarea name="descr" class="form-control"   required=""><%=rs1.getString(4)%></textarea>
                          </div>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">Company Name</label>
                          <div class="col-sm-9">
                              <input type="text" name="cname"  value="<%=rs1.getString(5)%>" class="form-control" required>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">Price</label>
                          <div class="col-sm-9">
                            
                              <input type="text" name="price" value="<%=rs1.getString(6)%>"  class="form-control" required>
                          </div>
                        </div>
                      </div> 
                         <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">Discount</label>
                          <div class="col-sm-9">
                              <input type="text" name="dis" value="<%=rs1.getString(7)%>"  class="form-control" required />
                          </div>
                        </div>
                      </div>
                    </div> 
                    <div class="row">
                      <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">Expiry Date </label>
                          <div class="col-sm-9"> 
                                <input type="date" name="date" class="form-control" value="<%=rs1.getString(8)%>" /> 
                         
                          </div>
                        </div>
                      </div>
                            <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">Count </label>
                          <div class="col-sm-9"> 
                              <input type="text" name="icount" class="form-control" value="<%=rs1.getString(12)%>" required>
                         
                          </div>
                        </div>
                      </div>    
                      
                    </div>  
                     <div class="col-md-6">
                        <div class="form-group row">
                          <div class="col-sm-9"> 
                       <input class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" type="submit" value="Update Items">
                </div>
                        </div>
                      </div>
                        
                  </form>
                           
                             
<%}
          
          }

}
}catch(Exception e) {e.printStackTrace();} %>         
                </div>
              </div>
            </div>
            
             
          </div>
        </div>  
        <!-- content-wrapper ends -->
        <!-- partial:partials/_footer.html -->
        <footer class="footer">
          <div class="d-sm-flex justify-content-center justify-content-sm-between">
            <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Copyright © 2022.  Premium <a href="https://www.rimscollege/" target="_blank">PAS-Product College</a>. All rights reserved.</span>
            
          </div>
          <div class="d-sm-flex justify-content-center justify-content-sm-between">
            <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Distributed by <a href="https://www.DGRIMS.com/" target="_blank"> DG PAS-Product</a></span> 
          </div>
        </footer>  
      </div> 
    </div>    
  </div> 
 
    
  <script src="vendors/js/vendor.bundle.base.js"></script> 
  <script src="vendors/typeahead.js/typeahead.bundle.min.js"></script>
  <script src="vendors/select2/select2.min.js"></script> 
  <script src="js/off-canvas.js"></script>
  <script src="js/hoverable-collapse.js"></script>
  <script src="js/template.js"></script>
  <script src="js/settings.js"></script>
  <script src="js/todolist.js"></script> 
  <script src="js/file-upload.js"></script>
  <script src="js/typeahead.js"></script>
  <script src="js/select2.js"></script>  
  <script src="vendors/js/vendor.bundle.base.js"></script>  
  <script src="js/off-canvas.js"></script> 
  <script src="js/dashboard.js"></script>   

</body>

</html>



