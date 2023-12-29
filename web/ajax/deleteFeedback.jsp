
<%@page import="com.bean.Bean"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="com.dao.*"%>
<%
    
    String name =(request.getParameter("name"));
    String email =(request.getParameter("email"));
    String feedback= (request.getParameter("feedback"));
    Bean obj = new Bean();
    obj.setName(name);
    obj.setEmail(email);
    obj.setFeedback(feedback);
    int progress = Demo.deleteFeedback(obj);
    if(progress == 1)
        out.println("Saved");
    else
        out.println("Failed");
%>