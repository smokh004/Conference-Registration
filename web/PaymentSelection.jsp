<%-- 
    Document   : PaymentSelection
    Created on : Nov 17, 2013, 4:47:04 PM
    Author     : mac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="Entity.AddressInfo"%>
<%@page import="Manager.AddressManager"%>
<%@page import="Entity.UserInfo"%>
<%@page import="Manager.UserManager"%>
<%@page import="Entity.CartInfo"%>
<%@page import="Manager.CartManager"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@include file="jspf/header.jspf" %>


<%
    int cartID = Integer.parseInt(request.getParameter("cart_id"));
    try {
        String action = request.getParameter("action");
        if (action.compareTo("pick") == 0) {
            boolean choice = Boolean.parseBoolean(request.getParameter("selected"));

            out.print("</br> Choice: " + choice);

            CartInfo info = new CartInfo();
            info.Id = cartID;

            if (choice == true) {
                info.paid = true;
                CartManager mngr = new CartManager();
                int pymt = mngr.updatePaymentChoice(info);
                response.sendRedirect("BillingInformation.jsp?cart_id=" + cartID);
            } else {
                info.paid = false;
                CartManager mngr = new CartManager();
                int pymt = mngr.updatePaymentChoice(info);
                response.sendRedirect("Confirmation.jsp?cart_id=" + cartID);
            }

            //CartManager mngr = new CartManager();
            //int pymt = mngr.updatePaymentChoice(info);

        }
    } catch (Exception e) {
        // no need to handle the exception.
//        out.print("<br> ERROR");

    }
%>

<script>
    function payment(option) {

        document.getElementById("selected").value = option

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
                        <div class="bar bar_package" style="width: 35%;">Select Package</div>
                        <div class="bar bar-warning" style="width: 30%;">Personal Information</div>
                        <div class="bar bar-success" style="width: 5%;"></div>
                    </div>
                <div class="span1"></div>
                </div>
            <div class="row-fluid">
                <div class="span1"></div>
                <div class="span8">
                <div class='mid_grey_font'>Select your payment preference.</div>
                <div id="shft_down_half"></div>
<form id="workshop" method="post">

    <div class='small_black_font'><input type="radio" name="paymentChoice"  value ="true" onclick="payment(this.value)"/> Online </br></div>
    <div class='small_black_font'><input type="radio" name="paymentChoice"  value="false" onclick="payment(this.value)"/> On-Site </br></div>

    <input type="hidden" name="selected" id="selected" />
    <input type="hidden" value="pick" name="action" id="action">
    <div id="shft_down"></div>
    <button class="button btn">Next</button>
</form>
                </div>
                <div class="span1"></div></div>
        </div>  
        <div class="span1"></div>
    </div>
</div>
<%@include file="jspf/footer.jspf" %>
