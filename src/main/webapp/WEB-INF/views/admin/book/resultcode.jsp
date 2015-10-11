<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
    <meta charset="utf-8">
    <title>BOOKTICKER Admin</title>
    <!-- Bootstrap -->
    <link href="/resources/css/bootstrap.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <![endif]-->
</head>
<script src="/resources/js/qrcode-generator/jquery.min.js"></script>
<script src="/resources/js/qrcode-generator/qrcode.js"></script>
<script src="/resources/js/qrcode-generator/qrcode.min.js"></script>
<style>
    .qr img {
        width: 2cm;
        height: 2cm;
        position: relative;
        left: 11.45cm;
        top: 1.5cm;
    }

    .apaper {
        padding-top: 1.25cm;
        padding-left: 0.85cm;
        padding-bottom: 1.25cm;
        padding-right: 0.85cm;
        width: 29.7cm;
        height: 21.0cm;
        margin: 0px;
        background-color: #ffffff;
    }
	.apaper2 {
        padding-top: 1.25cm;
        padding-left: 0.85cm;
        padding-bottom: 1.25cm;
        padding-right: 0.85cm;
        width: 29.7cm;
        height: 21.0cm;
        margin: 0px;
		margin-top: 2cm;
        background-color: #ffffff;
    }

</style>
<body>
<div class="qrcode row apaper">
<c:forEach begin="1" end="${amount}" varStatus="status">
	<c:if test="${ status.count ne 1 && status.count%6 eq 1 }">
	  <div class="qrcode row apaper2">
	</c:if>
	<div style="width: 14cm; height: 6.5cm; float: left; border: 1px solid #dddddd;background-image: url('/resources/img/booktickerBG.png'); background-size: 100% 100%">
        <div style="height: 0.75cm; padding-left: 10px; padding-top: 9px">
        	<span style="font-size: 10px; color: darkgray">NO. 0000001</span>
        </div>
        <div id="ticket${status.count}" class="qr" style="height: 5cm;">
        	<div style="position: absolute; width:2.4375cm; height: 3.25cm; margin-top: -0.5cm; margin-left: -2.5cm">
        		<img title="${book.title}" src="/view?fileName=${book.title}&fileType=IMAGE&series=${book.series}&bookversion=${book.bookversion}&pageNo=thumbnail" style="width: 100%; height: 100%">
        	</div>
            <div style="position: absolute; width:8.25cm; height: 4cm; margin-top: 1.5cm; margin-left: 0.5cm" align="center">
         		<span style="font-size: 40px; font-weight: bold; color: #204d74">${book.title}</span><br>
                <span style="font-weight: bold; color: #00abf0; font-size: 12px;">${book.username} 저 | ${book.pubcompany} | ${book.applydate}</span>      
            </div>
            <div style="position: absolute; width: 2cm; height: 1.5cm; margin-top: 1cm; margin-left: 11.45cm; font-size: 11px; font-weight: bold;">
                BOOKTICKER
            </div>
            <div style="position: absolute; width: 5cm; height: 1.5cm; margin-top: 3.6cm; margin-left: 11.45cm; font-size: 11px; font-weight: bold;">
                <figure style="height: 0.5cm; width: 0.5cm; background: url(/resources/img/logo.png); background-size: 100% 100%;padding-left: 0.5cm;padding-top: 0.1cm;">BIGSMILE</figure>
            </div>
        </div>
    </div>
    <c:if test="${status.count%6 eq 0 || status.count eq amount}">
	  </div>
	</c:if>
</c:forEach>
<input type="hidden" name="amount" value="${amount}">
<input type="hidden" name="bookno" value="${book.bookno}">
<script type="text/javascript">


    function generateUUID() {
        var d = new Date().getTime();
        var uuid = 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
            var r = (d + Math.random() * 16) % 16 | 0;
            d = Math.floor(d / 16);
            return (c == 'x' ? r : (r & 0x3 | 0x8)).toString(16);
        });
        return uuid;
    }
   	//uuid 만드는 함수
    var amount = $('input[name=amount]').attr('value');
    for (var i = 1; i <= amount; i++) {
        var uuid = generateUUID();
        $.post('regcode', { cardkey: uuid, bookno: $('input[name=bookno]').attr('value') });
        new QRCode(document.getElementById("ticket" + i), uuid); // 이걸하면 id영역에 qr이생긴다
    }

</script>
</body>
</html>