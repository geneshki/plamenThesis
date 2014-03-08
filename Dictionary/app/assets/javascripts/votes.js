$(document).ready(function(){
		
			$(".span7").each(function(){
					
				var id = $(this).attr('id');
				
				$("#d"+id).click(function(){
				
				$.ajax({
					url:'words/dec_votes',
					method:'GET',
					data: {
	            		'id': id
	    			},
					dataType: "json"
				});

			});
			$("#u"+id).click(function(){
				
				$.ajax({
					url:'words/inc_votes',
					method:'GET',
					data: {
	            		'id': id
	    			},
					dataType: "json"
				});

			});

			});
		$( document ).ajaxComplete(function(){
			location.reload(true);	
		});
				
});