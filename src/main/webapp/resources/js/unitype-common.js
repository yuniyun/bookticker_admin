/**
 * 
 */

var post = $('#postForm');
$('.logout').click(function(){
	post.attr('action', '/logout');
	post.submit();
});