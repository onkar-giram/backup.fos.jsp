

<%@page import="com.dao.Demo, com.bean.Bean, java.sql.*; "%>
<jsp:useBean id="obj" class="com.bean.Bean"/>  
  
<jsp:setProperty property="*" name="obj"/>  
  

<% 
    HttpSession mySession = request.getSession();
    int tableNo = Integer.parseInt(request.getParameter("table_no"));
    mySession.setAttribute("tableNo",tableNo );

    System.out.println("Table no ("+ tableNo+") added to session");
 
%>