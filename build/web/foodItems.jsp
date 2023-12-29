<%@page contentType="text/html" pageEncoding="UTF-8"  import="com.bean.Bean.* , com.dao.Demo , java.sql.*" %>
<html>
<head>
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=0.69, maximum-scale=0.69"/>
    <!-- CSS -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"/>
    <link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"/>

    <link rel="stylesheet" href="font/material-icons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">
    <script src="https://code.jquery.com/jquery-3.2.1.min.js" type="text/javascript"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>

    <script>
      <!-- Initialization of JQuery -->
          

      $(document).ready(function () {
        $('.modal').modal();
        $('.sidenav').sidenav();   
        $(".button-collapse").sideNav();   
        $('.tabs').tabs();
        $('.tooltipped').tooltip();
        $('.scrollspy').scrollSpy();
    });      
     
    </script>
    <style>
         .tabs .tab a{
            color:black;
        } /*Black color to the text*/

        .tabs .tab a:hover {
            
            color:#000;
        } /*Text color on hover*/

        .tabs .tab a.active {

            color:#000;
        } /*Background and text color when a tab is active*/

        .tabs .indicator {
            background-color:#000;
        } /*Color of underline*/
        
        
  body {
    display: flex;
    min-height: 100vh;
    flex-direction: column;
  }

  main {
    flex: 1 0 auto;
  }

    </style>

</head>
<body>
 
  
<%
if(request.getParameter("hiddenField") != null){
	%>
	<jsp:useBean id="obj" class="com.bean.Bean" />
	<jsp:setProperty property="*" name="obj" />

	<%
        String bt = request.getParameter("foodItem");	
            System.out.println(bt);
         
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
        if(request.getParameter("submit").equals("Log Out")){
            HttpSession mySession = request.getSession();   
            int cId = (Integer) mySession.getAttribute("customerId");
            int orderId=(Integer) mySession.getAttribute("orderId");
            obj.setCustomerId(cId);
            obj.setOrderId(orderId);
            int prog = Demo.customerSignOut(obj);
            if(prog == 1){
                System.out.println("Successfully Signed Out");
                response.sendRedirect("index.jsp");
            }
            else{
                System.out.println("Failure while signing out");
            }
        }   
	}
 %>	
    
     
    <!-- Section: Nav Bar -->
    <!-- Section: Nav Bar -->
    <!-- Section: Nav Bar -->
    
    <nav class="black lighten-1" role="navigation" style="width:100%;">
      <div class="nav-wrapper s12">
          <a id="logo-container" href="home.jsp" class="brand-logo hide-on-med-and-down" style="padding-left: 150px" >Hotel Flora-inn</a>
          <a id="logo-container" href="home.jsp" class="brand-logo hide-on-large-only" >Hotel Flora-inn</a>
          <ul class="right hide-on-med-and-down" style="padding-right: 100px;">
                <li><a href="home.jsp">Home</a></li>
                <li><a href="foodItems.jsp">Food Items</a></li>
                <li><a href="cart.jsp">Cart</a></li>
                <li><a class="modal-trigger" href="#feedback">Feedback</a></li>
                <li><a href="#signOut" class="modal-trigger white black-text waves-effect waves-light btn" >Log Out</a> </li>
        </ul>

        <ul id="nav-mobile" class="sidenav">
                <li><a href="home.jsp">Home</a></li>
                <li><a href="foodItems.jsp">Food Items</a></li>
                <li><a href="cart.jsp">Cart</a></li>
                <li><a class="modal-trigger" href="#feedback">Feedback</a></li>
                <li> <a href="#signOut" class="modal-trigger black white-text waves-effect waves-light btn" >Log Out</a> </li>
        </ul>
        <a href="#" data-target="nav-mobile" class="sidenav-trigger" ><i class="material-icons">menu</i></a>
      </div>
    </nav>

<!--Section: Food items -->
<!--Section: Food items --> 


    <div class="row lighten-1">  
        <div class="col s12">  
            <ul class="tabs lighten-1 ">  
                <li class="tab col s3 m2 l2"><a class="active" href="#breakfast">Breakfast</a></li>  
                <li class="tab col s3 m2 l2"><a href="#mainCourse">Main Course</a></li>  
                <li class="tab col s3 m2 l2"><a href="#indianBrat">Indian Brat</a></li>
                <li class="tab col s3 m2 l2"><a href="#salad">Salad</a></li>  
                <li class="tab col s3 m1 l2"><a href="#rice">Rice</a></li>                                  
                <li class="tab col s3 m2 l2"><a href="#beverages">Beverages</a></li>
            </ul>  
        </div>

        





    <!-- Section: Modal (Sign-Out) -->
    
    <div class="modal" id="signOut">
        <div class="modal-content"><form><h3 class="black white-text center">Log Out</h3><br>
                <table>
                    <tr>
                        <td>
                             Are you sure you want to log out? All the items in the cart will be deleted.
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input class="form-control" type="hidden" name="hiddenField" value="hidden"/>
                        </td>
                    </tr> 
                    <tr>
                        <td>
                             <input type="submit" value="Log Out" name="submit" class="btn black white-text" />
                        </td>
                    </tr>                    
                </table>
            </form>
        </div>
    </div>
    
            
   
<!-- Section: feedback -->
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
			<input class="btn black white-text" type="submit" name="submit" value="Submit"/>
		</td>
		</tr>
		</table>
	</form>
    </div>
</div>

    

        <!--Section: Breakfast -->
        <!--Section: Breakfast -->
        <!--Section: Breakfast -->

        
        <div id="breakfast" class="col s12">
            
           <div class="row white">
                <div class="col s6 m6 l2">
                  <div class="card hoverable">
                    <div class="card-image">
                      <img class="responsive-img" src="img/pohe.jpg">
                  <!--    <span class="card-title black-text">Pohe</span>
                  -->           <button name="foodItem" value="1" class="btn-floating halfway-fab waves-effect waves-light red tooltipped" data-tooltip="add to cart" onClick="saveToCart(this.value);"><i class="material-icons">add</i></button>
                    </div>
                    <div class="card-content grey white-text">
                        <blockquote> <p>Pohe
                                <br> 15 rs per plate</p> </blockquote>
                    </div>
                  </div>
                </div>

                <div class="col s6 m6 l2">
                  <div class="card hoverable">
                    <div class="card-image">
                      <img class="responsive-img" src="img/upma.jpg">
                  <!--    <span class="card-title black-text">Upma</span>
           -->           <button name="foodItem" value="2" class="btn-floating halfway-fab waves-effect waves-light red" onClick="saveToCart(this.value);"><i class="material-icons tooltipped" data-position="bottom" data-tooltip="add to cart">add</i></button>
                    </div>
                    <div class="card-content grey white-text">
                        <blockquote><p>Upma <br>20 rs per plate</p></blockquote>
                    </div>
                  </div>
                </div>    

                 <div class="col s6 m6 l2">
                   <div class="card hoverable">
                    <div class="card-image">
                      <img class="responsive-img" src="img/sabudana.jpg">
                  <!--    <span class="card-title black-text">Sabudana</span>
       -->               <button name="foodItem" value="3" class="btn-floating halfway-fab waves-effect waves-light red" onClick="saveToCart(this.value);"><i class="material-icons tooltipped" data-position="bottom" data-tooltip="add to cart">add</i></button>
                    </div>
                    <div class="card-content grey white-text">
                      <blockquote><p>Sabudana <br>25 rs per plate</p></blockquote>
                    </div>
                  </div>
                </div>

                <div class="col s6 m6 l2">
                  <div class="card hoverable">
                    <div class="card-image">
                      <img class="responsive-img" src="img/potatoSandwich.jpg">
                  <!--    <span class="card-title black-text">Potato Sandwich</span>
                  -->    <button name="foodItem" value="4" class="btn-floating halfway-fab waves-effect waves-light red" onClick="saveToCart(this.value);"><i class="material-icons tooltipped" data-position="bottom" data-tooltip="add to cart (2 pc per plate)">add</i></button>
                    </div>
                    <div class="card-content grey white-text">
                        <blockquote><p>Potato Sandwich <br> 25 rs per plate</p></blockquote>
                    </div>
                  </div>
                </div>

                <div class="col s6 m6 l2">
                  <div class="card hoverable">
                    <div class="card-image">
                      <img class="responsive-img" src="img/idliSambhar.jpeg">
                  <!--    <span class="card-title black-text">Pohe</span>
                  -->           <button name="foodItem" value="29" class="btn-floating halfway-fab waves-effect waves-light red" onClick="saveToCart(this.value);"><i name="foodItem" value="1" class="material-icons tooltipped " data-position="bottom" data-tooltip="add to cart">add</i></button>
                    </div>
                    <div class="card-content grey white-text">
                        <blockquote> <p>Idli Sambhar
                                <br> 40 rs per plate</p> </blockquote>
                    </div>
                  </div>
                </div>               

                <div class="col s6 m6 l2">
                  <div class="card hoverable">
                    <div class="card-image">
                      <img class="responsive-img" src="img/masalaDosa.jpeg">
                  <!--    <span class="card-title black-text">Pohe</span>
                  -->           <button name="foodItem" value="30" class="btn-floating halfway-fab waves-effect waves-light red" onClick="saveToCart(this.value);"><i name="foodItem" value="1" class="material-icons tooltipped " data-position="bottom" data-tooltip="add to cart">add</i></button>
                    </div>
                    <div class="card-content grey white-text">
                        <blockquote> <p>Mayore Masala Dosa
                                <br> 40 rs per plate</p> </blockquote>
                    </div>
                  </div>
                </div>               
              
            </div>
        </div>  
            
<!-- Main Course -->        
<!-- Main Course -->  
<!-- Main Course -->  
<!-- Main Course -->  
<!-- Main Course -->  
            
            
        <div id="mainCourse" class="col s12">
            
            <div class="row"> 
              <div class="col s6 m6 l2">
                <div class="card hoverable">
                  <div class="card-image">
                    <img class="responsive-img" src="img/dalFry.jpg">
                <!--    <span class="card-title black-text">Dal Fry</span>
        -->            <button name="foodItem" value="5" class="btn-floating halfway-fab waves-effect waves-light red" onClick="saveToCart(this.value);"><i class="material-icons tooltipped" data-position="bottom" data-tooltip="add to cart">add</i></button>
                  </div>
                  <div class="card-content grey white-text">
                      <blockquote><p>Dal Fry <br> 130 rs per plate</p></blockquote>
                  </div>
                </div>
              </div>

              <div class="col s6 m6 l2">
                <div class="card hoverable">
                  <div class="card-image">
                    <img class="responsive-img" src="img/shevBhaji.jpg">
                <!--    <span class="card-title black-text">Shev Bhaji</span>
     -->               <button name="foodItem" value="6" class="btn-floating halfway-fab waves-effect waves-light red" onClick="saveToCart(this.value);"><i class="material-icons tooltipped" data-position="bottom" data-tooltip="add to cart">add</i></button>
                  </div>
                  <div class="card-content grey white-text">
                      <blockquote><p>Shev Bhaji <br> 100 rs per plate</p></blockquote>
                  </div>
                </div>
              </div>    

               <div class="col s6 m6 l2">
                 <div class="card hoverable">
                  <div class="card-image">
                    <img class="responsive-img" src="img/pavBhaji.jpg">
                <!--    <span class="card-title black-text">Pav Bhaji</span>
      -->              <button name="foodItem" value="7" class="btn-floating halfway-fab waves-effect waves-light red"onClick="saveToCart(this.value);"><i class="material-icons tooltipped" data-position="bottom" data-tooltip="add to cart (1 plate bhaji & 4 pav)">add</i></button>
                  </div>
                  <div class="card-content grey white-text">
                    <blockquote><p> Pav Bhaji<br>80 rs per plate</p></blockquote>
                  </div>
                </div>
              </div>

              <div class="col s6 m6 l2">
                <div class="card hoverable">
                  <div class="card-image">
                    <img class="responsive-img" src="img/mixedVeg.jpg">
                <!--    <span class="card-title black-text">Mixed Veg</span>
      -->              <button name="foodItem" value="8" class="btn-floating halfway-fab waves-effect waves-light red" onClick="saveToCart(this.value);"><i class="material-icons tooltipped" data-position="bottom" data-tooltip="add to cart">add</i></button>
                  </div>
                  <div class="card-content grey white-text">
                      <blockquote><p>Mixed Veg <br> 130 rs per plate</p></blockquote>
                  </div>
                </div>
              </div>

              <div class="col s6 m6 l2">
                <div class="card hoverable">
                  <div class="card-image">
                    <img class="responsive-img" src="img/bhindiMasala.jpg">
                <!--    <span class="card-title black-text">Bhindi Masala</span>
  -->                  <button name="foodItem" value="9" class="btn-floating halfway-fab waves-effect waves-light red" onClick="saveToCart(this.value);"><i class="material-icons tooltipped" data-position="bottom" data-tooltip="add to cart">add</i></button>
                  </div>
                  <div class="card-content grey white-text">
                    <blockquote><p>Bhindi Masala <br> 135 rs per plate</p></blockquote>
                  </div>
                </div>
              </div>

              <div class="col s6 m6 l2">
                <div class="card hoverable">
                  <div class="card-image">
                    <img class="responsive-img" src="img/kajuCurry.jpg">
                <!--    <span class="card-title black-text">Kaju Curry</span>
     -->               <button name="foodItem" value="10" class="btn-floating halfway-fab waves-effect waves-light red" onClick="saveToCart(this.value);"><i class="material-icons tooltipped" data-position="bottom" data-tooltip="add to cart">add</i></button>
                  </div>
                  <div class="card-content grey white-text">
                      <blockquote><p>Kaju Curry<br> 125 rs per plate</p></blockquote>
                  </div>
                </div>
              </div>    

               <div class="col s6 m6 l2">
                 <div class="card hoverable">
                  <div class="card-image">
                    <img class="responsive-img" src="img/palakPaneer.jpeg">
                <!--    <span class="card-title black-text">Palak Paneer</span>
   -->                 <button name="foodItem" value="11" class="btn-floating halfway-fab waves-effect waves-light red" onClick="saveToCart(this.value);"><i class="material-icons tooltipped" data-position="bottom" data-tooltip="add to cart">add</i></button>
                  </div>
                  <div class="card-content grey white-text">
                      <blockquote><p>Palak Paneer <br> 110 rs per plate</p></blockquote>
                  </div>
                </div>
              </div>

              <div class="col s6 m6 l2">
                <div class="card hoverable">
                  <div class="card-image">
                    <img class="responsive-img" src="img/paneerMasala.jpeg">
                <!--    <span class="card-title black-text">Paneer Tikka</span>
   -->                 <button name="foodItem" value="31" class="btn-floating halfway-fab waves-effect waves-light red"onClick="saveToCart(this.value);"><i class="material-icons tooltipped" data-position="bottom" data-tooltip="add to cart">add</i></button>
                  </div>
                  <div class="card-content grey white-text">
                    <blockquote><p> Paneer Masala <br> 165 rs per plate</p></blockquote>
                  </div>
                </div>
              </div>

              <div class="col s6 m6 l2">
                <div class="card hoverable">
                  <div class="card-image">
                    <img class="responsive-img" src="img/vegKolhapuri.jpeg">
                <!--    <span class="card-title black-text">Paneer Tikka</span>
   -->                 <button name="foodItem" value="32" class="btn-floating halfway-fab waves-effect waves-light red"onClick="saveToCart(this.value);"><i class="material-icons tooltipped" data-position="bottom" data-tooltip="add to cart">add</i></button>
                  </div>
                  <div class="card-content grey white-text">
                    <blockquote><p> Veg Kolhapuri <br> 135 rs per plate</p></blockquote>
                  </div>
                </div>
              </div>
                
              <div class="col s6 m6 l2">
                <div class="card hoverable">
                  <div class="card-image">
                    <img class="responsive-img" src="img/vegKofta.jpeg">
                <!--    <span class="card-title black-text">Paneer Tikka</span>
   -->                 <button name="foodItem" value="33" class="btn-floating halfway-fab waves-effect waves-light red"onClick="saveToCart(this.value);"><i class="material-icons tooltipped" data-position="bottom" data-tooltip="add to cart">add</i></button>
                  </div>
                  <div class="card-content grey white-text">
                    <blockquote><p> Veg Kofta <br> 130 rs per plate</p></blockquote>
                  </div>
                </div>
              </div>
                
              <div class="col s6 m6 l2">
                <div class="card hoverable">
                  <div class="card-image">
                    <img class="responsive-img" src="img/dumAloo.jpeg">
                <!--    <span class="card-title black-text">Paneer Tikka</span>
   -->                 <button name="foodItem" value="34" class="btn-floating halfway-fab waves-effect waves-light red"onClick="saveToCart(this.value);"><i class="material-icons tooltipped" data-position="bottom" data-tooltip="add to cart">add</i></button>
                  </div>
                  <div class="card-content grey white-text">
                    <blockquote><p> Dum Aloo <br> 100 rs per plate</p></blockquote>
                  </div>
                </div>
              </div>

            </div>             

        </div>  
            
<!-- Section: Indian Brat -->  
<!-- Section: Indian Brat -->  
<!-- Section: Indian Brat -->  
            
        <div id="indianBrat" class="col s12">

            <div class="row"> 
              <div class="col s6 m6 l2">
                <div class="card hoverable">
                  <div class="card-image">
                    <img class="responsive-img" src="img/chappati.jpeg">
                <!--    <span class="card-title white-text">Chapati</span>
        -->            <button name="foodItem" value="13" class="btn-floating halfway-fab waves-effect waves-light red" onClick="saveToCart(this.value);"><i class="material-icons tooltipped" data-position="bottom" data-tooltip="add to cart">add</i></button>
                  </div>
                  <div class="card-content grey white-text">
                      <blockquote><p>Chapati <br> 9 rs per piece</p></blockquote>
                  </div>
                </div>
              </div>

              <div class="col s6 m6 l2">
                <div class="card hoverable">
                  <div class="card-image">
                    <img class="responsive-img" src="img/tandoor.jpeg">
                <!--    <span class="card-title white-text">Tandoor Roti</span>
   -->                 <button name="foodItem" value="14" class="btn-floating halfway-fab waves-effect waves-light red" onClick="saveToCart(this.value);"><i class="material-icons tooltipped" data-position="bottom" data-tooltip="add to cart">add</i></button>
                  </div>
                  <div class="card-content grey white-text">
                      <blockquote><p>Tandoor Roti <br> 12 rs per piece</p></blockquote>
                  </div>
                </div>
              </div>    

               <div class="col s6 m6 l2">
                 <div class="card hoverable">
                  <div class="card-image">
                    <img class="responsive-img" src="img/nanRoti.jpg">
                <!--    <span class="card-title white-text">Nan Roti</span>
       -->             <button name="foodItem" value="15" class="btn-floating halfway-fab waves-effect waves-light red" onClick="saveToCart(this.value);"><i class="material-icons tooltipped" data-position="bottom" data-tooltip="add to cart">add</i></button>
                  </div>
                  <div class="card-content grey white-text">
                      <blockquote><p>Nan Roti <br> 15 rs per piece</p></blockquote>
                  </div>
                </div>
              </div>

              <div class="col s6 m6 l2">
                <div class="card hoverable">
                  <div class="card-image">
                    <img class="responsive-img" src="img/alooParatha.jpg">
                <!--    <span class="card-title white-text">Aloo Paratha</span>
   -->                 <button name="foodItem" value="16" class="btn-floating halfway-fab waves-effect waves-light red" onClick="saveToCart(this.value);"><i class="material-icons tooltipped" data-position="bottom" data-tooltip="add to cart">add</i></button>
                  </div>
                  <div class="card-content grey white-text">
                      <blockquote><p>Aloo Paratha <br> 13 rs per piece</p></blockquote>
                  </div>
                </div>
              </div>

              <div class="col s6 m6 l2">
                <div class="card hoverable">
                  <div class="card-image">
                    <img class="responsive-img" src="img/jowarRoti.jpeg">
                <!--    <span class="card-title white-text">Aloo Paratha</span>
   -->                 <button name="foodItem" value="35" class="btn-floating halfway-fab waves-effect waves-light red" onClick="saveToCart(this.value);"><i class="material-icons tooltipped" data-position="bottom" data-tooltip="add to cart">add</i></button>
                  </div>
                  <div class="card-content grey white-text">
                      <blockquote><p>Jowar Roti <br> 22 rs per piece</p></blockquote>
                  </div>
                </div>
              </div>                
                
              <div class="col s6 m6 l2">
                <div class="card hoverable">
                  <div class="card-image">
                    <img class="responsive-img" src="img/bajraRoti.jpeg">
                <!--    <span class="card-title white-text">Aloo Paratha</span>
   -->                 <button name="foodItem" value="36" class="btn-floating halfway-fab waves-effect waves-light red" onClick="saveToCart(this.value);"><i class="material-icons tooltipped" data-position="bottom" data-tooltip="add to cart">add</i></button>
                  </div>
                  <div class="card-content grey white-text">
                      <blockquote><p>Bajra Roti <br> 22 rs per piece</p></blockquote>
                  </div>
                </div>
              </div> 
                
          </div>             

        </div>  

<!--Section: Salad -->
<!--Section: Salad -->
<!--Section: Salad -->

        <div id="salad" class="col s12">
            <div class="row"> 
              <div class="col s6 m6 l2">
                <div class="card hoverable">
                  <div class="card-image">
                    <img class="responsive-img" src="img/fruitSalad.jpg">
                <!--    <span class="card-title white-text">Fruit Salad</span>
    -->                <button name="foodItem" value="17" class="btn-floating halfway-fab waves-effect waves-light red" onClick="saveToCart(this.value);"><i class="material-icons tooltipped" data-position="bottom" data-tooltip="add to cart">add</i></button>
                  </div>
                  <div class="card-content grey white-text">
                      <blockquote><p>Fruit Salad <br>75 rs per plate</p></blockquote>
                  </div>
                </div>
              </div>

              <div class="col s6 m6 l2">
                <div class="card hoverable">
                  <div class="card-image">
                    <img class="responsive-img" src="img/greenSalad.jpg">
                <!--    <span class="card-title white-text">Green Salad</span>
    -->                <button name="foodItem" value="18" class="btn-floating halfway-fab waves-effect waves-light red" onClick="saveToCart(this.value);"><i class="material-icons tooltipped" data-position="bottom" data-tooltip="add to cart">add</i></button>
                  </div>
                  <div class="card-content grey white-text">
                      <blockquote><p>Green Salad <br>70 rs per plate</p></blockquote>
                  </div>
                </div>
              </div>    

               <div class="col s6 m6 l2">
                 <div class="card hoverable">
                  <div class="card-image">
                    <img class="responsive-img" src="img/carrotSalad.jpg">
                <!--    <span class="card-title white-text">Carrot Salad</span>
   -->                 <button name="foodItem" value="19" class="btn-floating halfway-fab waves-effect waves-light red" onClick="saveToCart(this.value);"><i class="material-icons tooltipped" data-position="bottom" data-tooltip="add to cart">add</i></button>
                  </div>
                  <div class="card-content grey white-text">
                      <blockquote><p>Carrot Salad <br>50 rs per plate</p></blockquote>
                  </div>
                </div>
              </div>

              <div class="col s6 m6 l2">
                <div class="card hoverable">
                  <div class="card-image">
                    <img class="responsive-img" src="img/broccoliSalad.jpg">
                <!--    <span class="card-title white-text">Broccoli Salad</span>
 -->                   <button name="foodItem" value="20" class="btn-floating halfway-fab waves-effect waves-light red" onClick="saveToCart(this.value);"><i class="material-icons tooltipped" data-position="bottom" data-tooltip="add to cart">add</i></button>
                  </div>
                  <div class="card-content grey white-text">
                      <blockquote><p>Broccoli <br>50 rs per plate</p></blockquote>
                  </div>
                </div>
              </div>

          </div>                       
            
        </div>  

<!-- Rice////////////// -->
<!-- Rice////////////// -->
<!-- ////////////////Rice////////////// -->
<!-- ////////////////Rice////////////// -->
<!-- ////////////////Rice////////////// -->


        <div id="rice" class="col s12">

            <div class="row"> 
              <div class="col s6 m6 l2">
                <div class="card hoverable">
                  <div class="card-image">
                    <img class="responsive-img" src="img/jeeraRice.jpg">
                <!--    <span class="card-title white-text">Jeera Rice</span>
     -->               <button name="foodItem" value="21" class="btn-floating halfway-fab waves-effect waves-light red" onClick="saveToCart(this.value);"><i class="material-icons tooltipped" data-position="bottom" data-tooltip="add to cart">add</i></button>
                  </div>
                  <div class="card-content grey white-text">
                      <blockquote><p>Jeera Rice <br> 55 rs per plate</p></blockquote>
                  </div>
                </div>
              </div>

              <div class="col s6 m6 l2">
                <div class="card hoverable">
                  <div class="card-image">
                    <img class="responsive-img" src="img/friedRice.jpg">
                <!--    <span class="card-title white-text">Fried Rice</span>
     -->               <button name="foodItem" value="22" class="btn-floating halfway-fab waves-effect waves-light red" onClick="saveToCart(this.value);"><i class="material-icons tooltipped" data-position="bottom" data-tooltip="add to cart">add</i></button>
                  </div>
                  <div class="card-content grey white-text">
                      <blockquote><p>Fried Rice <br> 100 rs per plate</p></blockquote>
                  </div>
                </div>
              </div>    

               <div class="col s6 m6 l2">
                 <div class="card hoverable">
                  <div class="card-image">
                    <img class="responsive-img" src="img/pulav.jpg">
                <!--    <span class="card-title white-text">Pulav</span>
          -->          <button name="foodItem" value="23" class="btn-floating halfway-fab waves-effect waves-light red" onClick="saveToCart(this.value);"><i class="material-icons tooltipped" data-position="bottom" data-tooltip="add to cart">add</i></button>
                  </div>
                  <div class="card-content grey white-text">
                      <blockquote><p>Pulav <br> 90 rs per plate</p></blockquote>
                  </div>
                </div>
              </div>

              <div class="col s6 m6 l2">
                <div class="card hoverable">
                  <div class="card-image">
                    <img class="responsive-img" src="img/vegBiryani.jpg">
                <!--    <span class="card-title white-text">Veg Biryani</span>
    -->                <button name="foodItem" value="24" class="btn-floating halfway-fab waves-effect waves-light red" onClick="saveToCart(this.value);"><i class="material-icons tooltipped" data-position="bottom" data-tooltip="add to cart">add</i></button>
                  </div>
                  <div class="card-content grey white-text">
                      <blockquote><p>Veg Biryani <br>90 rs per plate</p></blockquote>
                  </div>
                </div>
              </div>               
 
              <div class="col s6 m6 l2">
                <div class="card hoverable">
                  <div class="card-image">
                    <img class="responsive-img" src="img/steamedRice.jpeg">
                <!--    <span class="card-title white-text">Veg Biryani</span>
    -->                <button name="foodItem" value="37" class="btn-floating halfway-fab waves-effect waves-light red" onClick="saveToCart(this.value);"><i class="material-icons tooltipped" data-position="bottom" data-tooltip="add to cart">add</i></button>
                  </div>
                  <div class="card-content grey white-text">
                      <blockquote><p>Steamed Rice <br>70 rs per plate</p></blockquote>
                  </div>
                </div>
              </div>

              <div class="col s6 m6 l2">
                <div class="card hoverable">
                  <div class="card-image">
                    <img class="responsive-img" src="img/kashmiriPulav.jpeg">
                <!--    <span class="card-title white-text">Veg Biryani</span>
    -->                <button name="foodItem" value="38" class="btn-floating halfway-fab waves-effect waves-light red" onClick="saveToCart(this.value);"><i class="material-icons tooltipped" data-position="bottom" data-tooltip="add to cart">add</i></button>
                  </div>
                  <div class="card-content grey white-text">
                      <blockquote><p>Kashmiri Pulav <br>120 rs per plate</p></blockquote>
                  </div>
                </div>
              </div>

            </div>
        </div> 

 

<!-- Section:  beverages  -->
<!-- Section: beverages  -->
<!-- Section: beverages  -->


        <div id="beverages" class="col s12">


            <div class="row"> 
              <div class="col s6 m6 l2">
                <div class="card hoverable">
                  <div class="card-image">
                    <img class="responsive-img" src="img/tea.jpg">
                <!--    <span class="card-title white-text">Tea</span>
            -->        <button name="foodItem" value="25" class="btn-floating halfway-fab waves-effect waves-light red" onClick="saveToCart(this.value);"><i class="material-icons tooltipped" data-position="bottom" data-tooltip="add to cart">add</i></button>
                  </div>
                  <div class="card-content grey white-text">
                      <blockquote><p>Tea <br>10 rs</p></blockquote>
                  </div>
                </div>
              </div>


              <div class="col s6 m6 l2">
                <div class="card hoverable">
                  <div class="card-image">
                    <img class="responsive-img" src="img/coffee.jpg">
                <!--    <span class="card-title white-text">Coffee</span>
         -->           <button name="foodItem" value="26" class="btn-floating halfway-fab waves-effect waves-light red" onClick="saveToCart(this.value);"><i class="material-icons tooltipped" data-position="bottom" data-tooltip="add to cart">add</i></button>
                  </div>
                  <div class="card-content grey white-text">
                    <blockquote><p> Coffee<br> 15 rs</p></blockquote>
                  </div>
                </div>
              </div>    


               <div class="col s6 m6 l2">
                 <div class="card hoverable">
                  <div class="card-image">
                    <img class="responsive-img" src="img/lassi.jpg">
                <!--    <span class="card-title white-text">Lassi</span>
          -->          <button name="foodItem" value="27" class="btn-floating halfway-fab waves-effect waves-light red" onClick="saveToCart(this.value);"><i class="material-icons tooltipped" data-position="bottom" data-tooltip="add to cart">add</i></button>
                  </div>
                  <div class="card-content grey white-text">
                    <blockquote><p> Lassi <br> 20 rs</p></blockquote>
                  </div>
                </div>
              </div>


              <div class="col s6 m6 l2">
                <div class="card hoverable">
                  <div class="card-image">
                    <img class="responsive-img" src="img/coldDrinks.jpg">
                <!--    <span class="card-title white-text">Cold Drinks</span>
    -->                <button name="foodItem" value="28" class="btn-floating halfway-fab waves-effect waves-light red" onClick="saveToCart(this.value);"><i class="material-icons tooltipped" data-position="bottom" data-tooltip="add to cart">add</i></button>
                  </div>
                  <div class="card-content grey white-text">
                      <blockquote><p>Cold Drinks<br>25 rs on each drink</p></blockquote>
                  </div>
                </div>
              </div>

              <div class="col s6 m6 l2">
                <div class="card hoverable">
                  <div class="card-image">
                    <img class="responsive-img" src="img/mangoMilkshake.jpeg">
                <!--    <span class="card-title white-text">Cold Drinks</span>
    -->                <button name="foodItem" value="39" class="btn-floating halfway-fab waves-effect waves-light red" onClick="saveToCart(this.value);"><i class="material-icons tooltipped" data-position="bottom" data-tooltip="add to cart">add</i></button>
                  </div>
                  <div class="card-content grey white-text">
                      <blockquote><p>Mango Milkshake<br>54 rs</p></blockquote>
                  </div>
                </div>
              </div>                

              <div class="col s6 m6 l2">
                <div class="card hoverable">
                  <div class="card-image">
                    <img class="responsive-img" src="img/chocolateMilkshake.jpeg">
                <!--    <span class="card-title white-text">Cold Drinks</span>
    -->                <button name="foodItem" value="40" class="btn-floating halfway-fab waves-effect waves-light red" onClick="saveToCart(this.value);"><i class="material-icons tooltipped" data-position="bottom" data-tooltip="add to cart">add</i></button>
                  </div>
                  <div class="card-content grey white-text">
                      <blockquote><p>Chocolate Milkshake<br>54 rs</p></blockquote>
                  </div>
                </div>
              </div>      

            </div>
        </div> 


    </div> 
        
        
        
 <!-- Footer -->



 
     <footer class="black page-footer orange ">
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

   
    

  <script>
       window.history.forward();
        function noBack()
        {
            window.history.forward();
           
            
        }
        
  </script>
  
  <script>
function saveToCart(item_id) {
  var url = "ajax/saveToCart.jsp?item_id="+item_id;
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      if(this.responseText = "saved"){
      alert("Item added to cart");}
    }
  };
  xhttp.open("GET", url, true);
  xhttp.send();
}
</script>

      
</body>
</html>