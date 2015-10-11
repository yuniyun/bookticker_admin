<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>Send Message</title>
    <!-- Bootstrap core CSS -->
    <link href="/resources/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="/resources/font-awesome/css/font-awesome.css" rel="stylesheet" /> <!-- ������ -->
    <link href="/resources/lightbox-master/dist/ekko-lightbox.css" rel="stylesheet">
    
	<!-- Custom styles for this template -->
    <link href="/resources/css/style.css" rel="stylesheet">
    <link href="/resources/css/style-responsive.css" rel="stylesheet">
</head>
<body>
<form method="post" action="/admin/message/sendmsg">
	<input type="hidden" name="userid" value="${member.userid}">
	<table width="94%" style="margin: 2% 3% 2% 3%;">
	    <tr>
	        <td align="right">
	            <button class="btn btn-default">���Ϸκ�����</button>
	        </td>
	    </tr>
	    <tr>
	        <td>
	            <span style="font-size: 12px"><b>�޴� ��� :</b>${member.username} (${member.userid})</span>
	        </td>
	    </tr>
	    
	    <tr>
	        <td class="tbyte" style="text-align: right;">
	            <textarea class="contents" name="msg" style="width:100%;  resize: none" rows="10"></textarea>
	            <p><span class="count">0</span>/<span class="maxcount">1000</span> Byte</p>
	        </td>
	    </tr>
	    <tr>
	        <td align="right">
	        </td>
	    </tr>
	    <tr>
	        <td align="center">
	            <button class="btn btn-default" type="submit">������</button>
	            <button class="btn btn-default" data-dismiss="modal">���</button>
	        </td>
	    </tr>
	</table>
</form>
<script src="/resources/lightbox-master/dist/ekko-lightbox.js"></script>
<script>
    $(function () {
        $('.tbyte').each(function () {
            var $maxcount = $('.maxcount', this);
            var $count = $('.count', this);
            var $input = $(".contents", this);


            var maximumByte = $maxcount.text() * 1; //var�� Ÿ���� �������� �ʱ� ������, ���ڷ� ����� ���� 1�� �����ش�.

            // update �Լ��� keyup, paste, input �̺�Ʈ���� ȣ���Ѵ�.
            var update = function () {
                var before = $count.text() * 1;
                var str_len = $input.val().length;
                var cbyte = 0;
                var li_len = 0;
                for (i = 0; i < str_len; i++) {
                    var ls_one_char = $input.val().charAt(i);
                    if (escape(ls_one_char).length > 4) {
                        cbyte += 2; //�ѱ��̸� 2�� ���Ѵ�
                    } else {
                        cbyte++; //�ѱ۾ƴϸ� 1�� ���Ѵ�
                    }
                    if (cbyte <= maximumByte) {
                        li_len = i + 1;
                    }
                }
                // ����ڰ� �Է��� ���� ���� ���� �ʰ��ϴ����� �˻��Ѵ�.
                if (parseInt(cbyte) > parseInt(maximumByte)) {
                    // alert('���� ���ڼ��� �ʰ��Ǿ����ϴ�.\r\n\n�ʰ��� �κ��� �ڵ����� �����˴ϴ�.');
                    var str = $input.val();
                    var str2 = $input.val().substr(0, li_len);
                    $input.val(str2);
                    var cbyte = 0;
                    for (i = 0; i < $input.val().length; i++) {
                        var ls_one_char = $input.val().charAt(i);
                        if (escape(ls_one_char).length > 4) {
                            cbyte += 2; //�ѱ��̸� 2�� ���Ѵ�
                        } else {
                            cbyte++; //�ѱ۾ƴϸ� 1�� ���Ѵ�
                        }
                    }
                }
                $count.text(cbyte);
            };
            // input, keyup, paste �̺�Ʈ�� update �Լ��� ���ε��Ѵ�
            $input.bind('input keyup keydown paste change', function () {
                setTimeout(update, 0)
            });
            update();
        });
    });
</script>
</body>
</html>
