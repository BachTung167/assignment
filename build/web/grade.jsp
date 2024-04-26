<%-- 
    Document   : grade
    Created on : Mar 13, 2024, 1:04:56 AM
    Author     : VietAnh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import="model.Subject" %>
<%@page import="model.Assessment" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>


        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
            }

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
                margin-left: 80px;
                cursor: pointer;
                margin-right: 5px;
                color: skyblue;
            }

            .left h1 {
                font-size: 24px;
                margin-left: 80px;

            }

            .right {
                display: flex;
                align-items: center;
                margin-right: 80px;
            }

            .right h3 {
                color: #f00;
                margin: 0;
                margin-right: 20px;
            }

            .img a {
                margin-right: 20px;
            }

            .img a img {
                width: 120px;
                height: auto;
            }



            .title {
                margin-top: 50px;
                margin-bottom: 20px;
                margin-left: 80px;
            }

            .title h1 {
                font-size: 20px;
            }

            .book_grade {
                display: flex;
                margin-top: 20px;
            }

            .left_book {
                margin-top: 20px;
                flex: 1;
            }

            .right_book {
                flex: 1;
            }

            table {
                width: 100%;
                border-collapse: collapse;
            }

            th, td {
                border: 1px solid #ddd;
                padding: 8px;
                text-align: left;
            }

            th {
                background-color: #f2f2f2;
            }



            .book_grade {
                display: flex;
                margin-top: 20px;
                width: 90%;
                margin: 0 auto;
                justify-content: space-between;
            }


            .left_book a{
                text-decoration: none;
                color: #6B90DA;
            }

            .left_book .title_left{
                text-align: center;
            }

            .left_book, .right_book {
                width: 48%;
                padding: 10px;
                box-sizing: border-box;
            }

            .left_book h3, .right_book h3 {
                margin-top: 0;
            }



            .right_book table {
                width: 100%;
            }

            .right_book th, .right_book td {
                border: 1px solid #ddd;
                padding: 8px;
                text-align: left;
            }

            .right_book th {
                background-color: #f2f2f2;
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



            .book_grade .left_book table tr th{
                background-color: #6A8FD8;
            }

            .book_grade .right_book table tr th{
                background-color: #6A8FD8;
            }
            
            
            .book_grade .right_book hr{
                height: 7px;
                background-color: #E9F7F6;
                border:none;
            }

            .book_grade .right_book .lastLine{
                display: flex;
                
            }
            
            .book_grade .right_book .lastLine .lastLine_col2{
                padding-left: 138px;
            }
            
            .book_grade .right_book .lastLine .checkStatus{
                padding-left: 48px;
                padding-top: 20px;
            }
            
            .book_grade .right_book .lastLine .checkStatus h4{
                margin: 0;
            }

            

        </style>



    <header>
        <div class="left">
            <h1>FPT University Academic Portal</h1>
        </div>

        <div class="right">
            <h3>FAP mobile app (myFAP) is ready at</h3>
            <div class="img">
                <a href="https://apps.apple.com/us/app/myfap/id1527723314">
                    <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/0/0f/Available_on_the_App_Store_%28black%29_SVG.svg/640px-Available_on_the_App_Store_%28black%29_SVG.svg.png">
                </a>
                <a href="https://play.google.com/store/apps/details?id=com.fuct&pli=1">
                    <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/78/Google_Play_Store_badge_EN.svg/1200px-Google_Play_Store_badge_EN.svg.png">
                </a>
            </div>
        </div>
    </header>

    <div class="view">
        <p><a href="#">Home</a></p>
        <p> | Grade-book</p>
    </div>

    <div class="title">
        <h1>Grade report for ${sessionScope.account.displayname} (${sessionScope.account.ID})</h1>
    </div>

    <div class="book_grade">


        <div class="left_book">
            <input type="hidden" name="sid" value="${param.sid}">
            <h3 class="title_left">Select a term, course...</h3>
            <table>
                <tr>
                    <th>TERM</th>
                    <th>COURSE</th>
                </tr>



                <c:forEach items="${requestScope.subjects}" var="s">
                    <tr>
                        <td>Spring2024</td>
                        <td>
                            <a href="grade?sid=${requestScope.sid}&subid=${s.id}">${s.fullname} (${s.name})</a>

                        </td>
                    </tr>
                </c:forEach>

            </table>
        </div>

        <div class="right_book">
            <h3 class="title_right">...then see report</h3>
            <table>
                <tr>
                    <th>GRADE CATEGORY</th>
                    <th>WEIGHT</th>
                    <th>VALUE</th>
                    <th>COMMENT</th>
                </tr>
                <c:forEach var="list" items="${requestScope.listSubjectBySid}" varStatus="status">
                    <tr>
                        <td>${list.examid.asseid.name}</td>
                        <td>${list.examid.asseid.weight}%</td>
                        <td>${list.score}</td>
                        <td>${list.comment}</td>
                    </tr>


                </c:forEach>

                    
            </table>

            <hr>
            
            <div class="lastLine">
                <h4 class="lastLine_col1" style="font-weight: bold">COURSE TOTAL</h4>
                <h4 class="lastLine_col2" style="font-weight: bold">AVERAGE <br> STATUS</h4>
                <div class="checkStatus">
                    <h4>${requestScope.average}</h4>
                    <h4 class="lastLine_col3" style="${requestScope.average > 5 ? 'color:  green' : 'color: red'}">${requestScope.average > 5 ? 'PASSED' : 'NOT PASS'}</h4>
                </div>
            </div>


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
