<%-- 
    Document   : SessionSelection
    Created on : Nov 13, 2013, 11:55:16 PM
    Author     : Hiba Habli
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Entity.SessionInfo"%>
<%@page import="Manager.SessionManager"%>
<%@page import="Entity.CartInfo"%>
<%@page import="Manager.CartManager"%>
<%@page import="Entity.PackageDescriptionInfo"%>
<%@page import="Manager.PackageDescriptionManager"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@include file="jspf/header.jspf" %>
<body>
    <%

        Date date = new Date();
        //out.print("</br> dec then current " +date);
        SimpleDateFormat sdf = new SimpleDateFormat("dd/mm/yyyy");
        Date dt = sdf.parse("01/01/2014");
        //out.print("</br> dec then current " +dt);
        int deadline = date.compareTo(dt); //if deadline = -1 then earlybird registration
        //out.println("</br> " + deadline); 

        try {
            String action = request.getParameter("action");
            if (action.compareTo("pick") == 0) {
                int packageID = Integer.parseInt(request.getParameter("result"));

                PackageDescriptionManager package_mngr = new PackageDescriptionManager();
                PackageDescriptionInfo packageById = package_mngr.getPackageById(packageID);

                CartInfo info = new CartInfo();
                info.packageId = packageID;
                float earlybird_price = packageById.price - ((packageById.price * 20) / 100);
                if (deadline == -1) {
                    info.total = info.total + earlybird_price;
                } else {
                    info.total = info.total + packageById.price;
                }
                info.workshop = false;
                if (packageID == 8) {
                    info.workshop = true;
                }

                CartManager mngr = new CartManager();
                int cartID = -3;
                cartID = mngr.createCart(info);
                //out.print("<br> cart ID: " + cartID);


                if (packageID != 1 && packageID != 2 && packageID != 8) {
                    response.sendRedirect("AddWorkshop.jsp?cart_id=" + cartID);
                } else {
                    //response.sendRedirect("PersonalInformation.jsp?cart_id=" + cartID);
                    response.sendRedirect("uploadpaper.jsp?cart_id=" + cartID);
                }

            }


        } catch (Exception e) {
            // no need to handle the exception.
            //out.print("<br> ERROR");
        }
    %>
    <script>

        function selectPackageCategory(category)
        {
            document.getElementById("result").value = category

        }
    </script>
    <div class="container-fluid">
        <div class="row-fluid">
            <div class="span1"></div>

            <div class=" span10 bottom_shadow img_bk">
                <div id="shft_down"></div>
                <!-- progress bar -->
                <div class="row-fluid">
                    <div class="span1"></div>
                    <div class="progress progress-striped active span10">
                        <div class="bar" style="width: 30%;">Select Package</div>

                    </div>
                    <div class="span1"></div>
                </div>
                <!-- <div class="container span8"> -->
                <div class="row-fluid">
                    <div class="span1"></div>
                    <div class="span10"> 

                        <table class="table table-bordered session_table shadow">
                            <tr class="small_grey_font ">
                                <td></td>
                                <td class="span3">Full Conference & Workshop </td>
                                <td class="span3">Full Conference</td>
                                <td class="span3">Startup Pass</td>
                                <td class="span3">Student Pass</td>
                                <td class="span3">Networking Pass</td>
                            </tr>
                            <tr>
                                <td >Workshops</td>
                                <td><img src="img/check_mark.png" style=" height: 50px; width: 50px;"></td>
                                <td></td>
                                <td>(Add for $400)</td>
                                <td>(Add for $400)</td>
                                <td>(Add for $400)</td>
                            </tr>
                            <tr>
                                <td>Expo Hall</td>
                                <td><img src="img/check_mark.png" style=" height: 50px; width: 50px;"></td>
                                <td><img src="img/check_mark.png" style=" height: 50px; width: 50px;"></td>
                                <td><img src="img/check_mark.png" style=" height: 50px; width: 50px;"></td>
                                <td><img src="img/check_mark.png" style=" height: 50px; width: 50px;"></td>
                                <td><img src="img/check_mark.png" style=" height: 50px; width: 50px;"></td>
                           
                            </tr>
                            <tr>
                                <td>Keynotes</td>
                                <td><img src="img/check_mark.png" style=" height: 50px; width: 50px;"></td>
                                <td><img src="img/check_mark.png" style=" height: 50px; width: 50px;"></td>
                                <td><img src="img/check_mark.png" style=" height: 50px; width: 50px;"></td>
                                <td><img src="img/check_mark.png" style=" height: 50px; width: 50px;"></td>
                                <td><img src="img/check_mark.png" style=" height: 50px; width: 50px;"></td>
                            </tr>
                            <tr>
                                <td>Startup Sessions</td>
                               <td><img src="img/check_mark.png" style=" height: 50px; width: 50px;"></td>
                                <td><img src="img/check_mark.png" style=" height: 50px; width: 50px;"></td>
                                <td><img src="img/check_mark.png" style=" height: 50px; width: 50px;"></td>
                                <td><img src="img/check_mark.png" style=" height: 50px; width: 50px;"></td>
                                <td></td>
                           </tr>
                            <tr>
                                <td>Networking Lunch</td>
                                <td><img src="img/check_mark.png" style=" height: 50px; width: 50px;"></td>
                                <td><img src="img/check_mark.png" style=" height: 50px; width: 50px;"></td>
                                <td><img src="img/check_mark.png" style=" height: 50px; width: 50px;"></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>Continental Breakfast</td>
                                <td><img src="img/check_mark.png" style=" height: 50px; width: 50px;"></td>
                                <td><img src="img/check_mark.png" style=" height: 50px; width: 50px;"></td>
                                <td><img src="img/check_mark.png" style=" height: 50px; width: 50px;"></td>
                                <td><img src="img/check_mark.png" style=" height: 50px; width: 50px;"></td>
                                <td><img src="img/check_mark.png" style=" height: 50px; width: 50px;"></td>
                           
                            </tr>
                            <tr>
                                <td>Welcome Party</td>
                                <td><img src="img/check_mark.png" style=" height: 50px; width: 50px;"></td>
                                <td><img src="img/check_mark.png" style=" height: 50px; width: 50px;"></td>
                                <td><img src="img/check_mark.png" style=" height: 50px; width: 50px;"></td>
                                <td><img src="img/check_mark.png" style=" height: 50px; width: 50px;"></td>
                                <td><img src="img/check_mark.png" style=" height: 50px; width: 50px;"></td>
                            </tr>
                            <tr>
                                <td>Session Videos</td>
                                <td><img src="img/check_mark.png" style=" height: 50px; width: 50px;"></td>
                                <td><img src="img/check_mark.png" style=" height: 50px; width: 50px;"></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>T-Shirt</td>
                                <td><img src="img/check_mark.png" style=" height: 50px; width: 50px;"></td>
                                <td><img src="img/check_mark.png" style=" height: 50px; width: 50px;"></td>
                                <td><img src="img/check_mark.png" style=" height: 50px; width: 50px;"></td>
                                <td><img src="img/check_mark.png" style=" height: 50px; width: 50px;"></td>
                                <td><img src="img/check_mark.png" style=" height: 50px; width: 50px;"></td>
                           
                            </tr>
                        </table>
                        <!-- </div> -->
                        <!--  </div> -->
 
            <div id="shft_down_quart"></div>
            <div class="devider_index"></div>
            <div id="shft_down_half"></div>
            
             <p class="text-center">
            <a class="mid_grey_font">Register before January 2014 for</a> </p>
             <p class="text-center" >
            <a class="mid_grey_font">special prices for </a>
            <a href="SessionSelection.jsp" class="purple_large_font">Students </a> 
             <a class="mid_grey_font">and </a>
             <a href="SessionSelection.jsp" class="purple_large_font">Early Birds!</a>
             </p>

             <div id="shft_down_quart"></div>
            <div class="devider_index"></div>
            <div id="shft_down_half"></div>

                        <!--<div class="container">-->
                        <!--   <div class="span8"> -->
                        <form id="selectPackage" method="post">
                            <table class="table table-hover">    
                                <tr class="small_grey_font table_brdr" >
                                    <td></td>
                                    <td>Package</td>
                                    <td> Fee</td>
                                    <td> EarlyBird Fee</td>
                                </tr>
                                <%--
                                    SessionManager Dmngr = new SessionManager();
                                    List<SessionInfo> lst = Dmngr.listAll();
                                    Iterator<SessionInfo> itr = lst.iterator();
                                    while (itr.hasNext()) {
                                        out.print("<tr>");
                                        SessionInfo info = itr.next();
                                        out.print("<td>" + info.title + "</td><td>" + info.type + "</td><td>" + info.fee + "</td><td>" + info.date + "</td><td>" + info.starttime + "</td><td>" + info.endtime + "</td>");
                                        out.print("<tr>");
                                    }
                                --%>

                                <%
                                    PackageDescriptionManager Dmngr = new PackageDescriptionManager();
                                    List<PackageDescriptionInfo> lst = Dmngr.listAll();
                                    Iterator<PackageDescriptionInfo> itr = lst.iterator();
                                    while (itr.hasNext()) {
                                        out.print("<tr >");
                                        PackageDescriptionInfo info = itr.next();
                                        float earlybird_price = info.price - ((info.price * 20) / 100);
                                        out.print("<td><input type='radio' name='category' value=" + info.id + " onclick='selectPackageCategory(this.value)' ></td>");
                                        out.print("<td>" + info.category + "</td><td>$" + info.price + "</td><td>$" + earlybird_price + "</td>");
                                        out.print("<tr>");
                                    }
                                %>

                            </table>

                            <button class="btn pull-right">Next Step</button>
                            <input type="hidden" value="pick" name="action" id="action">
                            <input type="hidden" id="result" name="result">


                        </form>


                        <div class="span1"></div>          
                    </div>
                </div>
                <div class="span1"></div>
            </div>
        </div>
    </div>

</body>
<%@include file="jspf/footer.jspf" %>