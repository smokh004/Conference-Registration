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



<div class="container-fluid">
    <div class="row-fluid">
        <div class="span1"></div>
        <div class=" span10 bottom_shadow img_bk">
            <div id="shft_down"></div>
            
            <div class="row-fluid">
                <div class="span1"></div>
                <div class="span8">
                    
                    <div class='red_mid_mid_font'>ERROR!</div><div class='mid_grey_font'>This user is already registered for this conference. </div>
                   <div id="shft_down"></div>
                    </div>
                    <div class="span1"></div></div>
            </div>  
            <div class="span1"></div>
        </div>
    </div>
<%@include file="jspf/footer.jspf" %>