/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import Maindata.Order;
import Maindata.item;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Abhishek Dharamkar Ramesh
 */
public class Orders extends HttpServlet {

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
           
            DiskFileItemFactory dif=new DiskFileItemFactory();
 ServletFileUpload upload=new ServletFileUpload(dif);
Order ord=new Order();
 
List list=upload.parseRequest(request);
FileItem f1=(FileItem)list.get(0);
 String type=f1.getString();  System.out.println("type delete  ::"+type);
 if(type.equalsIgnoreCase("cart")){
     
     
            FileItem f2=(FileItem)list.get(1);
            FileItem f3=(FileItem)list.get(2); 
            FileItem f4=(FileItem)list.get(3); 

            String ff2=f2.getString();  System.out.println("Item id  ::"+ff2);
            String ff3=f3.getString();  System.out.println("price   ::"+ff3);
            String ff4=f4.getString();  System.out.println("price   ::"+ff3);

            String its= ord.AddCart(ff2,ff3,ff4);

            System.out.println("Staus   ::"+its);
 
            if(ff4.equalsIgnoreCase("MANAGER")){

                    if(its.equalsIgnoreCase("Inserted"))
                                    {  response.sendRedirect("Orders.jsp?v="+its+"");}
                                else{  response.sendRedirect("Orders.jsp?v="+its+"");}

            }else if(ff4.equalsIgnoreCase("EMPLOYEE")){
                
                    if(its.equalsIgnoreCase("Inserted"))
                                    {  response.sendRedirect("EOrders.jsp?v="+its+"");}
                                else{  response.sendRedirect("EOrders.jsp?v="+its+"");}
            }
  
     
	 
 }else if(type.equalsIgnoreCase("cartdel")){
            FileItem f2=(FileItem)list.get(1);
            FileItem f3=(FileItem)list.get(2);  
            String ff2=f2.getString();  System.out.println("Item id  ::"+ff2);
            String ff3=f3.getString();  System.out.println("Item id  ::"+ff3); 
            String its= ord.DeleteCart(ff2);
            
                 if(ff3.equalsIgnoreCase("MANAGER")){

                    if(its.equalsIgnoreCase("Deleted"))
                                    {  response.sendRedirect("Orders.jsp?v="+its+"");}
                                else{  response.sendRedirect("Orders.jsp?v="+its+"");}

            }else if(ff3.equalsIgnoreCase("EMPLOYEE")){
                
                    if(its.equalsIgnoreCase("Deleted"))
                                    {  response.sendRedirect("EOrders.jsp?v="+its+"");}
                                else{  response.sendRedirect("EOrders.jsp?v="+its+"");}
            }
    

 } else if(type.equalsIgnoreCase("prequest")){
     
            FileItem f2=(FileItem)list.get(1);
            FileItem f3=(FileItem)list.get(2);  
            FileItem f4=(FileItem)list.get(3);
            FileItem f5=(FileItem)list.get(4);
            String ff2=f2.getString();  System.out.println("file name   ::"+ff2);
            String ff3=f3.getString();  System.out.println("file name   ::"+ff3);
            String ff4=f4.getString();  System.out.println("file name   ::"+ff4); 
            String ff5=f5.getString();  System.out.println("file name   ::"+ff5);
            
             System.out.println("Eid :: "+ff2); 
                String its= ord.SellerRequest(ff2,ff3,ff4,ff5);
                
            System.out.println("Eid 1:: "+ff2); 
             if(its.equalsIgnoreCase("PRequested"))
                 
                            {
            System.out.println("Eid 2:: "+ff2); 
            response.sendRedirect("Reports.jsp?v="+its+"");}
                        else{  response.sendRedirect("Reports.jsp?v="+its+"");}
            
   
 }else if(type.equalsIgnoreCase("purchase")){
     
     
            FileItem f2=(FileItem)list.get(1);
            FileItem f3=(FileItem)list.get(2); 
            FileItem f4=(FileItem)list.get(3);
            FileItem f5=(FileItem)list.get(4);
            FileItem f6=(FileItem)list.get(5); 
            FileItem f7=(FileItem)list.get(6);
            FileItem f8=(FileItem)list.get(7);
            FileItem f9=(FileItem)list.get(8); 

            String ff2=f2.getString();  System.out.println("file name   ::"+ff2);
            String ff3=f3.getString();  System.out.println("file name   ::"+ff3);
            String ff4=f4.getString();  System.out.println("file name   ::"+ff4);
            String ff5=f5.getString();  System.out.println("file name   ::"+ff5);
            String ff6=f6.getString();  System.out.println("file name   ::"+ff6);
            String ff7=f7.getString();  System.out.println("file name   ::"+ff7);
            String ff8=f8.getString();  System.out.println("file name   ::"+ff8);
            String ff9=f9.getString();  System.out.println("froll ::"+ff9); 
     
     
     
 }else if(type.equalsIgnoreCase("BBAccept")){
    
 
            FileItem f2=(FileItem)list.get(1);
            FileItem f3=(FileItem)list.get(2); 
            FileItem f4=(FileItem)list.get(3);
            FileItem f5=(FileItem)list.get(4);
            FileItem f6=(FileItem)list.get(5);
            String ff2=f2.getString();  System.out.println("file name   ::"+ff2);
            String ff3=f3.getString();  System.out.println("file name   ::"+ff3);
            String ff4=f4.getString();  System.out.println("file name   ::"+ff4); 
            String ff5=f5.getString();  System.out.println("file name   ::"+ff5);
            String ff6=f6.getString();  System.out.println("file name   ::"+ff6);
             
 System.out.println("Eid :: "+ff2); 
                String its= ord.BuyerAccept(ff2,ff3,ff4,ff5,ff6);
                
            System.out.println("Eid 1:: "+ff2); 
  if(its.equalsIgnoreCase("BAccepted"))
                 
                            {
            System.out.println("Eid 2:: "+ff2); 
            response.sendRedirect("EReports.jsp?v="+its+"");}
                        else{  response.sendRedirect("EReports.jsp?v="+its+"");}
 
 
 }else if(type.equalsIgnoreCase("BBReject")){
    
 
            FileItem f2=(FileItem)list.get(1);
            FileItem f3=(FileItem)list.get(2); 
            FileItem f4=(FileItem)list.get(3);
            FileItem f5=(FileItem)list.get(4);
            String ff2=f2.getString();  System.out.println("file name   ::"+ff2);
            String ff3=f3.getString();  System.out.println("file name   ::"+ff3);
            String ff4=f4.getString();  System.out.println("file name   ::"+ff4); 
            String ff5=f5.getString();  System.out.println("file name   ::"+ff5);
             
 System.out.println("Eid :: "+ff2); 
                String its= ord.BuyerReject(ff2,ff3,ff4,ff5);
                
            System.out.println("Eid 1:: "+ff2); 
  if(its.equalsIgnoreCase("BRejected"))
                 
                            {
            System.out.println("Eid 2:: "+ff2); 
            response.sendRedirect("EReports.jsp?v="+its+"");}
                        else{  response.sendRedirect("EReports.jsp?v="+its+"");}
 
 
 }else if(type.equalsIgnoreCase("requests")){
     
            FileItem f2=(FileItem)list.get(1);
            FileItem f3=(FileItem)list.get(2); 
            FileItem f4=(FileItem)list.get(3);
            FileItem f5=(FileItem)list.get(4);
            FileItem f6=(FileItem)list.get(5); 
            String ff2=f2.getString();  System.out.println("file name   ::"+ff2);
            String ff3=f3.getString();  System.out.println("file name   ::"+ff3);
            String ff4=f4.getString();  System.out.println("file name   ::"+ff4);
            String ff5=f5.getString();  System.out.println("file name   ::"+ff5);
            String ff6=f6.getString();  System.out.println("file name   ::"+ff6);
            
            System.out.println("Eid :: "+ff2); 
                String its= ord.RequestOrders(ff2,ff3,ff4,ff5,ff6);
                
            System.out.println("Eid 1:: "+ff2); 
             if(its.equalsIgnoreCase("Requested"))
                 
                            {
            System.out.println("Eid 2:: "+ff2); 
            response.sendRedirect("EOrders.jsp?v="+its+"");}
                        else{  response.sendRedirect("EOrders.jsp?v="+its+"");}
            
            
      } else if(type.equalsIgnoreCase("Shipping")){
          
            FileItem f2=(FileItem)list.get(1);
            FileItem f3=(FileItem)list.get(2); 
            FileItem f4=(FileItem)list.get(3);
            FileItem f5=(FileItem)list.get(4);
            FileItem f6=(FileItem)list.get(5); 
            FileItem f7=(FileItem)list.get(6);
            FileItem f8=(FileItem)list.get(7); 


            String ff2=f2.getString();  System.out.println("file name a  ::"+ff2);
            String ff3=f3.getString();  System.out.println("file name b  ::"+ff3);
            String ff4=f4.getString();  System.out.println("file name c  ::"+ff4);
            String ff5=f5.getString();  System.out.println("file name   ::"+ff5);
            String ff6=f6.getString();  System.out.println("file name   ::"+ff6);
            String ff7=f7.getString();  System.out.println("file name   ::"+ff7);
            String ff8=f8.getString();  System.out.println("file name   ::"+ff8); 

            Random random = new Random();   
            int y = random.nextInt(99999);  
 
                String its= ord.AddShipping(ff2,ff3,ff4,ff5,ff6,ff7,ff8);  
                
                 
            if(its.equalsIgnoreCase("Inshipping"))
                            {  response.sendRedirect("EOrders.jsp?v="+its+"");}
                        else{  response.sendRedirect("EOrders.jsp?v="+its+"");}

      } else if(type.equalsIgnoreCase("processs")){
 

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


            String ff2=f2.getString();  System.out.println("file name 1  ::"+ff2);
            String ff3=f3.getString();  System.out.println("file name 2  ::"+ff3);
            String ff4=f4.getString();  System.out.println("file name 3  ::"+ff4);
            String ff5=f5.getString();  System.out.println("file name  4 ::"+ff5);
            String ff6=f6.getString();  System.out.println("file name  5 ::"+ff6);
            String ff7=f7.getString();  System.out.println("file name  6 ::"+ff7);
            String ff8=f8.getString();  System.out.println("file name  7 ::"+ff8);
            String ff9=f9.getString();  System.out.println("froll 8 ::"+ff9); 


            String ff10=f10.getString();  System.out.println("file name9   ::"+ff10);
            String ff11=f11.getString();  System.out.println("file name 10  ::"+ff11); 

  
 
                String its= ord.AddOrders(ff2,ff3,ff4,ff5,ff6,ff7,ff8,ff9,ff10,ff11);  
                
                 
            if(its.equalsIgnoreCase("Inserted"))
                            {  response.sendRedirect("EOrders.jsp?v="+its+"");}
                        else{  response.sendRedirect("EOrders.jsp?v="+its+"");}

             
   
 
 } else if(type.equalsIgnoreCase("delete")){
 
            FileItem f2=(FileItem)list.get(1);  
            FileItem f3=(FileItem)list.get(2);  
                String ff2=f2.getString();  System.out.println("file name   ::"+ff2);
                String ff3=f3.getString();  System.out.println("file name   ::"+ff3);
                String its= ord.DeleteOrder(ff2);
     
     
     
            if(ff3.equalsIgnoreCase("MANAGER")){

            if(its.equalsIgnoreCase("Deleted"))
                            {  response.sendRedirect("Orders.jsp?v="+its+"");}
                        else{  response.sendRedirect("Orders.jsp?v="+its+"");}

            }else if(ff3.equalsIgnoreCase("EMPLOYEE")){
            if(its.equalsIgnoreCase("Deleted"))
                            {  response.sendRedirect("EOrders.jsp?v="+its+"");}
                        else{  response.sendRedirect("EOrders.jsp?v="+its+"");}
            }
  
      
 
 
         }else if(type.equalsIgnoreCase("update")){
 
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

String ff2=f2.getString();  System.out.println("id   ::"+ff2);

String ff3=f3.getString();  System.out.println(" name   ::"+ff3);
String ff4=f4.getString();  System.out.println("email   ::"+ff4);
String ff5=f5.getString();  System.out.println("add  ::"+ff5);
String ff6=f6.getString();  System.out.println("phone  ::"+ff6);
String ff7=f7.getString();  System.out.println("pymeth   ::"+ff7);  
//String ff8=f8.getString();  System.out.println("payprice  ::"+ff8);
String ff9=f9.getString();  System.out.println("paydeatils  ::"+ff9);
//String ff10=f10.getString();  System.out.println("Orderid  ::"+ff10); 
String ff11=f11.getString();  System.out.println("role  ::"+ff11); 
 
       String its= ord.UpdateOrders(ff3,ff4,ff5,ff6,ff7,ff9,ff11,ff2); 
       
  
				         
            if(ff11.equalsIgnoreCase("MANAGER")){

            if(its.equalsIgnoreCase("Updated"))
                            {  response.sendRedirect("Orders.jsp?v="+its+"");}
                        else{  response.sendRedirect("Orders.jsp?v="+its+"");}

            }else if(ff11.equalsIgnoreCase("EMPLOYEE")){
            if(its.equalsIgnoreCase("Updated"))
                            {  response.sendRedirect("EOrders.jsp?v="+its+"");}
                        else{  response.sendRedirect("EOrders.jsp?v="+its+"");}
            }
   
  
  
  
         } }
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
