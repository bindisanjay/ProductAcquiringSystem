/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import Maindata.SendFeedback;
import Maindata.item;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Lenovo
 */
public class Feedback extends HttpServlet {

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
                   DiskFileItemFactory dif=new DiskFileItemFactory();
 ServletFileUpload upload=new ServletFileUpload(dif);
SendFeedback it=new SendFeedback();
 
List list=upload.parseRequest(request);

FileItem f1=(FileItem)list.get(0);
FileItem f2=(FileItem)list.get(1);
FileItem f3=(FileItem)list.get(2);
FileItem f4=(FileItem)list.get(3);  

 String path=request.getRealPath("fpath");
         
String filee=f3.getName();  System.out.println("file   ::"+filee);

  File f= new File(path+"\\"+filee);   String pa="fpath"+"/"+filee;

 System.out.println("path:: "+pa);

  f3.write(f);   
  
  
String ff1=f1.getString();  System.out.println("file name   ::"+ff1);
String ff2=f2.getString();  System.out.println("file name   ::"+ff2); 
String ff3=pa;  System.out.println("file name   ::"+ff3);
String ff4=f4.getString();  System.out.println("file name   ::"+ff4); 
            
 String its= it.SendFeedbacks(ff1,ff2,ff3);
 
   if(ff4.equalsIgnoreCase("MANAGER")){

                    if(its.equalsIgnoreCase("Inserted"))
                                    {  response.sendRedirect("sendFeedback.jsp?v="+its+"");}
                                else{  response.sendRedirect("sendFeedback.jsp?v="+its+"");}

            }else if(ff4.equalsIgnoreCase("EMPLOYEE")){
                
                    if(its.equalsIgnoreCase("Inserted"))
                                    {  response.sendRedirect("EsendFeedback.jsp?v="+its+"");}
                                else{  response.sendRedirect("EsendFeedback.jsp?v="+its+"");}
            }
  
 
 
             }
        catch(Exception e) {
	        	 out.println("   ----  hello----- \n "+e);
		        	e.printStackTrace();
	       } finally {            
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
