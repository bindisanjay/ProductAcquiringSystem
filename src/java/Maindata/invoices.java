/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Maindata;

import database.connect;
import java.sql.*;

/**
 *
 * @author Lenovo
 */
public class invoices extends User {
    
    public String getdata(String st){
        invoices ot = new invoices();
    String ss= ot.AddCategory("ss");
    return ss;
    }
    
    
    
    public static void main(String[] args) {
         String sql="select it.id,it.photo,it.name,it.category,it.Pcompany,it.price,it.discount,it.edate from orderdetails as od, cart as ct , item as it  where  od.cartoderid= ct.caid and ct.iid= it.id and od.id= 'OR001'";
         invoices ss=new invoices();
         
         try{
          connect db=new connect();
          Connection connect=db.getConnection(); 
          Statement stmt=connect.createStatement();
				 ResultSet rs =stmt.executeQuery(sql);
					int utype=0;
                while (rs.next()) {
                    utype+=  Integer.parseInt(rs.getString(6)); 
                     System.out.println("id ::"+rs.getString(1));
                     System.out.println("photo ::"+rs.getString(2));
                     System.out.println("utypeutype ::"+rs.getString(2));
                     System.out.println("utypeutype ::"+rs.getString(2));
                     System.out.println("utypeutype ::"+rs.getString(2));
                     System.out.println("utypeutype ::"+rs.getString(2));
                     System.out.println("utypeutype ::"+rs.getString(2));
                       }
                System.out.println("utypeutype ::"+utype);
         }catch(Exception e){
             e.printStackTrace();
         }}
    
}
