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
    <link href="/resources/font-awesome/css/font-awesome.css" rel="stylesheet" /> <!-- 아이콘 -->
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
	            <button class="btn btn-default">메일로보내기</button>
	        </td>
	    </tr>
	    <tr>
	        <td>
	            <span style="font-size: 12px"><b>받는 사람 :</b>${member.username} (${member.userid})</span>
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
	            <button class="btn btn-default" type="submit">보내기</button>
	            <button class="btn btn-default" data-dismiss="modal">취소</button>
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


            var maximumByte = $maxcount.text() * 1; //var가 타입이 지정되지 않기 때문에, 숫자로 만들기 위해 1을 곱해준다.

            // update 함수는 keyup, paste, input 이벤트에서 호출한다.
            var update = function () {
                var before = $count.text() * 1;
                var str_len = $input.val().length;
                var cbyte = 0;
                var li_len = 0;
                for (i = 0; i < str_len; i++) {
                    var ls_one_char = $input.val().charAt(i);
                    if (escape(ls_one_char).length > 4) {
                        cbyte += 2; //한글이면 2를 더한다
                    } else {
                        cbyte++; //한글아니면 1을 다한다
                    }
                    if (cbyte <= maximumByte) {
                        li_len = i + 1;
                    }
                }
                // 사용자가 입력한 값이 제한 값을 초과하는지를 검사한다.
                if (parseInt(cbyte) > parseInt(maximumByte)) {
                    // alert('허용된 글자수가 초과되었습니다.\r\n\n초과된 부분은 자동으로 삭제됩니다.');
                    var str = $input.val();
                    var str2 = $input.val().substr(0, li_len);
                    $input.val(str2);
                    var cbyte = 0;
                    for (i = 0; i < $input.val().length; i++) {
                        var ls_one_char = $input.val().charAt(i);
                        if (escape(ls_one_char).length > 4) {
                            cbyte += 2; //한글이면 2를 더한다
                        } else {
                            cbyte++; //한글아니면 1을 다한다
                        }
                    }
                }
                $count.text(cbyte);
            };
            // input, keyup, paste 이벤트와 update 함수를 바인드한다
            $input.bind('input keyup keydown paste change', function () {
                setTimeout(update, 0)
            });
            update();
        });
    });
</script>
</body>
</html>
