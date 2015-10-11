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
	<meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

	<title>BOOKTICKER Admin: Book</title>

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
	.regBook{
		color: #29e13e;
	}
	.regBook:hover{
		color: #1a9443;
		cursor: pointer;
	}
	.notRegBook{
		color: #34b6e4;
	}
	.notRegBook:hover{
		color: #34b6e4;
	}
	.errconvertBook{	
		color: #ffa200;
	}
	.errconvertBook:hover{
		color: #ff7900;
		cursor: pointer;
	}
	.contentTitle{
		color: #60ccdc
	}
	.contentTitle:hover{
		color: #50acb9;
		text-decoration: underline;
		cursor: pointer;
	}
	.reportView:hover{
		text-decoration: underline;
		cursor: pointer;
	}
	.paging:hover{
		color: #50acb9;
		text-decoration: underline;
		cursor: pointer;
	}
	.logocolor{
		color: #b5b5b6;
	}
</style>
<body>

<section id="container" >
	<!-- **********************************************************************************************************************************************************
      TOP BAR CONTENT & NOTIFICATIONS
      *********************************************************************************************************************************************************** -->
	<!--header start-->
	<header class="header black-bg">
		<div class="sidebar-toggle-box">
			<div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
		</div>
		<!--logo start-->
		<a class="logo" href="/admin/home"><b>BOOKTICKER Admin</b></a>

		<!--logo end-->

			<ul class="nav pull-right top-menu">
				<li><a class="logout">Logout</a></li>
			</ul>

	</header>
	<!--header end-->

	<!-- **********************************************************************************************************************************************************
      MAIN SIDEBAR MENU
      *********************************************************************************************************************************************************** -->
	<!--sidebar start-->
	<aside>
		<div id="sidebar"  class="nav-collapse ">
			<!-- sidebar menu start-->
			<ul class="sidebar-menu" id="nav-accordion">

				<li class="mt">
					<a href="/admin/home">
						<i class="fa fa-home"></i>
						<span>Home</span>
					</a>
				</li>

				<li class="sub-menu">
					<a href="/admin/user/list" >
						<i class="fa fa-user"></i>
						<span>Member</span>
					</a>
				</li>

				<li class="sub-menu">
					<a class="active" href="list" >
						<i class="fa fa-book"></i>
						<span>Book</span>
					</a>
				</li>
				<li class="sub-menu">
					<a href="/admin/board/list" >
						<i class="fa fa-pencil"></i>
						<span>Board</span>
					</a>
				</li>
				<li class="sub-menu">
					<a href="/admin/statistics" >
						<i class="fa fa-bar-chart-o"></i>
						<span>Statistics</span>
					</a>
				</li>
				<li class="sub-menu">
					<a href="/admin/message/list" >
						<i class="fa fa-bullhorn"></i>
						<span>Message</span>
					</a>
				</li>
			</ul>
			<!-- sidebar menu end-->
		</div>
	</aside>
	<!--sidebar end-->

	<!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
	<!--main content start-->
	<form id="bookForm" method="get">
	   <input type="hidden" name="bookno">
	</form>
	<form id="postForm" method="post" action="convertall">
	</form>
	<form id="criteriaForm" method="get">
	   <input type="hidden" name="page" value="${pageMaker.cri.page}">
	   <input type="hidden" name="perPageNum" value="${pageMaker.cri.perPageNum}">
	   <input type="hidden" name="searchType" value="${pageMaker.cri.searchType}">
	   <input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
	   <input type="hidden" name="chargeType" value="${pageMaker.cri.chargeType}">
	   <input type="hidden" name="categoryType" value="${pageMaker.cri.categoryType}">
	   <input type="hidden" name="isReportZero" value="${pageMaker.cri.isReportZero}">
	   <input type="hidden" name="convertType" value="${pageMaker.cri.convertType}">
	   <input type="hidden" name="sortType" value="${pageMaker.cri.sortType}">
	   <input type="hidden" name="sortDirection" value="${pageMaker.cri.sortDirection}">
	</form>
	<section id="main-content">
		<section class="wrapper">

			<div id="popmenu" style="position:absolute; z-index: 100; display: none;">
				<table style="background: #adadad; color: #FFFFFF; width:100px; border-color: #ffffff" border="1px">
					<tr>
						<td style="padding: 5px; border-right: 0px">
							<a id="bookInfo" href="" data-title="Book Info" data-toggle="lightbox" 
								style="color: #FFFFFF">책정보보기</a>
						</td>
						<td class="clickmenutitleR" align="right" style="border-left: 0px;">
							<span id="menuX" style="cursor: pointer; padding: 5px;">x</span>
						</td>
					</tr>
					<tr>
						<td style="padding: 5px" colspan="2">
							<a id="regCode" href="" data-title="Code Register" data-toggle="lightbox" 
								style="color: #FFFFFF">QR코드등록</a>
						</td>
					</tr>
					<tr>
						<td style="padding: 5px" colspan="2">
							<a id="permitList" href="" data-title="Permit List" data-toggle="lightbox" 
								style="color: #FFFFFF">승인내역</a>
						</td>
					</tr>
				</table>
			</div>


			<div class="row">
				<div class="main-chart"><!-- col-lg-9  -->
					<div style="text-align: center"> <!--input-group custom-search-form -->
						<div class="row">
							<span style="font-size: 25px;font-weight: bold"><br></span>
						</div>
						<form class="form-inline" id="searchForm">
							<input type="hidden" name="perPageNum" value="${pageMaker.cri.perPageNum}">
							<div class="form-group">
								<select class="form-control" name="searchType">
									<option value="전체"
									  <c:if test="${pageMaker.cri.searchType eq '전체'}">selected</c:if>>전체</option>
									<option value="제목"
									  <c:if test="${pageMaker.cri.searchType eq '제목'}">selected</c:if>>제목</option>
									<option value="작가"
									  <c:if test="${pageMaker.cri.searchType eq '작가'}">selected</c:if>>작가</option>
								</select>
							</div>
							<div class="input-group input-group-in">
								<input type="text" class="form-control" name="keyword" style="width: 500px;" autofocus 
								placeholder="<c:if test="${pageMaker.cri.keyword eq null}">전체/제목/작가</c:if>"
                     			value="<c:if test="${pageMaker.cri.keyword ne ''}">${pageMaker.cri.keyword}</c:if>">
								<span class="input-group-btn">
									<button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
								</span>
							</div><!-- /input-group-in -->
						</form>
					</div>
					<!-- /input-group -->

					<div class="col-md-12 mt">
						<br><br>
						<div style="float: left"><h4><i class="fa fa-angle-right"></i> Content List (${totalCnt}) </h4></div>
						<div style="float: right">
							<select name="perPageNum" onchange="javascript:criSettingSubmit(this)">
								<option value=10 <c:if test="${pageMaker.cri.perPageNum eq '10'}">selected</c:if>>10개</option>
								<option value=30 <c:if test="${pageMaker.cri.perPageNum eq '30'}">selected</c:if>>30개</option>
								<option value=100 <c:if test="${pageMaker.cri.perPageNum eq '100'}">selected</c:if>>100개</option>
							</select>
						</div>
						<div style="float: right">
							<select name="sortDirection" onchange="javascript:criSettingSubmit(this)">
								<option value="desc"
								  <c:if test="${pageMaker.cri.sortDirection eq ('' or 'desc')}">selected</c:if>>내림차순</option>
								<option value="asc"
								  <c:if test="${pageMaker.cri.sortDirection eq 'asc'}">selected</c:if>>오름차순</option>
							</select>
						</div>
						<div style="float: right">
							<select name="sortType" onchange="javascript:criSettingSubmit(this)">
								<option value="등록일"
								  <c:if test="${pageMaker.cri.sortType eq ''}">selected</c:if>>등록일순</option>
								<option value="판매량"
								  <c:if test="${pageMaker.cri.sortType eq '판매량'}">selected</c:if>>판매량순</option>
								<option value="평점"
								  <c:if test="${pageMaker.cri.sortType eq '평점'}">selected</c:if> >평점순</option>
							</select>
						</div>
						<div style="float: right">
							<input type="radio" name="convertType" onclick="javascript:criSettingSubmit(this)" value="">전체&nbsp;
							<input type="radio" name="convertType" onclick="javascript:criSettingSubmit(this)" value="변환됨">변환됨&nbsp;
							<input type="radio" name="convertType" onclick="javascript:criSettingSubmit(this)" value="변환안됨">변환안됨&nbsp;
							<input type="radio" name="convertType" onclick="javascript:criSettingSubmit(this)" value="변환오류">변환오류&nbsp;
							<input type="radio" name="convertType" onclick="javascript:criSettingSubmit(this)" value="변환대기">변환대기
							&emsp;
						</div>
					</div>

					<div class="col-md-12">
						<div class="">
							<hr>
							<table class="table table-hover">
								<thead>
								<tr>
									<th width="4%">#</th>
									<th width="30%">책이름</th>
									<th width="15%">저자</th>
									<th style="text-align: center" width="7%">판매량</th>
									<th style="text-align: center" width="8%">등록일</th>
									<th style="text-align: center" width="5%">평점</th>
									<th style="text-align: center" width="5%">
										<select name="chargeType" style="border: hidden" onchange="javascript:criSettingSubmit(this)">
											<option value="">관리</option>
											<option value="작가"
											  <c:if test="${pageMaker.cri.chargeType eq '작가'}">selected</c:if>>유료</option>
											<option value="일반"
											  <c:if test="${pageMaker.cri.chargeType eq '일반'}">selected</c:if>>무료</option>
										</select>
									</th>
									<th style="text-align: center" width="8%">
										<select name="categoryType" style="border: hidden" onchange="javascript:criSettingSubmit(this)">
											<option value="">카테고리</option>
											<option value="소설/시"
											  <c:if test="${pageMaker.cri.categoryType eq '소설/시'}">selected</c:if>>소설/시</option>
											<option value="무협"
											  <c:if test="${pageMaker.cri.categoryType eq '무협'}">selected</c:if>>무협</option>
											<option value="로맨스"
											  <c:if test="${pageMaker.cri.categoryType eq '로맨스'}">selected</c:if>>로맨스</option>
											<option value="판타지"
											  <c:if test="${pageMaker.cri.categoryType eq '판타지'}">selected</c:if>>판타지</option>
											<option value="SF"
											  <c:if test="${pageMaker.cri.categoryType eq 'SF'}">selected</c:if>>SF</option>
											<option value="에세이"
											  <c:if test="${pageMaker.cri.categoryType eq '에세이'}">selected</c:if>>에세이</option>
											<option value="자기계발"
											  <c:if test="${pageMaker.cri.categoryType eq '자기계발'}">selected</c:if>>자기계발</option>
											<option value="경제경영"
											  <c:if test="${pageMaker.cri.categoryType eq '경제경영'}">selected</c:if>>경제경영</option>
											<option value="사회과학"
											  <c:if test="${pageMaker.cri.categoryType eq '사회과학'}">selected</c:if>>사회과학</option>
											<option value="인문학"
											  <c:if test="${pageMaker.cri.categoryType eq '인문학'}">selected</c:if>>인문학</option>
											<option value="역사"
											  <c:if test="${pageMaker.cri.categoryType eq '역사'}">selected</c:if>>역사</option>
											<option value="청소년"
											  <c:if test="${pageMaker.cri.categoryType eq '청소년'}">selected</c:if>>청소년</option>
											<option value="예술/대중문화"
											  <c:if test="${pageMaker.cri.categoryType eq '예술/대중문화'}">selected</c:if>>예술/대중문화</option>
											<option value="종교/역학"
											  <c:if test="${pageMaker.cri.categoryType eq '종교/역학'}">selected</c:if>>종교/역학</option>
											<option value="만화"
											  <c:if test="${pageMaker.cri.categoryType eq '만화'}">selected</c:if>>만화</option>
											<option value="어린이"
											  <c:if test="${pageMaker.cri.categoryType eq '어린이'}">selected</c:if>>어린이</option>
										</select>
									</th>
									<th style="text-align: center" width="7%">
										<select name="isReportZero" style="border: hidden" onchange="javascript:criSettingSubmit(this)">
											<option value="">신고</option>
											<option value="false"
											  <c:if test="${pageMaker.cri.isReportZero eq 'false'}">selected</c:if>>있음</option>
											<option value="true"
											  <c:if test="${pageMaker.cri.isReportZero eq 'true'}">selected</c:if>>없음</option>
										</select>
									</th>
									<th style="text-align: center" width="5%">
										<button class="btn btn-default" id="regAll" type="button">등록</button>
									</th>
								</tr>
								</thead>
								<tbody>
								<c:forEach items="${list}" var="book">
								  <tr>
									<td class="bookno">${book.bookno}</td>
									<td><span class="contentTitle currBookno" name="${book.bookno}" onclick="itemClick(event)">${book.title}</span></td>
									<td>${book.username}(<label style="font-size: 11px">${book.userid}</label>)</td>
									<td align="center">${book.sellcnt}</td>
									<td align="center">${book.applydate}</td>
									<td align="center">${book.starpoint}</td>
									<td align="center">
									  <c:if test="${book.grade eq '작가'}">유료</c:if>
									  <c:if test="${book.grade eq '일반'}">무료</c:if>
									</td>
									<td align="center">${book.bookcategory}</td>
									<td align="center">
									  <c:choose>
									    <c:when test="${book.reportcnt > 0}">
									      <a class="reportView currBookno" style="color: red; font-size: 14px" name="${book.bookno}" data-title="Report Read" data-toggle="lightbox">
											<strong>${book.reportcnt}</strong></a>
									    </c:when>
									    <c:otherwise>${book.reportcnt}</c:otherwise>
									  </c:choose>
									  
									</td>
									<td align="center" class="contentRegister">
									  <c:if test="${book.convertstate eq '변환대기'}">
									     <a class="regBook currBookno convertBook" name="${book.bookno}" title="변환대기" data-title="Convert Book" data-toggle="lightbox">
									       <i class="fa fa-download fa-lg"></i>
									    </a>								 
									  </c:if>
									  
									  <c:if test="${book.convertstate eq '변환안됨'}">
									     <a class="notRegBook currBookno" name="${book.bookno}" title="변환안됨" data-title="Convert Book" data-toggle="lightbox">
									       <i class="fa fa-times-circle fa-lg"></i> <!-- fa-exclamation-circle -->
									     </a>								 
									  </c:if>
									  <c:if test="${book.convertstate eq '변환오류'}">
									     <a class="currBookno errconvertBook" name="${book.bookno}" title="변환오류" data-title="Convert Book" data-toggle="lightbox">
									       <i class="fa fa-exclamation-circle fa-lg"></i>
									     </a>		
									  </c:if>
									</td>
								  </tr>
								</c:forEach>
								</tbody>
							</table>
						</div><!--/content-panel -->
					</div><!-- /col-md-12 -->
					<!-- BUTTONS NESTING -->
					<div class="text-center" style="font-size: 15px">
			            <c:if test="${pageMaker.firstPage}">
			               <a class="paging" name="1" title="first page: 1" style="color: #da4453" onclick="javascript:pageSettingSubmit(this)">&laquo;</a>&nbsp;
			            </c:if>
			            <c:if test="${pageMaker.prev}">
			               <a class="paging" name="${pageMaker.startPage-1}" title="${pageMaker.startPage-1}" style="color: #ce8483" onclick="javascript:pageSettingSubmit(this)">&lt;</a>&emsp;
			            </c:if>	
			            <c:forEach var="i" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
			              <c:choose>
			                <c:when test="${pageMaker.cri.page eq i}">
			                  <a class="paging" name="${i}" style="color: #da4453" onclick="javascript:pageSettingSubmit(this)">${i}</a>&emsp;
			                </c:when>
			                <c:otherwise>
			                  <a class="paging" name="${i}" style="color: #979797" onclick="javascript:pageSettingSubmit(this)">${i}</a>&emsp;
			                </c:otherwise>
			              </c:choose>
			            </c:forEach>
			            <c:if test="${pageMaker.next}">
			               <a class="paging" name="${pageMaker.endPage+1}" title="${pageMaker.endPage+1}" style="color: #ce8483" onclick="javascript:pageSettingSubmit(this)">&gt;</a>&nbsp;
			            </c:if>
			            <c:if test="${pageMaker.lastPage && pageMaker.endPage > 0}">
			               <a class="paging" name="${pageMaker.last}" title="last page: ${pageMaker.last}" style="color: #da4453" onclick="javascript:pageSettingSubmit(this)">&raquo;</a>
			            </c:if>
			         </div>
				</div><!-- /col-lg-3 -->
			</div><!--/row -->
			
			
			<!--main content end-->
			<!--footer start-->
			<footer class="site-footer">
				<div class="text-center" style="color: #f7c8c8">
						<br><br><br>
						2015 - 함박웃음
				</div>
			</footer>
			<!--footer end-->
			
		</section>
	</section>
</section>

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

<script type="application/javascript">

	//--------------------------------------------------------------------------------------------- 새창 열리기
	function newWindow(openName, topvalue, leftvalue, widthvalue, heightvalue){
		window.open(openName, '', 'top='+ topvalue +', left='+ leftvalue +', width='+ widthvalue +', height='+ heightvalue +''); return false;
	};

	function alertFunction(msg, movePage){
		if(confirm(msg)){
			location.href=movePage;
		}
	}

	function abspos(e){
		this.x = e.clientX + (document.documentElement.scrollLeft?document.documentElement.scrollLeft:document.body.scrollLeft);
		this.y = e.clientY + (document.documentElement.scrollTop?document.documentElement.scrollTop:document.body.scrollTop);
		return this;
	}


	function itemClick(e){
		var ex_obj = document.getElementById('popmenu');
		if(!e) e = window.Event;
		pos = abspos(e);
		ex_obj.style.left = (pos.x)+"px";
		ex_obj.style.top = (pos.y+10)+"px";
		ex_obj.style.display = ex_obj.style.display=='none'?'block':'none';
	}
	$('#menuX').on('click',function(){
		var ex_obj = document.getElementById('popmenu');
		ex_obj.style.display='none';
	});
	//---------------------------------------------------------------------------------------------------------
	  
    function criSettingSubmit(criteria){
		var type = criteria.name;
		var key = criteria.value;
    	$('#criteriaForm').find('input[name='+ type +']').attr('value', key);
    	$('#criteriaForm').find('input[value=""]').remove();
    	$('#criteriaForm').find('input[name="page"]').remove();
    	$('#criteriaForm').submit();
    };
    
	var convertValue = $("input[name=convertType]").val();
	$("input[type=radio][value=" + convertValue + "]").attr("checked", true);
    
    function pageSettingSubmit(page){
		var key = page.name;
    	$('#criteriaForm').find('input[name=page]').attr('value', key);
    	$('#criteriaForm').find('input[value=""]').remove();
    	$('#criteriaForm').submit();
    };
    
    function criSetting(criteria){
    	var type = criteria.id;
		var key = criteria.value;
    	$('#criteriaForm').find('input[name='+ type +']').attr('value', key);
    };
    
	$('#searchType').on('click', function(){
		$(this).attr(value)
	});
	$('.currBookno').on('click', function(){
		var no = ($(this).attr('name'));
		$('#bookForm').find('input[name=bookno]').attr('value', no);
	});
	
	$('#regAll').on('click', function(){
		if(confirm('모든 책을 상용화 하시겠습니까?')){
			$('#postForm').submit();
		}
	});
	/* $('#bookInfo').on('click', function(){
		window.open('', 'bookinfoviewer', 'top=200,left=350,width=600,height=470');		
		subBookForm('bookinfoviewer', 'viewinfo');
	}); */
	

	function subBookForm(target, action){
		$('#bookForm').attr('target', target);		
		$('#bookForm').attr('action', action);		
		$('#bookForm').submit();
	}
	
	
	//--------------------------------------------------------------------------------------------------------------------
	
    // delegate calls to data-toggle="lightbox"
    $('#bookInfo').on('click', function(event) { //*[data-toggle="lightbox"]:not([data-gallery="navigateTo"])
        event.preventDefault();
        var bookno = $('#bookForm').find('input[name=bookno]').attr('value');
    	$(this).attr('href', 'viewinfo?bookno='+bookno);
        return $(this).ekkoLightbox();
    });
	
	$('#regCode').on('click', function(event) {
        event.preventDefault();
        var bookno = $('#bookForm').find('input[name=bookno]').attr('value');
    	$(this).attr('href', 'regcode?bookno='+bookno);
        return $(this).ekkoLightbox();
    });
	
	$('#permitList').on('click', function(event) {
        event.preventDefault();
        var bookno = $('#bookForm').find('input[name=bookno]').attr('value');
    	$(this).attr('href', 'permitlist?bookno='+bookno);
        return $(this).ekkoLightbox();
    });	
	$('.convertBook').on('click', function(event) {
        event.preventDefault();
        var bookno = $('#bookForm').find('input[name=bookno]').attr('value');
    	$(this).attr('href', 'convertbook?bookno='+bookno);
        return $(this).ekkoLightbox();
    });
	
	$('.errconvertBook').on('click', function(event) {
        event.preventDefault();
        var bookno = $('#bookForm').find('input[name=bookno]').attr('value');
    	$(this).attr('href', 'errconvertbook?bookno='+bookno);
        return $(this).ekkoLightbox();
    });
	$('.reportView').on('click', function(event) {
        event.preventDefault();
        var bookno = $('#bookForm').find('input[name=bookno]').attr('value');
    	$(this).attr('href', 'report?bookno='+bookno);
        return $(this).ekkoLightbox();
    });
	
</script>


</body>
</html>
