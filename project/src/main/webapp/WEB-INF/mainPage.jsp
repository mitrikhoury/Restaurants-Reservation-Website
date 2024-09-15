<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MK Restaurant</title>
<!-- Bootstrap CSS -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<style>
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: white;
}


#containerr {
    max-width: 1540px;
    color: black;
    height: 650px;
    background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' version='1.1' xmlns:xlink='http://www.w3.org/1999/xlink' xmlns:svgjs='http://svgjs.dev/svgjs' width='1650' height='645' preserveAspectRatio='none' viewBox='0 0 1650 645'%3e%3cg mask='url(%26quot%3b%23SvgjsMask1222%26quot%3b)' fill='none'%3e%3cpath d='M1064.56 670.17C1180.45 614.68 1087.62 271.24 1346.64 240.53 1605.65 209.82 1762.72 62.11 1910.79 59.93' stroke='rgba(88%2c 139%2c 183%2c 1)' stroke-width='2'%3e%3c/path%3e%3cpath d='M384.02 702.88C614.93 682.9 773.05 209.47 1168.65 209.05 1564.26 208.63 1744.19 494.7 1953.29 499.3' stroke='rgba(88%2c 139%2c 183%2c 1)' stroke-width='2'%3e%3c/path%3e%3cpath d='M964.11 656.77C1067.74 641.29 1014 410.46 1291.19 394.72 1568.37 378.98 1769.6 141.33 1945.34 136.72' stroke='rgba(88%2c 139%2c 183%2c 1)' stroke-width='2'%3e%3c/path%3e%3cpath d='M783.29 669.89C973.39 614.24 1027.78 83.57 1308.79 76.91 1589.81 70.25 1694.33 267.37 1834.3 270.41' stroke='rgba(88%2c 139%2c 183%2c 1)' stroke-width='2'%3e%3c/path%3e%3cpath d='M393.92 764.6C521.97 756.69 615.14 518.7 843.95 518.01 1072.76 517.32 1068.97 598.64 1293.98 598.63 1519 598.64 1629.71 518.33 1744.01 518.01' stroke='rgba(88%2c 139%2c 183%2c 1)' stroke-width='2'%3e%3c/path%3e%3c/g%3e%3cdefs%3e%3cmask id='SvgjsMask1222'%3e%3crect width='1650' height='645' fill='white'%3e%3c/rect%3e%3c/mask%3e%3c/defs%3e%3c/svg%3e");
    background-size: cover;
    background-position: center;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: flex-start;
    padding-left: 20px;
    text-align: left;
}

#containerr p {
    color: rgb(17, 56, 116);
    font-weight: bold;
    font-size: 2em;
    overflow: hidden;
    white-space: nowrap;
    border-right: 2px solid rgba(17, 56, 116, 0.75); /* Cursor effect */
    width: 0;
    animation: typing 5s steps(40, end) infinite, blink-caret 0.75s step-end infinite;
}

/* Typing animation */
@keyframes typing {
    0% {
        width: 0;
    }
    70% {
        width: 100%;
    }
    100% {
        width: 0; /* Resets back to 0 width to start again */
    }
}

/* Blinking cursor animation */
@keyframes blink-caret {
    from,
    to {
        border-color: transparent;
    }
    50% {
        border-color: rgba(17, 56, 116, 0.75);
    }
}


#about {
    padding: 50px;
    background-color: #f8f9fa; /* Light gray background for contrast */
    border-radius: 10px; /* Rounded corners */
    margin: 30px 0; /* Margin to separate from other sections */
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Soft shadow for depth */
}

#about h2 {
    font-size: 2.5em; /* Larger font size for heading */
    color: #113874; /* Deep blue color */
    font-weight: bold;
    margin-bottom: 20px; /* Space between heading and paragraph */
}

#about p {
    font-size: 1.25em; /* Larger font size for paragraph */
    line-height: 1.6; /* Line height for readability */
    color: #333; /* Dark gray color */
}

/* Style for the Contact Us section */
#contact {
    padding: 50px;
    background-color: #e3f2fd; /* Light blue background */
    border-radius: 10px; /* Rounded corners */
    margin: 30px 0; /* Margin to separate from other sections */
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Soft shadow for depth */
}

#contact h2 {
    font-size: 2.5em; /* Larger font size for heading */
    color: #113874; /* Deep blue color */
    font-weight: bold;
    margin-bottom: 20px; /* Space between heading and paragraph */
}

#contact p, #contact ul {
    font-size: 1.25em; /* Larger font size for paragraph and list */
    line-height: 1.6; /* Line height for readability */
    color: #333; /* Dark gray color */
}

#contact ul {
    list-style-type: none; /* Remove bullet points */
    padding: 0; /* Remove padding */
}

#contact li {
    margin-bottom: 10px; /* Space between list items */
}

#contact strong {
    color: #113874; /* Deep blue color for emphasis */
}
.image{
height: 100px; 
margin-right: 20px;
margin-top: 10px;
position: relative;
right:100px;
}


</style>
</head>
<body>
    <!-- Navigation Bar -->
    <header class=" navbar-expand-lg navbar-light text-black py-1 mb-4" style="background-color: #ECF9FF">
        <div class="container">
            <img class="image" src="${pageContext.request.contextPath}/pic.png" alt="MK Restaurant Logo">
            <nav class="navbar navbar-expand-lg navbar-light " style="background-color: #ECF9FF">
                <a class="navbar-brand"></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item"><a class="nav-link" href="#containerr">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="#about">About Us</a></li>
                        <li class="nav-item"><a class="nav-link" href="#contact">Contact Us</a></li>
                        <li class="nav-item"><a class="nav-link" href="/login">Login</a></li>
                        <li class="nav-item"><a class="nav-link" href="/registration">Registration</a></li>
                    </ul>
                </div>
            </nav>
        </div>
    </header>

    <!-- Main Content Section (Home) -->
    <div id="containerr" class="container section">
        <h1>Welcome to MK Restaurant</h1>
        <p>This is the homepage of MK Restaurant.<br> Use the navigation bar above to explore our site</p>
        
    </div>

    <!-- About Us Section -->
    <div id="about" class="section">
        <h2>About Us</h2>
        <p>MK Restaurant is dedicated to providing an exceptional dining experience with a diverse menu that features dishes from around the world. Our mission is to serve delicious food made from the freshest ingredients in a warm and welcoming atmosphere.</p>
    </div>

    <!-- Contact Us Section -->
    <div id="contact" class="container section">
        <h2>Contact Us</h2>
        <p>If you have any questions or comments, please feel free to reach out to us!</p>
        <ul>
            <li><strong>Email:</strong> MK@mkrestaurant.ps</li>
            <li><strong>Phone:</strong> +123-456-7890</li>
        </ul>
    </div>

    <!-- Footer -->
   <footer  class=" text-black py-4 mt-5" style="background-color: #ECF9FF">
        <div class="container text-center">
            <p class="mb-0">© 2024 MK Restaurant. All rights reserved.</p>
            <p class="mb-0">123 Main Street, City, Country</p>
            <p class="mb-0">Email: contact@mkrestaurant.com | Phone: +123-456-7890</p>
        </div>
    </footer>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
