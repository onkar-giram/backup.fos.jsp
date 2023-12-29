
<%@page import="com.bean.Bean"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="com.dao.*"%>
<%
    
    HttpSession mySession = request.getSession(); 
    Integer orderId = (Integer) mySession.getAttribute("orderId"); 
    int itemId = Integer.parseInt(request.getParameter("item_id"));
    Bean obj = new Bean();
    obj.setOrderId(orderId);
    obj.setItemId(itemId);
    int progress = Demo.insertOrderDetails(obj);
    if(progress == 1)
        out.println("Saved");
    else
        out.println("Failed");
%>