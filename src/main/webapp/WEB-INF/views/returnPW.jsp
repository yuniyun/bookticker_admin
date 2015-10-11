<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Dashboard">
<meta name="keyword"
	content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

<title>Return your password</title>

<!-- Bootstrap core CSS -->
<link href="/resources/css/bootstrap.css" rel="stylesheet">
<!--external css-->
<link href="/resources/font-awesome/css/font-awesome.css"
	rel="stylesheet" />

<!-- Custom styles for this template -->
<link href="/resources/css/style.css" rel="stylesheet">
<link href="/resources/css/style-responsive.css" rel="stylesheet">
<link href="/resources/lightbox-master/dist/ekko-lightbox.css"
	rel="stylesheet">

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>

	<!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->

	<div id="login-page">
		<div class="container">

			<form class="form-login" name="totalform">
				<h2 class="form-login-heading">Your password is...</h2>
				<div class="pwd-wrap">
					<input type="text" class="form-control" placeholder="Your Password is ${password}">
					<br>
					<span class="pull-right">
						<button class="btn btn-default" id="backToLogin"
							onClick="backClick(event)">
							<i class="fa fa-home fa-fw"></i>Go to Login Page
						</button>
					</span> <br> <br>
					<hr>
					<br>

				</div>

			</form>

		</div>
	</div>

	<!-- js placed at the end of the document so the pages load faster -->
	<script src="/resources/js/jquery.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>

	<!--BACKSTRETCH-->
	<!-- You can use an image of whatever size. This script will stretch to fit in any screen size.-->
	<script type="text/javascript"
		src="/resources/js/jquery.backstretch.min.js"></script>
	<script>
		$.backstretch("/resources/img/bg5.png", {
			speed : 500
		});

		function backClick(e) {
			//*[data-toggle="lightbox"]:not([data-gallery="navigateTo"])
			e.preventDefault();
			self.location = "/login";
			
		}

	</script>



</body>
</html>