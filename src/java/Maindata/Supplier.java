/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Maindata;

/**
 *
 * @author Lenovo
 */
public class Supplier extends User {
    
    public String getdata(String st){
        Supplier ot = new Supplier();
    String ss= ot.AddCategory("ss");
    return ss;
    }
        public static void main(String[] args) {
     Supplier ot = new Supplier();
    ot.AddCategory("ss"); 
    }
}
