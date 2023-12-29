
<%@page import="com.bean.Bean"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="com.dao.*"%>
<% HttpSession mySession = request.getSession();  
    
    int itemId =Integer.parseInt((request.getParameter("itemId")));
    Bean obj = new Bean();
    obj.setItemId(itemId);
    int orderId = (Integer) mySession.getAttribute("orderId"); 
    obj.setOrderId(orderId);
    int progress = Demo.deleteItemFromCart(obj);
    if(progress == 1)
        out.println("Saved");
    else
        out.println("Failed");
%>