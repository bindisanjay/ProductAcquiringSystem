
<%@page import="database.connect"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<html lang="en">
<%
try{
String email=session.getAttribute("email").toString();
if(email !=null){ 
    System.out.println("email ::"+email);
String sid=session.getAttribute("sid").toString();
  connect db=new connect();
          Connection connect=db.getConnection(); 
%>
<head> 
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>PAS-Product  Reports</title> 
  <link rel="stylesheet" href="vendors/feather/feather.css">
  <link rel="stylesheet" href="vendors/ti-icons/css/themify-icons.css">
  <link rel="stylesheet" href="vendors/css/vendor.bundle.base.css"> 
  <link rel="stylesheet" href="vendors/datatables.net-bs4/dataTables.bootstrap4.css">
  <link rel="stylesheet" href="vendors/ti-icons/css/themify-icons.css">
  <link rel="stylesheet" type="text/css" href="js/select.dataTables.min.css"> 
  <link rel="stylesheet" href="css/vertical-layout-light/style.css"> 
  <link rel="shortcut icon" href="images/favicon.png" />
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
       <%
String ss=request.getParameter("v");
if(ss!=null){
   if(ss.equalsIgnoreCase("BAccepted")) {%>    
   <script>  window.alert("Accepted Successfully");</script>
 <% } else  if(ss.equalsIgnoreCase("BRejected")) {%>    
   <script>  window.alert("Requested Rejected Successfully");</script>    <% }
else  if(ss.equalsIgnoreCase("BRejected")) {%>    
   <script>  window.alert(" Order BRejected Successfully");</script>    <% }
   else  if(ss.equalsIgnoreCase("NotBRejected")) {%>    
   <script>  window.alert(" Order BRejected Failed");</script>    <% }
else  if(ss.equalsIgnoreCase("Requested")) {%>    
   <script>  window.alert(" Product Requested Successfully");</script>    <% }
   else  if(ss.equalsIgnoreCase("NotRequested")) {%>    
   <script>  window.alert(" Product Requested Failed");</script>    <% }
else  if(ss.equalsIgnoreCase("Inshipping")) {%>    
   <script>  window.alert(" Product shipping Successfully");</script>    <% }
   else  if(ss.equalsIgnoreCase("NotInshipping")) {%>    
   <script>  window.alert(" Product  notshipping Failed");</script>    <% }



}  %>
       
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
                <li class="nav-item"> <a class="nav-link" href="EReports.jsp?st=Dproduct">Product Delivery</a></li>   
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
          
          
          
          
           
          <div class="row">
            <div class="col-md-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body"> 
                   <% 
String st=request.getParameter("st");
System.out.println("mmm::"+st);  
if(st!=null){  
System.out.println("mmm::"+st); 
   if(st.equalsIgnoreCase("Request")) { 
%>
           <h4 class="card-title">Get Requested Products</h4> 
                    <div id="GFG" class="table-responsive">
                    <table class="table table-striped">
                      <thead>
  <tr>  <th>  IID  </th>   <th>  Name </th>  <th>  Price </th> 
  <th>  Desc  </th>  <th>  Count </th>
  <th>  Buyer  </th>   <th>  Action </th>   </tr>
                      </thead>
                      <tbody>
                 <%
         
          String sql="SELECT * FROM itemrequest where seller='"+email+"'";
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
   <form class="form-sample" action="EReports.jsp?st=Bprequest" method="post" > 
     <input type="hidden"  name="type"  value="Bprequest"/>          
          <input  type="hidden" name="idi" value="<%=rs.getString(1)%>">  
          <input class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" type="submit" value="View Request">
            </form>
  
  </td>    
</tr>                
<%}%>  

  </tbody>  </table> 
 
                    </div> 


      <%} else  if(st.equalsIgnoreCase("Dproduct")) { %>
      
       <h4 class="card-title">Get Products  Delivery  Statues</h4> 
                    <div id="GFG" class="table-responsive">
                    <table class="table table-striped">
                      <thead>
  <tr>  <th>  Pid  </th>   <th>  Sid </th>  <th>  Rid </th> 
  <th>  Seller </th>  <th>  Count </th><th>  Buyer Count </th> <th>  Address </th>  <th>  Status </th> <th>  Action </th>   </tr>
                      </thead>
                      <tbody>
        <%
         
          //String sql="SELECT s.sid,s.reqid,s.name,s.seller,s.price,i.icount  FROM sellerres s, itemrequest i where s.reqid=i.id and s.reqid='RP006' and i.Status='waiting'";
   String sql="SELECT s.pid,s.sid,s.rid,s.sellername,s.totalprice,i.icount,s.saddress,s.status  FROM shipping s, itemrequest i where s.rid=i.id and s.buyername='"+email+"'";
                 
     //   String sql="SELECT *  FROM shipping where buyername='"+email+"'  ";
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
  <td> <%=rs.getString(8)%></td>  
  <%
  String stmmp=rs.getString(8);   
  if(stmmp.equals("Delivery")){
          %> 
          
 <td>
      
          <form class="form-sample" action="EReports.jsp?st=DPaymentas" method="post" > 
     <input type="hidden"  name="type"  value="BYPayments"/>   
     <input type="hidden"  name="1"  value="<%=rs.getString(1)%>"/>    
     <input type="hidden"  name="2"  value="<%=rs.getString(2)%>"/>    
     <input type="hidden"  name="3"  value="<%=rs.getString(3)%>"/>    
     <input type="hidden"  name="4"  value="<%=rs.getString(4)%>"/>   
     <input type="hidden"  name="5"  value="<%=email%>"/>                   
          <input class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" type="submit" value="Payment">
            </form>
 
  
   <form class="form-sample" action="EReports.jsp?st=DPReject" method="post"  enctype="multipart/form-data" > 
     <input type="hidden"  name="type"  value="BBReject"/>             
          <input class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" type="submit" value="Reject">
            </form>
  </td>    
               
<%}else{%> 

<td> ---NO-ACTION---</td>  
<%}%>
</tr> <%  }%>  

  </tbody>  </table> 
 
                    </div> 
          
      
      
      
         <% } else  if(st.equalsIgnoreCase("DPaymentas")) {
            
    String d1=request.getParameter("1"); 
String d2=request.getParameter("2");  
String d3=request.getParameter("3"); 
String d4=request.getParameter("4");  
String d5=request.getParameter("5");    
    %> 
            
       
<h4 class="card-title">Product Accepted To Payment</h4>
                          <form class="form-sample" action="./Orders" method="post"  enctype="multipart/form-data" > 
                    <div class="row">
                      <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">Card Number</label>
                          <div class="col-sm-9">
                              
                              <input type="hidden"  name="type"  value="processs"/> 
                              <input  type="hidden" name="1" value="<%=d1%>"> 
             <input  type="hidden" name="2" value="<%=d2%>"> 
             <input  type="hidden" name="3" value="<%=d3%>"> 
             <input  type="hidden" name="4" value="<%=d4%>"> 
             <input  type="hidden" name="5" value="<%=d5%>">   
                              
                              
                              
                              <input type="text" class="form-control" name="number" required />
                          </div>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">Exp date</label>
                          <div class="col-sm-9">
                              <input type="text" class="form-control" name="exp" required />
                          </div>
                        </div>
                      </div>
                    </div>
                    
                     
                    <div class="row">
                      <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">CVV</label>
                          <div class="col-sm-9"> 
                             <input type="text" class="form-control" name="cvv" required />
                          </div>
                        </div>
                      </div>
                        
                        <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">Total Price </label>
                          <div class="col-sm-9">
          <input type="text" name="price" class="form-control"  value="" >
                 
                   
                              
                              
                          </div>
                        </div>
                      </div>
                        
                    </div> 
           
                       
          
          
                   <div class="row">
                      <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">Payment Details </label>
                          <div class="col-sm-9">
                
                              <input type="text" name="det" class="form-control"   required="">
                              
                          </div>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="form-group row"> 
                          <div class="col-sm-9">  
                    <input class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" type="submit" value="Submit">
               
                </div> 
                        </div>
                      </div> 
                    </div>
                     
                      
                       
                  </form>
       
       
       
       
       
       
       
       <%  } else  if(st.equalsIgnoreCase("DPReject")) {
             %>  <%   } else  if(st.equalsIgnoreCase("Bprequest")) {
    String idid=request.getParameter("idi");      
    %>
                    
           <h4 class="card-title">Get Requested Products</h4> 
                    <div id="GFG" class="table-responsive">
                    <table class="table table-striped">
                      <thead>
  <tr>  <th>  SRid  </th>   <th>  RPid </th>  <th>  Seller </th> 
  <th>  Requested count  </th> <th>  Response count  </th>  <th>  Action </th>   </tr>
                      </thead>
                      <tbody>
                 <%
         
          //String sql="SELECT s.sid,s.reqid,s.name,s.seller,s.price,i.icount  FROM sellerres s, itemrequest i where s.reqid=i.id and s.reqid='RP006' and i.Status='waiting'";
          String sql="SELECT s.sid,s.reqid,s.name,s.seller,s.price,i.icount  FROM sellerres s, itemrequest i where s.reqid=i.id and s.reqid='"+idid+"' and s.Statuss='waiting'";
          Statement stmt=connect.createStatement();
				 ResultSet rs =stmt.executeQuery(sql);
					 
                while (rs.next()) {     
%>                           
<tr>
  <td class="py-1"> <%=rs.getString(1)%> </td>   
  <td> <%=rs.getString(2)%></td>  
  <td> <%=rs.getString(3)%></td>  
  <td> <%=rs.getString(6)%></td>  
  <td>  
  
      
      <form class="form-sample" action="./Orders" method="post"  enctype="multipart/form-data" > 
     <input type="hidden"  name="type"  value="BBAccept"/>          
          <input  type="hidden" name="sidi" value="<%=rs.getString(1)%>">  
          <input  type="hidden" name="idid" value="<%=idid%>">  
          <input  type="hidden" name="Selemail" value="<%=rs.getString(3)%>">  
          <input  type="hidden" name="BYemail" value="<%=rs.getString(4)%>">  
          <input  type="text" name="rescount" placeholder="Response count" value="<%=rs.getString(5)%>" >     
          <input class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" type="submit" value="Accept">
            </form>
  </td>    
  <td> 
  
   <form class="form-sample" action="./Orders" method="post"  enctype="multipart/form-data" > 
     <input type="hidden"  name="type"  value="BBReject"/>          
          <input  type="hidden" name="sidi" value="<%=rs.getString(1)%>">  
          <input  type="hidden" name="idid" value="<%=idid%>">  
          <input  type="hidden" name="Selemail" value="<%=rs.getString(3)%>">  
          <input  type="hidden" name="BYemail" value="<%=rs.getString(4)%>">   
          <input class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" type="submit" value="Reject">
            </form>
  </td>    
</tr>                
<%}%>  

  </tbody>  </table> 
 
                    </div> 
          
          
          
<% }  else  if(st.equalsIgnoreCase("Confirm")) {
          
    %>
               <h4 class="card-title">Product Accepted To Payment</h4>
                    <div id="GFG" class="table-responsive">
                    <table class="table table-striped">
                      <thead>
  <tr>  <th>  IID  </th>     <th>  Seller Name </th> 
  <th>  Product Name  </th>   <th>   Price </th> <th>  count  </th>    <th>  Total Price </th> 
  
  <th>  Action </th> </tr>
                      </thead>
                      <tbody>
                 <%
         
          String sql="SELECT i.id, s.name, i.iname, i.price, i.icount , s.price,s.sid FROM itemrequest as i, sellerres as s where s.reqid=i.id  and s.seller='"+email+"' and S.Statuss='Accepted'"; 
          Statement stmt=connect.createStatement();
				 ResultSet rs =stmt.executeQuery(sql);
					int utype=0;
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
      <form class="form-sample" action="EReports.jsp?st=purchase" method="post"   > 
     <input type="hidden"  name="type"  value="purchase"/>          
          <input  type="hidden" name="1" value="<%=rs.getString(7)%>">  
          <input  type="hidden" name="2" value="<%=rs.getString(1)%>">   
          <input  type="hidden" name="3" value="<%=rs.getString(2)%>">   
          <input  type="hidden" name="4" value="<%=rs.getString(6)%>">  
          <input  type="hidden" name="5" value="<%=email%>">   
          <input class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" type="submit" value="Purchase">
            </form>
  </td>   
</tr>                
<%}%>  

  </tbody>  </table> 
 
                    </div>   
                    
                     
                    <% } else  if(st.equalsIgnoreCase("purchase")) {
                    
String d1=request.getParameter("1"); 
String d2=request.getParameter("2");  
String d3=request.getParameter("3"); 
String d4=request.getParameter("4");  
String d5=request.getParameter("5");     
                                   %>
              
                          <h4 class="card-title">Product Accepted To Shipping Details</h4>
                          <form class="form-sample" action="./Orders" method="post"  enctype="multipart/form-data" > 
                    <div class="row">
                      <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">Shipping Details</label>
                          <div class="col-sm-9">
                              
                              <input type="hidden"  name="type"  value="Shipping"/> 
                                <input  type="hidden" name="1" value="<%=d1%>"> 
             <input  type="hidden" name="2" value="<%=d2%>"> 
             <input  type="hidden" name="3" value="<%=d3%>"> 
             <input  type="hidden" name="4" value="<%=d4%>"> 
             <input  type="hidden" name="5" value="<%=d5%>"> 
                              
                              
                              
                             <textarea name="shipp"  class="form-control" placeholder="Shipping Address Details"></textarea>
                          </div>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label"> </label>
                          <div class="col-sm-9"> <input  type="hidden" name="role" value="<%=email%>"> 
                    <input class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" type="submit" value="Submit">
               
                          </div>
                        </div>
                      </div>
                    </div>
                    
                     
                     
          
         
                       
          
          
                   
                     
                      
                       
                  </form>
                 
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
}catch(Exception e){ 
System.out.println("error"+e);
       response.sendRedirect("employeelogin.jsp");
}
%>