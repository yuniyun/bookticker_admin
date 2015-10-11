<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Dashboard">
<meta name="keyword"
	content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

<title>BOOKTICKER Login</title>

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

			<form class="form-login" id="totalform" name="totalform">
				<h2 class="form-login-heading">BOOKTICKER</h2>
				<div class="login-wrap">
					<input type="text" class="form-control" id="userid" name="userid"
						placeholder="User ID is email address" autofocus> <br>
					<input type="password" class="form-control" id="userpw" name="userpw"
						placeholder="Password"> <label class="checkbox"
						id="findPW" onClick="findPW(event)"> <span
						class="pull-right"> <a> Forgot Password?</a>

					</span>

					</label> <span class="pull-right">
						<button class="btn btn-default" id="loginner"
							>
							<i class="fa fa-home fa-fw"></i>login
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
	<script src="/resources/lightbox-master/dist/ekko-lightbox.js"></script>
	<input type="hidden" id="serverResult" name="serverMsg" value="${serverMsg}">

	
	<!--BACKSTRETCH-->
	<!-- You can use an image of whatever size. This script will stretch to fit in any screen size.-->
	<script type="text/javascript"
		src="/resources/js/jquery.backstretch.min.js"></script>
	<script>
		$.backstretch("/resources/img/bg5.png", {
			speed : 500
		});

		function findPW(e) {
			e.preventDefault();
			$(this).attr('href', '/findPW');
			return $(this).ekkoLightbox();
		}

		var job = $('#totalform');
		$('#loginner').click(function(){
			job.attr('action', '/loginCheck')
			job.attr('method', 'post')
			job.submit();
			//('.form-login').submit();
		});
		

		function regClick(e) {
			e.preventDefault();
			$(this).attr('href', '/user_regist');
			return $(this).ekkoLightbox();
		}

		$(document).ready(function(e) {
			var m = $('#serverResult').val();
			if (m != "") {
				alert(m)
			}

		});
	</script>



</body>
</html>