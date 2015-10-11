<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>Author Regist</title>
    <!-- Bootstrap core CSS -->
	<link href="/resources/css/bootstrap.css" rel="stylesheet">
	<!--external css-->
	<link href="/resources/font-awesome/css/font-awesome.css" rel="stylesheet" />
	<link rel="stylesheet" type="text/css" href="/resources/js/gritter/css/jquery.gritter.css" />
	<link rel="stylesheet" type="text/css" href="/resources/lineicons/style.css">
	
	<!-- Custom styles for this template -->
	<link href="/resources/css/style.css" rel="stylesheet">
	<link href="/resources/css/style-responsive.css" rel="stylesheet">
	<link href="/resources/lightbox-master/dist/ekko-lightbox.css" rel="stylesheet">

</head>
<body style="overflow-x:hidden; overflow-y:hidden;">
<div style="width: 100%">
    <h3 style="margin-left: 3%; text-align: center">Author Register</h3>

    <form class="form-horizontal" role="form" method="post" id="registForm"
          style="margin-left: 10%">
        <div class="form-group" id="divEmail" style="align-content: center">
            <label for="inputEmail" class="col-lg-2 control-label">이메일</label>

            <div class="col-lg-10" style="width: 90%">
                <input type="email" class="form-control" name="userid" id="email" data-rule-required="true" placeholder="이메일"
                       >
            </div>
        </div>
        <div class="form-group" id="divPassword">
            <label for="inputPassword" class="col-lg-2 control-label">패스워드</label>

            <div class="col-lg-10" style="width: 70%">
                <input type="password" class="form-control" id="password" name="userpw" data-rule-required="true"
                       placeholder="패스워드" maxlength="30">
            </div>
        </div>
        <div class="form-group" id="divPasswordCheck">
            <label for="inputPasswordCheck" class="col-lg-2 control-label">패스워드 확인</label>

            <div class="col-lg-10" style="width: 70%">
                <input type="password" class="form-control" id="passwordCheck" data-rule-required="true"
                       placeholder="패스워드 확인" maxlength="30">
            </div>
        </div>
        <div class="form-group" id="divName">
            <label for="inputName" class="col-lg-2 control-label">이름</label>

            <div class="col-lg-10" style="width: 60%">
                <input type="text" class="form-control onlyHangul" name="username" id="name" data-rule-required="true"
                       placeholder="한글만 입력 가능합니다." maxlength="15">
            </div>
        </div>
        <div class="form-group" id="divBirth">
            <label for="inputBirth" class="col-lg-2 control-label">생년월일</label>

            <div class="col-lg-10" style="width: 70%">
                <input type="text" class="form-control" name="birth" id="birth" data-rule-required="true"
                       placeholder="생년월일을 입력해주세요. ex)19990101" maxlength="8">
            </div>
        </div>

        <div class="form-group" id="divPhoneNumber">
            <label for="inputPhoneNumber" class="col-lg-2 control-label">휴대폰 번호</label>
            <div class="col-lg-10" style="width: 60%">
                <input type="tel" class="form-control onlyNumber" id="phoneNumber" name="phone" 
                data-rule-required="true" placeholder="휴대폰 번호를 입력하세요." maxlength="11">
            </div>
        </div>
        <div class="form-group">
            <label for="inputPhoneNumber" class="col-lg-2 control-label">성별</label>

            <div class="col-lg-10" style="width: 30%">
                <select class="form-control" id="gender" name="gender">
                    <option value="남자">남</option>
                    <option value="여자">여</option>
                </select>
            </div>
        </div>
		<input type="hidden" id="grade" value="작가" name="grade"/>
		<input type="hidden" id="livestate" value="등록" name="livestate"/>
        <div class="form-group">
            <div class="text-center">
                <button id="submitBtn" class="btn btn-default">Sign in</button>
                <button id="cancleBtn" class="btn btn-default" data-dismiss="modal">Cancle</button>
            </div>
        </div>
    </form>
</div>
<!-- js placed at the end of the document so the pages load faster -->
<script src="/resources/js/jquery.js"></script>
<script src="/resources/js/jquery-1.8.3.min.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<script src="/resources/lightbox-master/dist/ekko-lightbox.js"></script>

<script>
    $(function () {
        //모달을 전역변수로 선언
        var modalContents = $(".modal-contents");
        var modal = $("#defaultModal");

        $('.onlyAlphabetAndNumber').keyup(function (event) {
            if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
                var inputVal = $(this).val();
                $(this).val($(this).val().replace(/[^_a-z0-9]/gi, '')); //_(underscore), 영어, 숫자만 가능
            }
        });

        $(".onlyHangul").keyup(function (event) {
            if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
                var inputVal = $(this).val();
                $(this).val(inputVal.replace(/[a-z0-9]/gi, ''));
            }
        });

        $(".onlyNumber").keyup(function (event) {
            if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
                var inputVal = $(this).val();
                $(this).val(inputVal.replace(/[^0-9]/gi, ''));
            }
        });

        //------- 검사하여 상태를 class에 적용
        $('#id').keyup(function (event) {

            var divId = $('#divId');

            if ($('#id').val() == "") {
                divId.removeClass("has-success");
                divId.addClass("has-error");
            } else {
                divId.removeClass("has-error");
                divId.addClass("has-success");
            }
        });

        $('#password').keyup(function (event) {

            var divPassword = $('#divPassword');

            if ($('#password').val() == "") {
                divPassword.removeClass("has-success");
                divPassword.addClass("has-error");
            } else {
                divPassword.removeClass("has-error");
                divPassword.addClass("has-success");
            }
        });

        $('#passwordCheck').keyup(function (event) {

            var passwordCheck = $('#passwordCheck').val();
            var password = $('#password').val();
            var divPasswordCheck = $('#divPasswordCheck');

            if ((passwordCheck == "") || (password != passwordCheck)) {
                divPasswordCheck.removeClass("has-success");
                divPasswordCheck.addClass("has-error");
            } else {
                divPasswordCheck.removeClass("has-error");
                divPasswordCheck.addClass("has-success");
            }
        });

        $('#name').keyup(function (event) {

            var divName = $('#divName');

            if ($.trim($('#name').val()) == "") {
                divName.removeClass("has-success");
                divName.addClass("has-error");
            } else {
                divName.removeClass("has-error");
                divName.addClass("has-success");
            }
        });

        $('#nickname').keyup(function (event) {

            var divNickname = $('#divNickname');

            if ($.trim($('#nickname').val()) == "") {
                divNickname.removeClass("has-success");
                divNickname.addClass("has-error");
            } else {
                divNickname.removeClass("has-error");
                divNickname.addClass("has-success");
            }
        });

        $('#email').keyup(function (event) {

            var divEmail = $('#divEmail');

            if ($.trim($('#email').val()) == "") {
                divEmail.removeClass("has-success");
                divEmail.addClass("has-error");
            } else {
                divEmail.removeClass("has-error");
                divEmail.addClass("has-success");
            }
        });

        $('#phoneNumber').keyup(function (event) {

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
        $("form").submit(function (event) {

            var divPassword = $('#divPassword');
            var divPasswordCheck = $('#divPasswordCheck');
            var divName = $('#divName');
            var divNickname = $('#divNickname');
            var divEmail = $('#divEmail');
            var divPhoneNumber = $('#divPhoneNumber');


            //패스워드 검사
            if ($('#password').val() == "") {
                modalContents.text("패스워드를 입력하여 주시기 바랍니다.");
                modal.modal('show');

                divPassword.removeClass("has-success");
                divPassword.addClass("has-error");
                $('#password').focus();
                return false;
            } else {
                divPassword.removeClass("has-error");
                divPassword.addClass("has-success");
            }

            //패스워드 확인
            if ($('#passwordCheck').val() == "") {
                modalContents.text("패스워드 확인을 입력하여 주시기 바랍니다.");
                modal.modal('show');

                divPasswordCheck.removeClass("has-success");
                divPasswordCheck.addClass("has-error");
                $('#passwordCheck').focus();
                return false;
            } else {
                divPasswordCheck.removeClass("has-error");
                divPasswordCheck.addClass("has-success");
            }

            //패스워드 비교
            if ($('#password').val() != $('#passwordCheck').val() || $('#passwordCheck').val() == "") {
                modalContents.text("패스워드가 일치하지 않습니다.");
                modal.modal('show');

                divPasswordCheck.removeClass("has-success");
                divPasswordCheck.addClass("has-error");
                $('#passwordCheck').focus();
                return false;
            } else {
                divPasswordCheck.removeClass("has-error");
                divPasswordCheck.addClass("has-success");
            }

            //이름
            if ($('#name').val() == "") {
                modalContents.text("이름을 입력하여 주시기 바랍니다.");
                modal.modal('show');

                divName.removeClass("has-success");
                divName.addClass("has-error");
                $('#name').focus();
                return false;
            } else {
                divName.removeClass("has-error");
                divName.addClass("has-success");
            }

            //이메일
            if ($('#email').val() == "") {
                modalContents.text("이메일을 입력하여 주시기 바랍니다.");
                modal.modal('show');

                divEmail.removeClass("has-success");
                divEmail.addClass("has-error");
                $('#email').focus();
                return false;
            } else {
                divEmail.removeClass("has-error");
                divEmail.addClass("has-success");
            }

            //휴대폰 번호
            if ($('#phoneNumber').val() == "") {
                modalContents.text("휴대폰 번호를 입력하여 주시기 바랍니다.");
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