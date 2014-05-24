$(document).ready(function(){

	$(".cv").each(function(){
		var id = $(this).attr('id');
		var r_id = $(this).attr('name');

		$("#pie").click(function(){
			$.ajax({
					url:'words/dec_votes',
					method:'GET',
					data: {
	            		'word_id': r_id,
	            		'reg_id': id
	    			},
					dataType: "json"
				});
		});
	});

		

	$( document ).ajaxComplete(function(){
		location.reload(true);	
	});

});