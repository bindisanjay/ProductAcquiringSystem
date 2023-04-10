
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
  <title>PAS-Product EMPLOYEE Invoice</title> 
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
                <img src="<%=photo%>" alt="profile"/>
            </a>
            <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="profileDropdown">
               
              <a class="dropdown-item" href="Elogout.jsp" >
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
            <a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
              <i class="icon-layout menu-icon"></i>
              <span class="menu-title">Category</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="ui-basic">
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
            <a class="nav-link" data-toggle="collapse" href="#charts" aria-expanded="false" aria-controls="charts">
              <i class="icon-bag menu-icon"></i>
              <span class="menu-title">Account</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="charts">
              <ul class="nav flex-column sub-menu"> 
                <li class="nav-item"> <a class="nav-link" href="EmployeeAccount.jsp?st=update">  Update Account</a></li> 
                <li class="nav-item"> <a class="nav-link" href="EmployeeAccount.jsp?st=delete">Delete  Account</a></li> 
                <li class="nav-item"> <a class="nav-link" href="EmployeeAccount.jsp?st=deactivate"> Deactivate Account</a></li> 
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
                 <li class="nav-item"> <a class="nav-link" href="EOrders.jsp?st=add">Add Orders</a></li>
                <li class="nav-item"> <a class="nav-link" href="EOrders.jsp?st=update">Update Orders</a></li>
                <li class="nav-item"> <a class="nav-link" href="EOrders.jsp?st=delete">Delete Orders</a></li>
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
                <li class="nav-item"> <a class="nav-link" href="EReports.jsp?st=expiry">Generate Expiry Reports</a></li> 
            <li class="nav-item"> <a class="nav-link" href="EReports.jsp?st=stock">Generate Stock Report</a></li> 
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#icon" aria-expanded="false" aria-controls="icon">
              <i class="icon-file-add menu-icon"></i>
              <span class="menu-title">Invoice</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="icon">
              <ul class="nav flex-column sub-menu">    
                <li class="nav-item"> <a class="nav-link" href="EInvoice.jsp?st=generate">Generate Invoice</a></li> 
                <li class="nav-item"> <a class="nav-link" href="EInvoice.jsp?st=update">Update Invoice</a></li> 
                <li class="nav-item"> <a class="nav-link" href="EInvoice.jsp?st=delete">Delete Invoice</a></li> 
                <li class="nav-item"> <a class="nav-link" href="EDiscount.jsp?st=add">Add Discount</a></li> 
                <li class="nav-item"> <a class="nav-link" href="EDiscount.jsp?st=delete">Delete Discount</a></li>
                <li class="nav-item"> <a class="nav-link" href="EapplyCoupon.jsp">Apply Coupon</a></li> 
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#auth" aria-expanded="false" aria-controls="auth">
              <i class="icon-eye menu-icon"></i>
              <span class="menu-title">FeedBack</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="auth">
              <ul class="nav flex-column sub-menu"> 
                
                <li class="nav-item"> <a class="nav-link" href="EsendFeedback.jsp">Send Feedback</a></li> 
            <li class="nav-item"> <a class="nav-link" href="EsendEmessage.jsp">Send Email-message</a></li>  
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#error" aria-expanded="false" aria-controls="error">
              <i class="icon-ban menu-icon"></i>
              <span class="menu-title">Requests</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="error">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="Erequest.jsp?st=Leave"> Request leave </a></li>
                <li class="nav-item"> <a class="nav-link" href="Erequest.jsp?st=Mainte"> Request Maintenance </a></li>
                <li class="nav-item"> <a class="nav-link" href="Erequest.jsp?st=Approval"> Get Shift Approval </a></li> 
                <li class="nav-item"> <a class="nav-link" href="Erequest.jsp?st=Tasks"> View Tasks </a></li>
              </ul>
            </div>
          </li>
           
        </ul>
      </nav>
      <!-- partial -->
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
                     <input type="hidden"  name="types"  value="EMPLOYEE"/>  
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
                     <input type="hidden"  name="typse"  value="EMPLOYEE"/>
      <input class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" type="submit" value="Update">  </td> 

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

}  %>  
                
                
                
                
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