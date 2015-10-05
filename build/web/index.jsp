<%-- 
    Document   : index
    Created on : Nov 6, 2013, 8:55:59 PM
    Author     : Hiba
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="Entity.CommentInfo"%>
<%@page import="Manager.CommentManager"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@include file="jspf/header.jspf" %>


<%
    try {
        String action = request.getParameter("action");

        if (action.compareTo("cmnt") == 0) {
//out.print("inside in if");
            String commentName = request.getParameter("comment_name");
            String commentEmail = request.getParameter("comment_email");
            String commentText = request.getParameter("comment_text");
            
            CommentInfo info = new CommentInfo ();
            info.name = commentName;
            info.email = commentEmail;
            info.comment = commentText;
            
            CommentManager Mngr = new CommentManager();
            Mngr.createComment(info);
            response.sendRedirect("index.jsp");
            
        }
    }catch (Exception e) {
        // no need to handle the exception.
       // out.print("<br> fail");
     
    }
            %>
            
            
            
            
            
<div class="container-fluid">
    <div class="row-fluid">
        <div class="span1"></div>
        <div class=" span10 bottom_shadow">
            <!-- <div class="container span8"> -->


            <div id="myCarousel" class="carousel slide" >
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active" ></li>
                    <li data-target="#myCarousel" data-slide-to="1" ></li>
                    <li data-target="#myCarousel" data-slide-to="2"  ></li>
                </ol>

                <!-- Carousel items -->
                <div class="carousel-inner">
                    <div class="active item"><img style="width: 1200px; height: 500px" src='img/dbms_table.jpg'></div>
                    <div class="item"> <img style="width: 1200px; height: 500px" src='img/dbms_bulbs.jpg'></div>
                    <div class="item"> <img  style="width: 1200px; height: 500px" src='img/dbms_success.jpg'></div>
                </div>

                <!-- Carousel nav -->
                <a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
                <a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>    
            </div> <!-- myCarousel -->

            <div id="shft_down_half"></div>
            <div class="devider_index"></div>
            <div id="shft_down_quart"></div>
            
            <p class="text-center">
            <a class="purple_large_font"> Conference, </a>
            <a class="mid_grey_font">  helps you get published at the right conference on time.</a></p>
            
            <div id="shft_down_quart"></div>
            <div class="devider_index"></div>
            <div id="shft_down_half"></div>
            
             <p class="text-center">
            <a class="mid_grey_font">  Special prices for Students and Early Birds!</a>
            <a href="SessionSelection.jsp" class="purple_large_font"> REGISTER NOW </a></p>

             <div id="shft_down_quart"></div>
            <div class="devider_index"></div>
            <div id="shft_down_half"></div>
            
            <div class="span1"></div>
            <div id="shft_down"></div>
            <!-- leave a comment -->
            <div class="row-fluid">
                <div class="span3"></div>
                <div class=" span6 ">
                    

               

                    <form class="form-horizontal">
                        
                        <div class="control-group pull-left">
                            <form name="LeaveComment" id="LeaveComment" method="post">
                            <label class="control-label" for="inputName">Name</label>
                            <div class="controls ">
                                <input type="text" placeholder="Name" id="comment_name" name="comment_name" >
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="inputEmail">Email</label>
                            <div class="controls">
                                <input type="text" placeholder="Email" id="comment_email" name="comment_email">
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="inputComment">Comment</label>
                            <div class="controls">
                                <textarea rows="3" placeholder="Comment" id="comment_text" name="comment_text"></textarea>
                            </div>
                        </div>
                        <div class="control-group">
                            <div class="controls">
                                <button type="submit" class="btn btn-inverse">Leave a Comment</button>
                                <input type="hidden" value="cmnt" name="action" id="action"></input> 
                                </form> <!-- Leave Comment -->
                            </div>
                        </div>
                    </form>
                    <div id="shft_down"></div>
                    <% 
    
    CommentManager Mngr = new CommentManager();
    List<CommentInfo> lst = Mngr.listAll();
    Iterator<CommentInfo> itr = lst.iterator();
   while (itr.hasNext()) {
    out.print("<div class='breadcrumb'>");
    CommentInfo info = itr.next();
    out.print("<div class='pull-left'>" + info.name + "</div><div class='pull-right'>" + info.date + "</div></br></div><p>" + info.comment+"</p></br>" );
     //out.print("</tr>");
       }
    %>
                  <div id="shft_down"></div>
                </div>
                <div class="span1"></div>
            </div>
        </div>


    </div>
</div>
<%@include file="jspf/footer.jspf" %>