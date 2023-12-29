package com.dao;

import com.bean.Bean;
import com.connection.ConnectionProvider;
import java.sql.*;

public class Demo {

    public static int insertCustomerMaster(Bean obj) {
        int progress = 0;
        try {
            Connection con = ConnectionProvider.getConnection();
            PreparedStatement pst = con.prepareStatement("insert into customer_mst values(?,?,?,?,?,?)");
            pst.setInt(1, obj.getCustomerId());
            pst.setString(2, obj.getFirstName());
            pst.setString(3, obj.getLastName());
            pst.setLong(4, obj.getMobileNo());
            pst.setString(5, obj.getEmail());
            pst.setString(6, obj.getPassword());

            progress = pst.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex.toString());
        }
        return progress;
    }

    public static int insertOrderDetail(Bean obj) {
        int progress = 0;
        try {
            Connection con = ConnectionProvider.getConnection();
            PreparedStatement pst = con.prepareStatement("");

        } catch (Exception ex) {
            System.out.println(ex.toString());
        }
        return progress;
    }

    public static int insertCustomerFeedback(Bean obj) {
        int progress = 0;
        try {
            Connection con = ConnectionProvider.getConnection();
            PreparedStatement pst = con.prepareStatement("insert into feedback_mst values(?,?,?,?,?)");
            pst.setInt(1, obj.getFeedbackId());
            pst.setString(2, obj.getName());
            pst.setString(3, obj.getEmail());
            pst.setString(4, obj.getFeedback());
            pst.setString(5, obj.getStatus());

            progress = pst.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex.toString());
        }
        return progress;
    }

    public static ResultSet fetchFeedbacks() {
        ResultSet rs = null;
        try {
            Connection con = ConnectionProvider.getConnection();
            PreparedStatement pst = con.prepareStatement("select name,email,feedback from feedback_mst where status = 'unread'");

            rs = pst.executeQuery();

        } catch (Exception ex) {
            System.out.println(ex.toString());
        }
        return rs;
    }

    public static int updateFeedbackStatus(String a, String b, String c) {
        int progress = 0;
        try {
            Connection con = ConnectionProvider.getConnection();
            PreparedStatement pst = con.prepareStatement("update feedback_mst SET status = 'read' where name = ?");
 
            progress = pst.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex.toString());
        }
        return progress;
    }

    public static boolean validate(Bean obj) {
        boolean status = false;
        try {
            Connection con = ConnectionProvider.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from customer_mst where mobile_no =? and password=?");

            pst.setLong(1, obj.getMobileNo());
            pst.setString(2, obj.getPassword());

            ResultSet rs = pst.executeQuery();
            status = rs.next();

        } catch (Exception e) {
        }

        return status;

    }

    public static int insertOrder(Bean obj) {
        int progress = 0;
        try {
            Connection con = ConnectionProvider.getConnection();
            PreparedStatement pst = con.prepareStatement("insert into order_mst values(?,?,?,?);");
            pst.setInt(1, obj.getOrderId());
            pst.setInt(2, obj.getCustomerId());
            pst.setInt(3, obj.getTableNo());
            pst.setString(4, "ordered");
            progress = pst.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex.toString());
        }
        return progress;
    }

    public static ResultSet fetchCuId(Bean obj) {
        ResultSet rs = null;
        try {
            Connection con = ConnectionProvider.getConnection();
            PreparedStatement pst = con.prepareStatement("select customer_id from customer_mst where mobile_no =? and password=?");

            pst.setLong(1, obj.getMobileNo());
            pst.setString(2, obj.getPassword());

            rs = pst.executeQuery();

        } catch (Exception e) {
        }

        return rs;

    }

    public static ResultSet fetchOrderId(Bean obj) {
        ResultSet rs = null;
        try {
            Connection con = ConnectionProvider.getConnection();
            PreparedStatement pst = con.prepareStatement("select order_id from order_mst where customer_id = ? and status = ?");

            pst.setInt(1, obj.getCustomerId());
            pst.setString(2, "ordered");
            rs = pst.executeQuery();
        } catch (Exception e) {
        }
        return rs;
    }

    public static int insertOrderDetails(Bean obj) {
        int progress = 0;
        try {
            Connection con = ConnectionProvider.getConnection();
            PreparedStatement pst = con.prepareStatement("insert into order_details values(?,?,?,?)");
            pst.setInt(1, obj.getOrderDetailId());
            pst.setInt(2, obj.getOrderId());
            pst.setInt(3, obj.getItemId());
            pst.setString(4, "cart");
            progress = pst.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
        return progress;
    }

    public static ResultSet fetchOrderCart(Bean obj) {
        ResultSet rs = null;
        try {
            Connection con = ConnectionProvider.getConnection();
            PreparedStatement pst = con.prepareStatement("select mm.dish_name, mm.type, mm.price, od.item_id from menu_mst mm , order_details od where mm.item_id = od.item_id and od.order_id = ? and od.order_status=?;");
            pst.setInt(1, obj.getOrderId());
            pst.setString(2, "cart");
            rs = pst.executeQuery();
        } catch (Exception e) {System.out.println(e);
        }
        return rs;
    }

     public static ResultSet fetchOrderManagerCart() {
        ResultSet rs = null;
        try {
            Connection con = ConnectionProvider.getConnection();
            PreparedStatement pst = con.prepareStatement("select cm.first_name, cm.last_name,cm.mobile_no , cm.email,om.table_no, mm.dish_name, mm.type, mm.price , od.order_status from menu_mst mm , order_details od, customer_mst cm ,order_mst om where cm.customer_id = om.customer_id and om.order_id= od.order_id and mm.item_id = od.item_id and od.order_status=?");
            pst.setString(1, "ordered");
            rs = pst.executeQuery();
        } catch (Exception e) {
        }
        return rs;
    }

    public static ResultSet fetchOrderChefCart(Bean obj) {
        ResultSet rs = null;
        try {
            Connection con = ConnectionProvider.getConnection();
            PreparedStatement pst = con.prepareStatement("select om.table_no, mm.dish_name, mm.type, mm.price , od.order_status from fos.menu_mst mm , fos.order_details od, fos.customer_mst cm ,fos.order_mst om where cm.customer_id = om.customer_id and om.order_id= od.order_id and mm.item_id = od.item_id and od.order_status=?");
            pst.setString(1, "ordered");
            rs = pst.executeQuery();
        } catch (Exception e) {
        }
        return rs;
    }

    public static int insertInquiry(Bean obj) {
        int progress = 0;
        try {
            Connection con = ConnectionProvider.getConnection();
            PreparedStatement pst = con.prepareStatement("insert into inquiries_mst values(?,?,?,?,?,?)");
            pst.setInt(1, obj.getInquiryId());System.out.println(obj.getInquiryId());
            pst.setString(2, obj.getName());System.out.println(obj.getName());
            pst.setLong(3,obj.getMobileNo());System.out.println(obj.getMobileNo());
            pst.setString(4, obj.getEmail());System.out.println(obj.getEmail());
            pst.setString(5, obj.getInquiry());System.out.println(obj.getInquiry());
            pst.setString(6, "unread");

            progress = pst.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex.toString());
        }
        return progress;
    }
    

    public static ResultSet fetchInquiries() {
        ResultSet rs = null;
        try {
            Connection con = ConnectionProvider.getConnection();
            PreparedStatement pst = con.prepareStatement("select name,mobile,email,inquiry from inquiries_mst where status = 'unread'");

            rs = pst.executeQuery();

        } catch (Exception ex) {
            System.out.println(ex.toString());
        }
        return rs;
    }
    

    public static ResultSet validateStaff(Bean obj) {
        ResultSet rs = null ;
        try {
            Connection con = ConnectionProvider.getConnection();
            PreparedStatement pst = con.prepareStatement("select status from staff_mst where mobile_no =? and password=?");
            pst.setLong(1, obj.getMobileNo());
            pst.setString(2, obj.getPassword());

            rs = pst.executeQuery();

        } catch (Exception e) {System.out.println(e);
        }

        return rs;

    }

    public static int insertStaff(Bean obj) {
        int progress = 0;
        try {
            Connection con = ConnectionProvider.getConnection();
            PreparedStatement pst = con.prepareStatement("insert into staff_mst values(?,?,?,?,?,?,?)");
            pst.setInt(1,obj.getStaffId());
            pst.setString(2, obj.getFirstName());
            pst.setString(3, obj.getLastName());
            pst.setLong(4, obj.getMobileNo());
            pst.setString(5, obj.getEmail());
            pst.setString(6, obj.getPassword());
            pst.setString(7, obj.getStatus());
            progress = pst.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex.toString());
        }
        return progress;
    }
    
    public static int changePassword(Bean obj){
    int progress = 0;
    try{
        Connection con = ConnectionProvider.getConnection();
        PreparedStatement pst = con.prepareStatement("update customer_mst set password = ? where mobile_no = ?");
        pst.setString(1, obj.getPassword());
        pst.setLong(2, obj.getMobileNo());
        progress = pst.executeUpdate();
    }catch(Exception e){System.out.println(e);}
    return progress;
    }
    
    public static int deleteFeedback(Bean obj){
    int progress = 0;
    try{
        Connection con= ConnectionProvider.getConnection();
        PreparedStatement pst = con.prepareStatement("update feedback_mst set status = 'read' where name = ? and email = ? and feedback = ?");
        pst.setString(1, obj.getName());
        pst.setString(2, obj.getEmail());
        pst.setString(3, obj.getFeedback());
        progress = pst.executeUpdate();
    }catch(Exception e){System.out.println(e);}
    return progress;
    }
    
        public static int deleteEnquiry(Bean obj){
    int progress = 0;
    try{
        Connection con= ConnectionProvider.getConnection();
        PreparedStatement pst = con.prepareStatement("update inquiries_mst set status='read' where name=? and email=? and inquiry=?");
        pst.setString(1, obj.getName());
        pst.setString(2, obj.getEmail());
        pst.setString(3, obj.getInquiry());
        progress = pst.executeUpdate();
    }catch(Exception e){System.out.println(e);}
    return progress;
    }
    
    public static int customerSignOut(Bean obj){
    int progress = 0;
    try{
    Connection con= ConnectionProvider.getConnection();
    PreparedStatement pst = con.prepareStatement("update order_mst set status = 'signedOut' where customer_id = ? and order_id=?");
    pst.setInt(1, obj.getCustomerId());
    pst.setInt(2, obj.getOrderId());
    progress = pst.executeUpdate();
    }catch(Exception e){System.out.println(e);}
    return progress;
    }
    
    public static int deleteItemFromCart(Bean obj){
    int progress = 0;
    try{
        Connection con= ConnectionProvider.getConnection();
        PreparedStatement pst = con.prepareStatement("update order_details set order_status='deleted' where order_id=? and item_id=?");
        pst.setInt(1, obj.getOrderId());
        pst.setInt(2, obj.getItemId());
        progress = pst.executeUpdate();
    }catch(Exception e){System.out.println(e);}
    return progress;
    }
    
    public static int placeOrder(Bean obj){
    int progress = 0;
    try{
        Connection con= ConnectionProvider.getConnection();
        PreparedStatement pst= con.prepareStatement("update order_details set order_status='ordered' where order_id =? and order_status= 'cart' ");
        pst.setInt(1, obj.getOrderId());
        progress = pst.executeUpdate();
    }catch(Exception e){System.out.println("Place Order():"+e);}    
        
    return progress;
    }
    
    
    public static ResultSet seeHistory(Bean obj){
    ResultSet rs = null;
    try{
        Connection con= ConnectionProvider.getConnection();
        PreparedStatement pst= con.prepareStatement("select mm.dish_name, mm.type, mm.price, od.item_id from menu_mst mm , order_details od where mm.item_id = od.item_id and od.order_id = ? and od.order_status='ordered';");
        pst.setInt(1, obj.getOrderId());
        rs = pst.executeQuery();
    }catch(Exception e){System.out.println("seeHistory():"+e);}    
        
    return rs;
    }
    
     public static ResultSet fetchOrderManagerCartDemo() {
        ResultSet rs = null;
        try {
            Connection con = ConnectionProvider.getConnection();
            PreparedStatement pst = con.prepareStatement("select cm.customer_id, cm.first_name, cm.last_name,cm.mobile_no , cm.email,om.table_no from order_details od, customer_mst cm ,order_mst om where cm.customer_id = om.customer_id and om.order_id= od.order_id and od.order_status=? group by(cm.first_name);");
            pst.setString(1, "ordered");
            rs = pst.executeQuery();
        } catch (Exception e) {
        }
        return rs;
    }
     
    public static ResultSet fetchOrderManagerCartDemo1(Bean obj){
        ResultSet rs = null;
        try{
            Connection con = ConnectionProvider.getConnection();
            PreparedStatement pst = con.prepareStatement("select mm.dish_name, mm.type, mm.price from order_mst om, menu_mst mm , order_details od where mm.item_id = od.item_id and od.order_id = om.order_id and od.order_status=? and om.customer_id=? ;");
            pst.setString(1,"ordered");
            pst.setInt(2, obj.getCustomerId());
            rs = pst.executeQuery();
        }catch(Exception e){System.out.println("fetchOrderManagerCartDemo1: "+e);}
        return rs;
    }
    
    public static ResultSet fetchCompletedOrders(){
        ResultSet rs = null;
        try {
            Connection con = ConnectionProvider.getConnection();
            PreparedStatement pst = con.prepareStatement("select cm.customer_id, cm.first_name, cm.last_name,cm.mobile_no , cm.email,om.table_no from order_details od, customer_mst cm ,order_mst om where cm.customer_id = om.customer_id and om.order_id= od.order_id and od.order_status=? group by(cm.first_name);");
            pst.setString(1, "delivered");
            rs = pst.executeQuery();
        } catch (Exception e) {
        }    
        return rs;
    }
    
    public static ResultSet fetchCompletedOrders(Bean obj){
        ResultSet rs = null;
        try{
            Connection con = ConnectionProvider.getConnection();
            PreparedStatement pst = con.prepareStatement("select mm.dish_name, mm.type, mm.price from order_mst om, menu_mst mm , order_details od where mm.item_id = od.item_id and od.order_id = om.order_id and od.order_status=? and om.customer_id=? ;");
            pst.setString(1,"delivered");
            pst.setInt(2, obj.getCustomerId());
            rs = pst.executeQuery();
        }catch(Exception e){System.out.println("fetchCompletedOrders: "+e);}
        return rs;
    }
    
    public static int completeOrder(Bean obj) {
        int progress = 0;
        ResultSet rs = null;
        try {
            
            Connection con = ConnectionProvider.getConnection();
            PreparedStatement pst = con.prepareStatement("select customer_id from customer_mst where first_name = ? and last_name = ? and mobile_no = ?");
            pst.setString(1, obj.getFirstName());
            pst.setString(2, obj.getLastName());
            pst.setLong(3, obj.getMobileNo());
            rs = pst.executeQuery();
            
           while(rs.next()){
                System.out.println(rs.getInt(1));
                obj.setCustomerId(rs.getInt(1));
            }
            
            pst = con.prepareStatement("SELECT order_id FROM fos.order_mst where customer_id = ? and status = 'ordered' ORDER BY order_id DESC LIMIT 1");
            pst.setInt(1, obj.getCustomerId());
            rs = pst.executeQuery();
            
            while(rs.next()){
                System.out.print(rs.getInt(1));
                obj.setOrderId(rs.getInt(1));
            }
            
            pst = con.prepareStatement("UPDATE fos.order_details SET order_status = 'delivered' WHERE order_id = ? and order_status = 'ordered';");
            pst.setInt(1, obj.getOrderId());
            progress = pst.executeUpdate();
            
        } catch (Exception e) {
            System.out.println(e.toString());
        }

        return progress;
    }
    
    
    public static int payOrder(Bean obj) {
        int progress = 0;
        ResultSet rs = null;
        try {
            Connection con = ConnectionProvider.getConnection();
            PreparedStatement pst = con.prepareStatement("select customer_id from customer_mst where first_name = ? and last_name = ? and mobile_no = ?");
            pst.setString(1, obj.getFirstName());
            pst.setString(2, obj.getLastName());
            pst.setLong(3, obj.getMobileNo());
            rs = pst.executeQuery();
            
            while(rs.next()){
                obj.setCustomerId(rs.getInt(1));
            }
            
            pst = con.prepareStatement("SELECT order_id FROM fos.order_mst where customer_id = ? and status = 'ordered' ORDER BY order_id DESC LIMIT 1");
            pst.setInt(1, obj.getCustomerId());
            rs = pst.executeQuery();
            
            while(rs.next()){
                System.out.print(rs.getInt(1));
                obj.setOrderId(rs.getInt(1));
            }
            
            pst = con.prepareStatement("UPDATE fos.order_details SET order_status = 'paid' WHERE order_id = ? and order_status = 'delivered';");
            pst.setInt(1, obj.getOrderId());
            progress = pst.executeUpdate();
            
        } catch (Exception e) {
            System.out.println(e.toString());
        }

        return progress;
    }
   
    public static void main(String args[]) {
        Demo obj = new Demo();

    }
}
