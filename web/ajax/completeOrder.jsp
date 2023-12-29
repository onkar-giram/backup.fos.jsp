
<%@page import="com.bean.Bean"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="com.dao.*"%>
<%
    String fName =(request.getParameter("fName"));
    String lName =(request.getParameter("lName"));
    long mobNo =Long.parseLong((request.getParameter("mobNo")));
    String email =(request.getParameter("email"));
    int tabNo= Integer.parseInt((request.getParameter("tabNo")));
    Bean obj = new Bean();
    // System.out.println("name: "+fName+" "+lName+" Mob: "+mobNo+" email: "+email+" tabNO: "+tabNo);
    obj.setFirstName(fName);
    obj.setLastName(lName);
    obj.setMobileNo(mobNo);
    obj.setEmail(email);
    obj.setTableNo(tabNo);
    

    int prog = Demo.completeOrder(obj);
    if(prog == 1){
        System.out.println("completed Order Successfully");
    }
    else{
        System.out.println("Failure while completing order");
    }

%>