$(function(){
	$.ajax({ 
		url:"./getPageNow",
		type:"post",
		data:{
	    },
		dataType:"text",
	    success:function(data){
	    	$(".pagination>li>a[name='"+data+"']").parent().attr("class","active");
		}
	}); 
	if($("#goodsEmpty").find("p").length!=0){
		$("#paging").css("display","none"); 
	}else{
		$("#paging").css("display","block");
	}
//	//缩略图点击
	$(".small-imgs > img").click(function(){
		$(this).parent().parent().prev().find("img").attr("src",$(this).attr("src"));
	});
	 $(window).parallaxmouse({
	        invert: true,
	        range: 400,
	        elms: [
	            {el: $('#warpbg'), rate: 0.2},
	            {el: $('#star1'), rate: 0.1},
	            {el: $('#star2'), rate: 0.15},
	            {el: $('#star3'), rate: 0.2},
	            {el: $('#star4'), rate: 0.15},
	            {el: $('#star5'), rate: 0.2},
	            {el: $('#planet'), rate: 0.2},
	            {el: $('#robot'), rate: 0.13},
	            {el: $('#astronaut'), rate: 0.1},
	            {el: $('#asteroid'), rate: 0.2}
	        ]
	    });
});
