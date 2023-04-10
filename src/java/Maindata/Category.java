/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Maindata;

/**
 *
 * @author Lenovo
 */
public class Category extends User {
    
    public String getdata(String st){
          Category cat = new Category(); 
    String ss= cat.AddCategory("ss");
    return ss;
    }
//    public static void main(String[] args) {
//     
//    Category cat = new Category(); 
//    cat.AddCategory("ss");
//  cat.DeleteCategory("1");
//  cat.updateCategory("1", "22");
//    }
}
