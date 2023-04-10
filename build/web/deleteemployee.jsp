
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
  <title>PAS-Product Employee </title> 
  <link rel="stylesheet" href="vendors/ti-icons/css/themify-icons.css">
  <link rel="stylesheet" href="vendors/css/vendor.bundle.base.css"> 
  <link rel="stylesheet" href="vendors/ti-icons/css/themify-icons.css">
  <link rel="stylesheet" type="text/css" href="js/select.dataTables.min.css"> 
  <link rel="stylesheet" href="css/vertical-layout-light/style.css"> 
  <link rel="shortcut icon" href="images/favicon.png" /> 
  <link rel="stylesheet" href="vendors/feather/feather.css">  
  <link rel="stylesheet" href="vendors/select2/select2.min.css">
  <link rel="stylesheet" href="vendors/select2-bootstrap-theme/select2-bootstrap.min.css">   
   
  
  
  
  
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
   if(ss.equalsIgnoreCase("Deleted")) {%>    
   <script>  window.alert("Employee Deleted Successfully");</script>
 <% } else  if(ss.equalsIgnoreCase("NotDeleted")) {%>    
   <script>  window.alert("Employee Deleting Failed");</script>    <% }}  %>
      
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
           
             
           <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">Delete Employees</h4> 
                  <div class="table-responsive">
                    <table class="table table-striped">
                      <thead>
  <tr>  <th>  EID  </th>  <th>  Photo </th>  <th>  Name </th>
        <th>  DOJ  </th><th>  Salary </th><th>  Shift </th> <th>  Role </th> <th>  Action </th>
                        </tr>
                      </thead>
                      <tbody>
                 <%
          try{
          connect db=new connect();
          Connection connect=db.getConnection(); 
          String sql="SELECT * FROM Employee";
          Statement stmt=connect.createStatement();
				 ResultSet rs =stmt.executeQuery(sql);
					String utype="";
				 while (rs.next()) {       String pa=rs.getString(12);
%>                           
<tr>
  <td class="py-1"> <%=rs.getString(1)%> </td>
  <td> <img src="<%=pa%>" alt="image"> </td> 
  <td> <%=rs.getString(2)%></td> 
  <td> <%=rs.getString(5)%>   </td>
  <td> <%=rs.getString(10)%>   </td>
  <td> <%=rs.getString(9)%>   </td>
  <td> <%=rs.getString(6)%>  </td>
  <td>
      <form action="./deleteemployee" method="post">
          <input  type="hidden" name="id" value="<%=rs.getString(1)%>">
         
   <input class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" type="submit" value="Delete">
      </form>    
  
  </td>
</tr>                
<%}
}catch(Exception e)
          {e.printStackTrace();}       

%>  
  </tbody>
                    </table>
                  </div>
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



