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
public class Employee {
    
    public String AddEmployee(String f1,String f2,String f3,String f4,String f5,String f6,String f7,String f8,String f9,String f10,String f11,String f12) {  
		  String sql="SELECT count(*) FROM Employee ";
		  connect db = new connect();
			Connection connect=db.getConnection();
			String ret="";
			
			try {
				Statement stmt=connect.createStatement();
				 ResultSet rs =stmt.executeQuery(sql);
					String utype="";
				  rs.next();
                                    Date edate=Date.valueOf(f4); 
                                    System.out.println(edate); 
				     int cid=rs.getInt(1)+1; 
                                     String Eid="EM00"+cid;
String insertsql="insert into Employee values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)"; 
				     PreparedStatement ps=connect.prepareStatement(insertsql);
				    ps.setString(1, Eid);
				    ps.setString(2, f1);
				    ps.setString(3, f2);
				    ps.setString(4, f3);
				    ps.setDate(5, edate); 
				    ps.setString(6, f5);
				    ps.setString(7, f6);
				    ps.setString(8, f7);
				    ps.setString(9, f8);
				    ps.setString(10, f9);
				    ps.setString(11,f10);
				    ps.setString(12,f11);
				    ps.setString(13,f12); 
				    ps.setString(14, "Active");
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
    
    
    
    public String DeleteEmployee(String f1) {  
		  String deletesql="delete FROM Employee where eid='"+f1+"'";
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
    
        public String UpdateEmployee(String f1,String f2,String f3,String f4,String f5,String f6,String f7,String f8,String f9,String f10) {  
		  
		  connect db = new connect();
			Connection connect=db.getConnection();
			String ret="";
			
			try {
				 
                                    Date edate=Date.valueOf(f2); 
                                    System.out.println(edate); 
String updatesql="update Employee set gender=?, doj=?, erole=?, password=?, address=?, shift=?, salary=?,edu=?,phone=? where eid=?"; 
				     PreparedStatement ps=connect.prepareStatement(updatesql);
				     ps.setString(1, f1);
				    ps.setDate(2, edate);
				    ps.setString(3, f3);
				    ps.setString(4, f4);
				    ps.setString(5, f5);
				    ps.setString(6, f6);
				    ps.setString(7, f7);
				    ps.setString(8, f8);
				    ps.setString(9, f9);
				    ps.setString(10,f10); 
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
    
    
    
    
}
