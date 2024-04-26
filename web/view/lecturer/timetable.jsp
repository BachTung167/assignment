<%-- 
    Document   : timetable
    Created on : Feb 29, 2024, 12:00:15 AM
    Author     : VietAnh
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Account" %>
<%@page import="model.Enrollment" %>
<%@page import="model.Lecturer" %>
<%@page import="model.Lession" %>
<%@page import="model.Room" %>
<%@page import="model.Student" %>
<%@page import="model.StudentGroup" %>
<%@page import="model.Subject" %>
<%@page import="model.TimeSlot" %>
<%@page import="java.util.ArrayList" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <%
            ArrayList<TimeSlot> slots = (ArrayList<TimeSlot>) request.getAttribute("slots");
            ArrayList<Lession> lessionBy = (ArrayList<Lession>) request.getAttribute("lessionBy");
        %>

        <style>
            /* Reset CSS */
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            /* Body styles */
            body {
                font-family: Arial, sans-serif;
                line-height: 1.6;
                background-color: #f9f9f9;
                color: #333;
            }

            .container {
                max-width: 1200px;
                margin: 0 auto;
                padding: 20px;
            }

            /* Header styles */
            header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 20px 0;
            }
            
            
             .view{
                margin-top: 20px;
                width: 100%;
                height: 35px;
                background-color: #F5F5F5;
                display: flex;
                padding-bottom: 10px;
            }

            .view a{
                text-decoration: none;
                margin-left: 50px;
                cursor: pointer;
                margin-right: 5px;
                color: skyblue;
            }

            .left h1 {
                font-size: 24px;
            }

            .right h3 {
                color: #f00;
            }

            .right .img a {
                margin-right: 20px;
            }

            .right .img a img {
                width: 120px;
                height: auto;
            }

            /* Navigation styles */
            nav a {
                text-decoration: none;
                color: #007bff;
                margin-right: 20px;
            }

            /* Main content styles */
            main {
                margin-top: 20px;
            }

            .title h1 {
                font-size: 28px;
                margin-bottom: 20px;
            }

            .info p {
                margin-bottom: 10px;
            }

            .form-group {
                margin-bottom: 20px;
            }

            .form-group input[type="date"] {
                padding: 8px;
            }

            .btn {
                padding: 10px 20px;
                background-color: #007bff;
                color: #fff;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }

            .btn:hover {
                background-color: #0056b3;
            }

            /* Table styles */
            table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 20px;
            }

            th, td {
                padding: 10px;
                border: 1px solid #ddd;
            }

            th {
                background-color: #f2f2f2;
            }

            tr:nth-child(even) {
                background-color: #f9f9f9;
            }

            /* Footer styles */
            footer{
                margin-top: 30px;
                width: 100%;
                background-color: black;
            }

            footer .note2{
                background-color: white;
            }

            footer .link{
                display: flex;
                justify-content: center;
            }

            footer .link p{
                color: white;
                margin: 5px 5px 10px 5px;
            }

            footer .link a{
                color: white;
                text-decoration: none;
            }



        </style>


    </head>
    <body>
        <header>
            <div class="left">
                <h1>FPT University Academic Portal</h1>
            </div>

            <div class="right">
                <h3>FAP mobile app (myFAP) is ready at</h3>
                <div class="img">
                    <a href="https://apps.apple.com/us/app/myfap/id1527723314">
                        <img hre src="https://upload.wikimedia.org/wikipedia/commons/thumb/0/0f/Available_on_the_App_Store_%28black%29_SVG.svg/640px-Available_on_the_App_Store_%28black%29_SVG.svg.png">
                    </a>

                    <a href="https://play.google.com/store/apps/details?id=com.fuct&pli=1">
                        <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/78/Google_Play_Store_badge_EN.svg/1200px-Google_Play_Store_badge_EN.svg.png">
                    </a>
                </div>
            </div>
        </header>

        <div class="view">
            <p><a href="#">Home </a></p>
            <p> | View Schedule</p>
        </div>

        <div class="title">
            <h1>Activities for ${sessionScope.account.username} (${sessionScope.account.displayname})</h1>
        </div>

        <div class="info">
            <div class="note">
                <p>Note: </p>
                <p>The activities in the table below do not include extracurricular activities, e.g. club activities...</p>
            </div>

            <p>Rooms beginning with the AL belong to the Alpha building. Example: AL...</p>
            <p>Rooms starting with BE belong to the Beta building. EG: BE,..</p>
            <p>Rooms beginning with G belong to the Gamma building. Example: G201,...</p>
            <p>R-headed gyms belong to the Vovinam training ground.</p>
            <p>Rooms starting with DE belong to the Delta building. EXAMPLE: DE,..</p>
            <p>Little UK (LUK) is located on the 5th floor of Delta Building</p>

        </div>


        <br>
        <br>

        <form action="timetable" method="GET">
            <input type="hidden" name="id" value="${param.id}"/>
            Period: <input type="date" value="<%= request.getAttribute("from")%>" name="from"/> - <input value="<%= request.getAttribute("to")%>" type="date" name="to"/> 
            <input type="submit" value="Show"/>
        </form>


        <table border = "1">
            <tr>
                <td> </td>
                <c:forEach items="${requestScope.dates}" var="d">
                    <td>${d}</td>
                </c:forEach>
            </tr>

            <c:forEach items="${requestScope.slots}" var="slot">
                <tr>
                    <td>${slot.name}</td>
                    <c:forEach items="${requestScope.dates}" var="d">
                        <td>
                            <c:forEach items="${requestScope.lessionBy}" var="les">
                                <c:if test="${d eq les.date and les.slot.id eq slot.id}">
                                    ${les.group.name} - ${les.group.subject.name} <br>
                                    at ${les.room.name}
                                    <a href="attendence?id=${les.id}"> 

                                        <c:if test = "${les.attended}">
                                            <a href="attendence?id=${les.id}" class="edit-link">Edit</a>
                                        </c:if>

                                        <c:if test = "${!les.attended}">
                                            <a href="attendence?id=${les.id}" class="take-link">Take</a>
                                        </c:if>
                                    </a>
                                </c:if>
                            </c:forEach>
                        </td>
                    </c:forEach>
                </tr>  
            </c:forEach>



        </table>



        <div class="note">
            <h4>More note / Chú thích thêm:</h4>

            <div>
                <p>(-):  no data was given / chưa có dữ liệu</p>
            </div>
        </div>



        <footer>
            <p class="note2">Mọi lời khuyên, thắc mắc xin liên hệ: Phòng dịch vụ sinh viên: Email: dichvusinhvien@fe.edu.vn. Điện thoại: (024)7308.13.13</p>
            <div class="link">
                <p>© Powered by </p>
                <p><a href="https://fpt.edu.vn/">FPT University </a> | </p>
                <p><a href="https://cmshn.fpt.edu.vn/">CMS</a> | </p>
                <p><a href="https://library.fpt.edu.vn/">library</a> | </p>
                <p><a href="https://library.books24x7.com/login.asp?ic=0">books24x7</a></p>
            </div>
        </footer>

    </body>
</html>
