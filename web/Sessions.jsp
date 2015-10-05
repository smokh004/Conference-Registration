<%-- 
    Document   : Sessions
    Created on : Nov 13, 2013, 6:35:24 PM
    Author     : Hiba Habli
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Entity.SessionInfo"%>
<%@page import="Manager.SessionManager"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@include file="jspf/header.jspf" %>
<body>

    <!-- side tab to switch between sessions.-->

    <div class="container-fluid ">
        <div class="row-fluid">
            <div class="span1"></div>

            <div class=" span10 bottom_shadow img_bk">
                <div id="shft_down"></div>
                <form id="session" method="post">
                    <div class="btn-group middle_con">
                        <button class="btn btn-inverse btn-large" onclick="session_choice(1)">All Sessions</button>
                        <button class="btn btn-inverse btn-large" onclick="session_choice(2)">Conference Sessions</button>
                        <button class="btn btn-inverse btn-large" onclick="session_choice(3)">Tutorial Sessions</button>
                    </div>
                    <input type="hidden" value="pick" name="action" id="action">
                    <input type="hidden" value="all" name="choice" id="choice">
                </form>
                <!-- <div class="container span8"> -->
                <div class="row-fluid">
                    <div class="span1"></div>
                    <div class="span10 "> 
                        <script>
                            function session_choice(pressed) {

                                document.getElementById("choice").value = pressed

                            }
                        </script>
                        <table class="table table-striped ">     
                            <%
                                out.print("<tr><td class='purple_mid_font'>Title</td><td class='purple_mid_font'>Session</td><td class='purple_mid_font'>Fee($)</td><td class='purple_mid_font'>Date</td><td class='purple_mid_font'>Start Time</td><td class='purple_mid_font'>End Time</td></tr>");
                                try {
                                    String action = request.getParameter("action");
                                    int chosen = Integer.parseInt(request.getParameter("choice"));
                                    if (action.compareTo("pick") == 0) {
                                        if (chosen == 1) {
                                            SessionManager Dmngr = new SessionManager();
                                            List<SessionInfo> lst = Dmngr.listAll();
                                            Iterator<SessionInfo> itr = lst.iterator();
                                            while (itr.hasNext()) {
                                                out.print("<tr >");
                                                SessionInfo info = itr.next();
                                                out.print("<td>" + info.title + "</td><td>" + info.type + "</td><td>" + info.fee + "</td><td>" + info.date + "</td><td>" + info.starttime + "</td><td>" + info.endtime + "</td>");
                                                out.print("</tr>");
                                            }
                                        } else if (chosen == 2) {
                                            SessionManager Dmngr = new SessionManager();
                                            List<SessionInfo> lst = Dmngr.listAllConference();
                                            Iterator<SessionInfo> itr = lst.iterator();
                                            while (itr.hasNext()) {
                                                out.print("<tr>");
                                                SessionInfo info = itr.next();
                                                out.print("<td>" + info.title + "</td><td>" + info.type + "</td><td>" + info.fee + "</td><td>" + info.date + "</td><td>" + info.starttime + "</td><td>" + info.endtime + "</td>");
                                                out.print("</tr>");
                                            }
                                        } else if (chosen == 3) {
                                            SessionManager Dmngr = new SessionManager();
                                            List<SessionInfo> lst = Dmngr.listAllTutorial();
                                            Iterator<SessionInfo> itr = lst.iterator();
                                            while (itr.hasNext()) {
                                                out.print("<tr>");
                                                SessionInfo info = itr.next();
                                                out.print("<td>" + info.title + "</td><td>" + info.type + "</td><td>" + info.fee + "</td><td>" + info.date + "</td><td>" + info.starttime + "</td><td>" + info.endtime + "</td>");
                                                out.print("</tr>");
                                            }
                                        }
                                    }
                                } catch (Exception e) {
                                    // no need to handle the exception.
                                    SessionManager Dmngr = new SessionManager();
                                    List<SessionInfo> lst = Dmngr.listAll();
                                    Iterator<SessionInfo> itr = lst.iterator();
                                    while (itr.hasNext()) {
                                        out.print("<tr>");
                                        SessionInfo info = itr.next();
                                        out.print("<td>" + info.title + "</td><td>" + info.type + "</td><td>" + info.fee + "</td><td>" + info.date + "</td><td>" + info.starttime + "</td><td>" + info.endtime + "</td>");
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
<%@include file="jspf/footer.jspf" %>