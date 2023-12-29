<%@page import="javax.swing.JOptionPane"%>
<%@page contentType="text/html" pageEncoding="UTF-8"  import="com.bean.Bean.* , com.dao.Demo , java.sql.* , com.connection.ConnectionProvider " %>


<jsp:useBean id="obj" class="com.bean.Bean"/>  
  
<jsp:setProperty property="*" name="obj"/>  
  
<%  

    
       
HttpSession mySession = request.getSession();    
   
        String a = request.getParameter("cMobileNo");
        long mobileNo = Long.parseLong(a);
        String password = request.getParameter("cPassword");
        obj.setMobileNo(mobileNo);
        obj.setPassword(password);

        Boolean status = Demo.validate(obj);  
        if(status){
        out.println("You r successfully logged in");  
        response.sendRedirect("home.jsp");


     
    obj.setMobileNo(mobileNo);
    obj.setPassword(password);
    ResultSet rs = Demo.fetchCuId(obj);{
    while(rs.next()) {
        int customerId= rs.getInt(1);
    mySession.setAttribute("customerId", customerId);

    }
}
              int TableNo = (Integer) mySession.getAttribute("tableNo"); 
              int cId = (Integer) mySession.getAttribute("customerId"); 
              obj.setCustomerId(cId);
              obj.setTableNo(TableNo);
              int prog = Demo.insertOrder(obj);    
                if(prog == 1)
		{System.out.println("insertion in order_mst successful");
                }
		else
		{System.out.println("Insertion in order_mst failed");
                }
               
                obj.setCustomerId(cId);
                    ResultSet rs1 = Demo.fetchOrderId(obj);{
                    while(rs1.next()) {
                    mySession.setAttribute("orderId", rs1.getInt(1));
                    
}
}                    
}  
else 
{out.println("logging in failed, check if you have created an account.");
%>  
<jsp:include page="index.jsp"></jsp:include>  
<%  
}  
%>  

<!--


HttpSession mySession = request.getSession();
while(rs.next()) {   
mySession.setAttribute("customerId", rs.getInt(1));
}
System.out.println(mySession.getAttribute("customerId")); 

    obj.setCustomerId(a);
            obj.setTableNo(1);
                int prog = Demo.insertOrder(obj);    
                if(prog == 1)
		{System.out.println("insertion in order success");
		}
		else
		{System.out.println("Insertion in order failed");
                }


              
          if(request.getParameter("submit").equals("Go to website")){
             
          }


    Statement statement = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);

    ResultSet rs = statement.executeQuery("select item_id from menu_mst where ");
    while (rs.next()) {
                int itemId = rs.getInt(1);



-->