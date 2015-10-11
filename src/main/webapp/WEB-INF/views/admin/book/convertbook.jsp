<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>Book Register</title>
    <!-- Bootstrap core CSS -->
    <link href="/resources/css/bootstrap.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="/resources/css/style.css" rel="stylesheet">
</head>
<style>
	.hide{
        display: none;
    }
</style>
<body>
<br style="font-size: 12px;">
<table width="94%" style=" padding: 10px;">
    <br>
    <tr>
        <td width="70%" style="text-align: center">
            <span style="font-size: 15px; color: #888888;padding-left: 10px; text-decoration: underline">
                <i class="fa fa-angle-right"></i>
                컨텐츠명 : ${book.title}
            </span>
        </td>
        <td align="center">
            <button class="btn btn-default">
                <span onClick="window.open('readbookpdf', '', 'top=150, left=400, width=500, height=500'); return false;">PDF다운로드</span>
            </button>
        </td>
    </tr>
    <tr>
        <td class="text-center" colspan="2" style="padding-left: 10px">
            <br>
           승인을 하면 해당 책을 사용자가 열람하는 것이 가능해집니다.
           
        </td>
    </tr>
    <tr>
   		<td class="text-center hide" id="reasonLocation" colspan="2" style="padding-left: 20px">
   			<form id="permitForm" action="convertbook" method="post">
				<input type="hidden" name="bookno" value="${book.bookno}">
				<input type="hidden" name="permitstate">

		   		<br><br><label style="width:90%; padding-left: 1px; text-align: left;">비승인 이유:</label>
	   			<textarea class="contents" name="reason" style="width:90%;  resize: none" rows="3" placeholder="10자 이상 입력해주세요"></textarea>
	   			<p style="width:95%;text-align: right;"><span class="count">0</span>/<span class="maxcount">100</span> Byte</p>
		   	</form>
   		</td>
   	</tr>
    <tr>
        <td colspan="2" align="center" style="padding-top: 10px; padding-bottom: 10px">
            <br>
            <input class="hide btn btn-default" type="button" id="ok" name="permit" value="확인" disabled>
            <input class="btn btn-default" type="button" id="yes" value="승인">
            <input class="btn btn-default" type="button" id="no" value="비승인">
            <button class="btn btn-default" data-dismiss="modal">취소</button>
        </td>
    </tr>
</table>

<script type="text/javascript">
	$('#yes').on('click', function(){
		if(confirm("해당 책의 상용화를 승인하시겠습니까?")){
			$('#permitForm').find('input[name=reason]').remove();
			$('#permitForm').find('input[name=permitstate]').attr('value', '승인');
			$('#permitForm').submit();
		}
	});
	
	$('#no').on('click', function(){
		$('#reasonLocation').removeClass('hide');
		$('#yes').remove();
		$('#no').remove();
		$('#ok').removeClass('hide');
	});
	
	$('.contents').on('input', function(){
		if(this.value.length == 10){
 		  $('#ok').removeAttr("disabled");
		}
		if(this.value.length < 10){
	 	  $('#ok').attr("disabled", "disabled");
		}
	});
	
	$('#ok').on('click', function(){
		if(confirm("해당 책의 상용화를 비승인하시겠습니까?")){
			$('#permitForm').find('input[name=permitstate]').attr('value', '비승인');
			$('#permitForm').submit();
		}
	});
	
	$(function () {
        $('#reasonLocation').each(function () {
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