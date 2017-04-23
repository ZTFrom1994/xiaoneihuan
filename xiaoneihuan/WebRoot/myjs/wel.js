$(function(){
	$("#in-button").hide(); 
	$(".jumbotron>p").hide();
	$("#in-button").delay(600).animate({top: '-80px'}, "slow");
	$("#myCarousel").delay(600).animate({top: '-80px'}, "slow");
	$("#in-button").fadeIn("slow");
	$(".jumbotron>p").delay(700).fadeIn("slow");
	$("#about").mouseover(function(){
		$("#about>b").animate({top:"40px"},500);
		$("#about>p").animate({top:"-30px"},500);
	});
	
	$("#service").mouseover(function(){
		$("#service1").animate({left:"500px"},700);
		$("#service2").animate({left:"550px"},800);
		$("#service3").animate({left:"600px"},900); 
	});
	
	$("#team").mouseover(function(){
		$("#team-introduce>img").animate({left:"180px"},"slow");
		$("#text").animate({left:"-170px"},"slow");
	});
	
	
	
	$("#t-home").click(function(){
		$("html,body").animate({scrollTop: $("#home").offset().top}, 1000); 
		});
	$("#t-about").click(function(){
		$("html,body").animate({scrollTop: $("#about").offset().top-90}, 1000); 
		$("#about>b").delay(1000).animate({top:"40px"},500);
		$("#about>p").delay(1000).animate({top:"-30px"},500); 
		});
	$("#t-service").click(function(){
		$("html,body").animate({scrollTop: $("#service").offset().top-90}, 1000); 
		$("#service1").delay(1000).animate({left:"500px"},700);
		$("#service2").delay(1000).animate({left:"550px"},800);
		$("#service3").delay(1000).animate({left:"600px"},900); 
		});
	$("#t-contact").click(function(){
		$("html,body").animate({scrollTop: $("#contact").offset().top-90}, 1000); 
		});
	$("#t-team").click(function(){
		$("html,body").animate({scrollTop: $("#team").offset().top-90}, 1000); 
		$("#team-introduce>img").delay(1000).animate({left:"180px"},"slow");
		$("#text").delay(1000).animate({left:"-170px"},"slow");
		});
	
}); 	
	
