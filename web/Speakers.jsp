<%-- 
    Document   : Speakers
    Created on : Nov 13, 2013, 5:41:05 PM
    Author     : Hiba Habli
--%>
<%@page import="Entity.SpeakerInfo"%>
<%@page import="Manager.SpeakerManager"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@include file="jspf/header.jspf" %>
<body>


    <script>
        function speaker_choice(pressed) {

            document.getElementById("select_speaker").value = 'select_speaker'
            document.getElementById("speaker_id").value = pressed

        }
    </script>


    <div class="container-fluid">
        <div class="row-fluid">
            <div class="span1"></div>
            <div class=" span10 bottom_shadow img_bk">
                <div id="shft_down"></div>

                <div class="row-fluid">
                    <div class="span1"></div>
                    <form method='post' id='speaker_id_frm'>
                        <%


                            try {

                                String action = request.getParameter("select_speaker");

                                if (action.compareTo("select_speaker") == 0) {

                                    int chosen = Integer.parseInt(request.getParameter("speaker_id"));
                                    SpeakerManager Dmngr = new SpeakerManager();
                                    SpeakerInfo speaker = Dmngr.getSpeakerById(chosen);
                                    out.print("<dl class='dl-horizontal span10'>");
                                    out.print("<dt></dt><dd><img src='img/speaker2.png'></dd><dt>Speaker Name:</dt><dd> " + speaker.firstname + " " + speaker.lastname + "</dd><dt>Title:</dt><dd>" + speaker.title + "</dd><dt>Company:</dt><dd> " + speaker.company + "</dd><dt>Description:</dt><dd><p>" + speaker.description + "</p></dd>");

                                    out.print("<dt><a href='Speakers.jsp'>Back To All Speakers</a></dt><dd></dd>");
                                    out.print("</dl>");

                                }
                            } catch (Exception e) {

                                out.print("<table class='speaker_table span10'>");
                                SpeakerManager Dmngr = new SpeakerManager();
                                List<SpeakerInfo> lst = Dmngr.listAll();
                                Iterator<SpeakerInfo> itr = lst.iterator();
                                int count = 0;
                                while (itr.hasNext()) {

                                    SpeakerInfo info = itr.next();

                                    if (count == 1) {

                                        count = count + 1;
                                    }
                                    if (count == 0) {
                                        out.print("<tr class='speaker_table'>");
                                        count = count + 1;
                                    }

                                    out.print("<td> <button class='btn' onclick='speaker_choice(" + info.id + ")'><img src='img/speaker2.png'></button></td><td class='speaker_row' >Speaker Name: " + info.firstname + " " + info.lastname + "</br>Title: " + info.title + "</br>Company: " + info.company + "</td>");


                                    if (count == 2) {
                                        count = 0;
                                        out.print("</tr>");
                                    }
                                }
                                out.print("</table>");

                            }

                        %>

                        <input id='select_speaker' type='hidden' value='select' name='select_speaker'>
                        <input id='speaker_id' type='hidden' name='speaker_id'>
                    </form>
                    <div class="span1"></div></div>
            </div>  
            <div class="span1"></div>
        </div>
    </div>

</body>
<%@include file="jspf/footer.jspf" %>