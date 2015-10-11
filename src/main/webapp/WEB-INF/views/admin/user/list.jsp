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

<title>BOOKTICKER Admin: Member</title>

<!-- Bootstrap core CSS -->
<link href="/resources/css/bootstrap.css" rel="stylesheet">
<!--external css-->
<link href="/resources/font-awesome/css/font-awesome.css"
	rel="stylesheet" />
<link rel="stylesheet" type="text/css"
	href="/resources/css/zabuto_calendar.css">
<link rel="stylesheet" type="text/css"
	href="/resources/js/gritter/css/jquery.gritter.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/lineicons/style.css">

<!-- Custom styles for this template -->
<link href="/resources/css/style.css" rel="stylesheet">
<link href="/resources/css/style-responsive.css" rel="stylesheet">
<link href="/resources/lightbox-master/dist/ekko-lightbox.css" rel="stylesheet">

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
  
</head>
<style>
.userID {
	color: #60ccdc
}

.userID:hover {
	color: #50acb9;
	text-decoration: underline;
	cursor: pointer;
}
</style>
<body>

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

			<li class="sub-menu"><a class="active" href="list">
					<i class="fa fa-user"></i> <span>Member</span>
			</a></li>

			<li class="sub-menu"><a href="/admin/book/list"> <i
					class="fa fa-book"></i> <span>Book</span>
			</a></li>
			<li class="sub-menu"><a href="/admin/board/list"> <i
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
	<!--main member start-->
	<form id="postForm" method="post" action="">
	</form>
	<section id="main-content">
	<section class="wrapper">

	<div id="popmenu"
		style="position: absolute; z-index: 100; display: none;">
		<table
			style="background: #adadad; color: #FFFFFF; width: 95px; border-color: #ffffff"
			border="1px">
			<tr>
				<td class="clickmenu" style="padding: 5px; border-right: 0px">
					<span id="readBoard" style="cursor: pointer"
					onClick="location.href='/admin/board/list'">게시물보기</span>
				</td>
				<td class="clickmenutitleR" align="right" style="border-left: 0px;">
					<span id="menuX" style="cursor: pointer; padding: 5px;">x</span>
				</td>
			</tr>
			<tr>
				<td style="padding: 5px" colspan="2">
					<span id="readContent" style="cursor: pointer" >컨텐츠보기</span>
				</td>
			</tr>
			<tr>
				<td style="padding: 5px" colspan="2">
					<span id="sendMsg" style="cursor: pointer" data-title="Send Message" data-toggle="lightbox">쪽지보내기</span>
				</td>
			</tr>
			<tr>
				<td style="padding: 5px" colspan="2"><span id="kickUser"
					style="cursor: pointer">탈퇴시키기</span></td>
			</tr>
		</table>
	</div>

	<div class="row">
		<div class="main-chart">
			<!-- col-lg-9  -->
			<div style="text-align: center">
				<!--input-group custom-search-form -->
				<div class="row">
					<span style="font-size: 25px; font-weight: bold"><br></span>
				</div>
				<form class="form-inline" role="form">
					<div class="form-group">
						<select class="form-control" name="searchType">
							<option value="all"
								<c:out value="${cri.searchType eq 'all'?'selected':''}"/>>전체</option>
							<option value="userid"
								<c:out value="${cri.searchType eq 'userid'?'selected':''}"/>>아이디</option>
							<option value="username"
								<c:out value="${cri.searchType eq 'username'?'selected':''}"/>>이름</option>
							<option value="birth"
								<c:out value="${cri.searchType eq 'birth'?'selected':''}"/>>생년</option>
						</select>
					</div>
					<div class="input-group input-group-in">
						<input type="text" class="form-control" style="width: 500px" autofocus
							placeholder="아이디/이름/생년" name='keyword' id="keywordInput"
							value='${cri.keyword}'> <span class="input-group-btn">
							<button class="btn btn-default" type="button" id='searchBtn'>
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
						<i class="fa fa-angle-right"></i> Member List
						(${pageMaker.totalCount})
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
					<select id="sortDirection" onchange="javascript:sortDS(this)">
						<option value="desc"
							<c:if test="${pageMaker.cri.sortDirection eq 'desc'}">selected</c:if>>내림차순</option>
						<option value="asc"
							<c:if test="${pageMaker.cri.sortDirection eq 'asc'}">selected</c:if>>오름차순</option>
					</select>
				</div>
				<div style="float: right">
					<select id="sortType" onchange="javascript:sortTS(this)">
						<option value="regdate"
							<c:if test="${pageMaker.cri.sortType eq 'regdate'}">selected</c:if>>등록일순</option>
						<option value="mybookcnt"
							<c:if test="${pageMaker.cri.sortType eq 'mybookcnt'}">selected</c:if>>보유컨텐츠순</option>
						<option value="writingcnt"
							<c:if test="${pageMaker.cri.sortType eq 'writingcnt'}">selected</c:if>>작성컨텐츠순</option>
					</select>
				</div>
			</div>
			<div class="col-md-12">
				<div class="listStyle">
					<table class="table table-hover">
						<thead>
							<tr>
								<th width="20%">아이디</th>
								<th width="12%">이름</th>
								<th style="text-align: center" width="5%"><select
									id="checkGender" style="border: hidden"
									onchange="javascript:genderTS(this)">
										<option value="null">성별</option>
										<option value="남자"
											<c:if test="${pageMaker.cri.checkGender eq '남자'}">selected</c:if>>남자</option>
										<option value="여자"
											<c:if test="${pageMaker.cri.checkGender eq '여자'}">selected</c:if>>여자</option>
								</select></th>
								<th style="text-align: center" width="8%">생년월일</th>
								<th style="text-align: center" width="10%">연락처</th>
								<th style="text-align: center" width="8%">보유컨텐츠</th>
								<th style="text-align: center" width="8%">작성컨텐츠</th>
								<th style="text-align: center" width="8%">가입일</th>
								<th style="text-align: center" width="5%"><select
									id="checkGrade" style="border: hidden"
									onchange="javascript:gradeTS(this)">
										<option value="null">등급</option>
										<option value="일반"
											<c:if test="${pageMaker.cri.checkGrade eq '일반'}">selected</c:if>>일반</option>
										<option value="작가"
											<c:if test="${pageMaker.cri.checkGrade eq '작가'}">selected</c:if>>작가</option>
								</select></th>
								<th style="text-align: center" width="8%"><select
									id="checkLiveState" style="border: hidden"
									onchange="javascript:livestateTS(this)">
										<option value="null">탈퇴여부</option>
										<option value="사용중"
											<c:if test="${pageMaker.cri.checkLiveState eq '사용중'}">selected</c:if>>사용중</option>
										<option value="탈퇴"
											<c:if test="${pageMaker.cri.checkLiveState eq '탈퇴'}">selected</c:if>>탈퇴</option>
								</select></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="member">
								<tr class="userTable">
									<td>
										<span class="userID" id="${member.userid}" onclick="itemClick(event)">${member.userid}</span>
									</td>
									<td class="userName" id="${member.username}"><span>${member.username}</span></td>
									<td align="center">${member.gender}</td>
									<td align="center">${member.birth}</td>
									<td align="center">${member.phone}</td>
									<td align="center">${member.mybookcnt}</td>
									<td align="center">${member.writingcnt}</td>
									<td align="center">${member.regdate}</td>
									<td align="center" class="userGrade" id="${member.grade}">${member.grade}</td>
									<td align="center">
										<span class="liveState" id="${member.livestate}"> ${member.livestate}</span>
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
			<div class="col-md-12 text-right">
				<button class="btn btn-default" id="regWriter"
					onClick="regClick(event)">작가등록</button>

			</div>

			<!-- paging -->
			<div class="text-center" style="font-size: 15px">
				<c:if test="${pageMaker.firstPage}">
					<a href="list${pageMaker.makeSearch(1)}" title="first page: 1" style="color: #da4453">&laquo;</a>&nbsp;
                      </c:if>
				<c:if test="${pageMaker.prev}">
					<a href="list${pageMaker.makeSearch(pageMaker.startPage -1)}" title="${pageMaker.startPage-1}"
						style="color: #ce8483">&lt;</a>
					&emsp;
				</c:if>

				<c:forEach var="i" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
				  <c:choose>
	                <c:when test="${pageMaker.cri.page eq i}">
	                  <a href="list${pageMaker.makeSearch(i)}" style="color: #da4453">${i}</a>&emsp;
	                </c:when>
	                <c:otherwise>
	                  <a href="list${pageMaker.makeSearch(i)}" style="color: #979797">${i}</a>&emsp;
	                </c:otherwise>
	              </c:choose>
				</c:forEach>

				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					<a href="list${pageMaker.makeSearch(pageMaker.endPage +1)}"
						style="color: #ce8483">&gt;</a>&nbsp;
                      </c:if>
				<c:if test="${pageMaker.lastPage && pageMaker.endPage > 0}">
					<a href="list${pageMaker.makeSearch(pageMaker.last)}" title="last page: ${pageMaker.last}"
						style="color: #da4453">&raquo;</a>
				</c:if>
			</div>

		</div>
		<!-- /col-lg-3 -->
	</div>
	<!--/row --> <!--main content end--> <!--footer start--> <footer
		class="site-footer">
	<div class="text-center" style="color: #f7c8c8">
		<br>
		<br>
		<br> 2015 - 함박웃음
	</div>
	</footer> <!--footer end--> </section> </section> </section>

	<!-- js placed at the end of the document so the pages load faster -->
	<script src="/resources/js/jquery.js"></script>
	<script src="/resources/js/jquery-1.8.3.min.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script class="include" type="text/javascript"
		src="/resources/js/jquery.dcjqaccordion.2.7.js"></script>
	<script src="/resources/js/jquery.scrollTo.min.js"></script>
	<script src="/resources/js/jquery.nicescroll.js" type="text/javascript"></script>
	<script src="/resources/js/jquery.sparkline.js"></script>
	<script src="/resources/lightbox-master/dist/ekko-lightbox.js"></script>
	<!--common script for all pages-->
	<script src="/resources/js/common-scripts.js"></script>
	<script src="/resources/js/unitype-common.js"></script>

	<script type="text/javascript"
		src="/resources/js/gritter/js/jquery.gritter.js"></script>
	<script type="text/javascript" src="/resources/js/gritter-conf.js"></script>

	<form id="memberForm" method="POST" action="/admin/user/list">
		<input type="hidden" id="huserid" name="userid" value="">
		<input type="hidden" id="husername" name="username" value=""> 
		<input type="hidden" id="hlivestate" name="livestate" value="">
		<input type="hidden" id="hgrade" name="grade" value="">
	</form>
	<input type="hidden" id="hpage" value="${pageMaker.cri.page}" />
	<input type="hidden" id="hperPageNum" value="${pageMaker.cri.perPageNum}" />
	<input type="hidden" id="hsearchType" value="${pageMaker.cri.searchType}" />
	<input type="hidden" id="hkeyword" value="${pageMaker.cri.keyword}" />
	<input type="hidden" id="hcheckGender" value="${pageMaker.cri.checkGender}" />
	<input type="hidden" id="hcheckGrade" value="${pageMaker.cri.checkGrade}" />
	<input type="hidden" id="hcheckLiveState" value="${pageMaker.cri.checkLiveState}" />
	<input type="hidden" id="hsortType" value="${pageMaker.cri.sortType}" />
	<input type="hidden" id="hsortDirection" value="${pageMaker.cri.sortDirection}" />
	<input type="hidden" id="amsg" value="${msg}"/>
	<script type="application/javascript">
		

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

    $('#sendMsg').on('click', function(event) {
        event.preventDefault();
        var msgno = $(this).attr('id');
        var id = $('#huserid').attr('value');
    	$(this).attr('href', '/admin/message/sendmsg?userid='+id);
        return $(this).ekkoLightbox();
    });	
    $('#readContent').on('click', function(){
    	var name = $('#husername').attr('value');
    	var grade = $('#hgrade').attr('value');
    	location.href='/admin/book/list?searchType=작가&keyword='+name+'&chargeType='+grade;
    });
    
    $('#readBoard').on('click', function(){
    	var name = $('#husername').attr('value');
    	var grade = $('#hgrade').attr('value');
    	location.href='/admin/board/list?boardType='+grade+'&searchType=이름&keyword='+name;
    });

    $('#kickUser').on('click', function(){
    	var id = $('#huserid').val();
    	var name = $('#husername').val();

    	console.log(id);
    	console.log(name);

	        var j = '${msg}';
    	if(confirm(name +'(' + id + ') 계정을\n정말 탈퇴(비활성화)시키겠습니까?')) {   
    		if($('#hlivestate').val() == '탈퇴') {
    			alert(name + '(' + ') 은 \n이미 탈퇴(비활성화)된 계정입니다');
    		} else {

    			$.post("/admin/user/list", $("#memberForm").serialize());
    			alert(name + '(' + ')님이 \n탈퇴 되었습니다');
				location.reload();
    		}}
    	
    });
    
    $('.userID').on('click', function(){
        var id = ($(this).attr('id'));
        $('#huserid').attr('value', id);
     
        var name = $(this).closest('.userTable').find('.userName').attr('id');
        $('#husername').attr('value', name);
      
        var live = $(this).closest('.userTable').find('.liveState').attr('id');
        $('#hlivestate').attr('value', live);
      
        var grade = $('.userGrade').attr('id');
        $('#hgrade').attr('value', grade);
     });
    

    //search 
      $('#searchBtn').on("click", function(event){
         self.location = "list?page=1" 
         + "&perPageNum=" + $('#hperPageNum').attr('value')
         +"&searchType="+$("select option:selected" ).val() 
         +"&keyword="+$('#keywordInput').val()
        + "&checkGender=" + $('#hcheckGender').attr('value')
        + "&checkGrade=" + $('#hcheckGrade').attr('value')
        + "&checkLiveState=" + $('#hcheckLiveState').attr('value')
        + "&sortType=" + $('#hsortType').attr('value')
        + "&sortDirection=" + $('#hsortDirection').attr('value');
      });     

      function PerPn(ppn) {
         var link = "list?"
            + "&page=" + $('#hpage').attr('value')
            + "&perPageNum=" + ppn.value
            + "&searchType=" + $('#hsearchType').attr('value')
            + "&keyword=" + $('#hkeyword').attr('value')
            + "&checkGender=" + $('#hcheckGender').attr('value')
            + "&checkGrade=" + $('#hcheckGrade').attr('value')
            + "&checkLiveState=" + $('#hcheckLiveState').attr('value')
            + "&sortType=" + $('#hsortType').attr('value')
            + "&sortDirection=" + $('#hsortDirection').attr('value');
         location.href = link;
       };
       
       function sortTS(type){
         var link = "list?"
             + "&page=" + $('#hpage').attr('value')
             + "&perPageNum=" + $('#hperPageNum').attr('value')
             + "&searchType=" + $('#hsearchType').attr('value')
             + "&keyword=" + $('#hkeyword').attr('value')
             + "&checkGender=" + $('#hcheckGender').attr('value')
             + "&checkGrade=" + $('#hcheckGrade').attr('value')
             + "&checkLiveState=" + $('#hcheckLiveState').attr('value')
             + "&sortType=" + type.value
             + "&sortDirection="  + $('#hsortDirection').attr('value');
           location.href = link;
       }

       function sortDS(direction){
         var link = "list?"
             + "&page=" + $('#hpage').attr('value')
             + "&perPageNum=" + $('#hperPageNum').attr('value')
             + "&searchType=" + $('#hsearchType').attr('value')
             + "&keyword=" + $('#hkeyword').attr('value')
             + "&checkGender=" + $('#hcheckGender').attr('value')
             + "&checkGrade=" + $('#hcheckGrade').attr('value')
             + "&checkLiveState=" + $('#hcheckLiveState').attr('value')
             + "&sortType=" +  $('#hsortType').attr('value')
             + "&sortDirection=" + direction.value;
           location.href = link;
       };
       
       function genderTS(gender){
          var link = "list?page=1"
             + "&perPageNum=" + $('#hperPageNum').attr('value')
             + "&searchType=" + $('#hsearchType').attr('value')
             + "&keyword=" + $('#hkeyword').attr('value')
             + "&checkGender=" + gender.value
             + "&checkGrade=" + $('#hcheckGrade').attr('value')
             + "&checkLiveState=" + $('#hcheckLiveState').attr('value')
             + "&sortType=" +  $('#hsortType').attr('value')
             + "&sortDirection=" + $('#hsortDirection').attr('value');
           location.href = link;
       };
       
       function gradeTS(grade){
         var link = "list?"
             + "&page=" + $('#hpage').attr('value') 
             + "&perPageNum=" + $('#hperPageNum').attr('value')
             + "&searchType=" + $('#hsearchType').attr('value')
             + "&keyword=" + $('#hkeyword').attr('value')
             + "&checkGender=" + $('#hcheckGender').attr('value')
             + "&checkGrade=" + grade.value
             + "&checkLiveState=" + $('#hcheckLiveState').attr('value')
             + "&sortType=" +  $('#hsortType').attr('value')
             + "&sortDirection=" + $('#hsortDirection').attr('value');
           location.href = link;
       };

       function livestateTS(state){
         var link = "list?"
             + "&page=" + $('#hpage').attr('value')
             + "&perPageNum=" + $('#hperPageNum').attr('value')
             + "&searchType=" + $('#hsearchType').attr('value')
             + "&keyword=" + $('#hkeyword').attr('value')
             + "&checkGender=" + $('#hcheckGender').attr('value')
             + "&checkGrade=" + $('#hcheckGrade').attr('value')
             + "&checkLiveState=" + state.value;
             + "&sortType=" +  $('#hsortType').attr('value')
             + "&sortDirection=" + $('#hsortDirection').attr('value');
           location.href = link;
       };
       
       function regClick(e){
    	   //*[data-toggle="lightbox"]:not([data-gallery="navigateTo"])
    	   //event.preventDefault();   
    	   $(this).attr('href', '/admin/user/author_regist');
    	   return $(this).ekkoLightbox();
       }
	</script>

</body>
</html>
