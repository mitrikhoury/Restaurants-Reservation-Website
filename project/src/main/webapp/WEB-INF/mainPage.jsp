<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MK Restaurant</title>
<!-- Bootstrap CSS -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<style>
 
        body {
           background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' version='1.1' xmlns:xlink='http://www.w3.org/1999/xlink' xmlns:svgjs='http://svgjs.dev/svgjs' width='1440' height='560' preserveAspectRatio='none' viewBox='0 0 1440 560'%3e%3cg mask='url(%26quot%3b%23SvgjsMask1189%26quot%3b)' fill='none'%3e%3crect width='1440' height='560' x='0' y='0' fill='rgba(255%2c 255%2c 255%2c 1)'%3e%3c/rect%3e%3cpath d='M -1046.7831112941387%2c180 C -902.78%2c204 -614.78%2c319.2 -326.78311129413873%2c300 C -38.78%2c280.8 105.22%2c72.6 393.21688870586127%2c84 C 681.22%2c95.4 903.86%2c320.8 1113.2168887058613%2c357 C 1322.57%2c393.2 1374.64%2c283.4 1440%2c265' stroke='rgba(51%2c 121%2c 194%2c 0.58)' stroke-width='2'%3e%3c/path%3e%3cpath d='M -40.41032935721398%2c266 C 103.59%2c270.8 391.59%2c293.8 679.589670642786%2c290 C 967.59%2c286.2 1111.59%2c244.2 1399.5896706427861%2c247 C 1687.59%2c249.8 2111.51%2c309.4 2119.589670642786%2c304 C 2127.67%2c298.6 1575.92%2c236.8 1440%2c220' stroke='rgba(51%2c 121%2c 194%2c 0.58)' stroke-width='2'%3e%3c/path%3e%3cpath d='M -980.8530416433493%2c466 C -836.85%2c408.8 -548.85%2c191 -260.85304164334934%2c180 C 27.15%2c169 171.15%2c395.6 459.14695835665066%2c411 C 747.15%2c426.4 982.98%2c245 1179.1469583566507%2c257 C 1375.32%2c269 1387.83%2c428.2 1440%2c471' stroke='rgba(51%2c 121%2c 194%2c 0.58)' stroke-width='2'%3e%3c/path%3e%3cpath d='M -815.5615198899211%2c132 C -671.56%2c189 -383.56%2c419.4 -95.5615198899211%2c417 C 192.44%2c414.6 336.44%2c123.8 624.4384801100789%2c120 C 912.44%2c116.2 1181.33%2c397.6 1344.438480110079%2c398 C 1507.55%2c398.4 1420.89%2c177.2 1440%2c122' stroke='rgba(51%2c 121%2c 194%2c 0.58)' stroke-width='2'%3e%3c/path%3e%3c/g%3e%3cdefs%3e%3cmask id='SvgjsMask1189'%3e%3crect width='1440' height='560' fill='white'%3e%3c/rect%3e%3c/mask%3e%3c/defs%3e%3c/svg%3e");
            background-size: cover;
            background-repeat: no-repeat;
            margin: 0;
            padding: 0;
            scroll-behavior: smooth; /* Enables smooth scrolling */
}

	/* Sticky navbar */
        .navbar {
	position: sticky;
	top: 0;
	z-index: 1000;
}



/* Section spacing */
.section {
	padding: 150px 0;
}

/* Additional styling for text and containers */
h1, h2 {
	color: #333;
}

.container p, .container ul {
	color: #555;
}
</style>
</head>
<body>
	<!-- Navigation Bar -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="#home">MK Restaurant</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link" href="#home">Home</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="#about">About
						Us</a></li>
				<li class="nav-item"><a class="nav-link" href="#contact">Contact
						Us</a></li>
				<li class="nav-item"><a class="nav-link" href="/login">Login</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="/registration">Registration</a>
				</li>
			</ul>
		</div>
	</nav>

	<!-- Main Content Section -->
	
		<div id="home" class="container section">
			<h1>Welcome to MK Restaurant</h1>
			<p>This is the homepage of MK Restaurant. Use the navigation bar
				above to explore our site.</p>
		</div>


	<!-- About Us Section -->
	<div id="about" class="container section">
		<h2>About Us</h2>
		<p>MK Restaurant is dedicated to providing an exceptional dining
			experience with a diverse menu that features dishes from around the
			world. Our mission is to serve delicious food made from the freshest
			ingredients in a warm and welcoming atmosphere.</p>
	</div>

	<!-- Contact Us Section -->
	<div id="contact" class="container section">
		<h2>Contact Us</h2>
		<p>If you have any questions or comments, please feel free to
			reach out to us!</p>
		<ul>
			<li><strong>Email:</strong> MK@mkrestaurant.ps</li>
			<li><strong>Phone:</strong> +123-456-7890</li>
		</ul>
	</div>

	<!-- Footer -->
	<footer class="bg-light py-3">
		<div class="container text-center">
			<p class="mb-0">© 2024 MK Restaurant. All rights reserved.</p>
		</div>
	</footer>

	<!-- Bootstrap JS and dependencies -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>