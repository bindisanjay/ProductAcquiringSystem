/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Maindata;

/**
 *
 * @author Lenovo
 */
public class SendEmail extends User {
    
    public String getdata(String st){
          SendEmail cat = new SendEmail(); 
    String ss= cat.AddCategory("ss");
    return ss;
    }
        public static void main(String[] args) {
     SendEmail cat = new SendEmail();
    cat.AddCategory("ss");
  cat.DeleteCategory("1");
  cat.updateCategory("1", "22");
    }
}
