<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>Report List</title>
    <!-- Bootstrap core CSS -->
    <link href="/resources/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="/resources/lightbox-master/dist/ekko-lightbox.css" rel="stylesheet">
    
	<!-- Custom styles for this template -->
    <link href="/resources/css/style.css" rel="stylesheet">
    <link href="/resources/css/style-responsive.css" rel="stylesheet">

    <script src="/resources/js/jquery.js"></script>
</head>
<style>
    table tr th{
        text-align: center;
    }
    #viewPage{
         color: #66afe9;
     }
    #viewPage:hover{
        color: #a6e1ec;
        text-decoration: underline;
        cursor: pointer;
    }
</style>
<body>
<table width="94%" style="margin: 3% 3% 3% 3%;">
    <br>
    <tr>
        <td>
            <span style="padding-left: 10px">제목 : ${title}</span>
        </td>
    </tr>
    <tr>
        <td align="center">
            <table class="table" width="94%" style="padding: 0% 3% 0% 3%; margin: 3% 0% 3% 0%;">
                <tr align="center">
                    <th>신고자</th>
                    <th>사유</th>
                    <th>컨텐츠</th>
                </tr>
                <c:forEach items="${reportlist}" var="rep">
	             <tr align="center">
	                 <td>${rep.userid}</td>
	                 <td>${rep.coment}</td>
	                 <td><a class="viewPage" id="${rep.convertno}" href="" data-title="Report page" data-toggle="lightbox">내용보기</a></td>
	             </tr>
             	</c:forEach>
            </table>
        </td>
    </tr>
</table>
<table width="94%" style="margin: 2% 3% 2% 3%;">
    <tr>
        <td align="center">
            <button class="btn btn-default" data-dismiss="modal">Close</button>
        </td>
    </tr>
</table>
<!-- js placed at the end of the document so the pages load faster -->
<script src="/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery.dcjqaccordion.2.7.js"></script>
<script src="/resources/js/jquery.nicescroll.js" type="text/javascript"></script><!-- 얘 없으면 라이트 박스 두개 나오는거 안됨!-->
<script src="/resources/js/jquery.sparkline.js"></script>
<script src="/resources/lightbox-master/dist/ekko-lightbox.js"></script>


<!--common script for all pages-->
<script src="/resources/js/common-scripts.js"></script>

<script type="text/javascript">
	$('.viewPage').on('click', function(event) {
	    event.preventDefault();
	    var convertno = $(this).attr('id');
		$(this).attr('href', 'readbook?convertno='+convertno);
	    return $(this).ekkoLightbox();
	});
</script>
</body>
</html>