<%-- 
    Document   : AdAccManage
    Created on : Jun 5, 2024, 8:39:26 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Account Management</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
        <style>
            body {
                font-family: 'Inter', Times, serif;
                margin: 0;
                padding: 0;
                background-image: url('<%=request.getContextPath()%>/img/background/bg3.jpg');
                background-repeat: no-repeat;
                background-size: cover;
                background-position: center;
                min-height: 100vh;
            }
            .account-management-container {
                font-size: 16px;
                max-width: 800px;
                margin: 20px auto;
                padding: 20px;
                box-sizing: border-box;
                border: 1px solid #ccc;
                border-radius: 8px;
                background-color: #f9f9f9;
            }
            .account-filter-form, .search-bar {
                margin-bottom: 20px;
                display: flex;
                align-items: center;
            }
            .filter-role {
                display: flex;
                align-items: center;
                gap: 10px;
            }
            .role-label {
                font-weight: bold;
            }
            .dropdown {
                position: relative;
            }
            select[name="role"] {
                padding: 10px;
                font-size: 16px;
                border: 1px solid #ccc;
                border-radius: 4px;
                background: white;
                color: #333;
                width: 200px;
            }
            .search-bar input[type="email"] {
                padding: 10px;
                font-size: 16px;
                border: 1px solid #ccc;
                border-radius: 4px;
                width: 250px;
            }
            .search-bar button {
                background: #1f7a8c;
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                margin: 5px;
            }
            .search-bar button:hover {
                background: #145569;
            }
            .error {
                margin-bottom: 10px;
            }
            .account-list {
                padding: 20px;
                box-sizing: border-box;
                background-color: white;
                border: 1px solid #ccc;
                border-radius: 8px;
            }
            .account-item {
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 15px;
                border: 1px solid #eee;
                border-radius: 5px;
                margin-bottom: 10px;
                transition: transform 0.3s ease;
                cursor: pointer;
            }
            .account-item:hover {
                transform: scale(1.02);
                box-shadow: 0 0 10px rgba(0,0,0,0.1);
            }
            .avatar {
                background: #d9d9d9;
                border-radius: 50%;
                width: 60px;
                height: 60px;
                display: flex;
                justify-content: center;
                align-items: center;
                margin-right: 15px;
            }
            .account-details {
                flex-grow: 1;
            }
            .account-details div {
                margin-bottom: 5px;
            }
            .account-actions a {
                background: #1f7a8c;
                color: white;
                padding: 5px 10px;
                border-radius: 4px;
                text-decoration: none;
                cursor: pointer;
            }
            .account-actions a:hover {
                background: #145569;
            }
        </style>
    </head>
    <body>
        <%-- Include header --%>
        <jsp:include page="AdHeader.jsp" flush="true" />

        <div class="account-management-container">
            <form class="account-filter-form" action="filterAcc" method="post">
                <input type="hidden" name="name" value="${requestScope.name}">
                <div class="filter-role">
                    <div class="role-label">Role:</div>
                    <div class="dropdown">
                        <select name="role" onchange="this.form.submit()">
                            <option value="All" ${requestScope.role eq 'All' ? 'selected' : ''}>All</option>
                            <option value="Customer" ${requestScope.role eq 'Customer' ? 'selected' : ''}>Customers</option>
                            <option value="StadiumOwner" ${requestScope.role eq 'StadiumOwner' ? 'selected' : ''}>Stadium Owners</option>
                            <option value="Admin" ${requestScope.role eq 'Admin' ? 'selected' : ''}>Admin</option>
                        </select>
                    </div>
                </div>
            </form>
            <form class="search-bar" action="searchAcc" method="post">
                <input type="hidden" name="name" value="${requestScope.name}">
                <input type="email" name="email" placeholder="Email" value="${requestScope.email}"/>
                <button type="submit">
                    <i class="fas fa-search"></i>
                    Search
                </button>
            </form>
            <div class="error">
                <h2 style="color: red">${requestScope.error}</h2>
            </div>
            <div class="account-list">
                <h2>${requestScope.notify}</h2>
                <c:forEach var="acc" items="${requestScope.accList}">
                    <div class="account-item" onclick="window.location.href = 'accountDetail';">
                        <div class="avatar">
                            <i class="fas fa-user-circle" style="font-size: 40px;"></i>
                        </div>
                        <div class="account-details">
                            <div>Email: ${acc.email}</div>
                            <div>Role: ${acc.role}</div>
                        </div>
                        <div class="account-actions">
                            <a href="#">Delete</a>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </body>
</html>
