<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>Read Message</title>
    
    <!-- Bootstrap core CSS -->
    <link href="/resources/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="/resources/font-awesome/css/font-awesome.css" rel="stylesheet" /> <!-- 아이콘 -->
    <link href="/resources/lightbox-master/dist/ekko-lightbox.css" rel="stylesheet">
    
	<!-- Custom styles for this template -->
    <link href="/resources/css/style.css" rel="stylesheet">
    <link href="/resources/css/style-responsive.css" rel="stylesheet">

    <script src="/resources/js/jquery.js"></script>
</head>
<body>
<table width="94%" style="margin: 2% 3% 2% 3%;">
    <tr>
        <td>
            <br>
            <span style="font-size: 12px"><b>받는 사람 :</b>${msg.username} (${msg.userid})</span>
        </td>
    </tr>
    <tr>
        <td class="tbyte">
            <textarea class="contents"; style="width:100%;  resize: none" rows="10" readonly="readonly">${msg.msg}</textarea>
        </td>
    </tr>
    <tr>
        <td align="right">
        </td>
    </tr>
    <tr>
        <td align="right">
        	<button class="btn btn-default" id="deletBtn">삭제</button>
            <button class="btn btn-default" data-dismiss="modal">확인</button>
            <br>
        </td>
    </tr>
</table>
<form name="deleteMsg" action="delete" method="post">
	<input type="hidden" name="checkedVal" value="${msg.msgno}">
</form>

  <!-- js placed at the end of the document so the pages load faster -->
<script src="/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery.dcjqaccordion.2.7.js"></script>
<script src="/resources/js/jquery.scrollTo.min.js"></script>
<script src="/resources/js/jquery.nicescroll.js" type="text/javascript"></script>
<script src="/resources/js/jquery.sparkline.js"></script>
<script src="/resources/lightbox-master/dist/ekko-lightbox.js"></script>

<script type="text/javascript">
	$('#deletBtn').on('click', function(){
		if(confirm('해당 메세지를 삭제 하시겠습니까?')){
	        var form = document.deleteMsg;
	        form.submit();
		}
	});
</script>
</body>
</html>
