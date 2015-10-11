<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
    <!-- 부트스트랩 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <!-- ---------- -->
    <script src="//code.jquery.com/jquery-1.11.3.min.js"></script> <!-- JQuery -->
    <link rel="stylesheet" href="../../css/admin.css">
</head>
<body>
	
	<ul>
		<li>
		넘버 : <span>${reportRead.reportNo}</span>
		</li>
		<li>
		이유 : <span>${reportRead.reason}</span>
		</li>
		<li>
		신고자 : <span>${reportRead.username}(${reportRead.userid})</span>
		</li>
		<li>
		게시글넘버 : <span>${reportRead.boardNo}</span>
		</li>
	</ul>
	
</body>
</html>