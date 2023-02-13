
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="connect.jsp" %>
<%@page import ="java.sql.*"%>
<%@page import ="java.io.*"%>

<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>PAS-Product Forgot</title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="vendors/feather/feather.css">
  <link rel="stylesheet" href="vendors/ti-icons/css/themify-icons.css">
  <link rel="stylesheet" href="vendors/css/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- Plugin css for this page -->
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="css/vertical-layout-light/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="images/favicon.png" />
</head>

<body>
  <div class="container-scroller">
    <div class="container-fluid page-body-wrapper full-page-wrapper">
      <div class="content-wrapper d-flex align-items-center auth px-0">
        <div class="row w-100 mx-0">
          <div class="col-lg-4 mx-auto">
            <div class="auth-form-light text-left py-5 px-4 px-sm-5">
              <div class="brand-logo">
                <img src="images/logo.svg" alt="logo">
              </div>
              <h4>Forgot Password</h4>    <% 

String ss=request.getParameter("v");
if(ss!=null){
   if(ss.equalsIgnoreCase("1")) {
       try{
String email=request.getParameter("email");
String phone=request.getParameter("phone"); 
       String sql="select * from manager where emailid='"+email+"' and phone='"+phone+"' ";
       Statement stmt=connection.createStatement(); 
       ResultSet rs =stmt.executeQuery(sql); 
	if(rs.next()){ 
	 String sq=rs.getString(6); 
 session.setAttribute("pass",sq);          
         response.sendRedirect("forgot.jsp");
         }else{  %>    <script>  window.alert("invalid emalil");</script> <%response.sendRedirect("employeeforgot.jsp");
        }  %>     
  <%}catch(Exception e){ %>  <script>  window.alert("invalid emalil");</script>
<%} 
   }} else if(ss ==null){ %>
     
   
     <form action="employeeforgot.jsp?v=1" method="post" class="pt-3">
                <div class="form-group">
                  <input type="email" name="email" class="form-control form-control-lg" id="exampleInputEmail1" placeholder="email id">
                </div>
         <div class="form-group">
                  <input type="text" name="phone" class="form-control form-control-lg" id="exampleInputEmail1" placeholder="phone number">
                </div>
                <div class="mt-3">
                    <input class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" type="submit" value="Forgot Password">
               
                </div>
                <div class="text-center mt-4 font-weight-light">
                  
                  <a href="Home.jsp" class="auth-link text-black">home</a>
                </div>  
              </form>
   
   
   
   <%}%>
            </div>
          </div>
        </div>
      </div>
      <!-- content-wrapper ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
  <!-- container-scroller -->
  <!-- plugins:js -->
  <script src="vendors/js/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <!-- Plugin js for this page -->
  <!-- End plugin js for this page -->
  <!-- inject:js -->
  <script src="js/off-canvas.js"></script>
  <script src="js/hoverable-collapse.js"></script>
  <script src="js/template.js"></script>
  <script src="js/settings.js"></script>
  <script src="js/todolist.js"></script>
  <!-- endinject -->
</body>

</html>
