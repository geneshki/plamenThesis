$(document).ready(function(){

	$(".cv").each(function(){
		var id = $(this).attr('id');
		var r_id = $(this).attr('name');

		$("#"+id+"c").click(function(){
			$.ajax({
					url:'words/dec_votes',
					method:'GET',
					data: {
	            		'word_id': id,
	            		'reg_id': r_id
	    			},
					dataType: "json"
				});
		});
	});

		

	$( document ).ajaxComplete(function(){
		location.reload(true);	
	});

});