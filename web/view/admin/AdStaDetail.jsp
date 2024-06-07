<%-- 
    Document   : AdStaDetail
    Created on : Jun 5, 2024, 4:04:19 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Stadium Detail Management </title>
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
            />
        <style>
            .stadium-bg{
                width: 100%;
                background: #e3e6ed;
                padding: 40px 45px;
                box-sizing: border-box;
                display: flex;
                flex-direction: column;
                gap: 20px;
                flex-grow: 1; /* Make the stadium list take the available space */
            }
            .stadium-board {
                background: #ffffff;
                border-radius: 4px;
                height: 720px;
                position: relative;
            }
            .stadium-des{
                display: flex;
                padding-left: 145px;
                align-items: center;
                margin-bottom: 20px;
            }
            .stadium-detail{
                display: flex;
                padding: 0 60px;
                justify-content: space-around;
            }
            p{
                color: #022b3a;
                text-align: left;
                font-family: 'Inter-Bold', sans-serif;
                font-size: 28px;
                font-weight: 700;
                position: relative;
                display: flex;
                align-items: center;
                justify-content: flex-start;
                margin-left: 10px;
            }
            .stadium-des img{
                margin-top: 20px;
            }
            .stadium-inf{
                margin-right: 20px;
            }
            .stadium-inf div{
                color: #000000;
                text-align: left;
                font-family: 'Inter-Regular', sans-serif;
                font-size: 16px;
                font-weight: 400;
                position: relative;
                display: flex;
                align-items: center;
                justify-content: flex-start;
                margin: 10px 10px;
            }
            .rating-filter {
                display: flex;
                background: white;
                width: 120px;
                height: 42px;
                position: relative;
            }
            .star {
                padding: 10px;
                color: #000000;
                text-align: left;
                font-family: "Inter-Medium", sans-serif;
                font-size: 16px;
                font-weight: 500;
                position: relative;
                display: flex;
                align-items: center;
                justify-content: left;
            }
            .dropdown {
                position: relative;
                display: inline-block;
                margin: 10px 20px;
            }
            .dropdown-content {
                display: none;
                position: absolute;
                background-color: #f1f1f1;
                min-width: 160px;
                box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
                z-index: 1;
            }

            .cus-rate {
                padding: 12px 16px;
                text-decoration: none;
                display: block;
            }
            .cus-rate .fa-star {
                color: gold;
                margin-left: 5px;
            }
            .dropdown:hover .dropdown-content {
                display: block;
            }
            .rating {
                background: #1f7a8c;
                border-radius: 4px;
                border-style: solid;
                border-color: #000000;
                border-width: 1px;
                height: 300px;
                width:  800px;
                position: relative;
            }
            .booking-detail {
                overflow: auto;
                height: 210px;
            }
            .head{
                width: 100%;
                display: flex;
                justify-content: space-around;
                align-items: center;
                color: white;
                font-size: 18px;
                padding: 15px 0;
            }
            .booking-inf img {
                width: 60px; /* Increase image size */
                height: 60px; /* Increase image size */
                border-radius: 50%;
            }
            .booking-inf{
                display: flex;
                justify-content: space-between;
                align-items: center;
                background: #ffffff;
                border-style: solid;
                border-color: #000000;
                border-width: 1px 1px 0px 1px;
                height: 60px;
                padding: 7px;
                position: relative;
            }
            .booking-inf div{
               
                margin-left: 20px;
            }
            .avatar i {
                margin: 4px 0px;
                font-size: 40px;
                width: 80px;
                height: 80px;
                border-radius: 50%;
            }
         
            .avatar {
                text-align: center;
                background: #d9d9d9;
                border-radius: 50%;
                border-style: solid;
                border-color: #000000;
                border-width: 1px;
                border-radius: 50%;
                width: 50px; /* Increase image size */
                height: 50px; /* Increase image size */
                position: relative;
            }
            .stadium-details div {
                margin: 3px 0;
            }
            .stadium-actions {
                display: flex;
                flex-direction: column;
                align-items: flex-end;
                gap: 5px;
            }
            .stadium-actions a {
                background: #1F7A8C;
                color: white;
                padding: 5px 10px;
                border-radius: 4px;
                text-decoration: none;
                cursor: pointer;
            }
            .stadium-actions a:hover {
                background: #145569;
            }
            .star-rating {
                display: flex;
                align-items: center;
            }
            .star-rating .fa-star {
                color: gold;
                margin-left: 5px;
            }
            .court{
                height: 190px;
                overflow: auto;
            }
            table {
                border-collapse: collapse; /* Gộp các đường biên thành một */
            }

            th, td {
                border: 1px solid #ddd; /* Đường biên ô */
                text-align: left; /* Căn lề văn bản trong ô */
                padding: 10px;
            }

            th {
                background-color: #f2f2f2; /* Màu nền cho ô tiêu đề */
                color: black; /* Màu chữ cho ô tiêu đề */
            }
        </style>
    </head>
    <body>
        <jsp:include page = "AdHeader.jsp" flush = "true" />

        <div class="stadium-bg">
            <div class="stadium-board">
                <div class="stadium-des">
                    <div class="stadium-inf">
                        <p>Sân Đại Á</p>
                        <div>29B Mậu Thân, An Hoà, Ninh Kiều, Cần Thơ</div>
                        <div>0939129217</div>
                        <div>price</div>
                    </div>

                    <img
                        src="<%=request.getContextPath()%>/img/court/c1.jpg"
                        alt="Stadium"
                        width="820px"
                        height="320px"
                        />
                </div>
                <div class="stadium-detail">
                    <div class="rating">
                        <div class="rating-filter">
                            <div class="star">Rating</div>
                            <div class="dropdown">
                                <button class="dropbt">
                                    <i class="fa fa-caret-down"></i>
                                </button>
                                <div class="dropdown-content">
                                    <div class="cus-rate">
                                        5
                                        <i class="fas fa-star"></i>
                                    </div>
                                    <div class="cus-rate">
                                        4
                                        <i class="fas fa-star"></i>
                                    </div>
                                    <div class="cus-rate">
                                        3
                                        <i class="fas fa-star"></i>
                                    </div>
                                    <div class="cus-rate">
                                        2
                                        <i class="fas fa-star"></i>
                                    </div>
                                    <div class="cus-rate">
                                        1
                                        <i class="fas fa-star"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="booking-detail">
                            <div class="booking-inf">                              
                                <div class="avatar">
                                    <i class="fa-solid fa-user"></i>
                                </div>
                                <div class="stadium-details">
                                    <div>Username</div>
                                    <div>Feedback</div>
                                    <div class="star-rating">
                                        4/5
                                        <i class="fas fa-star"></i>
                                    </div>
                                </div>
                                <div class="stadium-actions">
                                    <a href="bookingPage.jsp">Delete</a> <!-- Replace 'bookingPage.jsp' with the actual booking page URL -->
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="court">
                        <table>
                            <tr>
                                <th>Court ID</th>
                                <th>Court Number</th>
                            </tr>
                            <tr>
                                <td>0001</td>
                                <td>1</td>
                            </tr>
                            <tr>
                                <td>0002</td>
                                <td>2</td>
                            </tr>
                            <tr>
                                <td>0003</td>
                                <td>3</td>
                            </tr>
                            <tr>
                                <td>0004</td>
                                <td>4</td>
                            </tr>
                        </table>
                    </div>  
                </div>
            </div>
        </div>
    </body>
</html>
