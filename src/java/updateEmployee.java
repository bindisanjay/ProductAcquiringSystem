/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import Maindata.Employee;
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
public class updateEmployee extends HttpServlet {

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
            out.println("<html>"); 
            
            DiskFileItemFactory dif=new DiskFileItemFactory();
 ServletFileUpload upload=new ServletFileUpload(dif);

List list=upload.parseRequest(request);

FileItem f1=(FileItem)list.get(0);
FileItem f2=(FileItem)list.get(1);
FileItem f3=(FileItem)list.get(2); 
FileItem f4=(FileItem)list.get(3);
FileItem f5=(FileItem)list.get(4);
FileItem f6=(FileItem)list.get(5); 
FileItem f7=(FileItem)list.get(6);
FileItem f8=(FileItem)list.get(7);
FileItem f9=(FileItem)list.get(8); 
FileItem f10=(FileItem)list.get(9);
FileItem f11=(FileItem)list.get(10);
FileItem fid=(FileItem)list.get(11);
            

String ff1=f1.getString();  System.out.println("file name   ::"+ff1);
String ff2=f2.getString();  System.out.println("file name   ::"+ff2);
String ff3=f3.getString();  System.out.println("file name   ::"+ff3);
String ff4=f4.getString();  System.out.println("file name   ::"+ff4);
String ff5=f5.getString();  System.out.println("file name   ::"+ff5);
String ff6=f6.getString();  System.out.println("file name   ::"+ff6);
String ff7=f7.getString();  System.out.println("file name   ::"+ff7);
String ff8=f8.getString();  System.out.println("file name   ::"+ff8);
String ff9=f9.getString();  System.out.println("file name   ::"+ff9);
String ff10=f10.getString();  System.out.println("file name   ::"+ff10); 
String ff11=f11.getString();  System.out.println("file name   ::"+ff11); 
String eid=fid.getString();  System.out.println("file name   ::"+eid); 
            
            
            Employee emp=new Employee();
            String ss=emp.UpdateEmployee(ff3, ff4, ff5, ff6, ff7, ff8, ff9, ff10, ff11, eid);
            
            if(ss.equalsIgnoreCase("Updated")){
	                ;
                    response.sendRedirect("updateemployee.jsp?v="+ss+"");
            }else{
                response.sendRedirect("updateemployee.jsp?v="+ss+"");
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
