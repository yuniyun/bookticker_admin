<%@ page session="false" %>
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

    <title>BOOKTICKER Admin</title>

	<!-- Bootstrap core CSS -->
	<link href="/resources/css/bootstrap.css" rel="stylesheet">
	<!--external css-->
	<link href="/resources/font-awesome/css/font-awesome.css" rel="stylesheet" />
	<link rel="stylesheet" type="text/css" href="/resources/css/zabuto_calendar.css">
	<link rel="stylesheet" type="text/css" href="/resources/js/gritter/css/jquery.gritter.css" />
	<link rel="stylesheet" type="text/css" href="/resources/lineicons/style.css">
	
	<!-- Custom styles for this template -->
	<link href="/resources/css/style.css" rel="stylesheet">
	<link href="/resources/css/style-responsive.css" rel="stylesheet">
	<link href="/resources/lightbox-master/dist/ekko-lightbox.css" rel="stylesheet">

</head>
<style>
    .aTag {
        color: #080808;
    }

    .aTag:hover {
        color: #adadad;
    }
    .title{
		color: #60ccdc
	}
	.title:hover{
		color: #50acb9;
		text-decoration: underline;
		cursor: pointer;
	}
</style>
<body>

<section id="container">
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
        <div id="sidebar" class="nav-collapse">
            <!-- sidebar menu start-->
            <ul class="sidebar-menu" id="nav-accordion">

                <li class="mt">
                    <a class="active" href="home">
                        <i class="fa fa-home"></i>
                        <span>Home</span>
                    </a>
                </li>

                <li class="sub-menu">
                    <a href="/admin/user/list">
                        <i class="fa fa-user"></i>
                        <span>Member</span>
                    </a>
                </li>

                <li class="sub-menu">
                    <a href="/admin/book/list">
                        <i class="fa fa-book"></i>
                        <span>Book</span>
                    </a>
                </li>
                <li class="sub-menu">
                    <a href="/admin/board/list">
                        <i class="fa fa-pencil"></i>
                        <span>Board</span>
                    </a>
                </li>
                <li class="sub-menu">
                    <a href="/admin/statistics">
                        <i class="fa fa-bar-chart-o"></i>
                        <span>Statistics</span>
                    </a>
                </li>
                <li class="sub-menu">
                    <a href="/admin/message/list">
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
    <form id="postForm" method="post" action="">
	</form>
    <section id="main-content">
        <section class="wrapper" style="padding-top: 20px">
            <br>

            <div class="row">
                <div class="col-md-1"></div>
                <div class="col-md-5">

                    <table width="100%" style="background-color: #efefef">
                        <tr>
                            <td width="70%"><h4><i class="fa fa-angle-right"></i> Author Board </h4></td>
                            <td style="text-align: right"><a href="/admin/board/list?boardType=작가">+more</a></td>
                        </tr>
                    </table>
                    <div class="btn-round">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th width="30%">제목</th>
                                <th width="8%">작성자</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${boardAList}" var="authorBoard" begin="0" end="4">
                              <tr>
                                <td>
                                  <a class="title boardtitle" id="${authorBoard.boardNo}" href=""
                                  data-title="Board Info" data-toggle="lightbox">
								    ${authorBoard.title}
								  </a>
								</td>
                                <td>${authorBoard.username}</td>
                              </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="col-md-5">
                    <table width="100%" style="background-color: #efefef">
                        <tr>
                            <td width="70%"><h4><i class="fa fa-angle-right"></i> User Board </h4></td>
                            <td style="text-align: right"><a href="/admin/board/list?boardType=일반">+more</a></td>
                        </tr>
                    </table>
                    <div class="btn-round">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th width="30%">제목</th>
                                <th width="8%">작성자</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${boardUList}" var="userBoard" begin="0" end="4">
                              <tr>
                                <td>
                                  <a class="title boardtitle" id="${userBoard.boardNo}" href=""
                                  data-title="Board Info" data-toggle="lightbox">
							        ${userBoard.title}
							      </a>
							    </td>
                                <td>${userBoard.username}</td>
                              </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-1"></div>
                <div class="col-md-5">
                    <table width="100%" style="background-color: #efefef">
                        <tr>
                            <td width="70%"><h4><i class="fa fa-angle-right"></i> No Free Contents </h4></td>
                            <td style="text-align: right"><a href="/admin/book/list?chargeType=작가">+more</a></td>
                        </tr>
                    </table>
                    <div class="btn-round">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th width="30%">책이름</th>
                                <th width="8%">저자</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${noFreeList}" var="noFree">
	                            <tr>
                                  <td>
                                    <a class="title contentTitle" id="${noFree.bookno}" href=""
                                    data-title="Book Info" data-toggle="lightbox">
									  ${noFree.title}
									</a>
								  </td>
                                  <td>${noFree.username}</td>
	                            </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="col-md-5">
                    <table width="100%" style="background-color: #efefef">
                        <tr>
                            <td width="70%"><h4><i class="fa fa-angle-right"></i> Free Contents </h4></td>
                            <td style="text-align: right"><a href="/admin/book/list?chargeType=일반">+more</a></td>
                        </tr>
                    </table>
                    <div class="btn-round">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th width="30%">책이름</th>
                                <th width="8%">저자</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${freeList}" var="free">
	                            <tr>
                                  <td>
                                    <a class="title contentTitle" id="${free.bookno}" href=""
                                    data-title="Book Info" data-toggle="lightbox">
									  ${free.title}
									</a>
								  </td>
	                              <td>${free.username}</td>
	                            </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <br>

            <div class="col-md-6"></div>
            <div class="col-md-5">
                <div class="col-md-4">
                    <a href="/admin/board/list?sortType=desc&sortkey=t1.reportcnt" class="aTag">
                        <div class="col-xs-12" style="font-size: 10px">Report Boards</div>
                        <div class="col-xs-1"><h5 style="text-align: right; padding-right: 27px">12</h5></div>
                        <h1><i class="fa fa-flag fa-2x"></i></h1>
                    </a>
                </div>
                <div class="col-md-4">
                    <a href="/admin/book/list?isReportZero=false" class="aTag">
                        <div class="col-xs-12" style="font-size: 10px">Report Contents</div>
                        <div class="col-xs-1"><h5 style="text-align: right; padding-right: 27px">3</h5></div>
                        <h1><i class="fa fa-flag-o fa-2x"></i></h1>
                    </a>
                </div>
                <div class="col-md-4">
                    <a href="/admin/book/list?convertType=변환대기" class="aTag">
                        <div class="col-xs-12" style="font-size: 10px">Update Contents</div>
                        <div class="col-xs-1"><h5 style="text-align: right; padding-right: 27px">5</h6></div>
                        <h1><i class="fa fa-book fa-2x"></i></h1>
                    </a>
                </div>
            </div>
        </section>
    </section>
</section>
<!-- js placed at the end of the document so the pages load faster -->
<script src="/resources/js/jquery.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<script class="include" type="text/javascript" src="/resources/js/jquery.dcjqaccordion.2.7.js"></script>
<script src="/resources/js/jquery.scrollTo.min.js"></script>
<script src="/resources/js/jquery.nicescroll.js" type="text/javascript"></script>
<script src="/resources/lightbox-master/dist/ekko-lightbox.js"></script>

<!--common script for all pages-->
<script src="/resources/js/common-scripts.js"></script>
<script src="/resources/js/unitype-common.js"></script>

<script type="text/javascript">
	$('.boardtitle').on('click', function(event){
		event.preventDefault();
        var bno = $(this).attr('id');
    	$(this).attr('href', '/admin/board/read?boardNo='+bno);
        return $(this).ekkoLightbox();
	});
	
	$('.contentTitle').on('click', function(event){
		event.preventDefault();
        var bookno = $(this).attr('id');
    	$(this).attr('href', '/admin/book/viewinfo?bookno='+bookno);
        return $(this).ekkoLightbox();
	});
</script>
</body>
</html>
