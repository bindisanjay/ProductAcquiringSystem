/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import Maindata.Discounts;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Lenovo
 */
public class Leave extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /*
             * TODO output your page here. You may use following sample code.
             */
          
            
 HttpSession session=request.getSession();  
                       DiskFileItemFactory dif=new DiskFileItemFactory();
 ServletFileUpload upload=new ServletFileUpload(dif);
Maindata.Leave it=new Maindata.Leave();
 
List list=upload.parseRequest(request);

FileItem f1=(FileItem)list.get(0);

String type=f1.getString();  System.out.println("type delete  ::"+type);
 if(type.equalsIgnoreCase("Leave")){
FileItem f2=(FileItem)list.get(1);
FileItem f3=(FileItem)list.get(2); 
FileItem f4=(FileItem)list.get(3);  
String ff2=f2.getString();  System.out.println("file name   ::"+ff2);
String ff3=f3.getString();  System.out.println("file name   ::"+ff3); 
String ff4=f4.getString();  System.out.println("file name   ::"+ff4);  
 
 String sid=session.getAttribute("sid").toString();
 String its= it.RequestLeave(ff2,ff3,ff4,sid);
  
if(its.equalsIgnoreCase("Inserted"))
                        {  response.sendRedirect("Erequest.jsp?v="+its+"");}
             else{  response.sendRedirect("Erequest.jsp?v="+its+"");}
 
     
 
         }else  if(type.equalsIgnoreCase("Maintenance")){
FileItem f2=(FileItem)list.get(1);
FileItem f3=(FileItem)list.get(2); 
FileItem f4=(FileItem)list.get(3);

String ff2=f2.getString();  System.out.println("file name   ::"+ff2);
String ff3=f3.getString();  System.out.println("file name   ::"+ff3); 
String ff4=f4.getString();  System.out.println("file name   ::"+ff4);  
 
 String sid=session.getAttribute("sid").toString(); 

 String its= it.RequestMainte(ff2,ff3,ff4,sid);
     
if(its.equalsIgnoreCase("Maintenance"))
            {  response.sendRedirect("Erequest.jsp?v="+its+"");}
             else{  response.sendRedirect("Erequest.jsp?v="+its+"");}
 
 
 
 }else  if(type.equalsIgnoreCase("Approve")){
FileItem f2=(FileItem)list.get(1); 

String ff2=f2.getString();  System.out.println("file name   ::"+ff2);  
 
String updatesql="update reqleave set rstatus='Approve' where rid='"+ff2+"'";
 String its= it.ApproveLeave(updatesql);
     
if(its.equalsIgnoreCase("Approve"))
            {  response.sendRedirect("approveLeave.jsp?v="+its+"");}
             else{  response.sendRedirect("approveLeave.jsp?v="+its+"");}
 
 
 
 }else  if(type.equalsIgnoreCase("MMaintenance")){
FileItem f2=(FileItem)list.get(1); 

String ff2=f2.getString();  System.out.println("file name   ::"+ff2);  
 
String updatesql="update reqmainte set rstatus='Approve' where rid='"+ff2+"'";
 String its= it.ApproveMainten(updatesql);
     
if(its.equalsIgnoreCase("Approve"))
            {  response.sendRedirect("approveLeave.jsp?v="+its+"");}
             else{  response.sendRedirect("approveLeave.jsp?v="+its+"");}
  
 
 }else  if(type.equalsIgnoreCase("RejectApprove")){
FileItem f2=(FileItem)list.get(1); 

String ff2=f2.getString();  System.out.println("file name   ::"+ff2);  
 
String updatesql="update reqleave set rstatus='Reject' where rid='"+ff2+"'";
 String its= it.ApproveReject(updatesql);
     
if(its.equalsIgnoreCase("Reject"))
            {  response.sendRedirect("approveLeave.jsp?v="+its+"");}
             else{  response.sendRedirect("approveLeave.jsp?v="+its+"");}
  }
     
  else  if(type.equalsIgnoreCase("RejectMMainten")){
FileItem f2=(FileItem)list.get(1); 

String ff2=f2.getString();  System.out.println("file name   ::"+ff2);  
 
String updatesql="update reqmainte set rstatus='Reject' where rid='"+ff2+"'";
 String its= it.RejectMainten(updatesql);
     
if(its.equalsIgnoreCase("MReject"))
            {  response.sendRedirect("approveLeave.jsp?v="+its+"");}
             else{  response.sendRedirect("approveLeave.jsp?v="+its+"");}
  }
              
            
            
              }
        catch(Exception e) {
	        	 out.println("   ----  hello----- \n "+e);
		        	e.printStackTrace();
	        }finally {            
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
