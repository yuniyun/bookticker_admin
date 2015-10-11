<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>Code Register</title>
    <!-- Bootstrap core CSS -->
    <link href="/resources/css/bootstrap.css" rel="stylesheet">
    
    <!-- Custom styles for this template -->
    <link href="/resources/css/style.css" rel="stylesheet">    
    <link href="/resources/css/style-responsive.css" rel="stylesheet">
    
    <link href="/resources/js/fancybox/jquery.fancybox.css" rel="stylesheet" />
</head>
<style>
    .hidDiv{
        display: none;
    }
</style>

<body style="overflow-x:hidden; overflow-y:hidden;">
<div style="width: 100%">
    <h3 style="margin-left: 3%">Code Register</h3>

    <form class="" role="form" method="post" action="javascript:alert( 'success!' );"></form>
    
        <div class="col-xs-8 form-group" id="divBookName">
            <label for="bookName" class="col-lg-3 control-label">책이름</label>

            <div class="col-lg-12">
                <input type="text" class="form-control" id="bookName" data-rule-required="true" value="${book.title}" readonly>
            </div>
        </div>
        <form action="resultcode" method="get" target="_blank">
        <input type="hidden" name="bookno" value="${book.bookno}">
        <div class="col-xs-4 form-group" id="divAmount" style="text-align: left">
            <label for="inputAmount" class="col-lg-5 control-label">수량</label>

            <div class="col-lg-12">
            	<input type="text" name="amount" style="width: 80%">개
            </div>
        </div>
    

    <div class="row text-center">
        <div class="col-xs-12" id="infoText">

        </div>
        <div class="col-xs-12" id="codeRecognition1">

        </div>
        <div class="col-xs-12"><figure style="height: 5px"></figure></div>
        <div class="col-xs-12" id="codeRecognition2">
        </div>
    </div>
    
	    <div class="row">
	        <div class="col-lg-12 text-center" style="margin-top: 10px">
	            <button type="submit" class="btn btn-default">등록</button>
	            <button class="btn btn-default" data-dismiss="modal">취소</button>
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
    function selectAmount(select){
        $('#divAmount').addClass('hidDiv');
        $('#infoText').append('<h5>카드인식기에 카드를 올려주세요</h5>');
        var str1 = '<div class="col-xs-1"></div>';
        var str2 = '<div class="col-xs-1"></div>';
        for(var i=0; i<select.value; i++) {
            var str ='';
            str += '<div class="col-xs-2">';
            str += '<figure id="'+i+'" style="background-color: #31b0d5; width: 30px; height: 20px"></figure>';
            str += '</div>';
            if (i < 5) {
                str1 += str;
            } else {
                str2 += str;
            }
        }
        $('#codeRecognition1').append(str1);
        $('#codeRecognition2').append(str2);
    };

</script>
</body>
</html>