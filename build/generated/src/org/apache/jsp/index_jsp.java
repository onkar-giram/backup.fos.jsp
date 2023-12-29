package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import javax.swing.JOptionPane;
import com.bean.Bean.*;
import com.dao.Demo;
import java.sql.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("  <head>\n");
      out.write("    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, maximum-scale=0.69\"/>\n");
      out.write("    <title>Sign In- Hotel Flora inn</title>\n");
      out.write(" \n");
      out.write("    <!-- CSS -->\n");
      out.write("    <link href=\"https://fonts.googleapis.com/icon?family=Material+Icons\" rel=\"stylesheet\"/>\n");
      out.write("    <link href=\"css/materialize.css\" type=\"text/css\" rel=\"stylesheet\" media=\"screen,projection\"/>\n");
      out.write("   \n");
      out.write("    <link rel=\"stylesheet\" href=\"https://use.fontawesome.com/releases/v5.5.0/css/all.css\"/>\n");
      out.write("    \n");
      out.write("    <link rel=\"stylesheet\" href=\"font/material-icons.css\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css\">\n");
      out.write("    <script src=\"https://code.jquery.com/jquery-3.2.1.min.js\" type=\"text/javascript\"></script>\n");
      out.write("    <script src=\"https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js\"></script>\n");
      out.write("    <!-- Jquery Initializations-->\n");
      out.write("    <script>\n");
      out.write("      $(document).ready(function () {\n");
      out.write("        $('.modal').modal();\n");
      out.write("        $('.sidenav').sidenav();   \n");
      out.write("        $(\".button-collapse\").sideNav();   \n");
      out.write("      });\n");
      out.write("\n");
      out.write("    window.onload = function(){\n");
      out.write("        function ParseURLParameter(Parameter){\n");
      out.write("            var FullURL = window.location.search.substring(1);\n");
      out.write("            var ParametersArray = FullURL.split('&');\n");
      out.write("            for(var i = 0;i< ParametersArray.length; i++){\n");
      out.write("                var CurrentParameter = ParametersArray[i].split('=');\n");
      out.write("                if(CurrentParameter[0] == Parameter ){\n");
      out.write("                    return CurrentParameter[1];\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("        }\n");
      out.write("        var TableNo = ParseURLParameter('tn');\n");
      out.write("\n");
      out.write("        if(typeof TableNo !== 'undefined'){    \n");
      out.write("            addTableNumber(TableNo);                        \n");
      out.write("        }else{\n");
      out.write("            window.alert('Table number not found');\n");
      out.write("        }\n");
      out.write("     \n");
      out.write("        function addTableNumber(table_no) {\n");
      out.write("          var url = \"ajax/addTableNumber.jsp?table_no=\"+table_no;\n");
      out.write("          var xhttp = new XMLHttpRequest();\n");
      out.write("          xhttp.onreadystatechange = function() {\n");
      out.write("            if (this.readyState == 4 && this.status == 200) {\n");
      out.write("              if(this.responseText = \"saved\"){\n");
      out.write("              alert(\"Table Number Added to Session\");}\n");
      out.write("            }\n");
      out.write("          };\n");
      out.write("          xhttp.open(\"GET\", url, true);\n");
      out.write("          xhttp.send();\n");
      out.write("        }        \n");
      out.write("    }    \n");
      out.write("    </script>\n");
      out.write("           \n");
      out.write("    \n");
      out.write("  </head>\n");
      out.write("  \n");
      out.write("  \n");

if(request.getParameter("hiddenField") != null){
	
      out.write('\n');
      out.write('	');
      com.bean.Bean obj = null;
      synchronized (_jspx_page_context) {
        obj = (com.bean.Bean) _jspx_page_context.getAttribute("obj", PageContext.PAGE_SCOPE);
        if (obj == null){
          obj = new com.bean.Bean();
          _jspx_page_context.setAttribute("obj", obj, PageContext.PAGE_SCOPE);
        }
      }
      out.write('\n');
      out.write('	');
      org.apache.jasper.runtime.JspRuntimeLibrary.introspect(_jspx_page_context.findAttribute("obj"), request);
      out.write("\n");
      out.write("\n");
      out.write("\t");


	if(request.getParameter("submit").equals("Sign-Up")){
                int prog = Demo.insertCustomerMaster(obj) ;
		if(prog == 1)
		{System.out.println("Successfully inserted in customer_mst");
		}
                else
		{System.out.println("Failure while inserting in customer_id");
                out.println("Creating account failed. It seems you already have created account");
		}
	}

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

        if(request.getParameter("submit").equals("Change Password")){
            System.out.println("Change Pssword method called");
            int prog = Demo.changePassword(obj) ;
		if(prog == 1)
		{System.out.println("Successfully changed Password");
		}
                else
		{System.out.println("Failure while changing password");
                out.println("Changing password failed, plz try again later");
		}
	}
}

 
      out.write("\t\n");
      out.write("  \n");
      out.write("  \n");
      out.write("  <body id=\"home\">\n");
      out.write("    <!-- Nav Bar -->\n");
      out.write("   <nav class=\"black lighten-1\" role=\"navigation\">\n");
      out.write("    <div class=\"nav-wrapper\">\n");
      out.write("          <a id=\"logo-container\" href=\"#\" class=\"brand-logo hide-on-med-and-down\" style=\"padding-left: 150px\" >Hotel Flora-inn</a>\n");
      out.write("          <a id=\"logo-container\" href=\"#\" class=\"brand-logo hide-on-large-only\" >Hotel Flora-inn</a>\n");
      out.write("      <ul class=\"right hide-on-med-and-down\">\n");
      out.write("        <li><a class=\"modal-trigger\" href=\"#signIn\">Login</a></li>\n");
      out.write("        <li><a class=\"modal-trigger\" href=\"#signUp\">Sign Up</a></li>        \n");
      out.write("        <li><a href=\"forStaff.jsp\">For Staff</a></li>\n");
      out.write("        <li><a href=\"#inquiries\" class=\"modal-trigger white black-text waves-effect waves-light btn\">For Enquiry</a></li>\n");
      out.write("      </ul>\n");
      out.write("\n");
      out.write("      <ul id=\"nav-mobile\" class=\"sidenav\">\n");
      out.write("        <li><a class=\"modal-trigger\" href=\"#signIn\">Login</a></li>\n");
      out.write("        <li><a class=\"modal-trigger\" href=\"#signUp\">Sign Up</a></li>        \n");
      out.write("        <li><a href=\"forStaff.jsp\">For Staff</a></li>\n");
      out.write("        <li><a href=\"#inquiries\" class=\"modal-trigger black white-text waves-effect waves-light btn\">For Enquiry</a></li>\n");
      out.write("      </ul>\n");
      out.write("      <a href=\"#\" data-target=\"nav-mobile\" class=\"sidenav-trigger\"><i class=\"material-icons\">menu</i></a>\n");
      out.write("    </div>\n");
      out.write("  </nav>\n");
      out.write("\t\n");
      out.write("    \n");
      out.write("    <!-- Section: Slider -->\n");
      out.write("\n");
      out.write("    <section class=\"slider\">\n");
      out.write("      <ul class=\"slides\">\n");
      out.write("        <li>\n");
      out.write("          <img src=\"img/back1.jpg\" />\n");
      out.write("          <!-- random image -->\n");
      out.write("          <div class=\"caption left-align\">\n");
      out.write("            <h1>Welcome</h1>\n");
      out.write("            <h5 class=\"light grey-text text-lighten-3\">\n");
      out.write("              Welcome to Hotel Flora-inn.</h5>\n");
      out.write("            <a href=\"#signIn\" class=\"modal-trigger white black-text waves-effect waves-light btn btn-large\"\n");
      out.write("              >Login</a\n");
      out.write("            >\n");
      out.write("          </div>\n");
      out.write("        </li>\n");
      out.write("        <li>\n");
      out.write("          <img src=\"img/woodenPlank.jpg\" />\n");
      out.write("          <!-- random image -->\n");
      out.write("          <div class=\"caption center-align\">\n");
      out.write("            <h3>Hotel Flora-inn</h3>\n");
      out.write("            <h5 class=\"light grey-text text-lighten-3\">\n");
      out.write("             Presenting a new interesting way to order the delicious food\n");
      out.write("            </h5>\n");
      out.write("            <a href=\"#signUp\" class=\"modal-trigger white black-text waves-effect waves-light btn btn-large\"\n");
      out.write("              >Sign Up</a\n");
      out.write("            >\n");
      out.write("          </div>\n");
      out.write("        </li>\n");
      out.write("      </ul>\n");
      out.write("    </section>\n");
      out.write("\n");
      out.write(" \n");
      out.write("    \n");
      out.write("    <!-- Section: Modal (SignUp)-->\n");
      out.write("\n");
      out.write("\n");
      out.write("  <div id=\"signUp\" class=\"modal\">\n");
      out.write("    <div class=\"modal-content\">\n");
      out.write("        <form><h3 class=\"center black white-text\">Customer Sign up</h3>\n");
      out.write("\t<table>\n");
      out.write("            <tr>\n");
      out.write("                <td>\n");
      out.write("                    First Name\n");
      out.write("                </td>\n");
      out.write("\t\t<td>\t\t\t\t\n");
      out.write("                    <input class=\"form-control validate \" type=\"text\" title=\"Enter your first name\" name=\"firstName\" id=\"firstName\" required />\n");
      out.write("                </td>\n");
      out.write("            </tr>\n");
      out.write("\n");
      out.write("            <tr>\t\n");
      out.write("\t\t<td>\n");
      out.write("                    Last Name\n");
      out.write("\t\t</td>\n");
      out.write("\t\t<td>\t\t\t\t\n");
      out.write("                    <input class=\"form-control validate\" type=\"text\" title=\"Enter your last name\"  name=\"lastName\" id=\"lastName\" required/>\n");
      out.write("\t\t</td>\n");
      out.write("\t\t</tr>\t\t\n");
      out.write("            <tr>\t\n");
      out.write("\t\t<td>\n");
      out.write("                    Mobile No \n");
      out.write("                </td>\n");
      out.write("\t\t<td>\t\t\t\t\n");
      out.write("                    <input class=\"form-control validate\" type=\"tel\"  name=\"mobileNo\" id=\"MobileNo\" maxlength=\"10\" title=\"Enter 10 digits only\" pattern=\"[1-9]{1}[0-9]{9}\" required/>\n");
      out.write("\t\t</td>\n");
      out.write("            </tr>\n");
      out.write("            <tr>\t\n");
      out.write("\t\t<td>\n");
      out.write("                    Email\n");
      out.write("\t\t</td>\n");
      out.write("                        <td>\t\t\t\t\n");
      out.write("                    <input class=\"form-control validate\" type=\"text\" title=\"enter your email address\" name=\"email\" id=\"email\" />\n");
      out.write("\t\t</td>\n");
      out.write("            </tr>\n");
      out.write("            <tr>\t\n");
      out.write("\t\t<td>\n");
      out.write("                    Password\n");
      out.write("                </td>\n");
      out.write("\t\t<td>\t\t\t\t\n");
      out.write("                    <input class=\"form-control validate\" type=\"password\" title=\"enter a password for the website\" name=\"password\" id=\"password\" required />\n");
      out.write("\t\t</td>\n");
      out.write("            </tr>\n");
      out.write("            <tr>\t\n");
      out.write("\t\t<td>\t\t\t\t\n");
      out.write("                    <input class=\"form-control\" type=\"hidden\" name=\"hiddenField\" value=\"hidden\" />\n");
      out.write("\t\t</td>\n");
      out.write("            </tr>\n");
      out.write("           </table>\n");
      out.write("\t\n");
      out.write("                <input class=\"btn black white-text\" type=\"submit\" name=\"submit\" value=\"Sign-Up\"/>\t\n");
      out.write("\t</form>\t\n");
      out.write("      </div>\n");
      out.write("  </div>\n");
      out.write("    \n");
      out.write("    \n");
      out.write("\n");
      out.write("    <!-- Section: Modal (SignIn)-->\n");
      out.write("\n");
      out.write("  <div id=\"signIn\" class=\"modal\">\n");
      out.write("    <div class=\"modal-content\">        \n");
      out.write("        <form class=\"l6 m8 s8 offset-l3 offset-m2 offset-s2 lighten-2\" action=\"login.jsp\" method=\"post\"><h3 class=\"center-align black white-text\">Customer Login</h3>\n");
      out.write("            <table>\n");
      out.write("                <tr>\n");
      out.write("                    <td>\n");
      out.write("                        Mobile Number:\n");
      out.write("                    </td>\n");
      out.write("                    <td>\n");
      out.write("                        <input type=\"tel\" id='cMobileNo' name=\"cMobileNo\" class=\"form-control validate input-field\" maxlength=\"10\" title=\"Enter 10 digits only\" pattern=\"[1-9]{1}[0-9]{9}\" required/> \n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>\n");
      out.write("                        Password:\n");
      out.write("                    </td>\n");
      out.write("                    <td>\n");
      out.write("                        <input type='password' id='cPassword' name=\"cPassword\" class=\"form-control validate input-field\" title=\"Enter valid password\" required/>\n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("            </table><input type=\"submit\" value=\"Login\" name='submit' class=\"btn black white-text\"/>\n");
      out.write("        </form>\n");
      out.write("        <a href=\"#forgotPassword\" class=\"modal-trigger center\">Forgot Password</a>\n");
      out.write("     </div>\n");
      out.write("  </div>\n");
      out.write("        \n");
      out.write("\n");
      out.write("<!-- Section: Inquiry -->\n");
      out.write(" \n");
      out.write(" <div id=\"inquiries\" class=\"modal\">\n");
      out.write("     <div class=\" modal-content \">\n");
      out.write("         <h3 class=\"center black white-text\"> Enquiry </h3>\n");
      out.write("        <form>\n");
      out.write("\t<table>\n");
      out.write("\t\t<tr>\n");
      out.write("                    <td>\n");
      out.write("                        Your Name\n");
      out.write("                    </td>\n");
      out.write("                    <td>\t\t\t\t\n");
      out.write("\t\t\t\t<input class=\"form-control\" type=\"text\" name=\"name\" id=\"inquiryName\" required/>\n");
      out.write("                    </td>\n");
      out.write("\t\t</tr>\n");
      out.write("\t\t<tr>\n");
      out.write("                    <td>\n");
      out.write("                        Mobile No:\n");
      out.write("                    </td>\n");
      out.write("                    <td>\t\t\t\t\n");
      out.write("\t\t\t\t<input class=\"form-control\" type=\"tel\" name=\"mobileNo\" id=\"mobileNo\" maxlength=\"10\" title=\"Enter 10 digits only\" pattern=\"[1-9]{1}[0-9]{9}\" required/>\n");
      out.write("                    </td>\n");
      out.write("\t\t</tr>\n");
      out.write("                <tr>\t\n");
      out.write("                    <td>\n");
      out.write("\t\t\tEmail\n");
      out.write("                    </td>\n");
      out.write("                    <td>\t\t\t\t\n");
      out.write("\t\t\t\t<input class=\"form-control validate\" type=\"email\"  name=\"email\" id=\"inquiryEmail\" required/>\n");
      out.write("                    </td>\n");
      out.write("\t\t</tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>\n");
      out.write("                    Enquiry About:          \n");
      out.write("                    </td>   \n");
      out.write("                    <td>\n");
      out.write("                                <textarea type=\"text\" class=\" materialize-textarea validate form-control\" id=\"inquiry\" name=\"inquiry\" ></textarea>     \n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("                \n");
      out.write("\t\t<tr>\t\n");
      out.write("\t\t\t<td>\t\t\t\t\n");
      out.write("\t\t\t\t<input class=\"form-control\" type=\"hidden\" name=\"hiddenField\" value=\"hidden\" />\n");
      out.write("\t\t\t</td>\n");
      out.write("\t\t</tr>\n");
      out.write("\t\t<tr>\n");
      out.write("\t\t<br>\t\t\n");
      out.write("\t\t<td colspan=\"2\">\n");
      out.write("\t\t\t<input class=\"btn black white-text\" type=\"submit\" name=\"submit\" value=\"Submit Inquiry\"/>\n");
      out.write("\t\t</td>\n");
      out.write("\t\t</tr>\n");
      out.write("\t\t</table>\n");
      out.write("\t</form>\n");
      out.write("    </div>\n");
      out.write("</div>\n");
      out.write("    \n");
      out.write("    \n");
      out.write("    \n");
      out.write("<div id=\"forgotPassword\" class=\"modal\" >\n");
      out.write("    <div class=\"modal-content\">\n");
      out.write("        <h3 class=\"black white-text\">Forgot Password</h3>\n");
      out.write("        <form>\n");
      out.write("            <table>\n");
      out.write("                <tr>\n");
      out.write("                    <td>\n");
      out.write("                        Mobile Number:\n");
      out.write("                    </td>\n");
      out.write("                    <td>\n");
      out.write("                        <input class=\"form-control\" type=\"tel\" name=\"mobileNo\" id=\"fMobileNo\" maxlength=\"10\" title=\"Enter 10 digits only\" pattern=\"[1-9]{1}[0-9]{9}\" required/>\n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>\n");
      out.write("                       Password: \n");
      out.write("                    </td>\n");
      out.write("                    <td>\n");
      out.write("                        <input type='password' id='fPassword' name=\"password\" class=\"form-control validate input-field\" title=\"Enter valid password\" required/>\n");
      out.write("                    </td>                    \n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>\n");
      out.write("\t\t\t\t<input class=\"form-control\" type=\"hidden\" name=\"hiddenField\" value=\"hidden\" />\n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("\t\t<tr>\n");
      out.write("\t\t<br>\t\t\n");
      out.write("\t\t<td colspan=\"2\">\n");
      out.write("\t\t\t<input class=\"btn black white-text\" type=\"submit\" name=\"submit\" value=\"Change Password\"/>\n");
      out.write("\t\t</td>\n");
      out.write("\t\t</tr>                \n");
      out.write("            </table>\n");
      out.write("        </form>\n");
      out.write("    </div>  \n");
      out.write("</div>\n");
      out.write("    <!-- Section: Service -->\n");
      out.write("\n");
      out.write("    <div id=\"service\" class=\"container scrollspy\">\n");
      out.write("      <div class=\"section\">\n");
      out.write("        <!-- Icon Section -->\n");
      out.write("        <div class=\"row\">\n");
      out.write("          <div class=\"col s12 m4\">\n");
      out.write("            <div class=\"icon-block\">\n");
      out.write("              <h2 class=\"center black-text\">\n");
      out.write("                <i class=\"material-icons\">flash_on</i>\n");
      out.write("              </h2>\n");
      out.write("              <h5 class=\"center\">Speeds up development</h5>\n");
      out.write("\n");
      out.write("              <p class=\"light\">\n");
      out.write("                We did most of the heavy lifting for you to provide a default\n");
      out.write("                stylings that incorporate our custom components. Additionally,\n");
      out.write("                we refined animations and transitions to provide a smoother\n");
      out.write("                experience for developers.\n");
      out.write("              </p>\n");
      out.write("            </div>\n");
      out.write("          </div>\n");
      out.write("\n");
      out.write("          <div class=\"col s12 m4\">\n");
      out.write("            <div class=\"icon-block\">\n");
      out.write("              <h2 class=\"center black-text\">\n");
      out.write("                <i class=\"material-icons\">group</i>\n");
      out.write("              </h2>\n");
      out.write("              <h5 class=\"center\">User Experience Focused</h5>\n");
      out.write("\n");
      out.write("              <p class=\"light\">\n");
      out.write("                By utilizing elements and principles of Material Design, we were\n");
      out.write("                able to create a framework that incorporates components and\n");
      out.write("                animations that provide more feedback to users. Additionally, a\n");
      out.write("                single underlying responsive system across all platforms allow\n");
      out.write("                for a more unified user experience.\n");
      out.write("              </p>\n");
      out.write("            </div>\n");
      out.write("          </div>\n");
      out.write("\n");
      out.write("          <div class=\"col s12 m4\">\n");
      out.write("            <div class=\"icon-block\">\n");
      out.write("              <h2 class=\"center black-text\">\n");
      out.write("                <i class=\"material-icons\">settings</i>\n");
      out.write("              </h2>\n");
      out.write("              <h5 class=\"center\">Easy to work with</h5>\n");
      out.write("\n");
      out.write("              <p class=\"light\">\n");
      out.write("                We have provided detailed documentation as well as specific code\n");
      out.write("                examples to help new users get started. We are also always open\n");
      out.write("                to feedback and can answer any questions a user may have about\n");
      out.write("                Materialize.\n");
      out.write("              </p>\n");
      out.write("            </div>\n");
      out.write("          </div>\n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("      <br /><br />\n");
      out.write("    </div>\n");
      out.write(" <!-- Footer -->\n");
      out.write("\n");
      out.write("    <footer class=\"black page-footer orange\">\n");
      out.write("      <div class=\"container\">\n");
      out.write("        <div class=\"row\">\n");
      out.write("          <div class=\"col l8 s12\">\n");
      out.write("            <h5 class=\"white-text\">Hotel Flora-inn</h5>\n");
      out.write("            <p class=\"grey-text text-lighten-4\">\n");
      out.write("              Jalna Industrial Area MIDC, Jalna, \n");
      out.write("              Maharashtra 431213 Jalna India 431213 <br> \n");
      out.write("              Celebrated as one of the city's best is, Flora Inn Hotel in Jalna.\n");
      out.write("              The hotel is strategically located in Aurangabad Road. \n");
      out.write("              Having been established in the year 2010, this hospitality destination\n");
      out.write("              has grown to become the ideal place for travelers and those on business\n");
      out.write("              to feel at home when in the city.\n");
      out.write("            </p>\n");
      out.write("          </div>\n");
      out.write("\n");
      out.write("          <div class=\"col l3 s12 offset-l1\">\n");
      out.write("            <h5 class=\"white-text\">Links</h5>\n");
      out.write("            <ul>\n");
      out.write("              <li><a class=\"white-text modal-trigger\" href=\"#signIn\">Login</a></li>\n");
      out.write("              <li><a class=\"white-text modal-trigger\" href=\"#signUp\">Sign Up</a></li>\n");
      out.write("              <li><a class=\"white-text\" href=\"forStaff.jsp\">For Staffs</a></li>\n");
      out.write("              <li><a class=\"white-text modal-trigger\" href=\"#inquiries\">For Enquiry</a></li>\n");
      out.write("            </ul>\n");
      out.write("          </div>\n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("      <div class=\"footer-copyright\">\n");
      out.write("        <div class=\"container\">\n");
      out.write("          Website by:\n");
      out.write("          <a class=\"orange-text text-lighten-3\" href=\"#\"\n");
      out.write("            >Swarajya Group of Companies</a\n");
      out.write("          >\n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("    </footer>\n");
      out.write("\n");
      out.write("\n");
      out.write("    <!-- Scripts -->\n");
      out.write("    <script src=\"https://code.jquery.com/jquery-2.1.1.min.js\"></script>\n");
      out.write("    <script src=\"js/materialize.js\"></script>\n");
      out.write("    <script src=\"js/init.js\"></script>\n");
      out.write("\n");
      out.write(" \n");
      out.write("    \n");
      out.write("    \n");
      out.write("  </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
