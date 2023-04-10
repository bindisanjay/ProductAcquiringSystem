
<%

try{
String email=session.getAttribute("email").toString(); 
String photo=session.getAttribute("photo").toString();
String sid=session.getAttribute("sid").toString();

session.removeAttribute("photo");
session.removeAttribute("sid");
session.removeAttribute("email");

session.removeValue("photo");
session.removeValue("sid");
session.removeValue("email");

response.sendRedirect("Home.jsp");

}catch(Exception e){  response.sendRedirect("Home.jsp"); 
}
%>