
<%@page import="database.connect"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<html lang="en">
<%
try{
String email=session.getAttribute("email").toString();
if(email !=null){
String photo=session.getAttribute("photo").toString();
String sid=session.getAttribute("sid").toString();
  connect db=new connect();
          Connection connect=db.getConnection(); 
%>
<head> 
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>PAS-Product  ORDERS</title> 
  <link rel="stylesheet" href="vendors/feather/feather.css">
  <link rel="stylesheet" href="vendors/ti-icons/css/themify-icons.css">
  <link rel="stylesheet" href="vendors/css/vendor.bundle.base.css"> 
  <link rel="stylesheet" href="vendors/datatables.net-bs4/dataTables.bootstrap4.css">
  <link rel="stylesheet" href="vendors/ti-icons/css/themify-icons.css">
  <link rel="stylesheet" type="text/css" href="js/select.dataTables.min.css"> 
  <link rel="stylesheet" href="css/vertical-layout-light/style.css"> 
  <link rel="shortcut icon" href="images/favicon.png" />
</head>
<body>
  <div class="container-scroller">
    <!-- partial:partials/_navbar.html -->
    <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
      <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
        <a class="navbar-brand brand-logo mr-5" href="employeehome.jsp"><img src="images/logo.svg" class="mr-2" alt="logo"/></a>
        <a class="navbar-brand brand-logo-mini" href="employeehome.jsp"><img src="images/logo-mini.svg" alt="logo"/></a>
      </div>
      <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
        <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
          <span class="icon-menu"></span>
        </button>
        <ul class="navbar-nav mr-lg-2">
          <li class="nav-item nav-search d-none d-lg-block">
            <div class="input-group">
              <div class="input-group-prepend hover-cursor" id="navbar-search-icon">
                <span class="input-group-text" id="search">
                  <i class="icon-search"></i>
                </span>
              </div>
                </div>
          </li>
        </ul>
        <ul class="navbar-nav navbar-nav-right">
           
          <li class="nav-item nav-profile dropdown">
            <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" id="profileDropdown">
                <img src="images/faces/face28.jpg" alt="profile"/>
            </a>
            <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="profileDropdown">
               
              <a class="dropdown-item"  href="Elogout.jsp" >
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
 
       
      <!-- partial -->
      <!-- partial:partials/_sidebar.html -->
      <nav class="sidebar sidebar-offcanvas" id="sidebar">
        <ul class="nav">
          <li class="nav-item">
            <a class="nav-link" href="employeehome.jsp">
              <i class="icon-grid menu-icon"></i>
              <span class="menu-title">PAS-Product MENU</span>
            </a>
          </li>
          
          
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#authq" aria-expanded="false" aria-controls="authq">
              <i class="icon-head menu-icon"></i>
              <span class="menu-title">Category</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="authq">
              <ul class="nav flex-column sub-menu"> 
                <li class="nav-item"> <a class="nav-link" href="ecategory.jsp?st=add"> Add Category</a></li>
                <li class="nav-item"> <a class="nav-link" href="ecategory.jsp?st=update"> Update Category</a></li>
                <li class="nav-item"> <a class="nav-link" href="ecategory.jsp?st=delete"> Delete Category</a></li>
                <li class="nav-item"> <a class="nav-link" href="ecategory.jsp?st=view"> View Category</a></li>
              </ul>
            </div>
          </li> 
          
          
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#form-elements" aria-expanded="false" aria-controls="form-elements">
              <i class="icon-columns menu-icon"></i>
              <span class="menu-title">Items</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="form-elements">
              <ul class="nav flex-column sub-menu"> 
                   <li class="nav-item"> <a class="nav-link" href="eItems.jsp?st=add"> Add Items</a></li> 
                <li class="nav-item"> <a class="nav-link" href="eItems.jsp?st=update">  Update Items</a></li> 
                <li class="nav-item"> <a class="nav-link" href="eItems.jsp?st=delete">Delete  Items</a></li> 
                <li class="nav-item"> <a class="nav-link" href="eItems.jsp?st=view"> View Items</a></li> 
              </ul>
            </div>
          </li>
           
           
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#tables" aria-expanded="false" aria-controls="tables">
              <i class="icon-file-add menu-icon"></i>
              <span class="menu-title">Orders</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="tables">
              <ul class="nav flex-column sub-menu"> 
                <li class="nav-item"> <a class="nav-link" href="EOrders.jsp?st=search">Search Products</a></li> 
                <li class="nav-item"> <a class="nav-link" href="EOrders.jsp?st=view">View Orders</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#icons" aria-expanded="false" aria-controls="icons">
              <i class="icon-upload menu-icon"></i>
              <span class="menu-title">Reports</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="icons">
              <ul class="nav flex-column sub-menu"> 
                <li class="nav-item"> <a class="nav-link" href="EReports.jsp?st=Request">Product Request</a></li> 
                <li class="nav-item"> <a class="nav-link" href="EReports.jsp?st=Confirm">Product Confirm</a></li>  
              </ul>
            </div>
          </li>
             
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#auth" aria-expanded="false" aria-controls="auth">
              <i class="icon-eye menu-icon"></i>
              <span class="menu-title">Messages</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="auth">
              <ul class="nav flex-column sub-menu"> 
                
                <li class="nav-item"> <a class="nav-link" href="EsendFeedback.jsp">Send Message</a></li>    
              </ul>
            </div>
          </li>
           
        </ul>
      </nav>
      <!-- partial -->
       <%
String ss=request.getParameter("v");
if(ss!=null){
   if(ss.equalsIgnoreCase("Inserted")) {%>    
   <script>  window.alert("Order Successfully");</script>
 <% } else  if(ss.equalsIgnoreCase("NotInserted")) {%>    
   <script>  window.alert("Order Failed");</script>    <% }
else  if(ss.equalsIgnoreCase("Deleted")) {%>    
   <script>  window.alert(" Order Delete Successfully");</script>    <% }
   else  if(ss.equalsIgnoreCase("NotDeleted")) {%>    
   <script>  window.alert(" Order Deleting Failed");</script>    <% }
else  if(ss.equalsIgnoreCase("Requested")) {%>    
   <script>  window.alert(" Product Requested Successfully");</script>    <% }
   else  if(ss.equalsIgnoreCase("NotRequested")) {%>    
   <script>  window.alert(" Product Requested Failed");</script>    <% }



}  %>
      <div class="main-panel">
        <div class="content-wrapper">
          <div class="row">
            <div class="col-md-12 grid-margin">
              <div class="row">
                <div class="col-12 col-xl-8 mb-4 mb-xl-0">
                  <h3 class="font-weight-bold">Welcome <%=email%></h3> 
                </div>
                
              </div>
            </div>
          </div>
          
          
          
          
           
          <div class="row">
            <div class="col-md-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                 <%
                 

String st=request.getParameter("st");
System.out.println("mmm::"+st);
  
if(st!=null){ 
    
System.out.println("mmm::"+st);

   if(st.equalsIgnoreCase("add")) {
       
%>
 <h4 class="card-title">Add Orders </h4>
 <h4 class="card-title"><a href="EOrders.jsp?st=cartde">View Cart details </a></h4>
               <% 
          String sql="SELECT * FROM item";
          Statement stmt=connect.createStatement();
				 ResultSet rs =stmt.executeQuery(sql);
					String idname="";
                                        %>
                                        
    <div class="table-responsive">
                    <table class="table table-striped">
                      <thead>
  <tr>  <th>  ID  </th>   <th>  Photo </th>  <th>  Name </th> 
  <th>  Category  </th>  
  <th>  Company  </th>  <th>  Price </th> 
  <th>  Discount  </th> <th>  Expiry Date  </th><th> Discount Price  </th><th> Action  </th>    </tr>
                      </thead>
                      <tbody>
                 <%
				 while (rs.next()) {       
                    idname=rs.getString(1)+"  -  "+rs.getString(2);
%>      
 <tr>
  <td class="py-1"> <%=rs.getString(1)%> </td>  
  <td> <img src="<%=rs.getString(8)%>" alt="image"> </td> 
  <td> <%=rs.getString(2)%></td>  
  <td> <%=rs.getString(3)%></td>   
  <td> <%=rs.getString(5)%></td>  
  <td> <%=rs.getString(6)%></td>   
  <td> <%=rs.getString(7)%>%</td>    
  <td> <%=rs.getString(9)%></td>    
  <td> <%   
              String price =rs.getString(6);
         String diss =rs.getString(7);
             float dis=Float.parseFloat(diss);
             float ac=dis/100;
             float disp=(Float.parseFloat(price)*ac); 
             int mp=(int)disp;
             int pp=Integer.parseInt(price);
             int pricee=pp-mp; 
             System.out.println("pric :::"+pricee); 
             
             
             
             %>
  <%=pricee%>
  </td>    
    
  <td> 
  <form class="form-sample" action="./Orders" method="post"  enctype="multipart/form-data" > 
     <input type="hidden"  name="type"  value="cart"/>          
          <input  type="hidden" name="id" value="<%=rs.getString(1)%>">
          <input  type="hidden" name="price" value="<%=pricee%>"> 
          <input  type="hidden" name="role" value="<%=email%>"> 
          <input class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" type="submit" value="Add to Cart">
            </form>
  </td>
</tr>
 
 
                       <%}%>     
                    </tbody>  </table> 
    
    </div>              
 <form class="form-sample" action="EOrders.jsp?st=process" method="post"> 
       <input class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" type="submit" value="process">
  
    </form>
                                

      <%} else  if(st.equalsIgnoreCase("view")) {
          %>
                    
             <h4 class="card-title">View Order Details</h4>
                    <div class="table-responsive">
                    <table class="table table-striped">
                      <thead>
  <tr>  <th>  Order ID  </th> <th>  pid  </th> <th>  sid  </th> <th>  rid </th> <th>   Seller </th>   
  
   <th>  Total Price </th> 
  <th>  Card number  </th>
  <th>  ExpDate </th>  <th>  CVV  </th>   
  <th>  Created Date  </th>   </tr>
                      </thead>
                      <tbody>
                 <%
         
          String sql="SELECT * FROM orderdetails where buyername='"+email+"'";
          Statement stmt=connect.createStatement();
				 ResultSet rs =stmt.executeQuery(sql);
					String utype="";
				 while (rs.next()) {        
%>                           
<tr>
  <td class="py-1"> <%=rs.getString(1)%> </td>   
  <td> <%=rs.getString(2)%></td>  
  <td> <%=rs.getString(3)%></td>  
  <td> <%=rs.getString(4)%></td>  
  <td> <%=rs.getString(5)%></td>     
  <td> <%=rs.getString(7)%></td>    
  <td> <%=rs.getString(8)%></td>    
  <td>  <%=rs.getString(9)%> </td>    
  <td> <%=rs.getString(10)%></td>    
  <td> <%=rs.getString(11)%></td>     
</tr>                
<%}%>  
  </tbody>  </table>  </div>
          
          
          
          
          
          
          
<% }else  if(st.equalsIgnoreCase("delete")) {
    %> 
     <h4 class="card-title">Delete Order Details</h4>
                    <div class="table-responsive">
                    <table class="table table-striped">
                      <thead>
  <tr>  
      
      <th>  IID  </th>   <th>  	CartOderid </th>  <th> User Name </th> 
  <th> Total price  </th>     <th>  Action </th>  </tr>
                      </thead>
                      <tbody>
                 <% 
          String sql="SELECT * FROM orderdetails";
          Statement stmt=connect.createStatement();
				 ResultSet rs =stmt.executeQuery(sql);
					String utype="";
				 while (rs.next()) {        
%>                           
<tr>
  <td class="py-1"> <%=rs.getString(1)%> </td>  
  <td>  
  
   <a href="EOrders.jsp?st=viewcartde&oid=<%=rs.getString(9)%>"><%=rs.getString(9)%> </a> 
  </td> 
  
  <td> <%=rs.getString(2)%></td>  
  <td> <%=rs.getString(7)%></td> 
  <td>   <form class="form-sample" action="./Orders" method="post"  enctype="multipart/form-data" > 
                     <input type="hidden"  name="type"  value="delete"/>          
          <input  type="hidden" name="id" value="<%=rs.getString(1)%>">
          <input  type="hidden" name="role" value="EMPLOYEE"> 
         
   <input class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" type="submit" value="Delete">
      </form>  </td>  
</tr>                
<%}  %>  
  </tbody>  </table>  </div>
    
      <%}else  if(st.equalsIgnoreCase("search")) {
          %>
       <h4 class="card-title">Search Items</h4>
        <form class="form-sample" action="EOrders.jsp?st=Searched" method="post"  > 
                    <div class="row">
                      <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">Items Name</label>
                          <div class="col-sm-9">
                              <input type="hidden" class="form-control" name="type" value="Searched">
                              <input type="text" class="form-control" name="name" required />
                          </div>
                        </div>
                      </div>
                      <div class="col-md-6">
                          <div class="col-md-6">
                        <div class="form-group row"> 
                          <div class="col-sm-9">  
                    <input class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" type="submit" value="Search">
               
                </div> 
                        </div>
                      </div> 
                          
                      </div>
                    </div>
                     
                     
                       
                       
                            
                            
                            
                            
                      
                  </form>
     
     <% }else  if(st.equalsIgnoreCase("Searched")) {
         String ser=request.getParameter("name");
         
    %>
     <div class="table-responsive">
                    <table class="table table-striped">
                      <thead>
  <tr>  <th>  IID  </th>   <th>  Photo </th>  <th>  Name </th> 
  <th>  Category  </th>  <th>  Company  </th>  <th>  Price </th> 
  <th>  Discount  </th>  <th>  Add By </th> <th>  Count </th> <th>  Request </th> </tr>
                      </thead>
                      <tbody>
                 <%
         
          String sql="SELECT * FROM item where name like '%"+ser+"%'";
          Statement stmt=connect.createStatement();
				 ResultSet rs =stmt.executeQuery(sql);
					String utype="";
				 while (rs.next()) {        
%>                           
<tr>
  <td class="py-1"> <%=rs.getString(1)%> </td>  
  <td> <img src="<%=rs.getString(8)%>" alt="image"> </td> 
  <td> <%=rs.getString(2)%></td>  
  <td> <%=rs.getString(3)%></td>   
  <td> <%=rs.getString(5)%></td>  
  <td> <%=rs.getString(6)%></td>   
  <td> <%=rs.getString(7)%></td>    
  <td> <%=rs.getString(10)%></td>  
  <td> <%=rs.getString(12)%></td>  
  <td> 
  <form class="form-sample" action="EOrders.jsp?st=requested" method="post" > 
                     <input type="hidden"  name="type"  value="request"/>          
          <input  type="hidden" name="id" value="<%=rs.getString(1)%>">         
          <input  type="hidden" name="name" value="<%=rs.getString(2)%>">      
          <input  type="hidden" name="price" value="<%=rs.getString(6)%>">
          <input  type="hidden" name="role" value="<%=email%>">  
   <input class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" type="submit" value="Request">
      </form>
  
  </td>   
</tr>                
<%}%>  
  </tbody>  </table>  </div>
       
       <%
          }else  if(st.equalsIgnoreCase("requested")) {
              String iidd=request.getParameter("id");
              String namee=request.getParameter("name");
              String price=request.getParameter("price");
              String role=request.getParameter("role"); 
       
       %>
       <h4 class="card-title">Request Items </h4>
                  <form class="form-sample" action="./Orders" method="post"  enctype="multipart/form-data" > 
                    <div class="row">
                      <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">Items Name</label>
                          <div class="col-sm-9">
                              <input type="hidden" class="form-control" name="type" value="requests">
                              <input type="text" class="form-control" name="name" value="<%=namee%>" required />
                          </div>
                        </div>
                      </div>
                       <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">Price</label>
                          <div class="col-sm-9">
                            
                              <input type="text" name="price" value="<%=price%>"  class="form-control" required>
                          </div>
                        </div>
                      </div> 
                    </div>
                    <div class="row">
                      <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">Description</label>
                          <div class="col-sm-9">
                               <textarea name="Descr" class="form-control"  required=""> </textarea>
                          </div>
                        </div>
                      </div>
                       
                    </div>
                       
                      <div class="row">
                      <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">Count </label>
                          <div class="col-sm-9"> 
                                <input type="text" name="icount" class="form-control"   required>
                         
                          </div>
                        </div>
                      </div>
                        <div class="col-md-6">
                        <div class="form-group row"> 
                          <div class="col-sm-9"> 
                              
                              <input type="hidden" class="form-control" name="role" value="<%=email%>"> 
                    <input class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" type="submit" value="Send Request To all sellers">
               
                </div> 
                        </div>
                      </div> 
                    </div> 
                            
                            
                            
                            
                      
                  </form>
                          
       
       <%
          }else  if(st.equalsIgnoreCase("update")) {
    %> 

     <h4 class="card-title">Update Item</h4>
                 <% 
          String sql="SELECT * FROM orderdetails where addby='EMPLOYEE' ";
          Statement stmt=connect.createStatement();
				 ResultSet rs =stmt.executeQuery(sql);
					String idname="";
                                        %>
                                         <div class="row">
                                             <form action="EOrders.jsp?st=updated" method="post">
                       
                           <select name="id" class="form-control" required>
                              <option value="">Select Order ID</option>
                 <%
				 while (rs.next()) {       
                    idname=rs.getString(1)+"  -  "+rs.getString(2);
%>      
<option value="<%=rs.getString(1)%>"><%=idname%></option> 
                       <%}%>     </select>
                               <input class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" type="submit" value="Select">
        </form>  </div> 
    
<%}else  if(st.equalsIgnoreCase("updated")) {
      
String id=request.getParameter("id"); 
          Statement stmt=connect.createStatement();
         String updatesql="SELECT * FROM orderdetails where id='"+id+"'";   
	ResultSet rs1 =stmt.executeQuery(updatesql);
          if (rs1.next()) { 
    %> 
   <br>
   <h4 class="card-title">Update Item :: <%=id%> --<%=rs1.getString(2)%> </h4> 
         <form class="form-sample" action="./Orders" method="post"  enctype="multipart/form-data" > 
                    <div class="row">
                      <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">User Name</label>
                          <div class="col-sm-9">
                              <input type="hidden"  name="type"  value="update"/>
                               <input type="hidden"  name="id"  value="<%=rs1.getString(1)%>"/>
                              <input type="text" class="form-control" name="name" value="<%=rs1.getString(2)%>" required />
      
                          </div>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">Email id</label>
                          <div class="col-sm-9">
                               
                              <input type="text" class="form-control" name="name" value="<%=rs1.getString(3)%>" required />
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">Address</label>
                          <div class="col-sm-9">
                               <textarea name="descr" class="form-control"   required=""><%=rs1.getString(4)%></textarea>
                          </div>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">Phone Number</label>
                          <div class="col-sm-9">
                              <input type="tel" name="cname"  value="<%=rs1.getString(5)%>" class="form-control" required>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">Payment Method</label>
                          <div class="col-sm-9">
                             <select name="method" class="form-control" required>
                              <option value="<%=rs1.getString(6)%>"><%=rs1.getString(6)%></option>
                    <option value="Cash">Cash</option>
                    <option value="Card">Card</option>
                    <option value="UPI">UPI</option>
                            </select> 
                          </div>
                        </div>
                      </div> 
                         <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">Total Price</label>
                          <div class="col-sm-9">
                              <input type="text" name="dis" value="<%=rs1.getString(7)%>"  class="form-control" readonly />
                          </div>
                        </div>
                      </div>
                    </div> 
                    <div class="row">
                      <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">Payment Details </label>
                          <div class="col-sm-9"> 
                                <input type="text" name="date" class="form-control" value="<%=rs1.getString(8)%>" />
                         
                          </div>
                        </div>
                      </div>
                                <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">Cart Orderid</label>
                          <div class="col-sm-9"> 
                              <input type="text" name="da" class="form-control" value="<%=rs1.getString(9)%>" readonly=""/>
                         
                          </div>
                        </div>
                      </div>
                      
                    </div>  
                     <div class="col-md-6">
                        <div class="form-group row">
                          <div class="col-sm-9"> 
                              
          <input  type="hidden" name="role" value="EMPLOYEE"> 
                       <input class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" type="submit" value="Update Order Details">
                </div>
                        </div>
                      </div>
                        
                  </form>
                           
                              
                              
                              
                              
<%}
          
          } else  if(st.equalsIgnoreCase("process")) {
          %>

    <h4 class="card-title">Add Order Details ::   </h4> 
    
 <h4 class="card-title"><a href="EOrders.jsp?st=cartde">View Cart details </a></h4>
                  <form class="form-sample" action="./Orders" method="post"  enctype="multipart/form-data" > 
                    <div class="row">
                      <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">User Name</label>
                          <div class="col-sm-9">
                              
                              <input type="hidden"  name="type"  value="process"/> 
                              <input type="text" class="form-control" name="name" required />
                          </div>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">Email Id</label>
                          <div class="col-sm-9">
                              <input type="email" class="form-control" name="emailid" required />
                          </div>
                        </div>
                      </div>
                    </div>
                    
                     
                    <div class="row">
                      <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">Address </label>
                          <div class="col-sm-9"> 
                            <textarea name="address" class="form-control" required=""> </textarea>
                          </div>
                        </div>
                      </div>
                       <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">Phone Number</label>
                          <div class="col-sm-9">
                              <input type="text" name="phone" required class="form-control" />
                          </div>
                        </div>
                      </div>
                    </div> 
                      <div class="row">
                      <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">Payment Method</label>
                          <div class="col-sm-9">
                              <select name="method" class="form-control" required>
                              <option value="">select</option>
                    <option value="Cash">Cash</option>
                    <option value="Card">Card</option>
                    <option value="UPI">UPI</option>
                            </select>
                          </div>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">Total Price </label>
                          <div class="col-sm-9">
                                <%
  String sql="select sum(price) from cart where addby='EMPLOYEE' and caid='nill'";
          Statement stm=connect.createStatement();
				 ResultSet rss =stm.executeQuery(sql);
					String utype="";
				 if (rss.next()) {                           
     %>      <input type="text" name="price" class="form-control"  value="<%=rss.getString(1)%>" readonly="">
                 
                   <%}%>
                              
                              
                          </div>
                        </div>
                      </div>
                    </div>
                   <div class="row">
                      <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">Payment Details</label>
                          <div class="col-sm-9">
                              <input type="text" name="det" class="form-control"   required="">
                          </div>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="form-group row"> 
                          <div class="col-sm-9"> 
          <input  type="hidden" name="role" value="EMPLOYEE"> 
                    <input class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" type="submit" value="Submit">
                
                </div> 
                        </div>
                      </div> 
                    </div>
                      
                  </form>
                
   
   <%} else  if(st.equalsIgnoreCase("cartde")) {
    %>
   
 <h4 class="card-title">View Cart Details</h4>
                    <div class="table-responsive">
                    <table class="table table-striped">
                      <thead>
  <tr>   
      <th>  CID  </th>   <th>  Photo </th>  <th>  Name </th> 
  <th>  price  </th>     <th>  Action </th>  </tr>
                      </thead>
                      <tbody>
                 <% 
          String sql="SELECT * FROM cart where addby='EMPLOYEE' and Caid='nill'";
          Statement stmt=connect.createStatement();
				 ResultSet rs =stmt.executeQuery(sql);
					String utype="";
				 while (rs.next()) {        
%>                           
<tr>
  <td class="py-1"> <%=rs.getString(1)%> </td>  
    
  
  
  <% String iid=rs.getString(2);
          String sq="SELECT * FROM item where id='"+iid+"'";
          Statement stm=connect.createStatement();
				 ResultSet rss =stm.executeQuery(sq);
				 if(rss.next()){    
%>            
  <td> <img src="<%=rss.getString(8)%>" alt="image"> </td> 
  <td> <%=rss.getString(2)%></td>  
  <td> <%=rs.getString(3)%></td> 
  <td>   <form class="form-sample" action="./Orders" method="post"  enctype="multipart/form-data" > 
                     <input type="hidden"  name="type"  value="cartdel"/>          
          <input  type="hidden" name="id" value="<%=rs.getString(1)%>">
          <input  type="hidden" name="role" value="EMPLOYEE"> 
   <input class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" type="submit" value="Delete">
      </form>  </td>  
</tr>                
<%}}  %>  
  </tbody>  </table>  </div>
     <form class="form-sample" action="EOrders.jsp?st=process" method="post"> 
       <input class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" type="submit" value="process">
  
    </form>
    
    
    
 <%
   
   }else  if(st.equalsIgnoreCase("viewcartde")) {
   String oid=request.getParameter("oid");
   %>
 
 <h4 class="card-title">View Cart Details of OrderId is ::<%=oid%>  </h4>
                    <div class="table-responsive">
                    <table class="table table-striped">
                      <thead>
  <tr>  
      
      <th>  ID  </th>   <th>  Photo </th>  <th>  Name </th> 
  <th>  price  </th><th>  count  </th>       </tr>
                      </thead>
                      <tbody>
  <% 
          String sql="  select it.id,it.photo,it.name,it.price,count(it.id) from  cart as ct , item as it  where  ct.iid= it.id and ct.Caid='"+oid+"' GROUP BY  it.id";

          Statement stmt=connect.createStatement();
				 ResultSet rs =stmt.executeQuery(sql);
					String utype="";
				 while (rs.next()) {        
%>                           
 <tr>
  <td class="py-1"> <%=rs.getString(1)%> </td>   
            
  <td> <img src="<%=rs.getString(2)%>" alt="image"> </td> 
  <td> <%=rs.getString(3)%></td>  
  <td> <%=rs.getString(4)%></td>  
  <td> <%=rs.getString(5)%></td> 
    
</tr>                

 <%}  %>  
  </tbody>  </table>  </div>
 
 <%
   
   }

}
 %>      
                
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
        
        
        
        <!-- partial -->
      </div>
      <!-- main-panel ends -->
    </div>   
    <!-- page-body-wrapper ends -->
  </div> 
  <script src="vendors/js/vendor.bundle.base.js"></script>   
  <script src="js/dataTables.select.min.js"></script>
 
  <script src="js/off-canvas.js"></script>
  <script src="js/hoverable-collapse.js"></script>
  <script src="js/template.js"></script>
  <script src="js/settings.js"></script>
  <script src="js/todolist.js"></script> 
  <script src="js/dashboard.js"></script>
  <script src="js/Chart.roundedBarCharts.js"></script> 
</body>

</html>


<%
}else { response.sendRedirect("employeelogin.jsp"); }
}catch(Exception e){  response.sendRedirect("employeelogin.jsp");
}
%>