<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>Content Manage</title>
    <!-- Bootstrap core CSS -->
    <link href="/resources/css/bootstrap.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="/resources/css/style.css" rel="stylesheet">
    <link href="/resources/css/style-responsive.css" rel="stylesheet">
    
</head>
<body style="overflow-x:hidden; overflow-y:hidden;">
    <div class="row">
            <div class="col-xs-12">
                <!--<h4><i class="fa fa-angle-right"></i> Basic Table</h4>-->
                <div class="col-xs-1"></div>
                <div class="col-xs-3" >
                    <div class="row">
                    </div>
                    <div class="row">
                        <span style="font-size: 25px;font-weight: bold"><br></span>
                    </div>
                    <div class="row" align="center" style="margin-top: 10%">
                        <img src='/view?fileName=${book.title}&fileType=IMAGE&series=${book.series}&bookversion=${book.bookversion}&pageNo=1'
		             		style='width:130px; height:200px;'>
                    </div>
                    <div class="row" style="border: 1px; text-align: center">
                        <button class="btn btn-default" style="width:80%; font-size: 12px;"
                                onClick="window.open('book_read.html', '', 'top=150, left=400, width=500, height=500'); return false;">내용보기</button>
                    </div>
                </div>
                <div class="col-xs-7" style="padding: 5px">
                    <div class="row">
                        <span style="font-size: 35px;font-weight: bold"><br></span>
                    </div>
                    <form id="modiForm" method="post" action="modify">
            			<input type="hidden" name="bookno" value="${book.bookno}">
            	
	                    <table class="table">
	                        <tr>
	                            <td style="font-size: 13px; font-weight: bold; width: 24%">책이름</td>
	                            <td>${book.title}</td>
	                        </tr>
	                        <tr>
	                            <td style="font-size: 13px; font-weight: bold">저자</td>
	                            <td>${book.username}</td>
	                        </tr>
	                        <tr>
	                            <td style="font-size: 13px; font-weight: bold">카테고리</td>
	                            <td>
	                            	<select name="bookcategory">
										<option value="소설/시"
										  <c:if test="${book.bookcategory eq '소설/시'}">selected</c:if>>소설/시</option>
										<option value="무협"
										  <c:if test="${book.bookcategory eq '무협'}">selected</c:if>>무협</option>
										<option value="로맨스"
										  <c:if test="${book.bookcategory eq '로맨스'}">selected</c:if>>로맨스</option>
										<option value="판타지"
										  <c:if test="${book.bookcategory eq '판타지'}">selected</c:if>>판타지</option>
										<option value="SF"
										  <c:if test="${book.bookcategory eq 'SF'}">selected</c:if>>SF</option>
										<option value="에세이"
										  <c:if test="${book.bookcategory eq '에세이'}">selected</c:if>>에세이</option>
										<option value="자기계발"
										  <c:if test="${book.bookcategory eq '자기계발'}">selected</c:if>>자기계발</option>
										<option value="경제경영"
										  <c:if test="${book.bookcategory eq '경제경영'}">selected</c:if>>경제경영</option>
										<option value="사회과학"
										  <c:if test="${book.bookcategory eq '사회과학'}">selected</c:if>>사회과학</option>
										<option value="인문학"
										  <c:if test="${book.bookcategory eq '인문학'}">selected</c:if>>인문학</option>
										<option value="역사"
										  <c:if test="${book.bookcategory eq '역사'}">selected</c:if>>역사</option>
										<option value="청소년"
										  <c:if test="${book.bookcategory eq '청소년'}">selected</c:if>>청소년</option>
										<option value="예술/대중문화"
										  <c:if test="${book.bookcategory eq '예술/대중문화'}">selected</c:if>>예술/대중문화</option>
										<option value="종교/역학"
										  <c:if test="${book.bookcategory eq '종교/역학'}">selected</c:if>>종교/역학</option>
										<option value="만화"
										  <c:if test="${book.bookcategory eq '만화'}">selected</c:if>>만화</option>
										<option value="어린이"
										  <c:if test="${book.bookcategory eq '어린이'}">selected</c:if>>어린이</option>
									</select>
	                            </td>
	                        </tr>
	                        <tr>
	                            <td style="font-size: 13px; font-weight: bold">관리</td>
	                            <td>
	                                <c:if test="${book.grade eq '작가'}">유료</c:if>
                              		<c:if test="${book.grade eq '일반'}">무료</c:if>
	                            </td>
	                        </tr>
	                        <tr>
	                            <td style="font-size: 13px; font-weight: bold">등록일</td>
	                            <td>2015.06.27</td>
	                        </tr>
	                        <tr>
	                            <td style="font-size: 13px; font-weight: bold">소개글</td>
	                            <td><textarea name="overview" style="width:100%; resize: none" rows="6">${book.overview}</textarea></td>
	                        </tr>
	                    </table>
		            </form>
                    <div class="row" align="center">
                        <button class="btn btn-default" id="modifyBook" style="font-size: 12px;">등록</button>
                        <button class="btn btn-default" id="cancel" style="font-size: 12px;" data-dismiss="modal">취소</button>
                    </div>
                </div>
            </div><!-- /col-md-12 -->
    </div>
       <!-- js placed at the end of the document so the pages load faster -->
<script src="/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery.dcjqaccordion.2.7.js"></script>
<script src="/resources/js/jquery.scrollTo.min.js"></script>
<script src="/resources/js/jquery.nicescroll.js" type="text/javascript"></script>
<script src="/resources/js/jquery.sparkline.js"></script>
<script src="/resources/lightbox-master/dist/ekko-lightbox.js"></script>


<!--common script for all pages-->
<script src="/resources/js/common-scripts.js"></script>

<script type="text/javascript">
	$('#modifyBook').on('click', function(){
		if(confirm('컨텐츠를 수정 하시겠습니까?')){
			$('#modiForm').submit();
		}
	});
</script>
</body>
</html>
