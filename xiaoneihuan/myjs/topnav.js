$(function(){
	$("#a-publish").click(function(){
		$.ajax({
			url:"./toPublishGoods",
			type:"post",
			data:{ 
			 
		    },
			dataType:"text",
		    success:function(data){
				if (data==1) {
					window.location.href="./goPublish";
				}
				else{
					$("#loginModal").modal("show");
				}
			}
		});
	});
	
	
	//搜索按钮 
	$("#searchGoods").click(function(){
		$(this).attr("href","./getGoods?action=search&searchText="+$("#searchText").val());
	}); 
	//导航的三个
	$("#a-latest-time").attr("href","./getGoods?action=search&searchBy=publishTime");
	$("#a-hotgoods").attr("href","./getGoods?action=search&searchBy=clickRate");
	$("#a-recent-deal").attr("href","./getGoods?action=search&searchBy=endDate");
});

