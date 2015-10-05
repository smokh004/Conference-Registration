

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

<%
    int CARTID = Integer.parseInt(request.getParameter("cart_id"));
    // request.setAttribute("cartID", CARDID);

%>
<%
    try {
       // out.print("</br>  cart id" + CARTID);
        String action = request.getParameter("action");
        //out.print("</br> inside try");
        if (action.compareTo("skip") == 0) {
            //out.print("</br> inside if");

            response.sendRedirect("PersonalInformation.jsp?cart_id=" + CARTID);

        }
    } catch (Exception e) {
        // no need to handle the exception.
        //out.print("<br> fail");
        //out.print("<br> user "+ cid);
        //out.print("<br> address"+ addressID);
    }
%>

<div class="container-fluid">
    <div class="row-fluid">
        <div class="span1"></div>

        <div class=" span10 bottom_shadow img_bk">
            <div id="shft_down"></div>
            <div class="row-fluid">
                <div class="span2"></div>

                <p> <img src="img/check_mark.png" style="height: 50px; width: 50px;"> Your paper has been uploaded. Thank you</p>
                <div id="shft_down"></div>
                
                <div class="span2">
                <form method="post" id="next" name="next_btn">



                    <button class="btn btn-inverse" >Next</button>
                    <input type="hidden" value="skip" name="action" id="action">


                </form>

                </div>
            </div>


        </div>



        <div class="span1"></div>
    </div>
</div>
<%@include file="jspf/footer.jspf" %>