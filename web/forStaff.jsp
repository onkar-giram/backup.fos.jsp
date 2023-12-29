<%@page contentType="text/html" pageEncoding="UTF-8"  import="javax.swing.JOptionPane ,com.bean.Bean.* , com.dao.Demo , java.sql.*"  %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0"/>
    <title>For Staff- Hotel Flora-inn</title>
 
    <!-- CSS -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"/>
    <link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
    <link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"/>
    
    <link rel="stylesheet" href="font/material-icons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">
    <script src="https://code.jquery.com/jquery-3.2.1.min.js" type="text/javascript"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>


    <!-- Jquery Initializations-->
    <script>
      $(document).ready(function () {
        $('.modal').modal();
        $(".button-collapse").sideNav(); 
       $('.sidenav').sidenav();    
       
      });
    
    </script>
  </head>
  
  
<%
if(request.getParameter("hiddenField") != null){
	%>
	<jsp:useBean id="obj" class="com.bean.Bean" />
	<jsp:setProperty property="*" name="obj" />

	<%
    	if(request.getParameter("submit").equals("Submit Inquiry")){
                int prog = Demo.insertInquiry(obj) ;
		if(prog == 1)
		{System.out.println("Successfully inserted in Inquiries");
		}
                else
		{System.out.println("Failure while inserting in Inquiries");
                out.println("Sending inquiry failed, plz try again later");
		}
	}
    	if(request.getParameter("submit").equals("Login")){
            ResultSet rs = Demo.validateStaff(obj);
            while(rs.next()){
            String status = rs.getString(1);
           
        if(status.equals("manager")){
         response.sendRedirect("managerLogin.jsp");
          }
        if(status.equals("chef")){
        response.sendRedirect("chefLogin.jsp");
        }
        else{
            out.print("invalid username and password");
        }
       }   
      }  
        
	
}

 %>	
  
  
  <body id="home">
    <!-- Nav Bar -->
    <nav class="black lighten-1" role="navigation">
      <div class="nav-wrapper">
          <a id="logo-container" href="index.jsp" class="brand-logo hide-on-med-and-down" style="padding-left: 150px" >Hotel Flora-inn</a>
          <a id="logo-container" href="index.jsp" class="brand-logo hide-on-large-only" >Hotel Flora-inn</a>
          <ul class="right hide-on-med-and-down" style="padding-right: 100px;">
            <li><a href="#signIn" class="modal-trigger">Manager Login</a></li>
            <li><a href="#signIn" class="modal-trigger">Chef Login</a></li>
            <li><a href="#inquiries" class="modal-trigger white black-text waves-effect waves-light btn">For Enquiry</a></li>
        </ul>

        <ul id="nav-mobile" class="sidenav">
          <li><a class="modal-trigger" href="#signIn">Manager Login</a></li>
          <li><a class="modal-trigger" href="#signIn">Chef Login </a></li>
          <li><a href="#inquiries" class="modal-trigger black white-text waves-effect waves-light btn">For Enquiry</a></li>
        </ul>
        <a href="#" data-target="nav-mobile" class="sidenav-trigger"
          ><i class="material-icons">menu</i></a
        >
      </div>
    </nav>

    <!-- Section: Modal (SignIn)-->

  <div id="signIn" class="modal">
    <div class="modal-content">        
        <form class="l6 m8 s8 offset-l3 offset-m2 offset-s2 lighten-2">
            <h3 class="center-align black white-text">Staff Login</h3>
            <table>
                <tr>
                    <td>
                        Mobile Number:
                    </td>
                    <td>
                        <input type="tel" id='mobileNo' name="mobileNo" class="form-control validate input-field" maxlength="10" title="Enter 10 digits only" pattern="[1-9]{1}[0-9]{9}" required/> 
                    </td>
                </tr>
                <tr>
                    <td>
                        Password:
                    </td>
                    <td>
                        <input type='password' id='password' name="password" class="form-control validate input-field" title="Enter valid password" required/>
                    </td>
                </tr>
                <tr>
                    <td>
                      <input type="hidden" value="hidden" name='hiddenField'/>  
                    </td>
                </tr>                
                <tr>
                    <td>
                      <input type="submit" value="Login" name='submit' class="btn center-align black white-texte"/>  
                    </td>
                </tr>
            </table>
        </form>
     </div>
  </div>
        

    <!-- Section: Slider -->

    <section class="slider">
      <ul class="slides">
        <li>
          <img src="img/back1.jpg" />
          <!-- random image -->
          <div class="caption left-align">
            <h1>Welcome</h1>
            <h5 class="light grey-text text-lighten-3">
              Welcome to Hotel Flora-inn.</h5>
            <a href="#signIn" class="modal-trigger white black-text waves-effect waves-light btn btn-large">Login</a>
          </div>
        </li>
        <li>
          <img src="img/woodenPlank.jpg" />
          <!-- random image -->
          <div class="caption center-align">
            <h3>Hotel Flora-inn</h3>
            <h5 class="light grey-text text-lighten-3">
             Presenting a new interesting way to order the delicious food
            </h5>
            <a href="#signIn" class="modal-trigger white black-text waves-effect waves-light btn btn-large">Login</a>
          </div>
        </li>
      </ul>
    </section>


<!-- Section: Inquiry -->
 
 <div id="inquiries" class="modal">
     <div class=" modal-content ">
         <h3 class="center black white-text"> Enquiry </h3>
        <form>
	<table>
		<tr>
                    <td>
                        Your Name
                    </td>
                    <td>				
				<input class="form-control" type="text" name="name" id="inquiryName" required/>
                    </td>
		</tr>
		<tr>
                    <td>
                        Mobile No:
                    </td>
                    <td>				
				<input class="form-control" type="tel" name="mobileNo" id="mobileNo" maxlength="10" title="Enter 10 digits only" pattern="[1-9]{1}[0-9]{9}" required/>
                    </td>
		</tr>
                <tr>	
                    <td>
			Email
                    </td>
                    <td>				
				<input class="form-control validate" type="email"  name="email" id="inquiryEmail" required/>
                    </td>
		</tr>
                <tr>
                    <td>
                    Enquiry About:          
                    </td>   
                    <td>
                                <textarea type="text" class=" materialize-textarea validate form-control" id="inquiry" name="inquiry" required ></textarea>     
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
			<input class="btn black white-text" type="submit" name="submit" value="Submit Inquiry"/>
		</td>
		</tr>
		</table>
	</form>
    </div>
</div>

        
    
    
     <!-- Section: Service -->
    <br><br>
    <div class="container">
        <div class="row">
            <div class="col s10 m4 l4 offset-s1">
                <div class="card grey lighten-4">
                    <div class="card-image waves-effect waves-block waves-light activator">
                        <img class="activator" src="img/coc.png" style="height: 100 px; width: 98px; margin-top: 20px; margin-left: auto; margin-right: auto;">
                    </div>

                    <div class="card-content">
                        <span class="card-title activator grey-text text-darken-4 center ">Fresh Food<i class="material-icons right"></i></span>
                    </div>

                    <div class="card-reveal">
                        <span class="card-title grey-text text-darken-4">Fresh Food<i class="material-icons right"></i></span>
                        <p>Here at Flora-inn, we make sure you have your best time here, to do so, we make dishes for each orders, so fresh food is provided to you.</p>
                    </div>
                </div>
            </div>   

            <div class="col s10 m4 l4 offset-s1">
                <div class="card grey lighten-4">
                    <div class="card-image waves-effect waves-block waves-light">
                        <img class="activator" src="img/qua.png" style="height: 100 px; width: 120px; margin-top: 20px; margin-left: auto; margin-right: auto;">
                    </div>

                    <div class="card-content">
                        <span class="card-title activator grey-text text-darken-4 center ">Quality Cuisine<i class="material-icons"></i></span>
                    </div>

                    <div class="card-reveal">
                        <span class="card-title grey-text text-darken-4">Quality Cuisine<i class="material-icons right"></i></span>
                        <p>We are known for the quality food we provide, our chefs work hard to provide you with the quality food, they cook food with utmost love and passion.</p>
                    </div>
                </div>
            </div>
            
            <div class="col s10 m4 l4 offset-s1">
                <div class="card grey lighten-4">
                    <div class="card-image waves-effect waves-block waves-light">
                        <img class="activator" src="img/cake.png" style="height: 100 px; width: 120px; margin-top: 20px; margin-left: auto; margin-right: auto;">
                    </div>

                    <div class="card-content">
                        <span class="card-title activator grey-text text-darken-4 center ">Delicious Cakes <i class="material-icons right"></i></span>
                    </div>

                    <div class="card-reveal">
                        <span class="card-title grey-text text-darken-4">Delicious Cakes<i class="material-icons right"></i></span>
                        <p>Now we also have started baking our very own cakes. We provide custom made cakes for various events like birthdays, anniversaries, etc to make your loved ones happy.</p>
                    </div>
                </div>
            </div>  

            <div class="col s10 m4 l4 offset-s1">
                <div class="card grey lighten-4">
                    <div class="card-image waves-effect waves-block waves-light">
                        <img class="activator" src="img/salad.png" style="height: 100 px; width: 120px; margin-top: 20px; margin-left: auto; margin-right: auto;">
                    </div>

                    <div class="card-content">
                        <span class="card-title activator grey-text text-darken-4 center ">Fresh Vegies Salad<i class="material-icons right"></i></span>
                    </div>

                    <div class="card-reveal">
                        <span class="card-title grey-text text-darken-4">Fresh Vegies Salad<i class="material-icons right"></i></span>
                        <p>We provide the best salads in the city, the salads are made by our chefs with love, the vegies used the salads are fresh and of superior quality. </p>
                    </div>
                </div>
            </div>  

            <div class="col s10 m4 l4 offset-s1">
                <div class="card grey lighten-4" style="height: 230px">
                    <div class="card-image waves-effect waves-block waves-light">
                        <img class="activator" src="img/event.png" style="height: 100 px; width: 90px; margin-top: 20px; margin-left: auto; margin-right: auto;">
                    </div>

                    <div class="card-content">
                        <span class="card-title activator grey-text text-darken-4 center ">Event Management<i class="material-icons right"></i></span>
                    </div>

                    <div class="card-reveal">
                        <span class="card-title grey-text text-darken-4">Event Management<i class="material-icons right"></i></span>
                        <p>We have also started managing events so whether its your birthday, anniversary or the wedding ceremony, please allow us to make your events memorable.</p>
                    </div>
                </div>
            </div> 

            <div class="col s10 m4 l4 offset-s1">
                <div class="card grey lighten-4">
                    <div class="card-image waves-effect waves-block waves-light">
                        <img class="activator" src="img/reserve.png" style="height: 100 px; width: 272px; margin-top: 20px; margin-left: auto; margin-right: auto;">
                    </div>

                    <div class="card-content">
                        <span class="card-title activator grey-text text-darken-4 center ">Reserve Now<i class="material-icons right"></i></span>
                    </div>

                    <div class="card-reveal">
                        <span class="card-title grey-text text-darken-4">Reserve Now<i class="material-icons right"></i></span>
                        <p>You can contact with us for any queries among the services,and also you can make our staff available for events through reservations.</p>
                    </div>
                </div>
            </div> 

        </div>
    </div>
 <!-- Footer -->

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
              <li><a class="white-text modal-trigger" href="#signIn">Manager Login</a></li>
              <li><a class="white-text modal-trigger" href="#signIn">Chef Login</a></li>
              <li><a class="white-text modal-trigger" href="#inquiries">For Enquiry</a></li>
            </ul>
          </div>
        </div>
      </div>
      <div class="footer-copyright">
        <div class="container">
          Website by:
          <a class="orange-text text-lighten-3" href="#">Phoenix Group of Companies</a>
        </div>
      </div>
    </footer>

    <!-- Scripts -->
    <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script src="js/materialize.js"></script>
    <script src="js/init.js"></script>
  </body>
</html>
