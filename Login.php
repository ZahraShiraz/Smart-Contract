<?php 

$hash = $_POST['hash'];
$cnic = $_POST['cnic'];

$con = mysqli_connect("localhost","root","","Registered People Database");

$hash = stripcslashes($hash);
$cnic = stripcslashes($cnic);
$hash = mysqli_real_escape_string($con, $hash);
$cnic = mysqli_real_escape_string($con, $cnic);

$result = mysqli_query($con, "SELECT * from users where hash = '$hash' and cnic = '$cnic'")
     or die("Failed to query database".mysqli_error($con));

$row = mysqli_fetch_array($result);
if($row['hash'] == $hash && $row['cnic'] == $cnic ){
      header("Location: C:\Users\Flower\Desktop\VOTS on Ropsten\indexc.html"); 

} else {
    echo "Whoops! Failed to login..";
}

?>