<%-- 
    Document   : PersonalInformation
    Created on : Nov 13, 2013, 8:44:11 PM
    Author     : Hiba Habli
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

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


<%
    session = request.getSession();
    String uidStr = session.getAttribute("uid").toString();
    int userID = Integer.parseInt(uidStr);

%>

<script>
    // init the datetimepicker and validationEngine
    $(document).ready(function() {

        $('#personalInfo').validationEngine('attach',
                {
                    promptPosition: "topLeft",
                    scroll: false,
                    autoHidePrompt: true
                });

    });



</script>
<%

    UserManager editMngr = new UserManager();
    UserInfo editedUser = editMngr.getUserById(userID);

%>

<div class="container-fluid">
    <div class="row-fluid">
        <div class="span1"></div>

        <div class=" span10 bottom_shadow img_bk">
            <div id="shft_down"></div>
            <form id="session" method="post">
                <div class="row-fluid">
                    <div class="span2"></div>
                    <div class="btn-group middle_con">
                        <button class="btn btn-inverse btn-large" onclick="user_choice(2)">Profile</button>
                        <button class="btn btn-inverse btn-large" onclick="user_choice(1)">Edit Profile</button>
                    </div>
                    <input type="hidden" value="pick" name="action" id="action">
                    <input type="hidden" value="all" name="choice" id="choice">
                    </form>
                </div>

                <!-- <div class="container span8"> -->
                <div class="row-fluid">
                    <div class="span1"></div>
                    <div class="span10 "> 

                        <script>
    function user_choice(pressed) {

        document.getElementById("choice").value = pressed

    }
                        </script>


                        <%
                            try {
                                String action = request.getParameter("action");
                                int chosen = Integer.parseInt(request.getParameter("choice"));
                                if (action.compareTo("pick") == 0) {
                                    if (chosen == 1) {

                                        response.sendRedirect("UserProfileEdit.jsp");
                                    } else if (chosen == 2) {

                                        response.sendRedirect("UserProfile.jsp");
                                    }
                                }
                            } catch (Exception e) {
                                // no need to handle the exception.
                            }
                        %>

                        <!-- <div class="container span8"> -->
                        <div class="row-fluid">

                            <!--  <div class="span5 "> -->
                            <div class="span1 "></div>
                            <div class="span5 "><div class="shadow"> <img src="img/dbms_bulb.jpg"></div></div>
                            <div class="span4 ">
                                <div class="purple_mid_font"> Personal Information </div>
                                <dl class="dl-horizontal">


                                    <dt>First Name: </dt><dd> <%out.print(editedUser.firstName);%> </dd>
                                    <dt>Last Name: </dt><dd><%out.print(editedUser.lastName);%>  </dd>
                                    <dt>Email: </dt><dd><%out.print(editedUser.email);%> </dd>
                                    <dt>Password: </dt><dd><%out.print(editedUser.pswrd);%>  </dd>
                                    <dt>Phone No: </dt><dd><%out.print(editedUser.phonnumber);%> </dd>
                                    <dt>Job Title: </dt><dd><%out.print(editedUser.jobtitle);%> </dd>
                                    <dt>Company: </dt><dd><%out.print(editedUser.company);%></dd>

                                </dl>

                                <!--</div>-->
                                <!--  <div class="span5"></div>      -->    
                                <!--<div class="span5 pull-right"> -->
                                <div class="purple_mid_font"> Reservation Information </div>
                                <dl class="dl-horizontal">
                                    <%
                                        //out.print("</br> user id" + userID);
                                        CartManager cartMngr = new CartManager();

                                        PackageDescriptionInfo pInfo = new PackageDescriptionInfo();
                                        PackageDescriptionManager pMngr = new PackageDescriptionManager();

                                        //out.print("here outside");
                                        List<CartInfo> lst = cartMngr.listAll(userID);
                                        Iterator<CartInfo> itr = lst.iterator();
                                        //out.print("here outside2");
                                        while (itr.hasNext()) {
                                            //out.print("here1");
                                            CartInfo info = itr.next();

                                            String paid = "Pay On Site";
                                            if (info.paid == true) {
                                                paid = "Paid Online";
                                            }
                                            String workshop = "Not Registered";
                                            if (info.workshop == true) {
                                                workshop = "Registered for Workshop";
                                            }
                                            String paper = "No Submitted Paper";
                                            if (info.paperId != -1) {
                                                paper = "Submitted Paper";
                                            }
                                            //out.print("here");
                                            PackageDescriptionInfo packageName = pMngr.getPackageById(info.packageId);
                                            out.print("<dt> Conference Package: </dt><dd>" + packageName.category + "</dd><dt> Total: </dt><dd>$" + info.total + "</dd><dt> Paid: </dt><dd>" + paid + "</dd><dt> Workshop: </dt><dd>" + workshop + "</dd><dt> Paper: </dt><dd>" + paper + "</dd><dt> Food Choice: </dt><dd>" + info.food + "</dd>");
                                            //out.print ("</br>  info " + info.total + " " +paid+ " " + info.userId+ " " +packageName.category);
                                        }

                                    %>
                                </dl>
                            </div>  

                        </div>
                        <div class="span1"></div>

                    </div>
                </div>
        </div>
    </div>
</div>
        <%@include file="jspf/footer.jspf" %>