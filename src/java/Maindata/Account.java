/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Maindata;

/**
 *
 * @author Lenovo
 */
public class Account extends User {
    
    public String getdata(String st){
          Account cat = new Account(); 
    String ss= cat.AddCategory("ss");
    return ss;
    }
        public static void main(String[] args) {
     Account cat = new Account();
    cat.AddCategory("ss");
  cat.DeleteCategory("1");
  cat.updateCategory("1", "22");
    }
}
