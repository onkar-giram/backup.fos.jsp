<%@page contentType="text/html" pageEncoding="UTF-8"  import="com.bean.Bean.* , com.dao.Demo , java.sql.*"  %>
<!DOCTYPE html>
    <head>
        <title>Enquiries- Hotel Flora-inn</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=0.8"/> 
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
            $(document).ready(function () {
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
    
    <body class="Site white">

        <%

        if(request.getParameter("hiddenField") != null){
        %>
                <jsp:useBean id="obj" class="com.bean.Bean" />
                <jsp:setProperty property="*" name="obj" />
        <%
            if(request.getParameter("submit").equals("Add Account")){
                int prog = Demo.insertStaff(obj) ;
                if(prog == 1)
                    {System.out.println("Successfully inserted in staff_mst");
                    }
                else{
                    System.out.println("Failure while inserting in staff_mst");
                    out.println("Invalid username or password /n It seems you already have created account");
                    }
            }
        }

        %>
        <!-- Nav Bar -->
 
    <nav class="black lighten-1" role="navigation">
      <div class="nav-wrapper">
          <a id="logo-container" href="managerLogin.jsp" class="brand-logo hide-on-med-and-down" style="padding-left: 150px" >Hotel Flora-inn</a>
          <a id="logo-container" href="managerLogin.jsp" class="brand-logo hide-on-large-only" >Hotel Flora-inn</a>
          <ul class="right hide-on-med-and-down" style="padding-right: 100px;">
                  <li><a href="orders.jsp">Orders</a></li>           
                 <li><a href="completedOrder.jsp">Completed Orders</a></li>
                 <li><a href="feedback.jsp">Feedbacks</a></li>
                 <li><a href="inquiries.jsp" >Enquiries</a></li>
                 <li><a class="modal-trigger" href="#addAccount" >Add Account</a></li>                 
                 <li><a href="forStaff.jsp" class="white black-text waves-effect waves-light btn" >Logout</a> </li>
          </ul>

        <ul id="nav-mobile" class="sidenav">
                  <li><a href="orders.jsp">Orders</a></li>           
                 <li><a href="completedOrder.jsp">Completed Orders</a></li>
                 <li><a href="feedback.jsp">Feedbacks</a></li>
                 <li><a href="inquiries.jsp" >Enquiries</a></li>
                 <li><a class="modal-trigger" href="#addAccount" >Add Account</a></li>      
                 <li> <a href="forStaff.jsp">Logout</a> </li>
        </ul>
        <a href="#" data-target="nav-mobile" class="sidenav-trigger"
          ><i class="material-icons">menu</i></a
        >
      </div>
    </nav>
    <!-- Section: Modal (add staff)-->


    <div id="addAccount" class="modal">
      <div class="modal-content">
            <form>
                 <h4 class="center black white-text">New Staff Entry</h4>
                <table>
                    <tr>
                        <td>
                            First Name
                        </td>
                        <td>				
                            <input class="form-control validate " type="text" title="Enter your first name" name="firstName" id="firstName" required />
                        </td>
                    </tr>

                    <tr>	
                        <td>
                            Last Name
                        </td>
                        <td>				
                            <input class="form-control validate" type="text" title="Enter your last name"  name="lastName" id="lastName" required/>
                        </td>
                        </tr>		
                    <tr>	
                        <td>
                            Mobile No.
                        </td>
                        <td>				
                            <input class="form-control validate" type="tel"  name="mobileNo" id="mobileNo" maxlength="10" title="Enter 10 digits only" pattern="[1-9]{1}[0-9]{9}" required/>
                        </td>
                    </tr>
                    <tr>	
                        <td>
                            Email
                        </td>
                                <td>				
                            <input class="form-control validate" type="text" title="enter your email address" name="email" id="email" required/>
                        </td>
                    </tr>
                    <tr>	
                        <td>
                            Password
                        </td>
                        <td>				
                            <input class="form-control validate" type="password" title="enter a password for the website" name="password" id="password" required />
                        </td>
                    </tr>
                    <tr>	
                        <td>
                            Account Type:
                        </td>
                        <td>				
                            <input class="form-control validate" type="text" title="Chef or Manager account" name="status" id="status" required />
                        </td>
                    </tr>
                    <tr>	
                        <td>				
                            <input class="form-control" type="hidden" name="hiddenField" value="hidden" />
                        </td>
                    </tr>
                </table>

                <input class="btn btn-secondary white-text black" type="submit" name="submit" value="Add Account"/>	
            </form>	
        </div>
    </div>
    
    <main class="Site-content">



        <!-- fetching feedback-->
        <table class="table highlight responsive-table white black-text">

            <thead>
            <tr>
                <td>Sr.No</td>
                    <td>Name</td>
                    <td>Mobile No</td>
                    <td>Email</td>
                    <td>Enquiry</td>
            </tr>
            </thead>	
            <%
                    ResultSet rs = Demo.fetchInquiries();
                    int i = 1;
                    while(rs.next()){
                            %>
                    <tbody>
                        <tr>
                                    <td> <%=i++ %> </td>
                                    <td> <%=rs.getString(1) %> </td>
                                    <td> <%=rs.getLong(2) %></td>
                                    <td> <%=rs.getString(3) %> </td>
                                    <td> <%=rs.getString(4) %> </td>
                                    <td> <button class="btn black white-text"  onclick="deleteEnquiry( '<%=rs.getString(1) %>' , '<%=rs.getString(3) %>' ,  '<%=rs.getString(4) %>')">Delete</button> </td>
                        </tr>
                    </tbody>
                            <% } 
                            %>
        </table>	   

    </main>
    
 <!-- Footer -->

    <footer class="black page-footer orange" style="  bottom: 0; left: 0; width: 100%;">
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
                    <li><a class="white-text" href="orders.jsp">Orders</a></li>           
                   <li><a class="white-text" href="">Completed Orders</a></li>
                   <li><a class="white-text" href="feedback.jsp">Feedbacks</a></li>
                   <li><a class="white-text" href="inquiries.jsp" >Inquiries</a></li>
                   <li><a class="modal-trigger white-text" href="#addAccount" >Add Account</a></li> 
                   <li> <a href="forStaff.jsp" class="white-text" >Logout</a> </li>
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
        

        function deleteEnquiry(name, email, enquiry) {
          var url = "ajax/deleteEnquiry.jsp?name="+name+"&email="+email+"&enquiry="+enquiry;
          var xhttp = new XMLHttpRequest();
          xhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
              if(this.responseText = "saved"){
        }
            }
          };
          xhttp.open("GET", url, true);
          xhttp.send();
              alert("Enquiry Deleted");
                window.location.reload();
        }
    </script>
     <!-- Scripts -->
    <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script src="js/materialize.js"></script>
    <script src="js/init.js"></script>

</body>
</html>