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
                                onClick="window.open('book_read.html', '', 'top=150, left=400, width=500, height=500'); return false;">���뺸��</button>
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
	                            <td style="font-size: 13px; font-weight: bold; width: 24%">å�̸�</td>
	                            <td>${book.title}</td>
	                        </tr>
	                        <tr>
	                            <td style="font-size: 13px; font-weight: bold">����</td>
	                            <td>${book.username}</td>
	                        </tr>
	                        <tr>
	                            <td style="font-size: 13px; font-weight: bold">ī�װ�</td>
	                            <td>
	                            	<select name="bookcategory">
										<option value="�Ҽ�/��"
										  <c:if test="${book.bookcategory eq '�Ҽ�/��'}">selected</c:if>>�Ҽ�/��</option>
										<option value="����"
										  <c:if test="${book.bookcategory eq '����'}">selected</c:if>>����</option>
										<option value="�θǽ�"
										  <c:if test="${book.bookcategory eq '�θǽ�'}">selected</c:if>>�θǽ�</option>
										<option value="��Ÿ��"
										  <c:if test="${book.bookcategory eq '��Ÿ��'}">selected</c:if>>��Ÿ��</option>
										<option value="SF"
										  <c:if test="${book.bookcategory eq 'SF'}">selected</c:if>>SF</option>
										<option value="������"
										  <c:if test="${book.bookcategory eq '������'}">selected</c:if>>������</option>
										<option value="�ڱ���"
										  <c:if test="${book.bookcategory eq '�ڱ���'}">selected</c:if>>�ڱ���</option>
										<option value="�����濵"
										  <c:if test="${book.bookcategory eq '�����濵'}">selected</c:if>>�����濵</option>
										<option value="��ȸ����"
										  <c:if test="${book.bookcategory eq '��ȸ����'}">selected</c:if>>��ȸ����</option>
										<option value="�ι���"
										  <c:if test="${book.bookcategory eq '�ι���'}">selected</c:if>>�ι���</option>
										<option value="����"
										  <c:if test="${book.bookcategory eq '����'}">selected</c:if>>����</option>
										<option value="û�ҳ�"
										  <c:if test="${book.bookcategory eq 'û�ҳ�'}">selected</c:if>>û�ҳ�</option>
										<option value="����/���߹�ȭ"
										  <c:if test="${book.bookcategory eq '����/���߹�ȭ'}">selected</c:if>>����/���߹�ȭ</option>
										<option value="����/����"
										  <c:if test="${book.bookcategory eq '����/����'}">selected</c:if>>����/����</option>
										<option value="��ȭ"
										  <c:if test="${book.bookcategory eq '��ȭ'}">selected</c:if>>��ȭ</option>
										<option value="���"
										  <c:if test="${book.bookcategory eq '���'}">selected</c:if>>���</option>
									</select>
	                            </td>
	                        </tr>
	                        <tr>
	                            <td style="font-size: 13px; font-weight: bold">����</td>
	                            <td>
	                                <c:if test="${book.grade eq '�۰�'}">����</c:if>
                              		<c:if test="${book.grade eq '�Ϲ�'}">����</c:if>
	                            </td>
	                        </tr>
	                        <tr>
	                            <td style="font-size: 13px; font-weight: bold">�����</td>
	                            <td>2015.06.27</td>
	                        </tr>
	                        <tr>
	                            <td style="font-size: 13px; font-weight: bold">�Ұ���</td>
	                            <td><textarea name="overview" style="width:100%; resize: none" rows="6">${book.overview}</textarea></td>
	                        </tr>
	                    </table>
		            </form>
                    <div class="row" align="center">
                        <button class="btn btn-default" id="modifyBook" style="font-size: 12px;">���</button>
                        <button class="btn btn-default" id="cancel" style="font-size: 12px;" data-dismiss="modal">���</button>
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
		if(confirm('�������� ���� �Ͻðڽ��ϱ�?')){
			$('#modiForm').submit();
		}
	});
</script>
</body>
</html>
