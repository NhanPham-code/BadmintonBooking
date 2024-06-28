<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Edit Profile</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <style>
            body {
                font-family: Arial, sans-serif;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                background-image: url('<%=request.getContextPath()%>/img/background/bg3.jpg');
                margin: 0;
                background-repeat: no-repeat;
                background-size: cover;
                background-position: center;
                min-height: 100vh;
            }

            .edit-profile-container {
                background: #ffffff;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                padding: 20px;
                max-width: 400px;
                width: 100%;
            }

            .edit-profile-container h2 {
                text-align: center;
                margin-bottom: 20px;
            }

            .edit-profile-container form {
                display: flex;
                flex-direction: column;
            }

            .edit-profile-container form label {
                margin-bottom: 5px;
                font-weight: bold;
            }

            .edit-profile-container form input {
                padding: 10px;
                margin-bottom: 15px;
                border: 1px solid #ccc;
                border-radius: 4px;
                font-size: 16px;
            }

            .edit-profile-container form button {
                background: #1f7a8c;
                color: white;
                padding: 10px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-size: 16px;
            }

            .edit-profile-container form button:hover {
                background: #145569;
            }

            .back-link {
                display: block;
                text-align: center;
                margin-top: 15px;
                text-decoration: none;
                color: #1f7a8c;
            }

            .back-link:hover {
                color: #145569;
            }
            .avatar {
            font-size: 5rem;
            color: #1f7a8c;
            text-align: center;
            margin-bottom: 20px;
        }

        </style>
    </head>
    <body>
        <div class="edit-profile-container">
            <div class="avatar">
                    <i class="fas fa-user-circle"></i>
                </div>
            <h2>Edit Profile</h2>
            <form action="editProfile" method="post">
                <h4 style="color: red">${requestScope.error}</h4>
                <c:set var="account" value="${requestScope.account}"></c:set>
                <label for="ID">ID</label>
                <input type="text" id="ID" name="ID" value="${requestScope.ID}" readonly>

                <label for="name">Name</label>
                <input type="text" id="name" name="name" value="${requestScope.name}" required>

                <label for="phone"><b>Phone Number</b></label>
                <input type="text" value="${requestScope.phone}" name="phone" id="phone" required maxlength="11" pattern="[0-9]{10,11}">

                <label for="email">Email</label>
                <input type="email" id="email" name="email" value="${account.email}" required>

                <input type="hidden" id="accID" name="accID" value="${account.acc_ID}">
                <input type="hidden" id="role" name="role" value="${account.role}">
                <button type="submit">Save Changes</button>
            </form>
            <a class="back-link" href="viewProfile">Back to Account</a>
        </div>
    </body>
</html>
