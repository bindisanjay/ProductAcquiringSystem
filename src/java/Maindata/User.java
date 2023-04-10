/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Maindata;

import database.connect;
import java.sql.*;
import java.text.SimpleDateFormat;   

import java.text.ParseException;
import java.text.SimpleDateFormat;


/**
 *
 * @author Lenovo
 */
public abstract class User {  
        public  String AddCategory(String f1) { 
           String sql="SELECT count(*) FROM category ";
		  connect db = new connect();
			Connection connect=db.getConnection();
			String ret="";
                        try {
				Statement stmt=connect.createStatement();
				 ResultSet rs =stmt.executeQuery(sql);
					String utype="";
				  rs.next();
				     int cid=rs.getInt(1)+1; 
                                     String Eid="CA00"+cid;
                                    String insertsql="insert into category values(?,?)"; 
				     PreparedStatement ps=connect.prepareStatement(insertsql);
				    ps.setString(1, Eid);
				    ps.setString(2, f1); 
				    int i=ps.executeUpdate();
				    if(i!=0) 
				    {
						ret= "Inserted";
				    }else {
						ret= "NotInserted";
				    }
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
           
           return ret;
       }
        public  String DeleteCategory(String f1) {
            
             String deletesql="delete FROM category where cid='"+f1+"'";
		  connect db = new connect();
			Connection connect=db.getConnection();
			String ret="";
			 try { PreparedStatement ps=connect.prepareStatement(deletesql); 
				    int i=ps.executeUpdate();
				    if(i!=0) 
				    {
						ret= "Deleted";
				    }else {
						ret= "NotDeleted";
				    }
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return ret;
       }
        public  String updateCategory(String f1,String f2) {  
            connect db = new connect();
			Connection connect=db.getConnection();
			String ret=""; 
			try { String updatesql="update category set name=? where cid=?"; 
				     PreparedStatement ps=connect.prepareStatement(updatesql);
				     ps.setString(1, f1);
				    ps.setString(2, f2);  
				    int i=ps.executeUpdate();
				    if(i!=0) 
				    {
						ret= "Updated";
				    }else {
						ret= "NotUpdated";
				    }
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return ret;
       }
        public  String UpdateMAccount(String f1) {  
            connect db = new connect();
			Connection connect=db.getConnection();
			String ret=""; 
			try {    System.out.println("data ::"+f1);
				     PreparedStatement ps=connect.prepareStatement(f1);   
				    int i=ps.executeUpdate();
				    if(i!=0) 
				    { ret= "Inserted";
				    }else { ret= "NotInserted";
				    }
			} catch (SQLException e) { e.printStackTrace();
			}
			return ret;
       }
        public  String AddMItem(String f1,String f2,String f3,String f4,String f5,String f6,String f7,String f8,String f9,String f10) throws ParseException { 
           String sql="SELECT count(*) FROM item ";
		  connect db = new connect();
			Connection connect=db.getConnection();
			String ret="";
                        try { 
                            long millis=System.currentTimeMillis();  
                     java.sql.Date cdate=new java.sql.Date(millis);  
                                System.out.println(cdate);    
                                 Date edate=Date.valueOf(f7); 
                                    System.out.println(edate);  
                                    
                                    
				Statement stmt=connect.createStatement();
				 ResultSet rs =stmt.executeQuery(sql);
					String utype="";
				  rs.next();
                                   
				     int cid=rs.getInt(1)+1; 
                                     String Eid="CI000"+cid; 
				   
                                     int icount=Integer.parseInt(f9);
                                    String insertsql="insert into item values(?,?,?,?,?,?,?,?,?,?,?,?)"; 
				     PreparedStatement ps=connect.prepareStatement(insertsql);
				    ps.setString(1, Eid);
				    ps.setString(2, f1); 
				    ps.setString(3, f2);
				    ps.setString(4, f3); 
				    ps.setString(5, f4);
				    ps.setString(6, f5); 
				    ps.setString(7, f6);
				    ps.setString(8, f8); 
				    ps.setDate(9, edate);
				    ps.setString(10, f10); 
				    ps.setDate(11, cdate);
				    ps.setInt(12, icount); 
				    int i=ps.executeUpdate();
				    if(i!=0) 
				    {
						ret= "Inserted";
				    }else {
						ret= "NotInserted";
				    }
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
           
           return ret;
       }
        public  String DeleteMItem(String f1) {
            
             String deletesql="delete FROM item where id='"+f1+"'";
		  connect db = new connect();
			Connection connect=db.getConnection();
			String ret="";
			 try { PreparedStatement ps=connect.prepareStatement(deletesql); 
				    int i=ps.executeUpdate();
				    if(i!=0) 
				    {
						ret= "Deleted";
				    }else {
						ret= "NotDeleted";
				    }
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return ret;
       }      
        public  String UpdateMItem(String f1,String f2,String f3,String f4,String f5,String f6,String f7,String f8,String f9,String f10) {  
            connect db = new connect();
             SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");  
//                              Date date = new Date();  
//                            System.out.println(formatter.format(date)); 
//                                     String edate=formatter.format(date);
             
             
			Connection connect=db.getConnection();
			String ret=""; 
			try { 
                             long millis=System.currentTimeMillis();  
                     java.sql.Date cdate=new java.sql.Date(millis);  
                                System.out.println(cdate);    
                                 Date edate=Date.valueOf(f7); 
                                    System.out.println(edate);  
 String updatesql="UPDATE item SET name=? , category=?,descri=?, Pcompany=?, price=?, discount=?, edate=?, addby=?, modifydate=?, icount=? WHERE id =?"; 
 //String updatesql="UPDATE item SET name=?, category=?, desc=?, Pcompany=?, price=?, discount=?, edate=?, addby=?, modifydate=? WHERE id =?"; 
  // String updatesql="update item set name='"+f1+"', category='"+f2+"' , desc='"+f3+"' , Pcompany='"+f4+"' , price='"+f5+"' , discount='"+f6+"' , edate='"+f7+"', addby='MANAGER', modifydate='"+edate+"' where id='"+f8+"'"; 
		   PreparedStatement ps=connect.prepareStatement(updatesql);
			System.out.println("sql= : "+updatesql);	  
				    ps.setString(1, f1); 
				    ps.setString(2, f2);
				    ps.setString(3, f3); 
				    ps.setString(4, f4);
				    ps.setString(5, f5); 
				    ps.setString(6, f6);
				    ps.setDate(7, edate); 
				    ps.setString(8, f9);
				    ps.setDate(9, cdate);   
				    ps.setString(10, f8); 
				    ps.setString(11, f10);   
				    int i=ps.executeUpdate();
				    if(i!=0) 
				    {
						ret= "Updated";
				    }else {
						ret= "NotUpdated";
				    }
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return ret;
       }
        public  String AddCart(String f1,String f2,String f3) { 
                System.out.println("price   1::"+f2);
           String sql="SELECT count(*) FROM cart ";
		  connect db = new connect();
			Connection connect=db.getConnection();
			String ret="";
                        try {
				Statement stmt=connect.createStatement();
				 ResultSet rs =stmt.executeQuery(sql);
					String utype="";
				  rs.next();
				     int cid=rs.getInt(1)+1; 
                                     String Eid="CA00"+cid; 
                                    String insertsql="insert into cart values(?,?,?,?,?)"; 
				     PreparedStatement ps=connect.prepareStatement(insertsql);
				    ps.setString(1, Eid);
				    ps.setString(2, f1); 
				    ps.setInt(3, Integer.parseInt(f2)); 
				    ps.setString(4, f3); 
				    ps.setString(5, "nill"); 
				    int i=ps.executeUpdate();
				    if(i!=0) 
				    {
						ret= "Inserted";
				    }else {
						ret= "NotInserted";
				    }
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
           
           return ret;
       }
        public  String DeleteCart(String f1) {
            
             String deletesql="delete FROM cart where cid='"+f1+"'";
		  connect db = new connect();
			Connection connect=db.getConnection();
			String ret="";
			 try { PreparedStatement ps=connect.prepareStatement(deletesql); 
				    int i=ps.executeUpdate();
				    if(i!=0) 
				    {
						ret= "Deleted";
				    }else {
						ret= "NotDeleted";
				    }
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return ret;
       }
        public  String CreatCartid(String f1,String f2) {  
            connect db = new connect();
			Connection connect=db.getConnection();
                        
			String ret=""; 
			try {
                             Statement st=connect.createStatement();
                             String updatesql="update cart set caid=? where addby='"+f2+"' and caid='nill'"; 
				     PreparedStatement ps=connect.prepareStatement(updatesql);
				     ps.setString(1, f1); 
				    int i=ps.executeUpdate();
                                    System.out.println("updatesq 1:");
                                        String cart= " select it.id,it.icount  from  cart as ct , item as it  where  ct.iid= it.id and ct.Caid='"+f1+"' "; 
                                        System.out.println("qusq:"+cart);
                                        
                                         ResultSet rop=st.executeQuery(cart);
                                         while(rop.next())
                                         {
                                             String iid=rop.getString(1);System.out.println("updatesq 2:id "+iid);
                                              int cc=Integer.parseInt(rop.getString(2))-1;
                                             System.out.println("cc :"+cc);
                                         String icount="update item set icount=? where id='"+iid+"'"; 
                                             System.out.println("  icount  :"+icount);
                                             PreparedStatement pst=connect.prepareStatement(icount);
                                              pst.setInt(1, cc); 
                                                int io=pst.executeUpdate();
                                              
                                         }
				
				rop.close();
                                    
                                    
                                    
                                    
                                    
				    if(i!=0) 
				    { 
                               
						ret= "Updated";
				    }else {
						ret= "NotUpdated";
				    }
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return ret;
       }
        public  String AddOrders(String f1,String f2,String f3,String f4,String f5,String f6,String f7,String f8,String f9,String f10) { 
           String sql="SELECT count(*) FROM orderdetails ";
		  connect db = new connect();
			Connection connect=db.getConnection();
			String ret="";
                        try { 
            long millis=System.currentTimeMillis();  
                     java.sql.Date cdate=new java.sql.Date(millis);  
                                System.out.println(cdate);     
                                      System.out.println("file name   ::"+f2);
 System.out.println("file name   ::"+f3);
 System.out.println("file name   ::"+f4);
 System.out.println("file name   ::"+f5);
 System.out.println("file name   ::"+f6);
 System.out.println("file name   ::"+f7);
 System.out.println("file name   ::"+f8); 
				Statement stmt=connect.createStatement();
				 ResultSet rs =stmt.executeQuery(sql); 
				  rs.next();
                                   int cid=rs.getInt(1)+1; 
                                     String Eid="OR00"+cid;
                                        System.out.println("Eid :: "+Eid);
                                  String insql="insert into orderdetails values(?,?,?,?,?,?,?,?,?,?,?,?)"; 
				     PreparedStatement ps=connect.prepareStatement(insql);
				    ps.setString(1, Eid);
				    ps.setString(2, f1); 
				    ps.setString(3, f2);
				    ps.setString(4, f3); 
				    ps.setString(5, f4);
				    ps.setString(6, f5); 
				    ps.setString(7, f9);
				    ps.setString(8, f6);
				    ps.setString(9, f7); 
				    ps.setString(10, f8); 
				    ps.setDate(11, cdate);
				    ps.setString(12, "Success");  
				    int i=ps.executeUpdate();
                                   if(i!=0) 
				    {
                                         String ins="update shipping set Status=? where rid=? and  sid=? and buyername=?"; 
				     PreparedStatement pso=connect.prepareStatement(ins);
				    pso.setString(1, "Delivered");
				    pso.setString(2, f3);  
				    pso.setString(3, f2);  
				    pso.setString(4, f5);        
				    int io=pso.executeUpdate();
                                         
                                          String key="Product Order Placed  OrderId::"+Eid;
                                        String subject="Product Accepted  Placed by "+f5;
//                                         ss.mail(f3, key, subject);
//                                         ss.mail(f5, key, subject);
                                          System.out.println("Eid :");
                                          
						ret= "Inserted";
				    }else {
						ret= "NotInserted";
				    }
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
           
           return ret;
       }       
       
         public  String AddShipping(String f1,String f2,String f3,String f4,String f5,String f6,String f7) { 
           String sql="SELECT count(*) FROM shipping ";
		  connect db = new connect();
			Connection connect=db.getConnection();
			String ret="";
                        try { 
           
 System.out.println("file name   ::"+f3);
 System.out.println("file name   ::"+f4);
 System.out.println("file name   ::"+f5);
 System.out.println("file name   ::"+f6);
 System.out.println("file name   ::"+f7); 
				Statement stmt=connect.createStatement();
				 ResultSet rs =stmt.executeQuery(sql); 
				  rs.next();
                                   int cid=rs.getInt(1)+1; 
                                     String Eid="SPA00"+cid;
                                        System.out.println("Eid :: "+Eid);
                                  String insql="insert into shipping values(?,?,?,?,?,?,?,?)"; 
				     PreparedStatement ps=connect.prepareStatement(insql);
				    ps.setString(1, Eid);
				    ps.setString(2, f1); 
				    ps.setString(3, f2);
				    ps.setString(4, f3); 
				    ps.setString(5, f5);
				    ps.setString(6, f4); 
				    ps.setString(7, f6);
				    ps.setString(8, "Inprocess");  
				    int i=ps.executeUpdate();
                                   if(i!=0) 
				    {
                                         String ins="update sellerres set Statuss=? where reqid=?"; 
				     PreparedStatement pso=connect.prepareStatement(ins);
				    pso.setString(1, "Accepteds");
				    pso.setString(2, f2);        
				    int io=pso.executeUpdate();
                                         
                                          
						ret= "Inshipping";
				    }else {
						ret= "NotInshipping";
				    }
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
           
           return ret;
       }       
       
        
        public  String DeleteOrder(String f1) {
            
             String deletesql="delete FROM orderdetails where id='"+f1+"'";
		  connect db = new connect();
			Connection connect=db.getConnection();
			String ret="";
			 try { PreparedStatement ps=connect.prepareStatement(deletesql); 
				    int i=ps.executeUpdate();
				    if(i!=0) 
				    {
						ret= "Deleted";
				    }else {
						ret= "NotDeleted";
				    }
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return ret;
       } 
        public  String UpdateOrders(String f1,String f2,String f3,String f4,String f5,String f6,String f7,String f8) {  
            
            
                System.out.println("id   ::"+f8);  
                System.out.println(" name   ::"+f1);  
                System.out.println("email   ::"+f2);   
                System.out.println("add  ::"+f3);
                System.out.println("phone  ::"+f4);  
                System.out.println("pymeth   ::"+f5);   
                System.out.println("paydeatils  ::"+f6);
                System.out.println("role  ::"+f7); 
 
            
            connect db = new connect();
			Connection connect=db.getConnection();
			String ret=""; 
			try {
                                  long millis=System.currentTimeMillis();  
                     java.sql.Date cdate=new java.sql.Date(millis);  
                                System.out.println(cdate);     
                            
                            String updatesql="update orderdetails set username=?,emailid=?,address=?,phonenum=?,paymethod=?,paydetails=?,modifydate=?, addby=? where id=?"; 
				     PreparedStatement ps=connect.prepareStatement(updatesql);
				     ps.setString(1, f1);
				     ps.setString(2, f2);  
				     ps.setString(3, f3);
				     ps.setString(4, f4);  
				     ps.setString(5, f5);
				     ps.setString(6, f6);
				     ps.setDate(7, cdate);  
				     ps.setString(8, f7);   
				     ps.setString(9, f8); 
				    int i=ps.executeUpdate();
				    if(i!=0) 
				    {
						ret= "Updated";
				    }else {
						ret= "NotUpdated";
				    }
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return ret;
       }
        public  String AddSuppliers(String f1,String f2,String f3,String f4,String f5) { 
           String sql="SELECT count(*) FROM suppliers ";
		  connect db = new connect();
			Connection connect=db.getConnection();
			String ret="";
                        try { 
            long millis=System.currentTimeMillis();  
                     java.sql.Date cdate=new java.sql.Date(millis);  
                                System.out.println(cdate);  
                                  
                                 Date edate=Date.valueOf(f5); 
                                    System.out.println(edate);
                                      System.out.println("file name   ::"+f2);
 System.out.println("file name   ::"+f3);
 System.out.println("file name   ::"+f4);
 System.out.println("file name   ::"+f5); 
				Statement stmt=connect.createStatement();
				 ResultSet rs =stmt.executeQuery(sql); 
				  rs.next();
                                   int cid=rs.getInt(1)+1; 
                                     String Eid="SP00"+cid;
                                        System.out.println("Eid :: "+Eid); ;
                                  String insql="insert into suppliers values(?,?,?,?,?,?,?,?)"; 
				     PreparedStatement ps=connect.prepareStatement(insql);
				    ps.setString(1, Eid);
				    ps.setString(2, f1); 
				    ps.setString(3, f2);
				    ps.setString(4, f3); 
				    ps.setString(5, f4);   
				    ps.setDate(6, edate);    
				    ps.setDate(7, cdate);     
				    ps.setString(8, "Activate");  
				    int i=ps.executeUpdate();
                                   if(i!=0) 
				    {
						ret= "Inserted";
				    }else {
						ret= "NotInserted";
				    }
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
           
           return ret;
       }  
        public  String UpdateSuppliers(String f1,String f2,String f3,String f4,String f5,String f6,String f7) {  
            connect db = new connect();
			Connection connect=db.getConnection();
			String ret=""; 
			try {
                                  long millis=System.currentTimeMillis();  
                     java.sql.Date cdate=new java.sql.Date(millis);  
                                System.out.println(cdate);     
                            
                            String updatesql="update suppliers set sname=?,emaiid=?,address=?,phone=?,accdate=?,modifydate=?,sstatus=? where id=?"; 
				     PreparedStatement ps=connect.prepareStatement(updatesql);
				     ps.setString(1, f1);
				     ps.setString(2, f2);  
				     ps.setString(3, f3);
				     ps.setString(4, f4);  
				     ps.setString(5, f5);
				     ps.setDate(6, cdate);
				     ps.setString(7, f6); 
				     ps.setString(8, f7); 
				    int i=ps.executeUpdate();
				    if(i!=0) 
				    {
						ret= "Updated";
				    }else {
						ret= "NotUpdated";
				    }
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return ret;
       }
        public  String DeleteSuppliers(String f1) {
            
             String deletesql="delete FROM suppliers where id='"+f1+"'";
		  connect db = new connect();
			Connection connect=db.getConnection();
			String ret="";
			 try { PreparedStatement ps=connect.prepareStatement(deletesql); 
				    int i=ps.executeUpdate();
				    if(i!=0) 
				    {
						ret= "Deleted";
				    }else {
						ret= "NotDeleted";
				    }
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return ret;
       }
        public  String DeactivateSuppliers(String f1) {
            
             String deletesql="update suppliers set sstatus='Deactivate' where id='"+f1+"'";
		  connect db = new connect();
			Connection connect=db.getConnection();
			String ret="";
			 try { PreparedStatement ps=connect.prepareStatement(deletesql); 
				    int i=ps.executeUpdate();
				    if(i!=0) 
				    {
						ret= "Deleted";
				    }else {
						ret= "NotDeleted";
				    }
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return ret;
       }
        public  String updateInvoice(String f1 ) {  
            connect db = new connect();
			Connection connect=db.getConnection();
			String ret="";  
			try { 
                            //String updatesql="update invoice set orderid=?,edate=? where inid=?"; 
				     PreparedStatement ps=connect.prepareStatement(f1);
//				     ps.setString(1, f1);
//				    ps.setDate(2, edate); 
//				    ps.setString(3, f2);  
				    int i=ps.executeUpdate();
				    if(i!=0) 
				    {
						ret= "Updated";
				    }else {
						ret= "NotUpdated";
				    }
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return ret;
       }
        public  String DeleteInvoice(String f1) {
            
             String deletesql="delete FROM invoice where inid='"+f1+"'";
		  connect db = new connect();
			Connection connect=db.getConnection();
			String ret="";
			 try { PreparedStatement ps=connect.prepareStatement(deletesql); 
				    int i=ps.executeUpdate();
				    if(i!=0) 
				    {
						ret= "Deleted";
				    }else {
						ret= "NotDeleted";
				    }
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return ret;
       }
        public  String AddDiscount(String f1 ) {  
            connect db = new connect();
			Connection connect=db.getConnection();
			String ret="";  
			try {     PreparedStatement ps=connect.prepareStatement(f1); 
				    int i=ps.executeUpdate();
				    if(i!=0) 
				    {
						ret= "Updated";
				    }else {
						ret= "NotUpdated";
				    }
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return ret;
       }
        public  String DeleteDiscount(String f1 ) {  
            connect db = new connect();
			Connection connect=db.getConnection();
			String ret="";  
			try {     PreparedStatement ps=connect.prepareStatement(f1); 
				    int i=ps.executeUpdate();
				    if(i!=0) 
				    {
						ret= "Updated";
				    }else {
						ret= "NotUpdated";
				    }
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return ret;
       }
        public  String AddCoupon(String f1,String f2,String f3,String f4 ) {  
            connect db = new connect();
			Connection connect=db.getConnection();
			String ret="";  
                          String sql="SELECT count(*) FROM coupons ";
			try {     
                            Statement stmt=connect.createStatement();
				 ResultSet rs =stmt.executeQuery(sql); 
				  rs.next();
                                   int cid=rs.getInt(1)+1; 
                                     String Eid="OR00"+cid;
                                        System.out.println("Eid :: "+Eid);
                            
                            String insql="insert into coupons values(?,?,?,?,?)"; 
				  
                            PreparedStatement ps=connect.prepareStatement(insql); 
                              ps.setString(1, Eid);
				    ps.setString(2, f1); 
				    ps.setString(3, f2);
				    ps.setString(4, f3); 
				    ps.setString(5, f4); 
				    int i=ps.executeUpdate();
				    if(i!=0) 
				    {
						ret= "Inserted";
				    }else {
						ret= "NotInserted";
				    }
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return ret;
       }
         public  String SendFeedbacks(String f1,String f2,String f3) { 
                System.out.println("price   1::"+f2);
           String sql="SELECT count(*) FROM Feedback ";
		  connect db = new connect();
			Connection connect=db.getConnection();
			String ret="";
                        try {
				Statement stmt=connect.createStatement();
				 ResultSet rs =stmt.executeQuery(sql);
					String utype="";
				  rs.next();
				     int cid=rs.getInt(1)+1; 
                                     String Eid="FB00"+cid; 
                                    String insertsql="insert into Feedback values(?,?,?,?)"; 
				     PreparedStatement ps=connect.prepareStatement(insertsql);
				    ps.setString(1, Eid);
				    ps.setString(2, f1); 
				    ps.setString(3, f2); 
				    ps.setString(4, f3);   
				    int i=ps.executeUpdate();
				    if(i!=0) 
				    {
						ret= "Inserted";
				    }else {
						ret= "NotInserted";
				    }
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
           
           return ret;
       }
         public  String SendEmails(String f1,String f2,String f3) { 
                System.out.println("price   1::"+f2);
           String sql="SELECT count(*) FROM semail ";
		  connect db = new connect();
			Connection connect=db.getConnection();
			String ret="";
                        try {
				Statement stmt=connect.createStatement();
				 ResultSet rs =stmt.executeQuery(sql);
					String utype="";
				  rs.next();
				     int cid=rs.getInt(1)+1; 
                                     String Eid="FB00"+cid; 
                                    String insertsql="insert into semail values(?,?,?,?)"; 
				     PreparedStatement ps=connect.prepareStatement(insertsql);
				    ps.setString(1, Eid);
				    ps.setString(2, f1); 
				    ps.setString(3, f2); 
				    ps.setString(4, f3);   
				    int i=ps.executeUpdate();
				    if(i!=0) 
				    {
                                        ss.mail(f1, f2, f3);
						ret= "Inserted";
				    }else {
						ret= "NotInserted";
				    }
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
           
           return ret;
       }
         public  String AddEShifts(String f1,String f2,String f3) { 
                System.out.println("price   1::"+f2);
           String sql="SELECT count(*) FROM empshifts ";
		  connect db = new connect();
			Connection connect=db.getConnection();
			String ret="";
                        try {
				Statement stmt=connect.createStatement();
				 ResultSet rs =stmt.executeQuery(sql);
					String utype="";
				  rs.next();
				     int cid=rs.getInt(1)+1; 
                                     String Eid="SF00"+cid; 
                                      Date edate=Date.valueOf(f3); 
                                    System.out.println(edate); 
                                    String insertsql="insert into empshifts values(?,?,?,?)"; 
				     PreparedStatement ps=connect.prepareStatement(insertsql);
				    ps.setString(1, Eid);
				    ps.setString(2, f1); 
				    ps.setString(3, f2); 
				    ps.setDate(4, edate);   
				    int i=ps.executeUpdate();
				    if(i!=0) 
				    {
						ret= "Inserted";
				    }else {
						ret= "NotInserted";
				    }
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
           
           return ret;
       }
          public  String DeleteEShifts(String f1) {
            
             String deletesql="delete FROM empshifts where Shiftid='"+f1+"'";
		  connect db = new connect();
			Connection connect=db.getConnection();
			String ret="";
			 try { PreparedStatement ps=connect.prepareStatement(deletesql); 
				    int i=ps.executeUpdate();
				    if(i!=0) 
				    {
						ret= "Deleted";
				    }else {
						ret= "NotDeleted";
				    }
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return ret;
       }
        public  String UpdateEShifts(String f1) {  
            connect db = new connect();
			Connection connect=db.getConnection();
			String ret=""; 
                         
			try { //String updatesql="update empshifts set shiftname=?, sdate=? where Shiftid=?"; 
				     PreparedStatement ps=connect.prepareStatement(f1);
//				     ps.setString(1, f1);
//				    ps.setDate(2, edate); 
//				    ps.setString(3, f2);  
				    int i=ps.executeUpdate();
				    if(i!=0) 
				    {
						ret= "Updated";
				    }else {
						ret= "NotUpdated";
				    }
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return ret;
       }
         public  String RequestLeave(String f1,String f2,String f3,String f4 ) {  
            connect db = new connect();
			Connection connect=db.getConnection();
			String ret="";  
                          String sql="SELECT count(*) FROM reqleave ";
			try {     
                            Statement stmt=connect.createStatement();
				 ResultSet rs =stmt.executeQuery(sql); 
				  rs.next();
                                   int cid=rs.getInt(1)+1; 
                                     String Eid="RL00"+cid;
                                        System.out.println("Eid :: "+Eid);
                                Date edate=Date.valueOf(f1); 
                                    System.out.println(edate);
                            String insql="insert into reqleave values(?,?,?,?,?,?)"; 
				  
                            PreparedStatement ps=connect.prepareStatement(insql); 
                              ps.setString(1, Eid);
				    ps.setDate(2, edate);
				    ps.setString(3, f2); 
				    ps.setString(4, f3); 
				    ps.setString(5, f4); 
				    ps.setString(6, "pending"); 
				    int i=ps.executeUpdate();
				    if(i!=0) 
				    {
						ret= "Inserted";
				    }else {
						ret= "NotInserted";
				    }
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return ret;
       }
public  String RequestMainte(String f1,String f2,String f3,String f4 ) {  
            connect db = new connect();
			Connection connect=db.getConnection();
			String ret="";  
                          String sql="SELECT count(*) FROM reqmainte ";
			try {     
                            Statement stmt=connect.createStatement();
				 ResultSet rs =stmt.executeQuery(sql); 
				  rs.next();
                                   int cid=rs.getInt(1)+1; 
                                     String Eid="RM00"+cid;
                                        System.out.println("Eid :: "+Eid);
                                Date edate=Date.valueOf(f1); 
                                    System.out.println(edate);
                            String insql="insert into reqmainte values(?,?,?,?,?,?)"; 
				  
                            PreparedStatement ps=connect.prepareStatement(insql); 
                              ps.setString(1, Eid);
				    ps.setDate(2, edate);
				    ps.setString(3, f2); 
				    ps.setString(4, f3); 
				    ps.setString(5, f4); 
				    ps.setString(6, "pending"); 
				    int i=ps.executeUpdate();
				    if(i!=0) 
				    {
						ret= "Maintenance";
				    }else {
						ret= "NotMaintenance";
				    }
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return ret;
       }
 public  String ApproveLeave(String f1) {  
            connect db = new connect();
			Connection connect=db.getConnection();
			String ret=""; 
                         
			try {    PreparedStatement ps=connect.prepareStatement(f1); 
				    int i=ps.executeUpdate();
				    if(i!=0) 
				    {
						ret= "Approve";
				    }else {
						ret= "NotApprove";
				    }
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return ret;
       }
       public  String ApproveMainten(String f1) {  
            connect db = new connect();
			Connection connect=db.getConnection();
			String ret=""; 
                         
			try {    PreparedStatement ps=connect.prepareStatement(f1); 
				    int i=ps.executeUpdate();
				    if(i!=0) 
				    {
						ret= "Maintenance";
				    }else {
						ret= "NotMaintenance";
				    }
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return ret;
       }
        public  String ApproveReject(String f1) {  
            connect db = new connect();
			Connection connect=db.getConnection();
			String ret=""; 
                         
			try {    PreparedStatement ps=connect.prepareStatement(f1); 
				    int i=ps.executeUpdate();
				    if(i!=0) 
				    {
						ret= "Reject";
				    }else {
						ret= "NotReject";
				    }
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return ret;
       }
        public  String RejectMainten(String f1) {  
            connect db = new connect();
			Connection connect=db.getConnection();
			String ret=""; 
                         
			try {    PreparedStatement ps=connect.prepareStatement(f1); 
				    int i=ps.executeUpdate();
				    if(i!=0) 
				    {
						ret= "MReject";
				    }else {
						ret= "NotMReject";
				    }
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return ret;
       }
        public  String CreateTask(String f1,String f2,String f3) {  
            connect db = new connect();
			Connection connect=db.getConnection();
			String ret="";  
                          String sql="SELECT count(*) FROM tasks ";
			try {     
                            Statement stmt=connect.createStatement();
				 ResultSet rs =stmt.executeQuery(sql); 
				  rs.next();
                                   int cid=rs.getInt(1)+1; 
                                     String Eid="CT00"+cid;
                                        System.out.println("Eid :: "+Eid);
                                 long millis=System.currentTimeMillis();  
                     java.sql.Date cdate=new java.sql.Date(millis);  
                                System.out.println(cdate);  ;
                            String insql="insert into tasks values(?,?,?,?,?,?)"; 
				  
                            PreparedStatement ps=connect.prepareStatement(insql); 
                              ps.setString(1, Eid);
				    ps.setString(2, f1);
				    ps.setString(3, f2); 
				    ps.setString(4, f3); 
				    ps.setDate(5, cdate);
				    ps.setString(6, "pending"); 
				    int i=ps.executeUpdate();
				    if(i!=0) 
				    {
						ret= "Inserted";
				    }else {
						ret= "NotInserted";
				    }
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return ret;
       }
        public  String UpdateTask(String f1) {  
            connect db = new connect();
			Connection connect=db.getConnection();
			String ret=""; 
                         
			try {    PreparedStatement ps=connect.prepareStatement(f1); 
				    int i=ps.executeUpdate();
				    if(i!=0) 
				    {
						ret= "Updatetask";
				    }else {
						ret= "NotUpdatetask";
				    }
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return ret;

}
   public  String RequestOrders(String f1,String f2,String f3,String f4,String f5) { 
           String sql="SELECT count(*) FROM itemrequest ";
		  connect db = new connect();
			Connection connect=db.getConnection();
			String ret="";
                        try { 
             
                       
                                    
                                      System.out.println("file name   ::"+f2);
 System.out.println("file name   ::"+f3);
 System.out.println("file name   ::"+f4);
 System.out.println("file name   ::"+f5); 
				Statement stmt=connect.createStatement();
				 ResultSet rs =stmt.executeQuery(sql); 
				  rs.next();
                                   int cid=rs.getInt(1)+1; 
                                     String Eid="RP00"+cid;
                                        System.out.println("Eid :: "+Eid); 
                                  String insql="insert into itemrequest values(?,?,?,?,?,?,?)"; 
				     PreparedStatement ps=connect.prepareStatement(insql);
				    ps.setString(1, Eid);
				    ps.setString(2, f1); 
				    ps.setString(3, f2);
				    ps.setString(4, f3); 
				    ps.setString(5, f4);   
				    ps.setString(6, f5);       
				    ps.setString(7, "Request");  
				    int i=ps.executeUpdate();
                                   if(i!=0) 
				    {
						ret= "Requested";
				    }else {
						ret= "NotRequested";
				    }
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
           
           return ret;
       }       
        
     public  String SellerRequest(String f1,String f2,String f3,String f4) { 
           String sql="SELECT count(*) FROM sellerres ";
		  connect db = new connect();
			Connection connect=db.getConnection();
			String ret="";
                        try { 
              System.out.println("file name   ::"+f1);
 System.out.println("file name   ::"+f2);  
				Statement stmt=connect.createStatement();
				 ResultSet rs =stmt.executeQuery(sql); 
				  rs.next();
                                   int cid=rs.getInt(1)+1; 
                                     String Eid="BPR0"+cid;
                                        System.out.println("Eid :: "+Eid); 
                                  String insql="insert into sellerres values(?,?,?,?,?,?)"; 
				     PreparedStatement ps=connect.prepareStatement(insql);
				    ps.setString(1, Eid);
				    ps.setString(2, f1); 
				    ps.setString(3, f2);
				    ps.setString(4, f4);
				    ps.setString(5, f3);        
				    ps.setString(6, "waiting");  
				    int i=ps.executeUpdate();
                                   if(i!=0) 
				    {
						ret= "PRequested";
				    }else {
						ret= "NotPRequested";
				    }
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
           
           return ret;
       }      
        
     public  String BuyerAccept(String f1,String f2,String f3,String f4,String f5) { 
           String sql="update itemrequest set icount=?,Status=? where id=? ";
		  connect db = new connect();
			Connection connect=db.getConnection();
			String ret="";
                        try { 
              System.out.println("file name   ::"+f1);
 System.out.println("file name   ::"+f2);  
				     PreparedStatement ps1=connect.prepareStatement(sql);
                                     ps1.setString(1, f5);
                                     ps1.setString(2, "Accepted");
				    ps1.setString(3, f2); 
				 int ii=ps1.executeUpdate();
				     if(ii!=0) {
                                        System.out.println("Eid :"); 
                                  String insql="update sellerres set Statuss=? where sid=?"; 
				     PreparedStatement ps=connect.prepareStatement(insql);
				    ps.setString(1, "Accepted");
				    ps.setString(2, f1);        
				    int i=ps.executeUpdate();
                                   if(i!=0) 
				    {
                                        String key="Product Order Accepted  Id::"+f1;
                                        String subject="Product Accepted  Succefully by "+f4;
//                                         ss.mail(f3, key, subject);
//                                         ss.mail(f4, key, subject);
                                          System.out.println("Eid :"); 
						ret= "BAccepted";
				    }else {
						ret= "NotBAccepted";
				    }
                                     }else {
						ret= "NotBAccepted";
				    }
                                     
                                   
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
           
           return ret;
       }  
     
     public  String BuyerReject(String f1,String f2,String f3,String f4) { 
           String sql="update itemrequest set Status=? where id=? ";
		  connect db = new connect();
			Connection connect=db.getConnection();
			String ret="";
                        try { 
              System.out.println("file name   ::"+f1);
 System.out.println("file name   ::"+f2);  
				   
				     
                                        System.out.println("Eid :"); 
                                  String insql="update sellerres set Statuss=? where sid=?"; 
				     PreparedStatement ps=connect.prepareStatement(insql);
				    ps.setString(1, "Rejected");
				    ps.setString(2, f1);        
				    int i=ps.executeUpdate();
                                   if(i!=0) 
				    {
                                        String key="Product Order Accepted Id::"+f1;
                                        String subject="Product Rejected by "+f4;
                                         
                                          System.out.println("Eid :"); 
						ret= "BRejected";
				    }else {
						ret= "NotBRejected";
				    }
                                      
                                     
                                   
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
           
           return ret;
       }    
     
        public  String RejectedTask(String f1) {  
            connect db = new connect();
			Connection connect=db.getConnection();
			String ret=""; 
                         
			try {    PreparedStatement ps=connect.prepareStatement(f1); 
				    int i=ps.executeUpdate();
				    if(i!=0) 
				    {
						ret= "RejectedTask";
				    }else {
						ret= "NotRejectedTask";
				    }
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return ret;

}
}
