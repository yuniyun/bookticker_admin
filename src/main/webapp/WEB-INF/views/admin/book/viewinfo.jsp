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
    
    <link href="/resources/js/fancybox/jquery.fancybox.css" rel="stylesheet" />
</head>
<body style="overflow-x:hidden; overflow-y:hidden;">
 <iframe name='zeroFrame' style="width:0px; height:0px;border:0px;" ></iframe>
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
                      <c:choose>
		                <c:when test="${book.convertstate eq '변환됨'}">
			                <img src="/view?fileName=${book.title}&fileType=IMAGE&series=${book.series}&bookversion=${book.bookversion}&pageNo=thumbnail" style='width:130px; height:200px;'>
			            </c:when>
			            <c:when test="${book.convertstate eq '변환대기'}">
			                <img src="/resources/img/ready.png" style="width:130px; height:200px;">
			            </c:when>
			            <c:when test="${book.convertstate eq '변환안됨'}">
			                <img src="/resources/img/forbid.png" style="width:130px; height:200px;">
			            </c:when>
			            <c:when test="${book.convertstate eq '변환오류'}">
			            	나와랐!!!!!!!!!!
			            </c:when>
		              </c:choose>
                    </div>
                    <div class="row" style="border: 1px; text-align: center">
                      <form id="postF" action="download" method="post" target="zeroFrame">
                         <input type="hidden" name="fileName" value="탐">
                         <input type="hidden" name="series" value="탐 시리즈">
                         <input type="hidden" name="bookversion" value="1.0">
                         <input type="hidden" name="" value="">
                         <button type="submit" class="btn btn-default" style="width:80%; font-size: 12px;">PDF다운로드</button>
                      </form>						
                    </div>
                </div>
                <div class="col-xs-7" style="padding: 5px">
                    <div class="row">
                        <span style="font-size: 35px;font-weight: bold"><br></span>
                    </div>
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
                            <td>${book.bookcategory}</td>
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
                            <td>${book.applydate}</td>
                        </tr>
                        <tr>
                            <td style="font-size: 13px; font-weight: bold">소개글</td>
                            <td><textarea style="width:100%; resize: none" rows="6" readonly>${book.overview}</textarea></td>
                        </tr>
                    </table>
                    <form id="criteriaForm" method="post" action="/admin/book/delete">
                    <input type="hidden" name="bookno" value="${book.bookno}">
                    <div class="row" align="center">
                        <a id="modifyContent" class="btn btn-default" href="modify?bookno=${book.bookno}" style="font-size: 12px;"
                        data-title="Book Modify" data-toggle="lightbox">수정</a>
                        
                        <button class="btn btn-default" id="deleteContent" style="font-size: 12px;" >삭제</button>
                        <button class="btn btn-default" data-dismiss="modal" id="cancel" style="font-size: 12px;">취소</button>
                    </div>
                    </form>
                    
                </div>
            </div><!-- /col-md-12 -->
    </div>
   
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

<script type="text/javascript">


	$('#deleteContent').on('click', function(){
		if(confirm('컨텐츠를 삭제 하시겠습니까?')==true){
			$('#criteriaForm').submit();
		};
	});
	
	$('#modifyContent').on('click', function(event) { //*[data-toggle="lightbox"]:not([data-gallery="navigateTo"])
		event.preventDefault();
		$(this).attr('data-dismiss',"modal");
        return $(this).ekkoLightbox();
    });
	
</script>
</body>
</html>
