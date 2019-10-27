<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Registered People Database</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel = "stylesheet" type = text/css href = "style.css">
        <link rel = "stylesheet" type = text/css href = "styleFrontPage.css">
        <link rel = "stylesheet" type = text/css href = "styleforms.css">


    <meta name="viewport" content="width=device-width, initial-scale=1">
    
</head>

<body style = "background: url(http://www.fullfinance.com/wp-content/uploads/2017/03/iStock-636279082-1024x683.jpg); background-size: cover;">
<nav>
    <ul class="topnav" id="dropdownClick">
    <li><a href = "http://127.0.0.1:5500/FrontEnd.html">Home</a></li>
    <li><a href = "CreateVehicle">Create New Vehicle</a></li>
    <li><a href = "transfervehicle">Transfer Vehicle</a></li>
    <li><a href = "RegisterNewVehicle">Register Vehicle to a person </a></li>
    <li><a href = "http://localhost/TestDBandFrontEnd/TestDBandFrontEnd.php">User Registration</a></li>
    <li class="topnav-right"><a href = "contactus">Contact Us</a></li>
    <li class="topnav-right"><a href = "about">About</a></li>
    <li class="dropdownIcon"><a href = "javascript:void(0);" onmouseover= "dropdownMenu()">&#9776;</a></li>
                    
    </ul>                        
</nav>
<div class = "container">
    <div class = login-box>
    <div class = "row">
    <div class = "col-md-6 login-left">
    <h2>Person Verification</h2>
    <form action = "Login.php" method = "POST">
        <div class = "form-group"> 
   
    <div class = "col-md-6 login-right">
        <div class = "form-group"> 
        <p>
            <label>&nbsp&nbspBiometric Verification:</label><br>
            &nbsp&nbsp<input type = "text" id = "hash" name = "hash" />
            </p>
</div>
        
        <p>
        <div class = "form-group"> 
            <label>&nbsp&nbspCNIC:</label><br>
            &nbsp&nbsp<input type = "text" id = "cnic" name = "cnic" />
        </p>
            
</div>
            <div>
            <p>
            <button type = "submit" class = "btn btn-primary" style = "margin-left:120px">Verify</button>
        </p>
    </form>
</div>
</div>
</div>
</div>
</body>
</html>