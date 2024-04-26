<%-- 
    Document   : home
    Created on : Mar 10, 2024, 1:41:23 PM
    Author     : VietAnh
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



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
                margin-bottom: 100px;
            }

            .view a{
                text-decoration: none;
                margin-left: 50px;
                cursor: pointer;
                margin-right: 5px;
                color: skyblue;
            }

            .info .note{
                display: flex;
            }

            .info .note p:first-child{
                font-weight: bolder;
                margin-right: 5px;
            }


            footer{
                margin-top: 100px;
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

            
            .mid {
                width: 80%;
                margin: 0 auto;
            }

            .mid h1{
                text-align: center;
                color: #004175;
            }
            
            
            .button input{
                margin-left: 140px;
                width: 100px;
                height: 30px;
                border: none;
                background-color: #499F49;
                color: white;
                cursor: pointer;
                border-radius: 8px;
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
            <p><a href="home2.jsp">Home </a></p>
            <p> | Thông báo</p>
        </div>
        
        <div class="mid">
            <h1>CẢNH BÁO</h1>
            <h4>Hiện nay có hình thức lừa đảo sửa dữ liệu điểm danh để chiếm đoạt tiền của sinh viên.</h4>
            <h4>Các đối tượng có thể giả mạo là giảng viên, cán bộ Nhà trường để gửi thông tin cho một số sinh viên.</h4>
            <h4>Vì vậy, sinh viên tuyệt đối không tin và thực hiện hành vi vi phạm nhằm tránh mất tiền, bị xử lý kỷ luật theo nội quy Nhà trường và có thể bị xử lý hình sự do đây là hành vi vi phạm pháp luật theo Luật an ninh mạng 2018.</h4>
            <h4>Đồng thời, ngay khi nhận được các thông tin với nội dung lôi kéo, lừa đảo vui lòng gửi thông tin tới phòng Dịch vụ sinh viên tại các cơ sở.</h4>
            <h4>Trân trọng thông báo,</h4>
            <h3>TRƯỜNG ĐẠI HỌC FPT</h3>
        </div>
        
        <br>
        <br>
        
        <div class="button">
            <a href="home2.jsp"><input type="button" value="Trang chủ"></a>
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
