<%@page contentType="text/html" pageEncoding="UTF-8"  import="com.bean.Bean.* , com.dao.Demo , java.sql.*"  %>
<!DOCTYPE html>
<head>
    <title>Orders- Hotel Flora-inn</title>
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

    <script>
      <!-- Initialization of JQuery -->
      $(document).ready(function() {
        $('.modal').modal();
        $(".button-collapse").sideNav();        
        $('input#input_text, textarea#textarea2').characterCounter();    

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

</head>
<body class="Site">

<!-- Section: using bean & Setting properties -->
    	<jsp:useBean id="obj" class="com.bean.Bean" />
	<jsp:setProperty property="*" name="obj" />

    
    <!-- Nav Bar -->

    <nav class="black lighten-1" role="navigation">
      <div class="nav-wrapper">
          <a id="logo-container" href="chefLogin.jsp" class="brand-logo hide-on-med-and-down" style="padding-left: 150px" >Hotel Flora-inn</a>
          <a id="logo-container" href="chefLogin.jsp" class="brand-logo hide-on-large-only" >Hotel Flora-inn</a>
          <ul class="right hide-on-med-and-down" style="padding-right: 100px;">
                 <li><a href="chefOrders.jsp">Orders</a></li>           
                 <li><a href="completedOrdersChef.jsp">Completed Orders</a></li>
                 <li> <a href="forStaff.jsp" class="white black-text waves-effect waves-light btn" >Logout</a> </li>
          </ul>

        <ul id="nav-mobile" class="sidenav">
                 <li><a href="chefOrders.jsp">Orders</a></li>               
                 <li><a href="completedOrdersChef.jsp">Completed Orders</a></li>
                 <li> <a href="forStaff.jsp">Logout</a> </li>
        </ul>
        <a href="#" data-target="nav-mobile" class="sidenav-trigger"><i class="material-icons">menu</i></a>
      </div>
    </nav>

<!-- Section: home body-->
<!-- Section: home body-->
<!-- Section: home body-->
    
<main class="Site-content">
    
    <table class="table">    
   <thead class="grey darken-1 white-text">
	<tr>    
                <td>Sr No</td> 
                <td>Table No</td> 
                <td>Dish Name</td> 
                <td>Type</td> 
                <td>Price </td> 
                <td>Order Status</td>
	</tr>
	</thead>	
	<%

            ResultSet rs = Demo.fetchOrderChefCart(obj);
	int i = 1;
		while(rs.next()){
			%>
			<tbody><tr>
				<td> <%=i++ %> </td>
                                <td> <%=rs.getInt(1) %> </td>
                                <td> <%=rs.getString(2) %> </td>
                                <td> <%=rs.getString(3) %> </td>
                                <td> <%=rs.getFloat(4) %> </td>
                                <td> <%=rs.getString(5) %> </td>
               		</tr>			
		</tbody>
			<% } 
			%>
</table>		 
</main> 
  <!--///////// Footer/////////-->
  
 <footer class="black page-footer orange">
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
                <li><a class="white-text" href="chefOrders.jsp">Orders</a></li>              
                 <li><a class="white-text" href="completedOrdersChef.jsp">Completed Orders</a></li>
                 <li> <a class="white-text" href="forStaff.jsp">Logout</a> </li>                 
            </ul>
          </div>
        </div>
      </div>
      <div class="footer-copyright">
        <div class="container">
          Website by:
          <a class="orange-text text-lighten-3" href="#"
            >Phoenix Group of Companies</a
          >
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
  
    <!-- Scripts -->
    <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script src="js/materialize.js"></script>
    <script src="js/init.js"></script>
  
</body>
</html>