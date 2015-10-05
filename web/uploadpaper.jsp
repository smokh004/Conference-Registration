<%-- 
    Document   : AddWorkshop
    Created on : Nov 17, 2013, 2:40:54 PM
    Author     : Shokoufe
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
    int CARTID = Integer.parseInt(request.getParameter("cart_id"));
    // request.setAttribute("cartID", CARDID);

%>
<%
    try {
        String action = request.getParameter("action");

        if (action.compareTo("skip") == 0) {
 out.print("</br> inside if");

           // response.sendRedirect("PersonalInformation.jsp?cart_id=" + CARTID);
         response.sendRedirect("PaymentSelection.jsp?cart_id=" + CARTID);

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
                    <div class='purple_mid_mid_font'>Upload your paper!</div><div class='mid_grey_font'>Submit your paper for $50 only.
                        </div>
                        <div id="shft_down_half"></div>
                        <form method="post" action="UploadServelet" enctype="multipart/form-data">
                            <input type="hidden" name="cartID" value="<% out.print(CARTID);%>"/> <br/><br/>
                             <dl class="dl-horizontal">
                
               
                        <dt>Title: </dt>  <dd><input type="text" name="title" /> </dd>
                        <dt>Description: </dt><dd> <input type="text" name="description" /> </dd>
                        <dt>Select file to upload:</dt><dd><input type="file" name="dataFile" id="fileChooser"/></dd>
                        
                        
                        
                        </dl>    
                        <!--<input type="submit" value="Upload" /> -->
                        <button class="btn btn-inverse"  value="Upload">Submit</button>    
                            
                        </form>
                             
                        <form method="post" id="skip_btn" name="skip_btn">

                      
                                
                                <button class="btn btn-inverse" >Skip</button>
                                <input type="hidden" value="skip" name="action" id="action">
                            

                        </form>
                    </div>
                    <div class="span1"></div></div>
            </div>  
            <div class="span1"></div>
        </div>
    </div>
    <%@include file="jspf/footer.jspf" %>