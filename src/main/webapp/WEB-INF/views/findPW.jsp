<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
<meta charset="UTF-8">
<title>find password</title>
<!-- Bootstrap core CSS -->
<link href="/resources/css/bootstrap.css" rel="stylesheet">
<!--external css-->
<link href="/resources/font-awesome/css/font-awesome.css"
	rel="stylesheet" />
<link rel="stylesheet" type="text/css"
	href="/resources/css/zabuto_calendar.css">
<link rel="stylesheet" type="text/css"
	href="/resources/js/gritter/css/jquery.gritter.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/lineicons/style.css">
<link rel="stylesheet"
	href="http://bootswatch.com/journal/bootstrap.css">
<!-- Custom styles for this template -->
<link href="/resources/css/style.css" rel="stylesheet">
<link href="/resources/lightbox-master/dist/ekko-lightbox.css"
	rel="stylesheet">
</head>
<body style="overflow-x: hidden; overflow-y: hidden;">
	<div style="width: 100%">
		<h3 style="margin-left: 3%; text-align: center">find password</h3>
		<br>
		<form class="form-horizontal" role="form" method="post" id="form"
			action="/findPW" style="margin-left: 10%">
			<div class="form-group" id="divEmail" style="align-content: center">
				<label for="inputEmail" class="col-lg-2 control-label">아이디</label>

				<div class="col-lg-10" style="width: 70%">
					<input type="email" class="form-control" name="userid" id="email"
						data-rule-required="true"
						placeholder="이메일 형식으로 입력  ex)user@mail.com">
				</div>
			</div>


			<div class="form-group" id="divPhoneNumber">
				<label for="inputPhoneNumber" class="col-lg-2 control-label">연락처</label>
				<div class="col-lg-10" style="width: 70%">
					<input type="tel" class="form-control onlyNumber" id="phoneNumber"
						name="phone" data-rule-required="true" placeholder="연락처를 입력하세요."
						maxlength="11">
				</div>
			</div>


			<div class="form-group">
				<div class="text-center">
					<button id="submitBtn" class="btn btn-default">confirm</button>
					<button id="cancleBtn" class="btn btn-default" data-dismiss="modal">Cancle</button>
				</div>
			</div>
		</form>
	</div>
	<input type="hidden" id="password" value="${password}" />

	<!-- js placed at the end of the document so the pages load faster -->
	<script src="/resources/js/jquery.js"></script>
	<script src="/resources/js/jquery-1.8.3.min.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/lightbox-master/dist/ekko-lightbox.js"></script>

	<script>
		$(function() {
			//모달을 전역변수로 선언
			var modalContents = $(".modal-contents");
			var modal = $("#defaultModal");

			$('.onlyAlphabetAndNumber').keyup(function(event) {
				if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
					var inputVal = $(this).val();
					$(this).val($(this).val().replace(/[^_a-z0-9]/gi, '')); //_(underscore), 영어, 숫자만 가능
				}
			});

			$(".onlyHangul").keyup(function(event) {
				if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
					var inputVal = $(this).val();
					$(this).val(inputVal.replace(/[a-z0-9]/gi, ''));
				}
			});

			$(".onlyNumber").keyup(function(event) {
				if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
					var inputVal = $(this).val();
					$(this).val(inputVal.replace(/[^0-9]/gi, ''));
				}
			});

			//------- 검사하여 상태를 class에 적용
			$('#id').keyup(function(event) {

				var divId = $('#divId');

				if ($('#id').val() == "") {
					divId.removeClass("has-success");
					divId.addClass("has-error");
				} else {
					divId.removeClass("has-error");
					divId.addClass("has-success");
				}
			});

			$('#email').keyup(function(event) {

				var divEmail = $('#divEmail');

				if ($.trim($('#email').val()) == "") {
					divEmail.removeClass("has-success");
					divEmail.addClass("has-error");
				} else {
					divEmail.removeClass("has-error");
					divEmail.addClass("has-success");
				}
			});

			$('#phoneNumber').keyup(function(event) {

				var divPhoneNumber = $('#divPhoneNumber');

				if ($.trim($('#phoneNumber').val()) == "") {
					divPhoneNumber.removeClass("has-success");
					divPhoneNumber.addClass("has-error");
				} else {
					divPhoneNumber.removeClass("has-error");
					divPhoneNumber.addClass("has-success");
				}
			});

			//------- validation 검사
			$("form").submit(function(event) {

				var divEmail = $('#divEmail');
				var divPhoneNumber = $('#divPhoneNumber');

				//아이디
				if ($('#email').val() == "") {
					modalContents.text("아이디를 입력하여 주시기 바랍니다.");
					modal.modal('show');

					divEmail.removeClass("has-success");
					divEmail.addClass("has-error");
					$('#email').focus();
					return false;
				} else {
					divEmail.removeClass("has-error");
					divEmail.addClass("has-success");
				}

				//연락처
				if ($('#phoneNumber').val() == "") {
					modalContents.text("연락처를 입력하여 주시기 바랍니다.");
					modal.modal('show');

					divPhoneNumber.removeClass("has-success");
					divPhoneNumber.addClass("has-error");
					$('#phoneNumber').focus();
					return false;
				} else {
					divPhoneNumber.removeClass("has-error");
					divPhoneNumber.addClass("has-success");
				}

			});
		});
	</script>
</body>
</html>