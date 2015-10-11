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
	
	<title>BOOKTICKER Admin: Board</title>
	
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
.boardtitle {
	color: #60ccdc
}

.boardtitle:hover {
	color: #50acb9;
	text-decoration: underline;
	cursor: pointer;
}

.reportMove {
	color: red;
	font-size: 14px;
}

.reportMove:hover {
	color: red;
	text-decoration: underline;
	cursor: pointer;
	font-size: 15px;
}
</style>
<body>

	<input id="pPN" type="hidden" value="${pageMaker.cri.perPageNum}" />

	<section id="container"> <!-- **********************************************************************************************************************************************************
      TOP BAR CONTENT & NOTIFICATIONS
      *********************************************************************************************************************************************************** -->
	<!--header start--> <header class="header black-bg">
	<div class="sidebar-toggle-box">
		<div class="fa fa-bars tooltips" data-placement="right"
			data-original-title="Toggle Navigation"></div>
	</div>
	<!--logo start--> <a class="logo" href="/admin/home"><b>BOOKTICKER Admin</b></a> <!--logo end-->
	<div class="top-menu">
		<ul class="nav pull-right top-menu">
			<li><a class="logout">Logout</a></li>
		</ul>
	</div>
	</header> <!--header end--> <!-- **********************************************************************************************************************************************************
      MAIN SIDEBAR MENU
      *********************************************************************************************************************************************************** -->
	<!--sidebar start--> <aside>
	<div id="sidebar" class="nav-collapse ">
		<!-- sidebar menu start-->
		<ul class="sidebar-menu" id="nav-accordion">

			<li class="mt"><a href="/admin/home"> <i class="fa fa-home"></i>
					<span>Home</span>
			</a></li>

			<li class="sub-menu"><a href="/admin/user/list"> <i
					class="fa fa-user"></i> <span>Member</span>
			</a></li>

			<li class="sub-menu"><a href="/admin/book/list"> <i
					class="fa fa-book"></i> <span>Book</span>
			</a></li>
			<li class="sub-menu"><a class="active" href="list"> <i
					class="fa fa-pencil"></i> <span>Board</span>
			</a></li>
			<li class="sub-menu"><a href="/admin/statistics"> <i
					class="fa fa-bar-chart-o"></i> <span>Statistics</span>
			</a></li>
			<li class="sub-menu"><a href="/admin/message/list"> <i
					class="fa fa-bullhorn"></i> <span>Message</span>
			</a></li>
		</ul>
		<!-- sidebar menu end-->
	</div>
	</aside> <!--sidebar end--> <!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
	<!--main content start-->
	<form id="postForm" method="post" action="">
	</form>
	<section id="main-content">
	<section class="wrapper">
	<div class="row">
		<div class="main-chart">
			<!-- col-lg-9  -->
			<div style="text-align: center">
				<!--input-group custom-search-form -->
				<div class="row">
					<span style="font-size: 25px; font-weight: bold"><br></span>
				</div>
				<form class="form-inline">
					<div class="form-group">
						<input type="hidden" name="page" value="${pageMaker.cri.page}" />
						<input type="hidden" name="perPageNum"
							value="${pageMaker.cri.perPageNum}" /> 
						<input type="hidden" name="boardType" value="${pageMaker.cri.boardType}" />
							<select name="searchType"
							class="form-control">
							<option value="전체"
								<c:if test="${pageMaker.cri.searchType eq '전체'}">selected</c:if>>전체</option>
							<option value="제목"
								<c:if test="${pageMaker.cri.searchType eq '제목'}">selected</c:if>>제목</option>
							<option value="이름"
								<c:if test="${pageMaker.cri.searchType eq '이름'}">selected</c:if>>이름</option>
							<option value="아이디"
								<c:if test="${pageMaker.cri.searchType eq '아이디'}">selected</c:if>>아이디</option>
							<option value="내용"
								<c:if test="${pageMaker.cri.searchType eq '내용'}">selected</c:if>>내용</option>
						</select>
					</div>
					<div class="input-group input-group-in">
						<input name="keyword" type="text" class="form-control"
							style="width: 500px" autofocus
							placeholder="<c:if test="${pageMaker.cri.keyword eq ''}">제목/이름/아이디/내용</c:if>"
							value="<c:if test="${pageMaker.cri.keyword ne ''}">${pageMaker.cri.keyword}</c:if>">
						<input type="hidden" name="sortkey"
							value="${pageMaker.cri.sortkey}" /> <input type="hidden"
							name="sortType" value="${pageMaker.cri.sortType}" /> <span
							class="input-group-btn">
							<button class="btn btn-default" id="search-bttn" type="submit">
								<i class="fa fa-search"></i>
							</button>
						</span>
					</div>
					<!-- /input-group-in -->
				</form>
			</div>
			<!-- /input-group -->

			<div class="col-md-12 mt">
				<br>
				<br>
				<div style="float: left">
					<h4>
						<i class="fa fa-angle-right"></i> Board List
						(${pageMaker.totalCnt})
					</h4>
				</div>
				<div style="float: right">

					<select id="data" onchange="javascript:PerPn(this)">
						<option value=10
							<c:if test="${pageMaker.cri.perPageNum eq '10'}">selected</c:if>>10개</option>
						<option value=30
							<c:if test="${pageMaker.cri.perPageNum eq '30'}">selected</c:if>>30개</option>
						<option value=100
							<c:if test="${pageMaker.cri.perPageNum eq '100'}">selected</c:if>>100개</option>
					</select>

				</div>
				<div style="float: right">
						<select id="sortDirection" onchange="javascript:sortSelect(this)">
							<option value="desc"
								<c:if test="${pageMaker.cri.sortType eq 'desc'}">selected</c:if>>내림차순</option>
							<option value="asc"
								<c:if test="${pageMaker.cri.sortType eq 'asc'}">selected</c:if>>오름차순</option>
						</select>
				</div>
				<div style="float: right">
					<select id="sortStandard" onchange="javascript:sortkeySelect(this)">
						<option value="t1.boardno"
							<c:if test="${pageMaker.cri.sortkey eq 't1.boardno'}">selected</c:if>>작성일순</option>
						<option value="t1.viewcnt"
							<c:if test="${pageMaker.cri.sortkey eq 't1.viewcnt'}">selected</c:if>>조회수순</option>
						<option value="t1.recomcnt"
							<c:if test="${pageMaker.cri.sortkey eq 't1.recomcnt'}">selected</c:if>>추천순</option>
						<option value="t1.reportcnt"
							<c:if test="${pageMaker.cri.sortkey eq 't1.reportcnt'}">selected</c:if>>신고순</option>
					</select>
				</div>
			</div>
			<!--   <div class="col-md-12" style="text-align: right">
                            <button class="btn btn-default" type="button">일괄등록</button>
                            <button class="btn btn-default" type="button">일괄업데이트</button>
                        </div>-->

			<div class="col-md-12">
				<div>
					<table class="table table-hover">
						<hr>
						<thead>
							<tr>
								<th width="4%">#</th>
								<th width="35%">제목</th>
								<th width="17%">작성자</th>
								<th style="text-align: center" width="10%">
								<select id="genderType" style="border: hidden" onchange="javascript:boardSelect(this)">
										<option value="전체"
											<c:if test="${pageMaker.cri.boardType eq '전체'}">selected</c:if>>게시판종류</option>
										<option value="일반"
											<c:if test="${pageMaker.cri.boardType eq '일반'}">selected</c:if>>일반</option>
										<option value="작가"
											<c:if test="${pageMaker.cri.boardType eq '작가'}">selected</c:if>>작가</option>
								</select></th>
								<th style="text-align: center" width="8%">작성일</th>
								<th style="text-align: center" width="6%">댓글</th>
								<th style="text-align: center" width="6%">조회</th>
								<th style="text-align: center" width="6%">추천</th>
								<th style="text-align: center" width="6%">신고</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${boardList}" var="bl"
								begin="${pageMaker.cri.getStartBno()}"
								end="${pageMaker.cri.getEndBno()}">
								<tr>
									<td>${bl.boardNo}</td>
									<td>
									  <a class="boardtitle" id="${bl.boardNo}" href="" data-title="Board Info" data-toggle="lightbox">
									    ${bl.title}
									  </a></td>
									<td>${bl.username}(${bl.userid})</td>
									<td align="center">${bl.grade}</td>
									<td align="center">${bl.regdate}</td>
									<td align="center">${bl.replycnt}</td>
									<td align="center">${bl.viewcnt}</td>
									<td align="center">${bl.recomcnt}</td>
									<td align="center">
									  <a class="boardreport" id="${bl.boardNo}" href="" data-title="Board Report" data-toggle="lightbox">
									    ${bl.reportcnt}
									  </a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<!--content-panel -->
			</div>
			<!-- /col-md-12 -->
			<!-- BUTTONS NESTING -->
			<div class="text-center" style="font-size: 15px">

				<c:if test="${pageMaker.firstPage}">
					<a
						href="list?page=1&perPageNum=${pageMaker.cri.perPageNum}"
						style="color: #da4453">&laquo;</a>&nbsp;
						</c:if>
				<c:if test="${pageMaker.prev}">
					<a
						href="list?page=${pageMaker.startPage-1}&perPageNum=${pageMaker.cri.perPageNum}"
						style="color: #ce8483">&lt;</a>
					&emsp;
				</c:if>

				<c:forEach var="i" begin="${pageMaker.startPage}"
					end="${pageMaker.endPage}">
					<a
						href="list?page=${i}&perPageNum=${pageMaker.cri.perPageNum}"
						style="color: #979797">${i}</a>
					&emsp;
				</c:forEach>

				<c:if test="${pageMaker.next}">
					<a
						href="list?page=${pageMaker.endPage+1}&perPageNum=${pageMaker.cri.perPageNum}"
						style="color: #ce8483">&gt;</a>&nbsp;
						</c:if>
				<c:if test="${pageMaker.lastPage}">
					<a
						href="list?page=${pageMaker.last}&perPageNum=${pageMaker.cri.perPageNum}"
						style="color: #da4453">&raquo;</a>
				</c:if>

			</div>
		</div>
		<!-- /col-lg-3 -->
	</div>
	<!--/row --> <!--main content end--> <!--footer start--> 
	<footer	class="site-footer">
	<div class="text-center" style="color: #f7c8c8">
		<br>
		<br>
		<br> 2015 - 함박웃음
	</div>
	</footer> <!--footer end--> </section> </section> </section>
	
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

			<input type="hidden" id="hpage" value="${pageMaker.cri.page}"/>
			<input type="hidden" id="hperPageNum" value="${pageMaker.cri.perPageNum}"/>
			<input type="hidden" id="hboardType" value="${pageMaker.cri.boardType}"/>
			<input type="hidden" id="hsearchType" value="${pageMaker.cri.searchType}"/>
			<input type="hidden" id="hkeyword" value="${pageMaker.cri.keyword}"/>
			<input type="hidden" id="hsortType" value="${pageMaker.cri.sortType}"/>
			<input type="hidden" id="hsortkey" value="${pageMaker.cri.sortkey}"/>
	<script>
		$('.boardtitle').on('click', function(event){
			event.preventDefault();
	        var bno = $(this).attr('id');
	    	$(this).attr('href', 'read?boardNo='+bno);
	        return $(this).ekkoLightbox();
		});
		$('.boardreport').on('click', function(event){
			event.preventDefault();
	        var bno = $(this).attr('id');
	    	$(this).attr('href', 'boardReportList?boardNo='+bno);
	        return $(this).ekkoLightbox();
		});
		
		function PerPn(ppn) {
			var link = "list?page=1"
				+ "&perPageNum="
				+ ppn.value
				+ "&boardType="
				+ $('#hboardType').attr('value')
				+ "&searchType="
				+ $('#hsearchType').attr('value')
				+ "&keyword="
				+ $('#hkeyword').attr('value')
				+ "&sortType="
				+ $('#hsortType').attr('value')
				+ "&sortkey="
				+ $('#hsortkey').attr('value');
			location.href = link;
		};
		
		function sortSelect(sort){
			var link = "list?page=1"
					+ "&perPageNum="
					+ $('#hperPageNum').attr('value')
					+ "&boardType="
					+ $('#hboardType').attr('value')
					+ "&searchType="
					+ $('#hsearchType').attr('value')
					+ "&keyword="
					+ $('#hkeyword').attr('value')
					+ "&sortType="
					+ sort.value
					+ "&sortkey="
					+ $('#hsortkey').attr('value');
			location.href = link;
		};
		
		function sortkeySelect(key){
			var link = "list?page=1"
				+ "&perPageNum="
				+ $('#hperPageNum').attr('value')
				+ "&boardType="
				+ $('#hboardType').attr('value')
				+ "&searchType="
				+ $('#hsearchType').attr('value')
				+ "&keyword="
				+ $('#hkeyword').attr('value')
				+ "&sortType="
				+ $('#hsortType').attr('value')
				+ "&sortkey="
				+ key.value;
			location.href = link;
		}

		function boardSelect(type){
			var link = "list?page=1"
				+ "&perPageNum="
				+ $('#hperPageNum').attr('value')
				+ "&boardType="
				+ type.value
				+ "&searchType="
				+ $('#hsearchType').attr('value')
				+ "&keyword="
				+ $('#hkeyword').attr('value')
				+ "&sortType="
				+ $('#hsortType').attr('value')
				+ "&sortkey="
				+ $('#hsortkey').attr('value');
			location.href = link;
		}

		function newWindow(openName, topvalue, leftvalue, widthvalue,
				heightvalue) {
			window.open(openName, '', 'top=' + topvalue + ', left=' + leftvalue
					+ ', width=' + widthvalue + ', height=' + heightvalue + '');
			return false;
		}
		
		function myNavFunction(id) {
			$("#date-popover").hide();
			var nav = $("#" + id).data("navigation");
			var to = $("#" + id).data("to");
			console.log('nav ' + nav + ' to: ' + to.month + '/' + to.year);
		}
		
	</script>


</body>
</html>