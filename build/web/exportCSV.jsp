<%-- 
    Document   : exportCSV.jsp
    Created on : Nov 20, 2013, 1:27:54 AM
    Author     : Chris
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="Entity.SessionInfo"%>
<%@page import="Manager.SessionManager"%>
<%@page import="Entity.PaperInfo"%>
<%@page import="Manager.PaperManager"%>
<%@page import="Entity.UserInfo"%>
<%@page import="Manager.UserManager"%>
<%@page import="Entity.CartInfo"%>
<%@page import="Manager.CartManager"%>
<%@page import="Entity.PackageDescriptionInfo"%>
<%@page import="Manager.PackageDescriptionManager"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="Manager.CSVManager"%>
<%@include file="jspf/header.jspf" %>
<body>
 <div class="container-fluid">
        <div class="row-fluid">
            <div class="span1"></div>

            <div class=" span10 bottom_shadow img_bk">
                <div id="shft_down"></div>
              <!-- buttons to navigate within user profile -->
              <form id="session" method="post">
                    <div class="btn-group middle_con">
                       
                        <button class="btn btn-inverse btn-large" onclick="user_choice(2)">Back Admin Page</button>
                        
                        <button class="btn btn-inverse btn-large" onclick="user_choice(4)">Export .CSV</button>
                    </div>
                    <div class="btn-group">
                        <p> 
                        
                        <button class="btn btn-inverse btn-large" onclick="user_choice(5)">Users</button>
                        <button class="btn btn-inverse btn-large" onclick="user_choice(6)">Credit Cards</button>
                        <button class="btn btn-inverse btn-large" onclick="user_choice(7)">Addresses</button>
                        <button class="btn btn-inverse btn-large" onclick="user_choice(8)">Papers</button>
                        <button class="btn btn-inverse btn-large" onclick="user_choice(9)">Packages</button>
                        <button class="btn btn-inverse btn-large" onclick="user_choice(10)">Session</button>
                        <button class="btn btn-inverse btn-large" onclick="user_choice(11)">Cart</button>
                        <button class="btn btn-inverse btn-large" onclick="user_choice(12)">Speakers</button>
                        <button class="btn btn-inverse btn-large" onclick="user_choice(13)">Comments</button>

                        </p>
                    </div>
                    <input type="hidden" value="pick" name="action" id="action">
                    <input type="hidden" value="all" name="choice" id="choice">
                </form>
              
              
                <!-- <div class="container span8"> -->
                <div class="row-fluid">
                    <div class="span1"></div>
                    <div class="span10 "> 
                        
                        <script>
                            function user_choice(pressed) {

                                document.getElementById("choice").value = pressed

                            }
                        </script>
                        
                        <table class="table table-striped ">     
                            <%
                                //out.print("<tr><td class='purple_mid_font'>PaperID</td><td class='purple_mid_font'>Title</td></tr>");
                                try {
                                    String action = request.getParameter("action");
                                    int chosen = Integer.parseInt(request.getParameter("choice"));
                                    if (action.compareTo("pick") == 0) {
                                        if (chosen == 2) {
                                           
                                            response.sendRedirect("admin.jsp");
                        
                                        } 
                                        
                                        else if (chosen == 4){
                                            response.sendRedirect("exportCSV.jsp");
                                        }
                                        else if (chosen == 5){
                                            CSVManager exp = new CSVManager("User");}
                                        else if (chosen == 6){
                                            CSVManager exp1 = new CSVManager("CreditCard");}
                                        else if (chosen == 7){
                                            CSVManager exp2 = new CSVManager("Address");}
                                        else if (chosen == 8){
                                            CSVManager exp3 = new CSVManager("Paper");}
                                        else if (chosen == 9){
                                            CSVManager exp4 = new CSVManager("PackageDescription");}
                                        else if (chosen == 10){
                                            CSVManager exp5 = new CSVManager("Session");}
                                        else if (chosen == 11){
                                            CSVManager exp6 = new CSVManager("Cart");}
                                        else if (chosen == 12){
                                            CSVManager exp7 = new CSVManager("Speakers");}
                                        else if (chosen == 13){
                                            CSVManager exp8 = new CSVManager("Comment");}
                                        
                                    }
                                } catch (Exception e) {
                                    // no need to handle the exception.
                                   /** 
                                    * PaperManager Dmngr = new PaperManager();
                                    List<PaperInfo> lst = Dmngr.listAll();
                                    Iterator<PaperInfo> itr = lst.iterator();
                                    while (itr.hasNext()) {
                                        out.print("<tr>");
                                        PaperInfo info = itr.next();
                                        out.print("<td>" + info.title + "</td>");
                                        out.print("</tr>");
                                    } */
                                }
                            %>

                        </table>
                        <div class="span1"></div>          
                   </div> 
                </div>
                <div class="span1"></div>
            </div>
        </div>
    </div>
</body>