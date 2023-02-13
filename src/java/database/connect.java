package database;

import java.sql.*;

public class connect {
	static Connection con;
	public  Connection getConnection() {
		// TODO Auto-generated constructor stub
  try {     Class.forName("com.mysql.jdbc.Driver");
	  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Product","root","");
 }
catch(Exception e)
{
System.out.println(e);
}
  return con;
	}
public String managerregister(String name,String email,String Phone,String gender,String password,String sq,String sa,String role) {  
		  String sql="SELECT count(*) FROM Manager ";
		  connect db = new connect();
			Connection connect=db.getConnection();
			String ret="";
			
			try {
				Statement stmt=connect.createStatement();
				 ResultSet rs =stmt.executeQuery(sql);
					String utype="";
				  rs.next();
				     int countid=rs.getInt(1)+1;  
					  String insertsql="insert into Manager values(?,?,?,?,?,?,?,?,?,?)"; 
				     PreparedStatement ps=connect.prepareStatement(insertsql);
				    ps.setString(1, ""+countid);
				    ps.setString(2, name);
				    ps.setString(3, email);
				    ps.setString(4, Phone);
				    ps.setString(5, gender);
				    ps.setString(6, password);
				    ps.setString(7, sq);
				    ps.setString(8, sa);
				    ps.setString(9, role);
				    ps.setString(10, "Active");
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
public String managerlogin(String email,String password) {  
		  String sql="SELECT * FROM Manager where emailid='"+email+"' and password='"+password+"' and role='Seller' and status='Active' ";
		  connect db = new connect();
			Connection connect=db.getConnection();
			String ret="";
			
			try {
                            System.out.println("SQL ::"+sql);
				Statement stmt=connect.createStatement();
				 ResultSet rs =stmt.executeQuery(sql);
					String utype="";
				  if(rs.next()){
				     
						ret= "valid";
				    }else {
						ret= "invalid";
				    }
			} catch (SQLException e) {
				// TODO Auto-generated catch block
                            System.out.println("Error"+e);
                            ret= "invalid"; 
			}
			return ret;
	 
	}
public String Employeelogin(String email,String password) {  
		  String sql="SELECT * FROM Manager where emailid='"+email+"' and password='"+password+"' and role='Buyer' and status='Active' ";
		  connect db = new connect();
			Connection connect=db.getConnection();
			String ret="";
			
			try {
                            System.out.println("SQL ::"+sql);
				Statement stmt=connect.createStatement();
				 ResultSet rs =stmt.executeQuery(sql);
					String utype="";
				  if(rs.next()){
				     String ss=rs.getString(2);
				     String sid=rs.getString(1);
						ret= "valid-"+ss+"-"+sid;
				    }else {
						ret= "invalid-mm";
				    }
			} catch (SQLException e) {
				// TODO Auto-generated catch block
                             System.out.println("Error"+e);
                            ret= "invalid"; 
			}
			return ret;
		   
	 
	}
	
public static void main(String[] arg)
	{

		try {
		  connect db = new connect();
		//  String dbs=db.managerregister("name", "email", "Phone", "gender", "password","sq", "sa");
//		  Connection connect=db.getConnection();
//		  Statement stmt=connect.createStatement();
//
//		  String sql="SELECT count(*) FROM user ";
//			 ResultSet rs =stmt.executeQuery(sql);
//				String utype="";
//			  rs.next();
//			     int countid=rs.getInt(1)+1; 
    //System.out.println("data "+dbs);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
}
