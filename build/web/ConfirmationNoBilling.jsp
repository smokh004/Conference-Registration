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
<%@page import="Manager.ConfirmationManager"%>
<%@page import="Entity.ConfirmationInfo"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@include file="jspf/header.jspf" %>


<div class="container-fluid">
    <div class="row-fluid">
        <div class="span1"></div>

        <div class=" span10 bottom_shadow img_bk">
            <div id="shft_down"></div>
            <div class="row-fluid">
                <div class="span2"></div>
                <p> <img src="img/check_mark.png" style="height: 50px; width: 50px;"> A confirmation email has been sent to you. Please print and bring on conference day. Thank you</p>
                    <%
                        int cartID = Integer.parseInt(request.getParameter("cart_id"));
                        int user_id = 0;
                        try {
                            ConfirmationInfo conInfo = new ConfirmationInfo();
                            CartManager cartMngr = new CartManager();
                            List<CartInfo> lst = cartMngr.listAllById(cartID);
                            Iterator<CartInfo> itr = lst.iterator();

                            while (itr.hasNext()) {
                                CartInfo info = itr.next();

                                user_id = info.userId;
                            }
                            UserManager userMngr = new UserManager();
                            UserInfo userEmail = userMngr.getUserById(user_id);

                            conInfo.firstName = userEmail.firstName;
                            conInfo.lastName = userEmail.lastName;
                            conInfo.email = userEmail.email;
                            conInfo.phonnumber = userEmail.phonnumber;
                            conInfo.jobtitle = userEmail.jobtitle;
                            conInfo.company = userEmail.company;

                            PackageDescriptionInfo pInfo = new PackageDescriptionInfo();
                            PackageDescriptionManager pMngr = new PackageDescriptionManager();

                            //out.print("here outside");
                            List<CartInfo> lst2 = cartMngr.listAll(user_id);
                            Iterator<CartInfo> itr2 = lst2.iterator();
                            //out.print("here outside2");
                            while (itr2.hasNext()) {
                                //out.print("here1");
                                CartInfo info = itr2.next();

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

                         //       out.print("<dt> Conference Package: </dt><dd>" + packageName.category + "</dd><dt> Total: </dt><dd>$" + info.total + "</dd><dt> Paid: </dt><dd>" + paid + "</dd><dt> Workshop: </dt><dd>" + workshop + "</dd><dt> Paper: </dt><dd>" + paper + "</dd><dt> Food Choice: </dt><dd>" + info.food + "</dd>");
                                ConfirmationManager conMngr = new ConfirmationManager();
                                conMngr.confirmationEmail(userEmail, packageName, info);
                                //out.print ("</br>  info " + info.total + " " +paid+ " " + info.userId+ " " +packageName.category);
                            }
                           



                        } catch (Exception e) {
                            // no need to handle the exception.
                            //out.print("<br> ERROR");
                        }
                    %>
           
              
                <div class="span2"></div>
            </div>


        </div>
        <div class="span1"></div>
    </div>
</div>


<%@include file="jspf/footer.jspf" %>
