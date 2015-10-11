<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>Permit List</title>
    <!-- Bootstrap core CSS -->
    <link href="/resources/css/bootstrap.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="/resources/css/style.css" rel="stylesheet">   
    <link href="/resources/css/style-responsive.css" rel="stylesheet">
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
                 <th>승인내역</th>
                 <th>사유</th>
                 <th>승인일</th>
             </tr>
                
             <c:forEach items="${perList}" var="per">
	             <tr align="center">
	                 <td>${per.permitstate}</td>
	                 <td>${per.reason}</td>
	                 <td>${per.permitdate}</td>
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
</body>
</html>