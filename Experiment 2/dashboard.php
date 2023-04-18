<?php
if($_SERVER["REQUEST_METHOD"]=="POST")
{
    session_start();
    $email=$_POST["email"];
    $password=$_POST["password"];
    $conn=mysqli_connect('localhost:3307','root','','facebook');
    $sql="select * from user where email='$email' and password='$password' ";
    $sql1="insert into current_users values('$email')";
    $res1=mysqli_query($conn,$sql1);
    $res=mysqli_query($conn,$sql);
    if(mysqli_num_rows($res)>0){
        session_start();
        $_SESSION['email']=$email;
        header('location:index.php');
    }
    else{
        echo "<script> alert('Enter valid details!!!') </script>";
    }

    }
?>