$(document).ready(function(){

	$(".cv").each(function(){

		var id = $(this).attr('id');
		
		var word_id = $(this).attr('name');

		$("#down"+id).click(function(){
			$.ajax({
					url:'words/dec_downvotes',
					method:'GET',
					data: {
	            		'user_id': id,
	            		'word_id': word_id
	    			},
					dataType: "json"
				});
		});

		$("#up"+id).click(function(){
			$.ajax({
					url:'words/dec_upvotes',
					method:'GET',
					data: {
	            		'user_id': id,
	            		'word_id': word_id
	    			},
					dataType: "json"
				});
		});

	});

	$( document ).ajaxComplete(function(){
		location.reload(true);	
	});

});