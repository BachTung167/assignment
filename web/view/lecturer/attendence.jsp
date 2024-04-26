<%-- 
    Document   : attendence
    Created on : Mar 3, 2024, 8:07:24 PM
    Author     : VietAnh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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



            table {
                width: 100%;
                border-collapse: collapse;
            }

            th, td {
                padding: 8px;
                text-align: left;
                border: 1px solid black;
            }

            th {
                background-color: black;
                color: gold;
            }

            tr:hover {
                background-color: #f5f5f5;
            }

            input[type="radio"] {
                margin-right: 5px;
            }

            input[type="text"] {
                width: 100%;
                padding: 5px;
                box-sizing: border-box;
            }

            input[type="submit"] {
                padding: 10px 20px;
                background-color: #4CAF50;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }

            input[type="submit"]:hover {
                background-color: #45a049;
            }



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


            td.image-cell {
                text-align: center; 
            }

            td.image-cell img {
                width: 140px; 
                height: 160px; 
                display: block; 
                margin: 0 auto; 
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
            <p><a href="view/authentication/home2.jsp">Home </a></p>
            <p> | View Schedule</p>
        </div>


        <br>
        <br>


        <form action="attendence" method="POST">
            <input type="hidden" name="id" value="${param.id}">
            <table>
                <tr>
                    <th>IMAGE</th>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Presented</th>
                    <th>Description</th>
                    <th>Time</th>
                </tr>

                <c:forEach items="${requestScope.attendenceByLession}" var="att">
                    <tr>
                        <td class="image-cell">
                            <img src="../Image/${att.student.id}.jpg" alt="${att.student.id}">
                        </td>

                        <td>${att.student.id}</td>
                        <td>${att.student.name}</td>
                        <td>
                            <input
                                ${!att.present ? "checked=\"checked\"" : ""}
                                type="radio" value="no" name="present${att.student.id}"> Absent

                            <input
                                ${att.present ? "checked=\"checked\"" : ""}
                                type="radio" value="yes" name="present${att.student.id}"> Present
                        </td>

                        <td>
                            <input name="description${att.student.id}" type="text" value="${att.description}">
                        </td>

                        <td>${att.time}</td>
                    </tr>
                </c:forEach>

            </table>

            <br>
            <input type="submit" value="Save">
        </form>

        <br>

        <br>

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
