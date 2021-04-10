<?php
     session_start();
     $db= mysqli_connect("c9","root","","authentication");
     
     if (isset($_POST['register_btn'])) {
         $username = mysql_real_excape_string($_POST['username']);
          $email = mysql_real_excape_string($_POST['email']);
           $password = mysql_real_excape_string($_POST['password']);
            $password2 = mysql_real_excape_string($_POST['passwor2']);
            
            if($password == $password2) {
                $password = md5($password);
                $sql = "INSERT INTO users(username, email, password) VALUES ('$username','$email','$password')";
                mysqli_query($db,$sql);
                $_SESSION['message'] = "you are now logged in";
                 $_SESSION['username'] = $username;
                 header("location: home.php");
                
            }else{
                 $_SESSION['message'] = "The two password do not match";
            }
     }
?>
<!DOCTYPE html>
<html>
<head>
    <title>Register, login and logout user php mysql</title>
</head>
<body>
    <div class="header">
        <h1>Register, login and logout user php mysql</h1>
    </div>

<form method="post" action="register.php">
    <table>
        <tr>
            <td>Username;</td>
            <td> <input type = "text" name = "username" class = "textInput"></td>
        </tr>
        <tr>
            <td>Email:</td>
            <td><input type="email" name="email"class="textInput"></td>
        </tr>
        <tr>
            <td>Password:</td>
            <td><input type="password" name="password" class="textInput"></td>
        </tr>
        <tr>
            <td>Password again:</td>
            <td><input type="password" name="password2" class="textInput"></td>
        </tr>
        <tr>
            <td>Username:</td>
            <td><input type="submit" name="register_btn" class="Register"></td>
        </tr>
    </table>
</form>
</body>
</html>