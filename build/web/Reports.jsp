
 
<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="database.connect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%
try{
String email=session.getAttribute("email").toString();
if(email !=null){ 
 
%>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>PAS-Product Reports </title> 
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
            a.document.write('<body > <h1>Generated Expiry Report </h1><br>');
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
          <a class="navbar-brand brand-logo mr-5" href="managerhome.jsp"  ><img src="images/logo.svg"  class="mr-2" alt="logo"/></a>
          <a class="navbar-brand brand-logo-mini" href="managerhome.jsp"><img src="images/logo-mini.svg" alt="logo"/></a>
      </div>
      <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end ">
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
   <script>  window.alert("Item Added Successfully");</script>
 <% } else  if(ss.equalsIgnoreCase("NotInserted")) {%>    
   <script>  window.alert("Item Adding Failed");</script>    <% }
else  if(ss.equalsIgnoreCase("Deleted")) {%>    
   <script>  window.alert(" Item Delete Successfully");</script>    <% }
   else  if(ss.equalsIgnoreCase("NotDeleted")) {%>    
   <script>  window.alert(" Item Deleting Failed");</script>    <% }
else  if(ss.equalsIgnoreCase("PRequested")) {%>    
   <script>  window.alert("  Requested Successfully");</script>    <% }
   else  if(ss.equalsIgnoreCase("NotPRequested")) {%>    
   <script>  window.alert(" Item Requested Failed");</script>    <% }



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
<!--            <li class="nav-item"> <a class="nav-link" href="Reports.jsp?st=Dproduct">Product Delivery</a></li> -->
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
if(st!=null){ 
    
System.out.println("mmm::"+st);

   if(st.equalsIgnoreCase("requests")) {
       
%>
 <h4 class="card-title">Requested Products</h4> 
                    <div id="GFG" class="table-responsive">
                    <table class="table table-striped">
                      <thead>
  <tr>  <th>  IID  </th>   <th>  Name </th>  <th>  Price </th> 
  <th>  Desc  </th>  <th>  Count </th>
  <th>  Buyer  </th>   <th>  Action </th>   </tr>
                      </thead>
                      <tbody>
                 <%
         
          String sql="SELECT * FROM itemrequest";
          Statement stmt=connect.createStatement();
				 ResultSet rs =stmt.executeQuery(sql);
					 
                while (rs.next()) {     
%>                           
<tr>
  <td class="py-1"> <%=rs.getString(1)%> </td>   
  <td> <%=rs.getString(2)%></td>  
  <td> <%=rs.getString(3)%></td>  
  <td> <%=rs.getString(4)%></td>  
  <td> <%=rs.getString(5)%></td>  
  <td> <%=rs.getString(6)%></td>   
  <td> 
   <form class="form-sample" action="./Orders" method="post"  enctype="multipart/form-data" > 
     <input type="hidden"  name="type"  value="prequest"/>          
          <input  type="hidden" name="id" value="<%=rs.getString(1)%>"> 
          <input  type="hidden" name="role" value="<%=email%>">  
          <input  type="text" name="counts"  placeholder="Total count" class="form-control" required="" > 
          <input  type="hidden" name="seller" value="<%=rs.getString(6)%>">  
          <input class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" type="submit" value="Request to Buyer">
            </form>
  
  </td>    
</tr>                
<%}%>  

  </tbody>  </table> 
 
                    </div> 

      <%} else  if(st.equalsIgnoreCase("confirm")) {
          %>
                    <h4 class="card-title">Get Product confirmation  </h4>
                     <div id="GFG" class="table-responsive">
                    <table class="table table-striped">
                      <thead>
  <tr>  <th>  Pid  </th>     <th>  Rid </th> 
    <th>  Buyer</th>  <th>  Count </th>  <th>  buyer Count </th> <th>  Address </th>  <th>  Status </th> <th>  Action </th>   </tr>
                      </thead>
                      <tbody>
                     <%
         
           String sql="SELECT s.pid,s.rid,s.sellername,s.totalprice,i.icount,s.saddress,s.status  FROM shipping s, itemrequest i where s.rid=i.id and s.sellername='"+email+"'";
           //String sql="SELECT *  FROM shipping s, itemrequest i where s.rid=i.id and s.sellername='"+email+"'   ";
          Statement stmt=connect.createStatement();
				 ResultSet rs =stmt.executeQuery(sql);
					 
                while (rs.next()) {     
%>                           
<tr>
  <td class="py-1"> <%=rs.getString(1)%> </td>   
  <td> <%=rs.getString(2)%></td>  
  <td> <%=rs.getString(3)%></td>     
  <td> <%=rs.getString(4)%></td>     
  <td> <%=rs.getString(5)%></td>  
  <td> <%=rs.getString(6)%></td>  
  <td> <%=rs.getString(7)%></td>  
  
  <%
  String stmmp=rs.getString(7);   
  if(stmmp.equals("Delivery")){
          %> 
         <td> <%=rs.getString(7)%></td>   
   
               
<%} else   if(stmmp.equals("Delivered")){
          %> 
         <td> <%=rs.getString(7)%></td>   
   
               
<%}else   if(stmmp.equals("Rejected")){
          %> 
         <td> <%=rs.getString(7)%></td>   
   
               
<%}else{%> 

<td>  
      
          <form class="form-sample" action="Reports.jsp?st=DUpdate" method="post" >    
              <input type="hidden"  name="id"  value="<%=rs.getString(1)%>"/>    
     <select name="sta" class="form-control form-control-lg" id="exampleFormControlSelect2" required> 
                    <option value="<%=rs.getString(7)%>"><%=rs.getString(7)%></option> 
                    <option value="Rejected">Rejected</option>
                    <option value="Conformed">Conformed</option>
                    <option value="OnTheWay">On The Way</option>
                    <option value="Delivery">Delivery</option>
                  </select>
          <input class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" type="submit" value="Update">
            </form>
 
   

</td>  

<%}%>
</tr> <%  }%>  

  </tbody>  </table> 
 
                    </div>  
                   
<% }  else  if(st.equalsIgnoreCase("DUpdate")) {
    
String date1=request.getParameter("id"); 
System.out.println("id::"+date1);
String stop=request.getParameter("sta"); 
System.out.println("sta"+stop);
String sql="update shipping set status='"+stop+"' where pid='"+date1+"' ";
Statement stlpt=connect.createStatement();
 
				    int ii=stlpt.executeUpdate(sql);
				    if(ii!=0) 
				    {%>
						 <script>  window.alert(" product Successfully");</script>
                                   product Successfully
				    <% }else {
						%>
						 <script>  window.alert(" product failed");</script>
                                   product failed
				    <%
				    }


     }  else  if(st.equalsIgnoreCase("Exprint")) {
         
String date1=request.getParameter("date1"); 
String date2=request.getParameter("date2");   
                                 Date edate1=Date.valueOf(date1); 
                                    System.out.println(edate1);
                                 Date edate2=Date.valueOf(date2); 
                                    System.out.println(edate2);

    %>
               <h4 class="card-title">View Items</h4>
                    <div id="GFG" class="table-responsive">
                    <table class="table table-striped">
                      <thead>
  <tr>  <th>  IID  </th>   <th>  Photo </th>  <th>  Name </th> 
  <th>  Category  </th>  <th>  Desc </th>
  <th>  Company  </th>  <th>  Price </th> 
  <th>  Discount  </th> <th>  Expiry Date  </th>  
  <th>  Add By </th> <th>  Modify Date </th> </tr>
                      </thead>
                      <tbody>
                 <%
         
          String sql="SELECT * FROM item where edate BETWEEN '"+edate1+"' AND '"+edate2+"'";
          Statement stmt=connect.createStatement();
				 ResultSet rs =stmt.executeQuery(sql);
					int utype=0;
                while (rs.next()) {    utype+=  Integer.parseInt(rs.getString(6));   
%>                           
<tr>
  <td class="py-1"> <%=rs.getString(1)%> </td>  
  <td> <img src="<%=rs.getString(8)%>" alt="image"> </td> 
  <td> <%=rs.getString(2)%></td>  
  <td> <%=rs.getString(3)%></td>  
  <td> <%=rs.getString(4)%></td>  
  <td> <%=rs.getString(5)%></td>  
  <td> <%=rs.getString(6)%></td>   
  <td> <%=rs.getString(7)%></td>    
  <td> <%=rs.getString(9)%></td>    
  <td> <%=rs.getString(10)%></td>  
  <td> <%=rs.getString(11)%></td>   
</tr>                
<%}%>  

  </tbody>  </table> 
<h3><center>Total Price :: <%=utype%></center></h3>
                    </div>   
                    
                    <center> <input class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" type="button" value="Print Report" onclick="printDiv()"> </center>
                    
                    <% } else  if(st.equalsIgnoreCase("Exstprint")) {
                    
String date1=request.getParameter("date1"); 
String date2=request.getParameter("date2");   
                                 Date edate1=Date.valueOf(date1); 
                                    System.out.println(edate1);
                                 Date edate2=Date.valueOf(date2); 
                                    System.out.println(edate2);  %>
                    
                          <h4 class="card-title">View Items</h4>
                    <div id="GFG" class="table-responsive">
                    <table class="table table-striped">
                      <thead>
  <tr>  <th>  IID  </th>   <th>  Photo </th>  <th>  Name </th> 
  <th>  Category  </th>  
  <th>  Company  </th>  <th>  Price </th> 
  <th>  Discount  </th> <th>  Expiry Date  </th>  
  <th>  Add By </th> <th>  Modify Date </th> </tr>
                      </thead>
                      <tbody>
                 <%
         
          String sql="SELECT * FROM item where modifydate BETWEEN '"+edate1+"' AND '"+edate2+"'";
         
          Statement stmt=connect.createStatement();
				 ResultSet rs =stmt.executeQuery(sql);
					int utype=0;
                while (rs.next()) {    utype+=  Integer.parseInt(rs.getString(6));   
%>                           
<tr>
  <td class="py-1"> <%=rs.getString(1)%> </td>  
  <td> <img src="<%=rs.getString(8)%>" alt="image"> </td> 
  <td> <%=rs.getString(2)%></td>  
  <td> <%=rs.getString(3)%></td>   
  <td> <%=rs.getString(5)%></td>  
  <td> <%=rs.getString(6)%></td>   
  <td> <%=rs.getString(7)%></td>    
  <td> <%=rs.getString(9)%></td>    
  <td> <%=rs.getString(10)%></td>  
  <td> <%=rs.getString(11)%></td>   
</tr>                
<%}%>  

                      </tbody>  </table> <br><br>
<h2 style="align:center" >
    <center> Category Wise Counts </center></h2><br>
<table class="table table-striped">
                      <thead>
  <tr>   <th>  Category  </th>  <th>  Count </th>  <th>  Stock </th></tr>
                      </thead>
                      <tbody>

<%   String countsql="SELECT category, COUNT(*),sum(icount)  FROM item GROUP BY category";
				 ResultSet crs =stmt.executeQuery(countsql); while (crs.next()) {     
%>                           
<tr>
  <td class="py-1"> <%=crs.getString(1)%> </td>   
  <td> <%=crs.getString(2)%></td>  
  <td> <%=crs.getString(3)%></td>  
</tr>                
<%}%>  

  </tbody>  </table> 

<h3><center>Total Price :: <%=utype%></center></h3>
                    </div>   
                    
                    <center> <input class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" type="button" value="Print Report" onclick="printDiv()"> </center>
             
                    
                    <% 
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


<%
}else { response.sendRedirect("Home.jsp"); }
}catch(Exception e){  response.sendRedirect("Home.jsp");
}
%>



