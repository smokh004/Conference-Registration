<%-- 
    Document   : UserProfile
    Created on : Nov 20, 2013, 12:27:54 AM
    Author     : mac
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
                      
                        <button class="btn btn-inverse btn-large" onclick="user_choice(2)">Paper Statistics</button>
                        <button class="btn btn-inverse btn-large" onclick="user_choice(3)">Conference Participants</button>
                        <button class="btn btn-inverse btn-large" onclick="user_choice(4)">Export .CSV</button>
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
                                            out.print("<tr><td class='purple_mid_font'>PaperID</td><td class='purple_mid_font'>Title</td><td class='purple_mid_font'>Description</td></tr>");
                                            PaperManager Dmngr = new PaperManager();
                                            List<PaperInfo> lst = Dmngr.listAll();
                                            Iterator<PaperInfo> itr = lst.iterator();
                                            while (itr.hasNext()) {
                                                out.print("<tr>");
                                                PaperInfo info = itr.next();
                                                out.print("<td>" + info.PaperId + "</td><td>" + info.title + "</td><td>" + info.description +"</td>");
                                                out.print("</tr>");
                                            }
                                        } else if (chosen == 3) {

                                            out.print("<tr><td class='purple_mid_font'>UserID</td><td class='purple_mid_font'>FirstName</td><td class='purple_mid_font'>LastName</td></tr>");
                                            UserManager Umngr = new UserManager();
                                            List<UserInfo> lst = Umngr.listAll();
                                            Iterator<UserInfo> itr = lst.iterator();
                                            while (itr.hasNext()) {
                                                out.print("<tr>");
                                                UserInfo info = itr.next();
                                                out.print("<td>" + info.id + "</td><td>" + info.firstName + "</td><td>" + info.lastName + "</td>");
                                                out.print("</tr>");
                                            }

                                        }
                                        else if (chosen == 4){
                                            response.sendRedirect("exportCSV.jsp");
                                        }
                                    }
                                } catch (Exception e) {
                                    // no need to handle the exception.
                                    out.print("<tr><td class='purple_mid_font'>UserID</td><td class='purple_mid_font'>FirstName</td><td class='purple_mid_font'>LastName</td></tr>");

                                    UserManager Umngr = new UserManager();
                                    List<UserInfo> lst = Umngr.listAll();
                                    Iterator<UserInfo> itr = lst.iterator();
                                    while (itr.hasNext()) {
                                        out.print("<tr>");
                                        UserInfo info = itr.next();
                                        out.print("<td>" + info.id + "</td><td>" + info.firstName + "</td><td>" + info.lastName + "</td>");
                                        out.print("</tr>");
                                    }
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
