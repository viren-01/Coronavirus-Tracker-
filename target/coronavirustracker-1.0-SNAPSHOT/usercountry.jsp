
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="javax.lang.model.element.Element"%>
<%@page errorPage="errorpage.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
        <title></title>
    </head>
    <body style="background: url(images/background.jpg);background-size: cover;background-attachment: fixed;">
        <%
            
            String user_country = request.getParameter("search_id"); 
            String url = "https://www.worldometers.info/coronavirus/country/"+user_country+"/";
             StringBuffer sf = new StringBuffer();
             Document doc = Jsoup.connect(url).get();
             
              Elements element= doc.select("#maincounter-wrap");
          element.forEach((a)->{
           String text = a.select("h1").text();
          String count =a.select(".maincounter-number>span").text();
             sf.append(text).append(" ").append(count).append(" ");
            
                       });
               String res= sf.toString();
            

                String arr[] = res.split(" ");
          
         String corona_cases = arr[2];
         String deaths = arr[4];
         String recovered = arr[6];
         String country = user_country.toUpperCase();
         %>
        
         <h1 style="margin-top:50px; text-align: center; color:yellow;"> YOU SEARCHED FOR</h1>
         <h1 class="center-align pink-text" style="margin-top:20px; margin-left:450px;margin-right:450px;text-align:center;"> <%= country %></h1>
         <div class="container2 silver" style="margin-top:30px; margin-left:450px;margin-right:450px;text-align:center;">
                    <div class="row">
                        <br><div class="col s6 offset-s3"><span class="flow-text red-text"style="margin-top:40px;"> CORONAVIRUS ACTIVE CASES</span></div>
                        <h1 class="grey-text"><%= corona_cases %></h1><br>
                        <h4 class="center-align grey-text" >DEATHS</h4>
                        <h1 class="center-align red-text" ><%= deaths %></h1><br>
                        <h4 class="center-align grey-text">RECOVERED</h4>
                        <h1 class="center-align green-text"><%= recovered %></h1><br>
         </div>
         </div>
    
    </body>
</html>
