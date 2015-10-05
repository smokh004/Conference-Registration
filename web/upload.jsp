<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@page import="Entity.AddressInfo"%>
<%@page import="Manager.AddressManager"%>
<%@page import="Entity.PackageDescriptionInfo"%>
<%@page import="Manager.PackageDescriptionManager"%>
<%@page import="Entity.UserInfo"%>
<%@page import="Manager.UserManager"%>
<%@page import="Entity.CartInfo"%>
<%@page import="Manager.CartManager"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@include file="jspf/header.jspf" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%

    // out.print("</br> cart id: "+ cartID);
%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>File Upload</title>
    </head>
    <body>

        <form method="post" action="UploadServelet" enctype="multipart/form-data">
            <input type="hidden" name="cartID" value=cartID/>
            title <input type="text" name="title" /> <br/><br/>
            description <input type="text" name="description" /> <br/><br/>
            Select file to upload:
            <input type="file" name="dataFile" id="fileChooser"/><br/><br/>
            <input type="submit" value="Upload" />

            <div class = "button btn">
                <button class="btn btn-inverse btn-large" onclick="user_choice(1)">Skip</button>

                <input type="hidden" value="pick" name="action" id="action">
                <input type="hidden" value="all" name="choice" id="choice">
            </div>

        </form>


    </body>
</html>

<script>
                function user_choice(pressed) {

                    document.getElementById("choice").value = pressed;

                }
</script>

<%
    try {
        int cartID = Integer.parseInt(request.getParameter("cart_id"));
        String action = request.getParameter("action");
        int chosen = Integer.parseInt(request.getParameter("choice"));
        if (action.compareTo("pick") == 0) {
            if (chosen == 1) {

                response.sendRedirect("PersonalInformation.jsp?cart_id=" + cartID);
            }


        }
    } catch (Exception e) {
        // no need to handle the exception.
    }
%>