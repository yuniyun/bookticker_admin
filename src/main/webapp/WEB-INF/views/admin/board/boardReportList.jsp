<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
	<ul>
		<c:forEach items="${reportList}" var="rl">
		<li>
			<a href="boardReportRead?reportNo=${rl.getReportNo()}">신고가 접수되었습니다.</a>
		</li>		
		</c:forEach>
	</ul>
<!-- js placed at the end of the document so the pages load faster -->
<script src="/resources/js/fancybox/jquery.fancybox.js"></script>    
<script src="/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery.dcjqaccordion.2.7.js"></script>
<script src="/resources/js/jquery.scrollTo.min.js"></script>
<script src="/resources/js/jquery.nicescroll.js" type="text/javascript"></script>
<script src="/resources/js/jquery.sparkline.js"></script>
<script src="/resources/lightbox-master/dist/ekko-lightbox.js"></script>


<!--common script for all pages-->
<script src="/resources/js/common-scripts.js"></script>
<script src="/resources/js/unitype-common.js"></script>

<script type="text/javascript" src="/resources/js/gritter/js/jquery.gritter.js"></script>
<script type="text/javascript" src="/resources/js/gritter-conf.js"></script>
</body>
</html>