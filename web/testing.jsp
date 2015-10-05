<%-- 
    Document   : testing
    Created on : Nov 13, 2013, 1:26:22 AM
    Author     : mac
--%>
<%@ page import="java.io.*,java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*,javax.activation.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="css/homepage.css" rel="stylesheet">
<%@include file="jspf/header.jspf" %>


 <div id="menu_container">   
         <!--  <div id="left_tab"><p class="left_t">Edit Itinerary</p></div>
            <div id="middle_tab"><div class="blue"></div><p class="middle_t">Select Car</p></div>
            <div id="right_tab"><p class="right_t">Reserve Car</p></div>
           -->
       
 </div>  
   
<div id="main_content_HomePage">
 <div class="divider"></div> 
   <div id="side_menu"></div>    
   <button class="btn btn-inverse btn-large" onclick="user_choice(4)">Submit</button>
   <%
   String result;
   // Recipient's email ID needs to be mentioned.
   String to = "shokoufeh.mokhtar@gmail.com";

   // Sender's email ID needs to be mentioned
   String from = "shokoufeh.mokhtari@gmail.com";

   // Assuming you are sending email from localhost
   String host = "localhost";

   // Get system properties object
   Properties properties = System.getProperties();

   // Setup mail server
   properties.setProperty("mail.smtp.host", host);

   // Get the default Session object.
   Session mailSession = Session.getDefaultInstance(properties);

   try{
      // Create a default MimeMessage object.
      MimeMessage message = new MimeMessage(mailSession);
      // Set From: header field of the header.
      message.setFrom(new InternetAddress(from));
      // Set To: header field of the header.
      message.addRecipient(Message.RecipientType.TO,
                               new InternetAddress(to));
      // Set Subject: header field
      message.setSubject("This is the Subject Line!");
      // Now set the actual message
      message.setText("This is actual message");
      // Send message
      Transport.send(message);
      result = "Sent message successfully....";
   }catch (MessagingException mex) {
      mex.printStackTrace();
      result = "Error: unable to send message....";
   }
%>
   
  

           
           </div>
<html>
<head>
<title>Send Email using JSP</title>
</head>
<body>
<center>
<h1>Send Email using JSP</h1>
</center>
<p align="center">
<% 
   out.println("Result: " + result + "\n");
%>
</p>
</body>
</html>