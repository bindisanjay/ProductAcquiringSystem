/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Maindata;

/**
 *
 * @author Lenovo
 */
public class SendFeedback extends User {
    
    public String getdata(String st){
          SendFeedback cat = new SendFeedback(); 
    String ss= cat.AddCategory("ss");
    return ss;
    }
        public static void main(String[] args) {
     SendFeedback cat = new SendFeedback();
    cat.AddCategory("ss");
  cat.DeleteCategory("1");
  cat.updateCategory("1", "22");
    }
}
