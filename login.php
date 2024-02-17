<?php
session_start();
$message = "";
if (isset($_POST['signup'])) {
    require "connection.php";
    $fullName = $_POST['fullName'];
    $mobile = $_POST['mobile'];
    $pass1 = $_POST['pass1'];
    $pass2 = $_POST['pass2'];

    if ($fullName != "" && $mobile != "" && $pass1 != "" && $pass2 != "") {
        if ($pass1 == $pass2) {
            $p = password_hash($pass1, PASSWORD_DEFAULT);
            $sql = "INSERT INTO `users` (`full_name`, `mobile`, `password`) VALUES
            ('" . $fullName . "', '" . $mobile . "', '" . $p . "');";
            $conn->query($sql);
            if ($conn->affected_rows > 0) {
                $message = "Registration Successfully";
            } else {
                $message = "Error";
            }
        } else {
            $message = "Password does not match";
        }
    } else {
        $message = "Please fill all the fields";
    }
}


$message = "";
if (isset($_POST['login'])) {
    $mobileNum = $_POST['mobileNum'];
    $password = $_POST['password'];
    require "connection.php";
    $selectQuery = "SELECT * FROM users WHERE `mobile` = '" . $mobileNum . "' LIMIT 1";
    $result = $conn->query($selectQuery);
    if ($result->num_rows) {
        $userinfo = $result->fetch_assoc();
        if (password_verify($password, $userinfo['password'])) {
            $_SESSION['logged_in'] = true;
            $_SESSION['user_id'] = $userinfo['id'];
            $_SESSION['full_name'] = $userinfo['full_name'];
            $_SESSION['user_mobile'] = $userinfo['mobile'];
            $_SESSION['user_role'] = $userinfo['role'];
            if (isset($_SESSION['logged_in']) && $_SESSION['user_role'] == '2') {
                header("location: admin/admin-dashboard.php");
            }
            elseif (isset($_SESSION['logged_in']) && $_SESSION['user_role'] == '1') {
                header("location: user-dashboard.php");
            } else {
                $message = "Login failed";
                header("location: login.php");
            }
        } else {
            $message = "Invalid mobile number or password";
        }
    } else {
        $message = "Invalid mobile number or password";
    }
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="https://kit.fontawesome.com/64d58efce2.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="assets/css/login.style.css" />
    <title>Sign in & Sign up Form</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css">
</head>

<body>
    <div class="container">
        <div class="forms-container">
            <div class="signin-signup">
                <form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="POST" class="sign-in-form">
                    <h4><?php echo $message ?? ""; ?></h4>
                    <h2 class="title">Sign in</h2>
                    <div class="input-field">
                        <i class="fas fa-user"></i>
                        <input type="text" placeholder="Mobile Number" name="mobileNum" />
                    </div>
                    <div class="input-field">
                        <i class="fas fa-lock"></i>
                        <input type="password" placeholder="Password" name="password" />
                    </div>
                    <input type="submit" value="Login" class="btn solid" name="login" />
                    <p class="social-text">Or Sign in with social platforms</p>
                    <div class="social-media">
                        <a href="#" class="social-icon">
                            <i class="fab fa-facebook-f"></i>
                        </a>
                        <a href="#" class="social-icon">
                            <i class="fab fa-twitter"></i>
                        </a>
                        <a href="#" class="social-icon">
                            <i class="fab fa-google"></i>
                        </a>
                        <a href="#" class="social-icon">
                            <i class="fab fa-linkedin-in"></i>
                        </a>
                    </div>
                </form>
                <form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="POST" class="sign-up-form">
                    <h2 class="title">Sign up</h2>
                    <div class="input-field">
                        <i class="fas fa-user"></i>
                        <input type="text" placeholder="Full Name" name="fullName" />
                    </div>
                    <div class="input-field">
                        <i class="fa-solid fa-phone"></i>
                        <input type="text" placeholder="Mobile Number" name="mobile" />
                    </div>
                    <div class="input-field">
                        <i class="fas fa-envelope"></i>
                        <input type="password" placeholder="Password" name="pass1" />
                    </div>
                    <div class="input-field">
                        <i class="fas fa-lock"></i>
                        <input type="password" placeholder="Confirm Password" name="pass2" />
                    </div>
                    <input type="submit" class="btn" value="Sign up" name="signup" />
                    <p class="social-text">Or Sign up with social platforms</p>
                    <div class="social-media">
                        <a href="#" class="social-icon">
                            <i class="fab fa-facebook-f"></i>
                        </a>
                        <a href="#" class="social-icon">
                            <i class="fab fa-twitter"></i>
                        </a>
                        <a href="#" class="social-icon">
                            <i class="fab fa-google"></i>
                        </a>
                        <a href="#" class="social-icon">
                            <i class="fab fa-linkedin-in"></i>
                        </a>
                    </div>
                </form>
            </div>
        </div>

        <div class="panels-container">
            <div class="panel left-panel">
                <div class="content">
                    <h3>New here ?</h3>
                    <p>
                        Lorem ipsum, dolor sit amet consectetur adipisicing elit. Debitis,
                        ex ratione. Aliquid!
                    </p>
                    <button class="btn transparent" id="sign-up-btn">
                        Sign up
                    </button>
                </div>
                <img src="assets/images/log.svg" class="image" alt="" />
            </div>
            <div class="panel right-panel">
                <div class="content">
                    <h3>One of us ?</h3>
                    <p>
                        Lorem ipsum dolor sit amet consectetur adipisicing elit. Nostrum
                        laboriosam ad deleniti.
                    </p>
                    <button class="btn transparent" id="sign-in-btn">
                        Sign in
                    </button>
                </div>
                <img src="assets/images/register.svg" class="image" alt="" />
            </div>
        </div>
    </div>
    <script src="assets/js/login.js"></script>
</body>

</html>