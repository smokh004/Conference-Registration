<%-- 
    Document   : AddWorkshop
    Created on : Nov 17, 2013, 2:40:54 PM
    Author     : Hiba Habli
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
        if (action.compareTo("add") == 0) {
            int check = Integer.parseInt(request.getParameter("checkIfChecked"));

            if (check == 0) {
                CartInfo info = new CartInfo();
                info.Id = cartID;
                info.workshop = true;
                info.total = info.total + 400;

                CartManager mngr = new CartManager();
                mngr.addWorkshop(info);

                //response.sendRedirect("PersonalInformation.jsp?cart_id=" + cartID);
                response.sendRedirect("uploadpaper.jsp?cart_id=" + cartID);
            } else {
               // response.sendRedirect("PersonalInformation.jsp?cart_id=" + cartID); 
               response.sendRedirect("uploadpaper.jsp?cart_id=" + cartID);
                
            }
        }
    } catch (Exception e) {
        // no need to handle the exception.
        //out.print("<br> ERROR");
    }
%>

<script>
    function workshopCheckbox(addWorkshop) {
        if (addWorkshop.checked == 1) {
            document.getElementById("checkIfChecked").value = 0
        }
        else {
            document.getElementById("checkIfChecked").value = -1
        }

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
                    <div class="bar" style="width: 35%;">Select Package</div>
                </div>
                <div class="span1"></div>
            </div>
            <div class="row-fluid">
                <div class="span1"></div>
                <div class="span8">
                    <div class='purple_mid_mid_font'>Upgrade your package!<div class='mid_grey_font'>Add all the workshops for $400 only.
                        </div>
                        <div id="shft_down_half"></div>
                        <form id="workshop" method="post">
                            <div class='small_black_font'><input type="checkbox" name="addWorkshop" id="addWorkshop" onclick="workshopCheckbox(addWorkshop)"/> Check to add Workshops.</div>
                            <input type="hidden" name="checkIfChecked" id="checkIfChecked" value=-1 />
                            <input type="hidden" value="add" name="action" id="action">
                           
                            <div id="shft_down"></div>
                            <button class="button btn">Submit</button>
                        </form>
                    </div>
                    <div class="span1"></div></div>
            </div>  
            <div class="span1"></div>
        </div>
    </div>
    <%@include file="jspf/footer.jspf" %>