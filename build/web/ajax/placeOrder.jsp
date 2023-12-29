
<%@page import="com.dao.Demo, com.bean.Bean, java.sql.*; "%>
<jsp:useBean id="obj" class="com.bean.Bean"/>  
  
<jsp:setProperty property="*" name="obj"/>  
  

<% 
    HttpSession mySession = request.getSession();
    int orderId = (Integer) mySession.getAttribute("orderId");
    
    obj.setOrderId(orderId);
    int progress = Demo.placeOrder(obj);
    
    if( progress == 1){
    out.println("order placed");
    }
    else {
    out.println("failed");
    }

%>