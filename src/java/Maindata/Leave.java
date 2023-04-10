/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Maindata;

/**
 *
 * @author Lenovo
 */
public class Leave extends User {
    
    public String getdata(String st){
        Leave ot = new Leave();
    String ss= ot.AddCategory("ss");
    return ss;
    }
        public static void main(String[] args) {
     Leave ot = new Leave();
    ot.AddCategory("ss"); 
    }
}
