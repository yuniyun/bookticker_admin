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
                �������� : ${book.title}
            </span>
        </td>
        <td align="center">
            <button class="btn btn-default">
                <span onClick="window.open('readbookpdf', '', 'top=150, left=400, width=500, height=500'); return false;">PDF�ٿ�ε�</span>
            </button>
        </td>
    </tr>
    <tr>
        <td class="text-center" colspan="2" style="padding-left: 10px">
            <br>
           ������ �ϸ� �ش� å�� ����ڰ� �����ϴ� ���� ���������ϴ�.
           
        </td>
    </tr>
    <tr>
   		<td class="text-center hide" id="reasonLocation" colspan="2" style="padding-left: 20px">
   			<form id="permitForm" action="convertbook" method="post">
				<input type="hidden" name="bookno" value="${book.bookno}">
				<input type="hidden" name="permitstate">

		   		<br><br><label style="width:90%; padding-left: 1px; text-align: left;">����� ����:</label>
	   			<textarea class="contents" name="reason" style="width:90%;  resize: none" rows="3" placeholder="10�� �̻� �Է����ּ���"></textarea>
	   			<p style="width:95%;text-align: right;"><span class="count">0</span>/<span class="maxcount">100</span> Byte</p>
		   	</form>
   		</td>
   	</tr>
    <tr>
        <td colspan="2" align="center" style="padding-top: 10px; padding-bottom: 10px">
            <br>
            <input class="hide btn btn-default" type="button" id="ok" name="permit" value="Ȯ��" disabled>
            <input class="btn btn-default" type="button" id="yes" value="����">
            <input class="btn btn-default" type="button" id="no" value="�����">
            <button class="btn btn-default" data-dismiss="modal">���</button>
        </td>
    </tr>
</table>

<script type="text/javascript">
	$('#yes').on('click', function(){
		if(confirm("�ش� å�� ���ȭ�� �����Ͻðڽ��ϱ�?")){
			$('#permitForm').find('input[name=reason]').remove();
			$('#permitForm').find('input[name=permitstate]').attr('value', '����');
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
		if(confirm("�ش� å�� ���ȭ�� ������Ͻðڽ��ϱ�?")){
			$('#permitForm').find('input[name=permitstate]').attr('value', '�����');
			$('#permitForm').submit();
		}
	});
	
	$(function () {
        $('#reasonLocation').each(function () {
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