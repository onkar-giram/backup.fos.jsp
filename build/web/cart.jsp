
<%@page contentType="text/html" pageEncoding="UTF-8"  import="com.bean.Bean.* , com.dao.Demo , java.sql.*"  %>
<html>
<head>
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=0.69"/>
    <!-- CSS -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"/>
    <link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
    <link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"/>

    <link rel="stylesheet" href="font/material-icons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">
    <script src="https://code.jquery.com/jquery-3.2.1.min.js" type="text/javascript"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
    <style>
.Site {
  display: flex;
  min-height: 100vh;
  flex-direction: column;
}

.Site-content {
  flex: 1;
}
    </style>
    <script>
      <!-- Initialization of JQuery -->
      $(document).ready(function () {
      $(".modal").modal();
        $(".button-collapse").sideNav();
      });
      
          $(document).on({
    "contextmenu": function(e) {
        console.log("ctx menu button:", e.which); 

        // Stop the context menu
        e.preventDefault();
    },
    "mousedown": function(e) { 
        console.log("normal mouse down:", e.which); 
    },
    "mouseup": function(e) { 
        console.log("normal mouse up:", e.which); 
    }
});
      
    </script>
</head>
<body class="Site"S>
  
    	<jsp:useBean id="obj" class="com.bean.Bean" />
	<jsp:setProperty property="*" name="obj" />


    
<%
    HttpSession mySession = request.getSession();  

if(request.getParameter("hiddenField") != null){

	if(request.getParameter("submit").equals("Submit")){	
            obj.setStatus("unread");
		int prog = Demo.insertCustomerFeedback(obj) ;
		if(prog == 1)
		{System.out.println("Success");
		}
		else
		{System.out.println("Failed");
		}
	}
        if(request.getParameter("submit").equals("Logout")){

            int cId = (Integer) mySession.getAttribute("customerId");
            int orderId=(Integer) mySession.getAttribute("orderId");
            obj.setCustomerId(cId);
            obj.setOrderId(orderId);
            int prog = Demo.customerSignOut(obj);
            if(prog == 1){
                System.out.println("Successfully logged Out");
                response.sendRedirect("index.jsp");
            }
            else{
                System.out.println("Failure while logging out");
            }
        }        
}

 %>	

 
    
    
    <!-- Section: Nav Bar -->
    <!-- Section: Nav Bar -->
    <!-- Section: Nav Bar -->
    
    <nav class="black lighten-1" role="navigation">
      <div class="nav-wrapper">
          <a id="logo-container" href="home.jsp" class="brand-logo hide-on-med-and-down" style="padding-left: 150px" >Hotel Flora-inn</a>
          <a id="logo-container" href="home.jsp" class="brand-logo hide-on-large-only" >Hotel Flora-inn</a>
        <ul class="right hide-on-med-and-down" style="padding-right: 100px;">
                <li><a href="home.jsp">Home</a></li>
                <li><a href="foodItems.jsp">Food Items</a></li>
                <li><a href="cart.jsp">Cart</a></li>
                <li><a class="modal-trigger" href="#feedback">Feedback</a></li>
                <li> <a href="#signOut" class="modal-trigger white black-text waves-effect waves-light btn" >Logout</a> </li>
        </ul>

        <ul id="nav-mobile" class="sidenav">
                <li><a href="home.jsp">Home</a></li>
                <li><a href="foodItems.jsp">Food Items</a></li>
                <li><a href="cart.jsp">Cart</a></li>
                <li><a class="modal-trigger" href="#feedback">Feedback</a></li>
                <li> <a href="#signOut" class="modal-trigger black white-text waves-effect waves-light btn" >Logout</a> </li>
        </ul>
        <a href="#" data-target="nav-mobile" class="sidenav-trigger"
          ><i class="material-icons">menu</i></a
        >
      </div>
    </nav>


    <!-- Section: Modal (Sign-Out) -->
    <!-- Section: Modal (Sign-Out) -->
    
    <div class="modal" id="signOut">
        <div class="modal-content"><form><h3 class="black white-text center">Logout</h3><br>
                <table>
                    <tr>
                        <td>
                             Are you sure you want to Log out? All the items in the cart will be deleted.
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input class="form-control" type="hidden" name="hiddenField" value="hidden"/>
                        </td>
                    </tr> 
                    <tr>
                        <td>
                             <input type="submit" value="Logout" name="submit" class="btn black white-text" />
                        </td>
                    </tr>                    
                </table>
            </form>
        </div>
    </div>
    
        <!-- Section: Modal (history) -->
    
    <div class="modal" id="history">
        <div class="modal-content"><form><h3 class="black white-text center">Order Details</h3><br>

    <table>    
        <thead class="grey darken-1 white-text">
	<tr>
		<td>Sr.No</td>	
		<td>Item Name</td>
		<td>Type</td>
		<td>Price</td>
                <td></td>
        	</tr>
	</thead>          
        
                  <%
                  float total = 0;
                  int orderID = (Integer)mySession.getAttribute("orderId");
                  obj.setOrderId(orderID);
                  ResultSet rs = Demo.seeHistory(obj);
                  int j = 1;
                  while(rs.next()){           
                  %>   
                 
			<tbody><tr>
				<td> <%=j++ %> </td>
				<td> <%=rs.getString(1) %> </td>
				<td> <%=rs.getString(2) %> </td>
				<td> <%=rs.getFloat(3) %> </td>
               		</tr>			
		</tbody>
               <%total += rs.getFloat(3);}%>

    </table>
            
            </form>
        </div>
<div class="grey darken-1 white-text"><h5>Total = Rs.<%= total%>  </h5></div>  
    </div>
    
        
   
<!-- Section: Feedback -->  
<!-- Section: Feedback -->
 
 <div id="feedback" class="modal">
     <div class=" modal-content ">
         <h3 class="center black white-text"> Feedback </h3>
        <form>
	<table>
		<tr>
                    <td>
                        Your Name
                    </td>
                    <td>				
				<input class="form-control" type="text" name="name" id="name" required/>
                    </td>
		</tr>
		<tr>	
			<td>
			Email
			</td>
			<td>				
				<input class="form-control validate" type="email"  name="email" id="email" required/>
			</td>
		</tr>
                <tr>
                    <td>
                    Feedback:         
                    </td>   
                    <td>
                        <textarea type="text" class=" materialize-textarea validate form-control" id="feedback" name="feedback" ></textarea>     
                    </td>
                </tr>
                
		<tr>	
			<td>				
				<input class="form-control" type="hidden" name="hiddenField" value="hidden" />
			</td>
		</tr>
		<tr>
		<br>		
		<td colspan="2">
		
		
			<input class="btn black" type="submit" name="submit" value="Submit"/>
		</td>
		</tr>
		</table>
	</form>	
    </div>
</div>


<main class="Site-content">  <!--Cart-->
    <table>    
        <thead class=" grey darken-1 white-text">
	<tr>
            <td class="center">Sr.No</td>	
		<td class="center">Item Name</td>
		<td class="center">Type</td>
		<td class="center">Price</td>
                <td></td>
                <td><button onclick="window.location.reLoad()" href="#history" class="wrap-content btn black white-text modal-trigger">View</button></td>

	</tr>
	</thead>	
	<% float sum=0;
              int orderId = (Integer) mySession.getAttribute("orderId"); 
              obj.setOrderId(orderId);
            ResultSet Rs = Demo.fetchOrderCart(obj);
	int i = 1;
        
		while(Rs.next()){
			%>
			<tbody><tr>
                                <td class="center"> <%=i++ %> </td>
				<td class="center"> <%=Rs.getString(1) %> </td>
				<td class="center"> <%=Rs.getString(2) %> </td>
				<td class="center"> <%=Rs.getFloat(3) %> </td>
                               
                                <td  class="center"> <button class="btn black waves-effect waves-light hoverable" onclick="deleteFromCart(<%=Rs.getString(4)%>)">Delete</button></td>
               		</tr>			
		</tbody>
			<% sum+=Rs.getFloat(3);  } 
			%> 
</table>		 
</main>  

                        <div style="padding-right: 10%; " class="show-on-small hide-on-med-and-up right-align grey darken-1 white-text"><h5>Total = Rs.<%= sum%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button onClick="placeOrder()" class="btn black hoverable waves-effect waves-light">Place Order </button></h5></div>    
                        <div style="padding-right: 10%;" class="hide-on-small-and-down right-align grey darken-1 white-text"><h4> Total = Rs.<%= sum%>&nbsp;&nbsp;&nbsp;&nbsp; <button onClick="placeOrder()" class="btn black hoverable waves-effect waves-light">Place Order</button></h4></div>    

 <!-- Footer -->
    <footer class="black page-footer orange" style="left: 0; bottom: 0; width: 100%;">
      <div class="container">
        <div class="row">
          <div class="col l8 s12">
            <h5 class="white-text">Hotel Flora-inn</h5>
            <p class="grey-text text-lighten-4">
              Jalna Industrial Area MIDC, Jalna, 
              Maharashtra 431213 Jalna India 431213 <br> 
              Celebrated as one of the city's best is, Flora Inn Hotel in Jalna.
              The hotel is strategically located in Aurangabad Road. 
              Having been established in the year 2010, this hospitality destination
              has grown to become the ideal place for travelers and those on business
              to feel at home when in the city.
            </p>
          </div>

          <div class="col l3 s12 offset-l1">
            <h5 class="white-text">Links</h5>
            <ul>
                <li><a class="white-text" href="home.jsp">Home</a></li>
                <li><a class="white-text" href="foodItems.jsp">Food Items</a></li>
                <li><a class="white-text" href="cart.jsp">Cart</a></li>
                <li><a class="white-text modal-trigger" href="#feedback">Feedback</a></li>
                <li><a class="white-text modal-trigger" href="#signOut">Logout</a></li>
            </ul>
          </div>
        </div>
      </div>
      <div class="footer-copyright">
        <div class="container">
          Website by:
          <a class="orange-text text-lighten-3" href="#" >Phoenix Group of Companies</a>
        </div>
      </div>
    </footer>
    

  <script>
       window.history.forward();
        function noBack()
        {
            window.history.forward();
           
            
        }
        
  </script>

  <script>
function deleteFromCart(itemId) {
  var url = "ajax/deleteFromCart.jsp?itemId="+itemId;
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      if(this.responseText = "saved"){
      alert("Item Deleted");
      window.location.reload();
            }
    }
  };
  xhttp.open("GET", url, true);
  xhttp.send();
  
}

function placeOrder(){
    var url="ajax/placeOrder.jsp";
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
      if (this.readyState == 4 && this.status == 200) {
        if(this.responseText = "order placed"){
        alert("order placed");
        window.location.reload();
    }
        else{
            alert("Order placing failed ");
                
        }
      }
    };
    xhttp.open("GET", url, true);
    xhttp.send();
    
}
</script>

  
    <!-- Scripts -->
    <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script src="js/materialize.js"></script>
    <script src="js/init.js"></script>

      
  
</body>
</html>