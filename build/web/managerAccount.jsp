

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
  <title>PAS-Product  Account </title> 
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
            <a class="nav-link dropdown-toggle" href="mlogout.jsp" data-toggle="dropdown" id="profileDropdown">
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
   <script>  window.alert("Account Added Successfully");</script>
 <% } else  if(ss.equalsIgnoreCase("NotInserted")) {%>    
   <script>  window.alert("Account Adding Failed");</script>    <% }
else  if(ss.equalsIgnoreCase("Deleted")) {%>    
   <script>  window.alert(" Account Delete Successfully");</script>    <% }
   else  if(ss.equalsIgnoreCase("NotDeleted")) {%>    
   <script>  window.alert(" Account Deleting Failed");</script>    <% }
else  if(ss.equalsIgnoreCase("Updated")) {%>    
   <script>  window.alert(" Account Updated Successfully");</script>    <% }
   else  if(ss.equalsIgnoreCase("NotUpdated")) {%>    
   <script>  window.alert(" Account Updating Failed");</script>    <% }



}  %>
      
      <nav class="sidebar sidebar-offcanvas" id="sidebar">
        <ul class="nav">
          <li class="nav-item">
            <a class="nav-link" href="managerhome.jsp">
              <i class="icon-grid menu-icon"></i>
              <span class="menu-title">PAS-Product</span>
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
                <li class="nav-item"> <a class="nav-link" href="Orders.jsp?st=view">View Orders</a></li>
               </ul>
            </div>
          </li>
           <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#ui-bas" aria-expanded="false" aria-controls="ui-bas">
              <i class="icon-layout menu-icon"></i>
              <span class="menu-title">Requests & Confirm</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="ui-bas">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="Reports.jsp?st=requests">Product Request</a></li> 
            <li class="nav-item"> <a class="nav-link" href="Reports.jsp?st=confirm">Product Confirm</a></li> 
               </ul>
            </div>
          </li>
          
          
          
           <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#ui-b" aria-expanded="false" aria-controls="ui-b">
              <i class="icon-layout menu-icon"></i>
              <span class="menu-title">Messages</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="ui-b">
              <ul class="nav flex-column sub-menu">
                  
                <li class="nav-item"> <a class="nav-link" href="sendFeedback.jsp">Send Message</a></li>  
               </ul>
            </div>
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
          String email= session.getAttribute("email").toString();
if(st!=null){ 
    
System.out.println("mmm::"+st);

   if(st.equalsIgnoreCase("deactivate")) {
       
          Statement stmt=connect.createStatement();
       String updatesql="update manager set status='deactivate' where emailid='"+email+"'";   
	 int i=stmt.executeUpdate(updatesql);
				    if(i!=0) 
				    {%>   <script>  window.alert(" Account Updated Successfully");</script>  <%
			 response.sendRedirect("mlogout.jsp?v=Updated");
				    }else {
             %>   <script>  window.alert(" Account Updated Unsuccessfully");</script>  <%
			 response.sendRedirect("mlogout.jsp?v=NotUpdated");
				    }
       
       
 }  else  if(st.equalsIgnoreCase("delete")) {
    
           Statement stmt=connect.createStatement();
       String updatesql="delete FROM manager where emailid='"+email+"'";   
	 int i=stmt.executeUpdate(updatesql);
				    if(i!=0) 
				    {
             %>   <script>  window.alert(" Account Deleted Successfully");</script>  <%
			 response.sendRedirect("mlogout.jsp?v=Deleted");
				    }else {
             %>   <script>  window.alert(" Account  Deleted Unsuccessfully");</script>  <%
			 response.sendRedirect("mlogout.jsp?v=NotDeleted");
				    }
		 
      } else  if(st.equalsIgnoreCase("update")) {
       
          Statement stmt=connect.createStatement();
         String updatesql="SELECT * FROM manager where emailid='"+email+"'";   
	ResultSet rs1 =stmt.executeQuery(updatesql);
          if (rs1.next()) { 
    %> 
   <br>
   <h4 class="card-title">Update Manager Account :: <%=rs1.getString(1)%> --<%=rs1.getString(2)%> </h4>
  
                  <form class="form-sample" action="./MAccount" method="post"   > 
                    <div class="row">
                      <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">Manager Name</label>
                          <div class="col-sm-9">
                              <input type="text" class="form-control" name="name" value="<%=rs1.getString(2)%> " required="" />
                              <input type="hidden" class="form-control" name="eid" value="<%=rs1.getString(1)%> " >
                          </div>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">Email Id</label>
                          <div class="col-sm-9">
                              <input type="email" class="form-control" name="emailid" value="<%=rs1.getString(3)%> " required=""   />
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">Gender</label>
                          <div class="col-sm-9">
                              <select name="gender" class="form-control" required>
                              <option value="<%=rs1.getString(5)%>"><%=rs1.getString(5)%></option> 
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                    <option value="Others">Others</option>
                            </select>
                          </div>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">Password</label>
                          <div class="col-sm-9">
                            <input type="password" value="<%=rs1.getString(6)%>"  name="pass" class="form-control" required />
                         </div>
                        </div>
                      </div>
                    </div>
                   
                   
                     
                     <div class="row">
                       
                         <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">Phone Number</label>
                          <div class="col-sm-9">
                              <input type="text" name="phone" value="<%=rs1.getString(4)%>"  required class="form-control" />
                          </div>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="form-group row"> 
                          <div class="col-sm-9"> 
                    <input class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" type="submit" value="Update Account">
               
                </div> 
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



