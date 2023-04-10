
<%@page import="database.connect"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<html lang="en">
<%
try{
String email=session.getAttribute("email").toString();
if(email !=null){ 
  connect db=new connect();
          Connection connect=db.getConnection(); 
%>
<head> 
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>PAS-Product  Send Messages</title> 
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
            <a class="nav-link" data-toggle="collapse" href="#form-elements" aria-expanded="false" aria-controls="form-elements">
              <i class="icon-columns menu-icon"></i>
              <span class="menu-title">Items</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="form-elements">
              <ul class="nav flex-column sub-menu">  
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
              <span class="menu-title">Requests & Confirm</span>
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
          
             <%
String ss=request.getParameter("v"); 
if(ss!=null){
   if(ss.equalsIgnoreCase("sent")) {%>    
   <script>  window.alert("Sent Successfully");</script>
 <% } else  if(ss.equalsIgnoreCase("Notsent")) {%>    
   <script>  window.alert("Sent  Failed");</script>    <% }}  %>
     
            
          
          
           
          <div class="row">
            <div class="col-md-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                   
                  <%
String st=request.getParameter("st");                 
if(ss!=null){
    if(ss.equalsIgnoreCase("Upmessages")) {
        
    String iid=request.getParameter("id");
    System.out.println("saa"+iid);
    System.out.println("Buyer"+email);
        %>
                  
                    
                     
                    <h4 class="card-title"> <%=iid%>  Messages</h4>
                 <% 
                  String csql="SELECT count(*) FROM messages where selller='"+iid+"' and Buyer='"+email+"' ";
          Statement cstmt=connect.createStatement();
           ResultSet crs =cstmt.executeQuery(csql);
           crs.next();
                System.out.println("saa");
            int cid=crs.getInt(1);
            if(cid == 0) {
                 System.out.println("saa" +cid);
            }else{
                           
                 
          String sql="SELECT * FROM messages where selller='"+iid+"' and Buyer='"+email+"' ";
          Statement stmt=connect.createStatement();
				 ResultSet rs =stmt.executeQuery(sql);
					String idname="";
                                        %>
                                         <div class="row">
                                             <div>  
                                                 
                 <%
				 while (rs.next()) {       
                    idname= rs.getString(2)+" - "+rs.getString(3)+" - "+rs.getString(4)+" - "+rs.getString(4); 
%>      
 <%=idname%> <br>
                       <%} 
                                                                  }             
                                        
                                        %>   
                                             </div>
                           <form action="EsendFeedback.jsp?st=updatemessage" method="post">  
                                <textarea name="descr" class="form-control"   required=""> </textarea>
                                <input type="hidden" value="<%=iid%>" name="seller">
                                <input type="hidden" value="<%=email%>" name="buyer">
                               <input class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" type="submit" value="Select">
        </form>  </div> 
                    
                    
                    <%
    } else  if(ss.equalsIgnoreCase("upmes")) {
         String descr=request.getParameter("descr");
         String seller=request.getParameter("seller");
         String buyer=request.getParameter("buyer"); 
         
         String sql="select count(*) from  messages ";
         Statement stmt=connect.createStatement();
				 ResultSet rs =stmt.executeQuery(sql);
					String utype="";
				  rs.next();
				     int cid=rs.getInt(1)+1; 
                                     String Eid="MP00"+cid;
         
         
           long millis=System.currentTimeMillis();  
                     java.sql.Date cdate=new java.sql.Date(millis);  
                                System.out.println(cdate);  
         String sqql="insert into table messages values(?,?,?,?,?) ";
          PreparedStatement ps=connect.prepareStatement(sqql);
				    ps.setString(1, Eid);
				    ps.setString(2, seller);
				    ps.setString(3, buyer);
				    ps.setString(4, descr);
				    ps.setDate(5, cdate); 
				    int i=ps.executeUpdate();
				    if(i!=0) 
				    {
						response.sendRedirect("EsendFeedback.jsp?v=sent");
				    }else {
						response.sendRedirect("EsendFeedback.jsp?v=notsent");
				    }
        
    }
    

}else{

%>  
                    
                    
                    
                    
                    
                    
                    
                    
                    
                     
                    <h4 class="card-title">Select Seller to Message</h4>
                 <% 
          String sql="SELECT * FROM manager where Role='Seller' ";
          Statement stmt=connect.createStatement();
				 ResultSet rs =stmt.executeQuery(sql);
					String idname="";
                                        %>
                                         <div class="row">
                                             <form action="EsendEmessage.jsp?st=Upmessages" method="post">
                       
                           <select name="id" class="form-control" required>
                              <option value="">Select Seller ID</option>
                 <%
				 while (rs.next()) {       
                    idname=rs.getString(1)+"  -  "+rs.getString(2);
%>      
<option value="<%=rs.getString(3)%>"><%=idname%></option> 
                       <%}%>     </select>
                               <input class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" type="submit" value="Select">
        </form>  </div> 
    
                <%
}%>    
                    
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