
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
         String sqql="insert into messages values(?,?,?,?,?) ";
          PreparedStatement ps=connect.prepareStatement(sqql);
				    ps.setString(1, Eid);
				    ps.setString(2, seller);
				    ps.setString(3, buyer);
				    ps.setString(4, descr);
				    ps.setDate(5, cdate); 
				    int i=ps.executeUpdate();
				    if(i!=0) 
				    {
						response.sendRedirect("sendFeedback.jsp?v=sent");
				    }else {
						response.sendRedirect("sendFeedback.jsp?v=notsent");
				    }
               
          
          
          
          %> 






<%
}else { response.sendRedirect("managerlogin.jsp"); }
}catch(Exception e){  response.sendRedirect("managerlogin.jsp");
}
%>


