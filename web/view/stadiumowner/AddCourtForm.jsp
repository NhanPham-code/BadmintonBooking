<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Court</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
            background-color: #bfdbf7;
            margin: 0;
            padding: 0;
            background-image: url('<%=request.getContextPath()%>/img/background/bg3.jpg');
            background-repeat: no-repeat;
            background-size: cover;
            background-position: center;
        }
        .container {
            max-width: 600px;
            margin: 20px auto;
            padding: 20px;
            background-color: #f5f5f5;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        input[type=text], select {
            width: 100%;
            padding: 12px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .add-button {
            background-color: #1f7a8c;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            cursor: pointer;
            width: 100%;
            border-radius: 4px;
            font-size: 16px;
        }
        .add-button:hover {
            opacity: 0.8;
        }
    </style>
</head>
<body>
    
    <div class="container">
        <h2>Add New Court</h2>
        <form action="AddCourtServlet" method="post">
            <label for="courtID">Court ID:</label>
            <input type="text" id="courtID" name="courtID" required><br><br>
            
            <label for="courtNumber">Court Number:</label>
            <input type="text" id="courtNumber" name="courtNumber" required><br><br>
            
            <input type="hidden" id="stadiumID" name="stadiumID" value="${param.stadiumID}">
            
            <button type="submit" class="add-button">Add Court</button>
        </form>
    </div>
    
</body>
</html>
