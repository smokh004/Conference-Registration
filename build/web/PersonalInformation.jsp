<%-- 
    Document   : PersonalInformation
    Created on : Nov 13, 2013, 8:44:11 PM
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

<script>
    $(".alert").alert();
</script>
<%
    int addressID = -5;
    int userID = -8;
    int cartID = Integer.parseInt(request.getParameter("cart_id"));
    int cid = -9;
    // out.print("beginning");
    try {// coopy
        String action = request.getParameter("action"); //copy

        if (action.compareTo("reserve") == 0) { //copy
//out.print("inside in if");
            String first_name = request.getParameter("fname"); //copy
            String last_name = request.getParameter("lname");
            String email = request.getParameter("email");
            //String confirm_email = request.getParameter("cnfrm_email");
            String password = request.getParameter("password");
            String phone_no = request.getParameter("phoneno");
            String job_title = request.getParameter("jobtitle");
            String company = request.getParameter("company");
            String food = request.getParameter("food");
            //creating new user and adding info to user table
            UserInfo info = new UserInfo();
            info.firstName = first_name;
            info.lastName = last_name;
            info.email = email;
            info.pswrd = password;
            info.phonnumber = phone_no;
            info.jobtitle = job_title;
            info.company = company;

            UserManager mngr = new UserManager();
            //int userID=-1;
            userID = mngr.createUser(info);
            out.print("<br> user ID: "+userID);

           // out.print("<br> user ID working: " + userID);
            int checkEmail = 9;
            checkEmail = mngr.emailRegistered(email);
            if (checkEmail == -1) {
                response.sendRedirect("ErrorPage.jsp");

            }

            //saving user's company address info to address table of type "Work"
            /**
             * AddressInfo adrs_info = new AddressInfo(); adrs_info.addressline1
             * = address1; adrs_info.addressline2 = address2; adrs_info.city =
             * city; adrs_info.state = state; adrs_info.zip = zip;
             * adrs_info.country = country; adrs_info.Type = "Work";
             * adrs_info.UserId = userID;
             *
             * AddressManager adrs_mngr= new AddressManager(); // int
             * addressID=-1; addressID= adrs_mngr.createAddress(adrs_info);
             * out.print("<br> address ID: "+addressID);
             */
            CartInfo cartInfo = new CartInfo();
            cartInfo.userId = userID;
            cartInfo.Id = cartID;
            cartInfo.food = food;
            out.print("<br> cart ID: " + cartID);
            //  out.print(" </br> still working b4 cart mngr");
            CartManager cartMngr = new CartManager();
            /////////////////////////

            ////////////////////////
            //   out.print(" </br> still working after cart mngr");
            cid = cartMngr.updateCartUser(cartInfo);
            out.print("<br> cart ID: " + cid);

            response.sendRedirect("PaymentSelection.jsp?cart_id=" + cartID);
            //response.sendRedirect("uploadpaper.jsp?cart_id=" + cartID);

        }
    } catch (Exception e) {
        // no need to handle the exception.
        //out.print("<br> fail");
        //out.print("<br> user "+ cid);
        //out.print("<br> address"+ addressID);
    }
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
                </div>
                <div class="span1"></div>
            </div>
            <!-- <div class="container span8"> -->
            <div class="row-fluid">

                <div class="span5 "> 




                    <form  id="personalInfo" name="personalInfo" method="post">
                        <dl class="dl-horizontal">
                            <dt>First Name: </dt><dd><input type="text" placeholder="First Name" name="fname" class ="validate[required, custom[onlyLetterSp],maxSize[50]]"></dd>
                            <dt>Last Name: </dt><dd><input type="text" placeholder="Last Name" name="lname" class ="validate[required, custom[onlyLetterSp],maxSize[50]]"></dd>
                            <dt>Email: </dt><dd><input type="text" placeholder="Email" name="email" class="validate[required,custom[email]]"></dd>
                            <dt>Password: </dt><dd><input type="password" placeholder="Password" name="password" class="validate[required, custom[onlyLetterNumber], minSize[8], maxSize[16]]"></dd>
                            <dt>Phone No: </dt><dd><input type="text" placeholder="Phone No" name="phoneno" class ="validate[required, custom[onlyNumberSp],maxSize[50]]"></dd>
                            <dt>Job Title: </dt><dd><input type="text" placeholder="Job Title" name="jobtitle" class ="validate[required, custom[onlyLetterSp],maxSize[50]]"></dd>
                            <dt>Company: </dt><dd><input type="text" placeholder="Company" name="company" class ="validate[required, custom[onlyLetterSp],maxSize[50]]"></dd>
                            <dt>Food Choice: </dt> <dd>
                                <select name="food">
                                    <option value="Any"> Any</option>
                                    <option value="Vegeterian"> Vegeterian</option>   
                                    <option value="Vegan"> Vegan</option> 
                                    <option value="Kosher"> Kosher</option> 
                                    <option value="Halal"> Halal</option>
                                    <option value="Gluten-Free"> Gluten-Free</option>
                                </select>
                            </dd>
                            <dd>
                                <div class="controls pull-right">
                                    <button class="btn">Submit</button>
                                    <div>
                                        </dd>
                                        </dl>
                                        <input type="hidden" value="reserve" name="action" id="action"><!--copy this -->
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