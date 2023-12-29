<%@page import="javax.swing.JOptionPane"%>
<%@page contentType="text/html" pageEncoding="UTF-8"  import="com.bean.Bean.* , com.dao.Demo , java.sql.* , com.connection.ConnectionProvider " %>


<jsp:useBean id="obj" class="com.bean.Bean"/>    
<jsp:setProperty property="*" name="obj"/>  
  
<%  
        String a = request.getParameter("mobileNo");
        long mobileNo = Long.parseLong(a);
        String password = request.getParameter("password");
        obj.setMobileNo(mobileNo);
        obj.setPassword(password);
        
        ResultSet rs = Demo.validateStaff(obj);  
        while(rs.next()){
        String status = rs.getString(1);

        if(status.equals("manager")){
        out.println("You r successfully logged in");  
        response.sendRedirect("managerLogin.jsp");  
        }
        if(status.equals("chef")){
        out.println("Logged in successfully");
        response.sendRedirect("chefLogin.jsp");
        }
        else 
        { 
        JOptionPane.showMessageDialog(null,"invalid mobile number or password, or maybe you haven't created account");  
        %>  
        <jsp:include page="forStaff.jsp"></jsp:include>  
        <%  
        }
}
%>  
