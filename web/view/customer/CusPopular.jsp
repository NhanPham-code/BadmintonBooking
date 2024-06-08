<%-- 
    Document   : CusPopular
    Created on : Jun 8, 2024, 11:18:08 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <style>

            .Pop-bg {
                display: grid;
                grid-template-columns: auto auto auto;
                background: #e3e6ed;
                padding: 10px;
                align-items: center;
                justify-items: center;
            }
            .SO-profile {
                border: 1px solid;
                border-radius: 8px;
                width: 55%;
                background: #ffffff;
                padding: 55px 55px;
                box-sizing: border-box;
                height: 75%;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;

            }
            .avatar {
                display:flex;
                padding-right: 60px;
                justify-content: center;
                padding-bottom: 111px;
                padding-top: 50px;


            }

            .avatar i {
                margin: 16px 0px;
                font-size: 100px;
                width: 40px;
                height: 40px;
                border-radius: 50%;
            }

            .owner-detail {
                display: flex;
                padding-bottom: 15px;
                padding-top: 15px;
                justify-content: center;
            }


        </style>
    </head>
    <body>
        <jsp:include page = "CusHeader.jsp" flush = "true" />

        <div class="Pop-bg">
            <div class="SO-profile">
                <div class="cus-inf" onclick="window.location.href = '#';">
                    <div class="avatar">
                        <i class="fas fa-user-circle"></i>
                    </div>
                    <div class="owner-info">
                        <div>Sân Vạn Phụng</div>
                        <div class="phone">
                            <i class="fas fa-phone"></i>
                            0881114329
                        </div>
                        <div class="rating">
                            4/5
                            <i class="fas fa-star"></i>
                        </div>
                    </div>
                    <div class="owner-detail" style="padding-bottom: 40px">
                        <a href="CusStaDetail.jsp">Details</a>
                        <!-- Replace 'bookingPage.jsp' with the actual booking page URL -->
                    </div>
                    <!-- Details button removed, click on item for details -->
                </div>
                <!-- Repeat the above stadium-item div for each stadium entry -->
            </div>

            <div class="SO-profile">
                <div class="cus-inf" onclick="window.location.href = '#';">
                    <div class="avatar">
                        <i class="fas fa-user-circle"></i>
                    </div>
                    <div class="owner-info">
                        <div>Sân Vạn Phụng</div>
                        <div class="phone">
                            <i class="fas fa-phone"></i>
                            0881114329
                        </div>
                        <div class="rating">
                            4/5
                            <i class="fas fa-star"></i>
                        </div>
                    </div>
                    <div class="owner-detail" style="padding-bottom: 40px">
                        <a href="CusStaDetail.jsp">Details</a>
                        <!-- Replace 'bookingPage.jsp' with the actual booking page URL -->
                    </div>
                    <!-- Details button removed, click on item for details -->
                </div>
                <!-- Repeat the above stadium-item div for each stadium entry -->
            </div>

            <div class="SO-profile">
                <div class="cus-inf" onclick="window.location.href = '#';">
                    <div class="avatar">
                        <i class="fas fa-user-circle"></i>
                    </div>
                    <div class="owner-info">
                        <div>Sân Vạn Phụng</div>
                        <div class="phone">
                            <i class="fas fa-phone"></i>
                            0881114329
                        </div>
                        <div class="rating">
                            4/5
                            <i class="fas fa-star"></i>
                        </div>
                    </div>
                    <div class="owner-detail" style="padding-bottom: 40px">
                        <a href="CusStaDetail.jsp">Details</a>
                        <!-- Replace 'bookingPage.jsp' with the actual booking page URL -->
                    </div>
                    <!-- Details button removed, click on item for details -->
                </div>
                <!-- Repeat the above stadium-item div for each stadium entry -->
            </div>

            <div class="SO-profile">
                <div class="cus-inf" onclick="window.location.href = '#';">
                    <div class="avatar">
                        <i class="fas fa-user-circle"></i>
                    </div>
                    <div class="owner-info">
                        <div>Sân Vạn Phụng</div>
                        <div class="phone">
                            <i class="fas fa-phone"></i>
                            0881114329
                        </div>
                        <div class="rating">
                            4/5
                            <i class="fas fa-star"></i>
                        </div>
                    </div>
                    <div class="owner-detail" style="padding-bottom: 40px">
                        <a href="CusStaDetail.jsp">Details</a>
                        <!-- Replace 'bookingPage.jsp' with the actual booking page URL -->
                    </div>
                    <!-- Details button removed, click on item for details -->
                </div>
                <!-- Repeat the above stadium-item div for each stadium entry -->
            </div>

            <div class="SO-profile">
                <div class="cus-inf" onclick="window.location.href = '#';">
                    <div class="avatar">
                        <i class="fas fa-user-circle"></i>
                    </div>
                    <div class="owner-info">
                        <div>Sân Vạn Phụng</div>
                        <div class="phone">
                            <i class="fas fa-phone"></i>
                            0881114329
                        </div>
                        <div class="rating">
                            4/5
                            <i class="fas fa-star"></i>
                        </div>
                    </div>
                    <div class="owner-detail" style="padding-bottom: 40px">
                        <a href="CusStaDetail.jsp">Details</a>
                        <!-- Replace 'bookingPage.jsp' with the actual booking page URL -->
                    </div>
                    <!-- Details button removed, click on item for details -->
                </div>
                <!-- Repeat the above stadium-item div for each stadium entry -->
            </div>

            <div class="SO-profile">
                <div class="cus-inf" onclick="window.location.href = '#';">
                    <div class="avatar">
                        <i class="fas fa-user-circle"></i>
                    </div>
                    <div class="owner-info">
                        <div>Sân Vạn Phụng</div>
                        <div class="phone">
                            <i class="fas fa-phone"></i>
                            0881114329
                        </div>
                        <div class="rating">
                            4/5
                            <i class="fas fa-star"></i>
                        </div>
                    </div>
                    <div class="owner-detail" style="padding-bottom: 40px">
                        <a href="CusStaDetail.jsp">Details</a>
                        <!-- Replace 'bookingPage.jsp' with the actual booking page URL -->
                    </div>
                    <!-- Details button removed, click on item for details -->
                </div>
                <!-- Repeat the above stadium-item div for each stadium entry -->
            </div>
        </div>
<jsp:include page = "CusFooter.jsp" flush = "true" />
    </body>
</html>
