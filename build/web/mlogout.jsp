
 
<%

try{
String email=session.getAttribute("email").toString();  
 
session.removeAttribute("email"); 
session.removeValue("email");

response.sendRedirect("Home.jsp");

}catch(Exception e){  response.sendRedirect("Home.jsp"); 
}
%>