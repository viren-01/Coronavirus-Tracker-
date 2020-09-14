
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="errorpage.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="javax.lang.model.element.Element"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HOME PAGE</title>
         
    <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
        
    </head>
    <body style="background: url(images/background.jpg);background-size: cover;background-attachment: fixed;">
        
        <%! static String text="";
            static String count="";
            public static String getData() throws Exception
              {
                  StringBuffer sf = new StringBuffer();
                  String url ="https://www.worldometers.info/coronavirus/";
           Document doc = Jsoup.connect(url).get();
           
            
           
//            selecting divs of cases, deaths, and recovered
          Elements element= doc.select("#maincounter-wrap");
          element.forEach((a)->{
           text = a.select("h1").text();
           count =a.select(".maincounter-number>span").text();
             sf.append(text).append(" ").append(count).append(" ");
            
                       });
               return sf.toString();
                }
        %>
        
        <%
        String res =getData();
         //out.println(res);
          
          String arr[] = res.split(" ");
          
         String corona_cases = arr[2];
         String deaths = arr[4];
         String recovered = arr[6];
//          out.println(corona_cases);
//          out.println(deaths);
//          out.println(recovered);
       

         %>
        
        
        
        
        
        
        
        
        <div class="container  " >
            <div class="row ">
                <div class="col-s6 black center-align">
                    <h3 style="margin-top: 20px; margin-bottom:0px; margin-left:150px;margin-right: 150px;" class="yellow-text center-align ">CORONAVIRUS PANDEMIC WORLD STATUS</h3>
                        
                </div>
            </div>
        </div>
         
           <div class="container2 silver" style="margin-top:90px; margin-left:450px;margin-right:450px;text-align:center;">
                    <div class="row">
                        <br><div class="col s6 offset-s3"><span class="flow-text red-text"style="margin-top:40px;">CORONAVIRUS ACTIVE CASES</span></div><br>
                        <h1 class="grey-text" ><%= corona_cases %></h1><br>
                        <h5 class="center-align grey-text">DEATHS</h5>
                        <h1 class="center-align red-text" ><%= deaths %></h1><br>
                        <h5 class="center-align grey-text">RECOVERED</h5>
                        <h1 class="center-align green-text" ><%= recovered %></h1><br>
         </div>
         </div>
         
         <div>
                <nav>
                    <div class="nav-wrapper black fixed" style=" margin-top:127.5px;">
            <form action="usercountry.jsp">
              <div class="input-field ">
                  <input  name="search_id" placeholder ="search your country here" type="search" required>
                <label class="label-icon" for="search" ></label>
                <i class="material-icons"><b>X</b></i>
              </div>
            </form>
          </div>
        </nav>
         </div>

          
    </body>
</html>
