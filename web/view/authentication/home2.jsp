<%-- 
    Document   : home2
    Created on : Mar 12, 2024, 9:58:39 AM
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

        <style>
            header {
                width: 100%;
                height: auto;
                display: flex;
                justify-content: space-between;
            }

            .left{
                margin-left: 50px
            }

            .left h1{
                margin-top: 30px;
            }

            .right{
                margin-right: 50px;
            }

            .right h3{
                color: red;
            }

            .right .img{
                display: flex;
            }

            .right .img a img{
                margin-right: 30px;
                width: 120px;
                height: 40px;
            }




            footer{
                margin-top: 150px;
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



            .list {
                display: flex;
                justify-content: center;
            }

            .list form ul {
                list-style-type: none;
                margin: 0;
                padding: 0;
            }

            .list form ul li {
                display: inline-block;
                margin-right: 20px;
            }

            .list form ul li:last-child {
                margin-right: 0;
            }

            .list form ul li a {
                text-decoration: none;
                color: #333;
                font-size: 16px;
                font-weight: bold; 
                padding: 10px; 
                border: 2px solid #ccc; 
                border-radius: 5px; 
                transition: all 0.3s ease; 
            }

            .list form ul li a:hover {
                background-color: #f0f0f0;
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


        <br>
        <br>

        <h3 style="color: skyblue">Information Access(Tra cứu thông tin)</h3>
        <div class = "table">

            <br>
            <br>
            <div class="list">
                <form action="#" method="GET">
                    <ul>
                        <li><a href="/Project_Assignment/lecturer/timetable?id=${sessionScope.account.ID}">Weekly timetable</a></li>
                        <li><a href="/Project_Assignment/lecturer/attendence?id=${sessionScope.account.ID}">Attendance report</a></li>

                    </ul>
                </form>
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
