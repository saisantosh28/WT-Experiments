<?php
session_start();
$conn=mysqli_connect('localhost:3307','root','','facebook');
$eid=$_SESSION['email'];
$sql="delete from current_users where email='$eid'";
$res=mysqli_query($conn,$sql);
session_destroy();
header('location:login.php');
?>