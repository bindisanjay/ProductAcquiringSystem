/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Maindata;

/**
 *
 * @author Lenovo
 */
public class item extends User {
    
    public String getdata(String st){
          item cat = new item(); 
    String ss= cat.AddCategory("ss");
    return ss;
    }
        public static void main(String[] args) {
     item cat = new item();
    cat.AddCategory("ss"); 
    }
}
