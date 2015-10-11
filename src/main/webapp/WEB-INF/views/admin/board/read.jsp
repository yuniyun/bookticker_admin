<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Dashboard">
<meta name="keyword"
	content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

<title>Board Read</title>

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
<style>
.replyBar:HOVER {
	color: #333;
	background-color: #e6e6e6;
	border-color: #adadad;
}
::-webkit-scrollbar {width: 5px; height: 8px; border: 3px solid #fff; }
::-webkit-scrollbar-button:start:decrement, ::-webkit-scrollbar-button:end:increment {display: block; height: 10px; background: url('./images/bg.png') #efefef}
::-webkit-scrollbar-track {background: #efefef; -webkit-border-radius: 10px; border-radius:10px; -webkit-box-shadow: inset 0 0 4px rgba(0,0,0,.2)}
::-webkit-scrollbar-thumb {height: 50px; width: 50px; background: rgba(0,0,0,.2); -webkit-border-radius: 8px; border-radius: 8px; -webkit-box-shadow: inset 0 0 4px rgba(0,0,0,.1)}
</style>
<body>
	<div>
		<div style="margin-left: 5%; margin-right: 5%;">
			<div class="form-group">
				<h3 class="control-label">&nbsp;Read</h3>
			</div>
			<div>
				<table class="table" style="color: tomato;">
					<tr>
						<td align="center" width="10%" style="font-weight: bold;">Bno</td>
						<td style="padding: 0px"><input class="form-control"
							name='bno' type="text" value="${boardRead.boardNo}" disabled
							style="cursor: context-menu; background-color: #FFFFFF">
						</td>
					</tr>
					<tr>
						<td align="center" width="10%" style="font-weight: bold">Title</td>
						<td style="padding: 0px"><input class="form-control"
							name='bno' type="text" value="${boardRead.title}" disabled
							style="cursor: context-menu; background-color: #FFFFFF">
						</td>
					</tr>
					<tr>
						<td align="center" width="10%" style="font-weight: bold">Writer</td>
						<td style="padding: 0px"><input class="form-control"
							name='bno' type="text"
							value="${boardRead.username}(${boardRead.userid})" disabled
							style="cursor: context-menu; background-color: #FFFFFF">
						</td>
					</tr>
					<tr>
						<td align="center" style="font-weight: bold" colspan="4">Content</td>
					</tr>
					<tr>
						<td style="padding: 0px" colspan="4"><textarea
								class="form-control" name="content" rows="10" disabled
								style="cursor: context-menu; background-color: #FFFFFF; resize: none">${boardRead.boardContent}
                        </textarea></td>
					</tr>
				</table>

				<div>
					<div class="form-control replyBar" id="rep-bttn"
						style="text-align: center; cursor: pointer;" onclick="javascript:repshow()">
						<span style="color: tomato; font-weight: bold">reply(${boardRead.replycnt})</span>
					</div>
				</div>
				<div id="reply" class="hide">
					
				</div>

				<div align="right" style="margin-top: 20px">
					<button class="btn btn-default"
						onclick="if(confirm('게시글을 삭제 하시겠습니까?')){window.close();}">삭제</button>
					<button class="btn btn-default" data-dismiss="modal">확인</button>
				</div>
			</div>
		</div>

	</div>

	<input>
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
	<script>
	$('#rep-bttn').on('click',
		function rep() {
	        $('#reply').toggleClass('hide');
	});
	
	function repshow(){
	var reply="";
	for(int i = 0; i < 리플토탈카운트 ; i++){
	reply += '<table style="font-size: 12px">';
	reply += '<tr>';
	reply += '<td style="height: 10px; background-color: white;" colspan="2"></td>';
	reply += '</tr>';
	reply += '<tr>';
	reply += '<td style="height: 1px; background-color: #e6e6e6;" colspan="2"></td>';
	reply += '</tr>';
	reply += '<tr>';
	reply += '<td style="height: 10px; background-color: white;" colspan="2"></td>';
	reply += '</tr>';
	reply += '<tr>';
	reply += '<td align="center" width="10%" style="font-weight: bold;">Writer</td>';
	reply += '<td style="padding: 0px;"><input class="form-control" name="reply-writer" type="text" value="글쓴이" disabled style="font-size: 8px; cursor: context-menu; background-color: #FFFFFF"></td>';
	reply += '</tr>';
	reply += '<tr>';
	reply += '<td align="center" width="10%" style="font-weight: bold;">Regdate</td>';
	reply += '<td style="padding: 0px;"><input class="form-control" name="reply-writer" type="text" value="날짜" disabled style="font-size: 8px; cursor: context-menu; background-color: #FFFFFF"></td>';
	reply += '</tr>';
	reply += '<tr>';
	reply += '<td align="center" width="10%" style="font-weight: bold;">Contents</td>';
	reply += '<td style="padding: 0px;"><textarea class="form-control" name="content" rows="4" disabled style="font-size: 8px; cursor: context-menu; background-color: #FFFFFF; resize: none">내용입니다....</textarea>';
	reply += '<span class="glyphicon glyphicon-thumbs-up" id="like-it"';
	reply += ' style="color: #666666;"></span> <label for="like-it">2</label>';
	reply += ' &nbsp;|&nbsp; <span class="glyphicon glyphicon-exclamation-sign"';
	reply += ' id="report-mark" style="color: #666666;"></span> <label';
	reply += ' for="report-mark">1</label> &nbsp;|&nbsp; <span';
	reply += ' class="glyphicon glyphicon-trash" id="trash-can"';
	reply += ' style="color: #666666;"></span></td>';
	reply += '</tr>';
	reply += '</table>';
		
	}
	
	$('#reply').html(reply);
	}
	
	
	</script>
</body>
</html>
