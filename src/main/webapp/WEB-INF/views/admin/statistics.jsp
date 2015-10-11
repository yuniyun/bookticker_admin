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

    <title>BOOKTICKER Admin: Statistics</title>
    
	<!-- Bootstrap core CSS -->
    <link href="/resources/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="/resources/font-awesome/css/font-awesome.css" rel="stylesheet" /> <!-- 아이콘 -->
    <link rel="stylesheet" href="/resources/morris/morris.css">

	<!-- Custom styles for this template -->
    <link href="/resources/css/style.css" rel="stylesheet">
    <link href="/resources/css/style-responsive.css" rel="stylesheet">
</head>

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
                    <a class="active" href="statistics" >
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
    <!-- **********************************************************************************************************************************************************
MAIN CONTENT
*********************************************************************************************************************************************************** -->
   	<input type="hidden" id="female" value="${femalePercent}">
   	<input type="hidden" id="male" value="${malePercent}">
   	<input type="hidden" id="author" value="${authorPercent}">
   	<input type="hidden" id="general" value="${generalPercent}">
   	<form id="postForm" method="post" action="">
	</form>
   	<%-- <c:forEach items="${ageList}" var="age">
   	  <input type="hidden" name="age" value="${age}">
   	</c:forEach> --%>
    <!--main content start-->
    <section id="main-content">
        <section class="wrapper site-min-height">
            <!-- page start-->
            <div id="morris">
                <div class="row mt">
                    <div class="col-lg-4">
                        <h3><i class="fa fa-angle-right"></i> Gender Chart</h3>
                        <div id="hero-donut1"></div>
                    </div>
                    <div class="col-lg-4">
                        <h3><i class="fa fa-angle-right"></i> Age Chart</h3>
                        <div id="hero-bar"></div>
                    </div>
                    <div class="col-lg-4">
                        <h3><i class="fa fa-angle-right"></i> Grade Chart</h3>
                        <div id="hero-donut2"></div>
                    </div>
                </div>
            </div>
            <!-- page end-->

            <div class="row mt">
                <div class="col-lg-6">
                    <h4><i class="fa fa-angle-right"></i> Best-Seller(Author)</h4>
                    <section id="unseen">
                        <table class="table table-bordered table-striped table-condensed">
                            <thead>
                            <tr>
                                <th width="50%">제목</th>
                                <th>작가</th>
                                <th class="numeric">관리</th>
                                <th class="numeric">평점</th>
                                <th class="numeric">판매량</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${noFreeBestList}" var="noFree">
	                            <tr>
	                                <td>${noFree.title}</td>
	                                <td>${noFree.username}</td>
	                                <td class="numeric">
	                                  <c:if test="${noFree.grade eq '작가'}">유료</c:if>
									  <c:if test="${noFree.grade eq '일반'}">무료</c:if>
	                                </td>
	                                <td class="numeric">${noFree.starpoint}</td>
	                                <td class="numeric">${noFree.sellcnt}</td>
	                            </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </section>
                </div><!-- /col-lg-6 -->
                <div class="col-lg-6">
                    <h4><i class="fa fa-angle-right"></i> Best-Seller(General)</h4>

                        <table class="table table-bordered table-striped table-condensed">
                            <thead>
                            <tr>
                                <th width="50%">제목</th>
                                <th>작가</th>
                                <th class="numeric">관리</th>
                                <th class="numeric">평점</th>
                                <th class="numeric">다운로드</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${freeBestList}" var="free">
	                            <tr>
	                                <td>${free.title}</td>
	                                <td>${free.username}</td>
	                                <td class="numeric">
	                                  <c:if test="${free.grade eq '작가'}">유료</c:if>
									  <c:if test="${free.grade eq '일반'}">무료</c:if>
	                                </td>
	                                <td class="numeric">${free.starpoint}</td>
	                                <td class="numeric">${free.sellcnt}</td>
	                            </tr>
                            </c:forEach>
                            </tbody>
                        </table>

                </div><!-- /col-lg-6 -->
            </div><!-- /row -->
            <!--footer start-->
            <footer class="site-footer">
                <div class="text-center" style="color: #f7c8c8">
                    2015 - 함박웃음
                </div>
            </footer>
            <!--footer end-->
        </section>
    </section><!-- /MAIN CONTENT -->
</section>
<!-- js placed at the end of the document so the pages load faster -->
<script src="/resources/js/jquery.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery.dcjqaccordion.2.7.js"></script>
<script src="/resources/js/jquery.scrollTo.min.js"></script>
<script src="/resources/js/jquery.nicescroll.js" type="text/javascript"></script>


<!--common script for all pages-->
<script src="/resources/js/common-scripts.js"></script>
<script src="/resources/js/unitype-common.js"></script>

<!--script for this page-->
<script src="/resources/morris/raphael-min.js"></script>
<script src="/resources/morris/morris.min.js" charset="euc-kr"></script>
<script src="/resources/morris/morris.js" charset="euc-kr"></script>

<script>
    console.log($('input[name=age]').attr('value'));

    Morris.Donut({
      element: 'hero-donut1',
      data: [
        {label: 'Female', value: $('#female').attr('value') },
        {label: 'Male', value: $('#male').attr('value') }
       
      ],
        colors: ['#ff9231', '#ffc550'],
        formatter: function (y) { return y + "%" }
    });

    Morris.Bar({
      element: 'hero-bar',
      data: [
		{device: "under", figure: 10},
        {device: "10's", figure: 236},
        {device: "20's", figure: 437},
        {device: "30's", figure: 475},
        {device: "40's", figure: 280},
        {device: "50's", figure: 155},
        {device: "60's", figure: 90},
        {device: "over", figure: 10},
      ],
      xkey: 'device',
      ykeys: ['figure'],
      labels: ['Figure'],
      barRatio: 0.4,
      xLabelAngle: 35,
      hideHover: 'auto',
      barColors: ['#7cded5']
    });
     
    Morris.Donut({
      element: 'hero-donut2',
      data: [
        {label: 'Author', value: $('#author').attr('value') },
        {label: 'General', value: $('#general').attr('value') }
      ],
      colors: ['#83389b', '#cca5d7'],
      formatter: function (y) { return y + "%" }
    });

</script>
</body>
</html>