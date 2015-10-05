<%-- 
    Document   : BillingInformation
    Created on : Nov 15, 2013, 5:42:33 PM
    Author     : Hiba Habli
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Entity.AddressInfo"%>
<%@page import="Manager.AddressManager"%>
<%@page import="Entity.UserInfo"%>
<%@page import="Manager.UserManager"%>
<%@page import="Entity.CartInfo"%>
<%@page import="Manager.CartManager"%>
<%@page import="Entity.CreditCardInfo"%>
<%@page import="Manager.CreditCardManager"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@include file="jspf/header.jspf" %>


<% int addressID = -5;
    int userID = -8;
    int cartID = Integer.parseInt(request.getParameter("cart_id"));
    //out.print("</br> cartID " +cartID);
    int cid = -9;
    //out.print("beginning");
    try {
        String action = request.getParameter("action");

        if (action.compareTo("reserve") == 0) {
           // out.print("inside in if");
            String type = request.getParameter("cardType");
            String number = request.getParameter("cardNo");
            String name =request.getParameter("nameOnCard");
            String code =request.getParameter("securityCode");
            String month= request.getParameter("month");
            String year = request.getParameter("year");
           // String exp_date = year+ "/" + month + "/"+ 01;
            String exp_date = month + " / "+ year ;            
           // out.print ("<br> dat: " + exp_date);
            String address1 = request.getParameter("addressline1");
            String address2 = request.getParameter("addressline2");
            String city = request.getParameter("city");
            String state = request.getParameter("state");
            String zip = request.getParameter("zip");
            String country = request.getParameter("country");

            //save user's credit card information
            CreditCardInfo cc_info = new CreditCardInfo();
            cc_info.number = number;
           // out.print("</br> number: "+cc_info.number );
            cc_info.name_on_card = name;
           // out.print("</br> name: "+cc_info.name_on_card);
            cc_info.expiration_date = exp_date.toString();
            //out.print("</br> date: "+cc_info.expiration_date);
            cc_info.security_code = code;
           // out.print("</br> code: "+cc_info.security_code);
            cc_info.card_type = type;
            //out.print("</br> type: "+cc_info.card_type);

            
            CreditCardManager ccMngr =  new CreditCardManager();
            int ccid = 234;
            ccid = ccMngr.createCreditCard(cc_info);
            out.print("</br> ccid: "+ ccid);
            
            //saving user's company address info to address table of type "Work"
            AddressInfo adrs_info = new AddressInfo();
            adrs_info.addressline1 = address1;
            adrs_info.addressline2 = address2;
            adrs_info.city = city;
            adrs_info.state = state;
            adrs_info.zip = zip;
            adrs_info.country = country;
            adrs_info.Type = "Billing";
            adrs_info.creditCardId = ccid;
           

            AddressManager adrs_mngr = new AddressManager();
            // int addressID=-1;
            addressID = adrs_mngr.createAddress(adrs_info);
          //  out.print("<br> address ID: " + addressID);

            CartInfo cartInfo = new CartInfo();
            cartInfo.creditCardID = ccid;
            cartInfo.addressID = addressID;
            cartInfo.Id = cartID;
            
          //  out.print(" </br> still working b4 cart mngr");
            CartManager cartMngr = new CartManager();
          //  out.print(" </br> still working after cart mngr");
            cid = cartMngr.updateCartBilling(cartInfo);
           // out.print("<br> cart ID: " + cid);
            
            response.sendRedirect("Confirmation.jsp?cart_id=" + cartID );

        }
    } catch (Exception e) {
        // no need to handle the exception.
       out.print("<br> fail");
       // out.print("<br> user " + cid);
       // out.print("<br> address" + addressID);
    }
%>

<script>
    // init the datetimepicker and validationEngine
    $(document).ready(function() {

        $('#billing').validationEngine('attach',
                {
                    promptPosition: "topLeft",
                    scroll: false,
                    autoHidePrompt: true
                });

    });



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
                        <div class="bar" style="width: 35%;">Select Package</div>
                        <div class="bar bar-warning" style="width: 30%;">Personal Information</div>
                        <div class="bar bar-success" style="width: 5%;"></div>
                        <div class="bar bar-danger" style="width: 30%;">Payment & Payment </div>
                    </div>
                <div class="span1"></div>
                </div>
                <!-- <div class="container span8"> -->
                <div class="row-fluid">
                    
                    <div class="span5 "> 



        <form  id="billing" name="billing" method="post">
            <dl class="dl-horizontal">
                <dt>Card Type: </dt>
                <dd><select name="cardType">
                        <option value="Visa">Visa</option>   
                        <option value="MasterCard">MasterCard</option> 
                        <option value="American Express">American Express</option> 
                    </select></dd>
                <dt>Card Number: </dt><dd><input type="text" placeholder="Card Number" name="cardNo" class ="validate[required, custom[onlyNumberSp],minSize[16], maxSize[16]]"></dd>
                <dt>Name On Card: </dt><dd><input type="text" placeholder="Name On Card" name="nameOnCard" class ="validate[required, custom[onlyLetterSp],maxSize[40]]"></dd>
                <dt>Expiration Date: </dt><dd> <select name="month" style=" width:110px;" >
                        <option value="01">January
                        <option value="02">February
                        <option value="03">March
                        <option value="04">April
                        <option value="05">May
                        <option value="06">June
                        <option value="07">July
                        <option value="08">August
                        <option value="09">September
                        <option value="10">October
                        <option value="11">November
                        <option value="12">December
                    </select>
                    <input  style ="width:20px; border:none; " type="text" value='/' name="" >
                    <select name="year" style=" width:70px; "><%
                        int year = 2013;
                        while (year < 2051) {
                            out.print("<option value=" + year + ">" + year);
                            year = year + 1;
                        }
                        %></select></dd>
                <dt>Security Code: </dt><dd><input type="text" placeholder="Security Code" name="securityCode" class ="validate[required, custom[onlyNumberSp],minSize[3], maxSize[3]]"></dd>
                <dt>Address Line 1: </dt><dd><input type="text" placeholder="Address Line 1" name="addressline1" class ="validate[required, maxSize[30]]"/></dd>
                <dt>Address Line 2: </dt><dd><input type="text" placeholder="Address Line 2" name="addressline2" class ="validate[maxSize[30]]"></dd>
                <dt>City: </dt><dd><input type="text" placeholder="City" name="city" class ="validate[required, maxSize[40]]"></dd>
                <dt>State: </dt><dd><input type="text" placeholder="State" name="state" class ="validate[required, maxSize[30]]"></dd>
                <dt>ZIP: </dt><dd><input type="text" placeholder="ZIP" name="zip" class ="validate[required, custom[onlyNumberSp],mminSize[5], maxSize[5]]"></dd>
                <dt>Country: </dt><dd><input type="text" placeholder="Country" name="country" class ="validate[required, maxSize[40]]"></dd>

                <dd>
                    <div class="controls pull-right">
                        <button class="btn">Submit</button>
                        <div>
                            </dd>
                            </dl>
                            <input type="hidden" value="reserve" name="action" id="action"></input> 
                            </form>  
                        </div>
                <div class="span2"></div>          
                <div class="span3">Create a cart for picked conference.</div>  
                </div>
                <div class="span1"></div>
            </div>
        </div>
    </div>
                <%@include file="jspf/footer.jspf" %>