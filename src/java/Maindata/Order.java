/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Maindata;

/**
 *
 * @author Lenovo
 */
public class Order extends User {
    
    public String getdata(String st){
        Order ot = new Order();
    String ss= ot.AddCategory("ss");
    return ss;
    }
        public static void main(String[] args) {
     Order ot = new Order();
    ot.AddCategory("ss"); 
    }
}
