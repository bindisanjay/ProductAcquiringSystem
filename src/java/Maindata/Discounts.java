/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Maindata;

/**
 *
 * @author Lenovo
 */
public class Discounts extends User {
    
    public String getdata(String st){
        invoices ot = new invoices();
    String ss= ot.AddCategory("ss");
    return ss;
    }
    public static void main(String[] args) {
         String sql="select it.id,it.photo,it.name,it.category,it.Pcompany,it.price,it.discount,it.edate from orderdetails as od, cart as ct , item as it  where  od.cartoderid= ct.caid and ct.iid= it.id and od.id= 'OR001'";
         invoices ss=new invoices();
    }
}
