<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>BOOKTICKER Admin: Message</title>

	<!-- Bootstrap core CSS -->
    <link href="/resources/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="/resources/font-awesome/css/font-awesome.css" rel="stylesheet" /> <!-- 아이콘 -->
    <link href="/resources/lightbox-master/dist/ekko-lightbox.css" rel="stylesheet">
    
	<!-- Custom styles for this template -->
    <link href="/resources/css/style.css" rel="stylesheet">
    <link href="/resources/css/style-responsive.css" rel="stylesheet">
   
</head>
<style>
    #msgRead{
		color: #60ccdc
	}
	#msgRead:hover{
		color: #50acb9;
		text-decoration: underline;
		cursor: pointer;
	}
	.paging:hover{
		color: #50acb9;
		text-decoration: underline;
		cursor: pointer;
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
        <div class="top-menu">
            <ul class="nav pull-right top-menu">
                <li><a class="logout">Logout</a></li>
            </ul>
        </div>
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
                    <a href="/admin/book/list" >
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
                    <a class="active" href="list" >
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
    <form id="msgForm" method="get" action="/admin/message/readmsg">
	   <input type="hidden" name="msgno" value="">
	</form>
	<form id="criteriaForm" method="get">
	   <input type="hidden" name="page" value="${pageMaker.cri.page}">
	   <input type="hidden" name="perPageNum" value="${pageMaker.cri.perPageNum}">
	   <input type="hidden" name="msgReadState" value="${pageMaker.cri.msgReadState}">
	</form>
	<form id="postForm" method="post" action="">
	</form>
    <section id="main-content">
        <section class="wrapper">
            <div class="row">
                <div class="main-chart"><!-- col-lg-9  -->
                    <div class="col-md-12 mt">
                        <br><br>
                        <div style="float: left"><h4><i class="fa fa-angle-right"></i> Message List (${totalCnt}) </h4></div>
                        <div style="float: right">
                            <select name="perPageNum" onchange="javascript:criSettingSubmit(this)">
                                <option value=10
                                  <c:if test="${pageMaker.cri.perPageNum eq '10'}">selected</c:if>>10개</option>
                                <option value=30
                                  <c:if test="${pageMaker.cri.perPageNum eq '30'}">selected</c:if>>30개</option>
                                <option value=100
                                  <c:if test="${pageMaker.cri.perPageNum eq '100'}">selected</c:if>>100개</option>
                            </select>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="">
                        <form name='checkList' method='post' action="delete">
                            <table class="table table-hover">
                                <hr>
                                <thead>
                                <tr>
                                    <th width="2%"><input type="checkbox" id="allck" name="allck"  onclick="allCk(this.checked);availableBtn()"></th>
                                    <th width="3%">#</th>
                                    <th width="20%">아이디</th>
                                    <th width="60%">내용</th>
                                    <th style="text-align: center" width="5%">
                                        <select name="msgReadState" style="border: hidden" onchange="javascript:criSettingSubmit(this)">
                                            <option value=""
                                            	<c:if test="${pageMaker.cri.msgReadState eq ''}">selected</c:if>>읽음상태</option>
                                            <option value="O"
                                            	<c:if test="${pageMaker.cri.msgReadState eq 'O'}">selected</c:if>>읽음</option>
                                            <option value="X"
                                            	<c:if test="${pageMaker.cri.msgReadState eq 'X'}">selected</c:if>>안읽음</option>
                                        </select>
                                    </th>
                                    <th style="text-align: center" width="8%">보낸날짜</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${list}" var="msg">
                                <tr>
                                    <td><input type="checkbox" name="checkedVal" value="${msg.msgno}" onclick="availableBtn()"></td>
                                    <td>${msg.msgno}</td>
                                    <td>${msg.userid}</td>
                                    <td class="msg" id="${msg.msgno}">
                                    	<a id="msgRead" href="" data-title="Read Message" data-toggle="lightbox">
                                       		${msg.msg}
                                       	</a>
                                    </td>
                                    <td align="center">${msg.readstate}</td>
                                    <td align="center">${msg.senddate}</td>
                                </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            </form>
                        </div><!--content-panel -->
                    </div><!-- /col-md-12 -->
                    <!-- BUTTONS NESTING -->
                    <div class="col-md-6 text-left">
                        <button class="btn btn-default" id="deleteBtn" disabled>삭제</button>
                    </div>
                    <!-- paging -->
					<div class="col-md-12 text-center" style="font-size: 15px">
			            <c:if test="${pageMaker.firstPage}">
			               <a class="paging" title="1" style="color: #da4453" onclick="javascript:pageSettingSubmit(this)">&laquo;</a>&nbsp;
			            </c:if>
			            <c:if test="${pageMaker.prev}">
			               <a class="paging" title="${pageMaker.startPage-1}" style="color: #ce8483" onclick="javascript:pageSettingSubmit(this)">&lt;</a>&emsp;
			            </c:if>	
			            <c:forEach var="i" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
			              <c:choose>
			                <c:when test="${pageMaker.cri.page eq i}">
			                  <a class="paging" style="color: #da4453" onclick="javascript:pageSettingSubmit(this)">${i}</a>&emsp;
			                </c:when>
			                <c:otherwise>
			                  <a class="paging" style="color: #979797" onclick="javascript:pageSettingSubmit(this)">${i}</a>&emsp;
			                </c:otherwise>
			              </c:choose>
			            </c:forEach>
			            <c:if test="${pageMaker.next}">
			               <a class="paging" title="${pageMaker.endPage+1}" style="color: #ce8483" onclick="javascript:pageSettingSubmit(this)">&gt;</a>&nbsp;
			            </c:if>
			            <c:if test="${pageMaker.lastPage && pageMaker.endPage > 0}">
			               <a class="paging" title="${pageMaker.last}" style="color: #da4453" onclick="javascript:pageSettingSubmit(this)">&raquo;</a>
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
<script src="/resources/js/jquery.js"></script>
<script src="/resources/js/jquery-1.8.3.min.js"></script>
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

	
	function availableBtn(){
		var checks = $('input[type=checkbox]');
		var flag = false;
        for( var i = 0; i < checks.length; i++ ){
        	if(checks[i].checked == true){
        		flag = true;
        	}
        }
        if(flag == true){    	
			$('#deleteBtn').attr('disabled', false);
        }else{
        	$('#deleteBtn').attr('disabled', true);
        }
	};
    //--------------------------------------------------전체  선택 checkbox 클릭
    function allCk(objCheck){
        var checks = document.getElementsByName('checkedVal');
        for( var i = 0; i < checks.length; i++ ){
            checks[i].checked = objCheck;
            // name이 'check' 인 checkbox는  id가 allck인 checkbox의 checked 상태와 같게 된다.

        }
    }
    
    $('#deleteBtn').on('click', function(){ //여러 게시물을 선택하고 삭제하기
    	if(confirm('선택 목록을 삭제 하시겠습니까?')){
	        var form = document.checkList;
	        form.submit();
    	}
    });

    function abspos(e){
        this.x = e.clientX + (document.documentElement.scrollLeft?document.documentElement.scrollLeft:document.body.scrollLeft);
        this.y = e.clientY + (document.documentElement.scrollTop?document.documentElement.scrollTop:document.body.scrollTop);
        return this;
    }

    //------------------------------------------------------------------------
    $('.msg').on('click', function(event) {
        event.preventDefault();
        var msgno = $(this).attr('id');
    	$(this).attr('href', 'readmsg?msgno='+msgno);
        return $(this).ekkoLightbox();
    });
    
    function pageSettingSubmit(page){
		var key = page.title;
    	$('#criteriaForm').find('input[name=page]').attr('value', key);
    	$('#criteriaForm').find('input[value=""]').remove();
    	$('#criteriaForm').submit();
    };
    function criSettingSubmit(criteria){
		var type = criteria.name;
		var key = criteria.value;
    	$('#criteriaForm').find('input[name='+ type +']').attr('value', key);
    	$('#criteriaForm').find('input[value=""]').remove();
    	$('#criteriaForm').find('input[name="page"]').remove();
    	$('#criteriaForm').submit();
    };

</script>

</body>
</html>
