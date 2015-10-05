<%-- 
    Document   : PersonalInformation
    Created on : Nov 13, 2013, 8:44:11 PM
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
    session = request.getSession();
    String uidStr = session.getAttribute("uid").toString();
    int userID = Integer.parseInt(uidStr);

//int cartID = Integer.parseInt(request.getParameter("cart_id"));
    int cid = -9;
    // out.print("beginning");
    try {
        String action = request.getParameter("action");

        if (action.compareTo("reserve") == 0) {

            String first_name = request.getParameter("fname");
            String last_name = request.getParameter("lname");
            String email = request.getParameter("email");
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
            info.id = userID;
            UserManager mngr = new UserManager();
            int newUSERE = 12;
            newUSERE = mngr.editUser(info);

            CartInfo cartInfo = new CartInfo();
            cartInfo.userId = userID;
            cartInfo.food = food;

            CartManager cartMngr = new CartManager();
            cid = cartMngr.editCartUser(cartInfo);


        }
    } catch (Exception e) {
        // no need to handle the exception.
        //out.print("<br> fail");
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
<% //int eu = 44;
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
                        <div class="purple_mid_font"> Edit Personal Information </div>

                        <div class="row-fluid">

                            <div class="span6 pull-left "> 




                                <form  id="personalInfo" name="personalInfo" method="post">
                                    <dl class="dl-horizontal">


                                        <dt>First Name: </dt><dd><input type="text" value="<%out.print(editedUser.firstName);%>" placeholder="First Name" name="fname" class ="validate[required, custom[onlyLetterSp],maxSize[50]]"></dd>
                                        <dt>Last Name: </dt><dd><input type="text" value="<%out.print(editedUser.lastName);%>"  placeholder="Last Name" name="lname" class ="validate[required, custom[onlyLetterSp],maxSize[50]]"></dd>
                                        <dt>Email: </dt><dd><input type="text"  value="<%out.print(editedUser.email);%>" placeholder="Email" name="email" class="validate[required,custom[email]]"></dd>
                                        <dt>Password: </dt><dd><input type="password"  value="<%out.print(editedUser.pswrd);%>"  placeholder="Password" name="password" class="validate[required, custom[onlyLetterNumber], minSize[8], maxSize[16]]"></dd>
                                        <dt>Phone No: </dt><dd><input type="text"  value="<%out.print(editedUser.phonnumber);%>" placeholder="Phone No" name="phoneno" class ="validate[required, custom[onlyNumberSp],maxSize[50]]"></dd>
                                        <dt>Job Title: </dt><dd><input type="text"  value="<%out.print(editedUser.jobtitle);%>"  placeholder="Job Title" name="jobtitle" class ="validate[required, custom[onlyLetterSp],maxSize[50]]"></dd>
                                        <dt>Company: </dt><dd><input type="text"  value="<%out.print(editedUser.company);%>" placeholder="Company" name="company" class ="validate[required, custom[onlyLetterSp],maxSize[50]]"></dd>
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
                                                <button class="btn">Save Changes</button>
                                                <div>
                                                    </dd>
                                                    </dl>
                                                    <input type="hidden" value="reserve" name="action" id="action"></input> 
                                                    </form>  
                                                </div>
                                                <div class="span5 pull-left "><div class="shadow"> <img src="img/dbms_bulb.jpg"></div></div>         

                                            </div>
                                            </div>
                                            </div>
                                            </div>
                                            </div> 
                                            </div>
                                            <%@include file="jspf/footer.jspf" %>