$(document).ready(function(){
		
			
			$("#id").each(function(){

				var id = $("#id").text();
				$("#down").click(function(){
				$.ajax({
					url:'words/dec_votes',
					method:'GET',
					data: {
	            		'word': id
	    			},
					dataType: "json"
				});

			});
			$("#up").click(function(){
				$.ajax({
					url:'words/inc_votes',
					method:'GET',
					data: {
	            		'word': id
	    			},
					dataType: "json"
				});

			});

			});
		$( document ).ajaxComplete(function(){
			location.reload(true);	
		});
				
		});