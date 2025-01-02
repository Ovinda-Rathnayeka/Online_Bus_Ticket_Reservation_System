<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="sign-in.css">
    <link rel="stylesheet" type="text/css" href="../../homepage/css/font.css">

    <title>Login</title>
</head>

<body>

    <div class="container" id="container">
        <div class="form-container sign-up">
            <form action="buslogin" method="POST">
                <h1>Bus Owner Log In</h1>
             
                <span>Use your email password</span>
                <input type="email" name="email" placeholder="Email" required>
                <input type="password" name="password" placeholder="Password" required>
                <a href="#">Forget Your Password?</a>
                <button type="submit" name="submit">Sign In</button>
            </form>
        </div>
        <div class="form-container sign-in">
            <form action="loginservlet" method="POST">
                <h1>User Log In</h1>
                
                <span>Use your email password</span>
                <input type="email" name="email" placeholder="Email" required>
                <input type="password" name="password" placeholder="Password" required>
                <a href="#">Forget Your Password?</a>
                <button type="submit" name="submit">Sign In</button>
            </form>
        </div>
        <div class="toggle-container">
            <div class="toggle">
                <div class="toggle-panel toggle-left">
                    <h1>Hello!</h1>
                    <p>If you are a <strong>User</strong> please sign in from here.</p>
                    <button class="hidden" id="app-login">Customer Log In</button>
                </div>
                <div class="toggle-panel toggle-right">
                    <h1>Hello!</h1>
                    <p>If you are a <strong>Bus Operator</strong> please sign in from here.</p>
                    <button class="hidden" id="rec-login">Bus Owner Log In</button>
                </div>
            </div>
        </div>
    </div>

    <script src="sign-in.js"></script>
</body>

</html>