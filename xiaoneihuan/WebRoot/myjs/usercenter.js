$(function(){
	var goodsId = 0 ;
	$(".changeStatus").click(function(){
			goodsId = $(this).attr("name");
			$("#selectModal").modal("show");
			$(".selections").css("background-color","grey");
			if($(this).prev().html()=="已交易"){
				$(".selections:eq(0)").css("background-color","#D9534F");
			}
			if($(this).prev().html()=="寻求交易"){
				$(".selections:eq(1)").css("background-color","#D9534F");
			}
			if($(this).prev().html()=="交易中"){
				$(".selections:eq(2)").css("background-color","#D9534F");
			}
	});
	$(".selections").click(function(){
		$(".selections").css("background-color","grey");
		$(".selections").attr("class","selections ");
		$(this).css("background-color","#D9534F");
		$(this).attr("class","selections active");
	});
	
	$("#submitChange").click(function(){
		$.ajax({
			url:"./updateGoodsStatus",
			data:{
					id:goodsId,
					status:$(".active").html()
			},
			type:"post",
			success:function(data){
				if(data!=0){
					$('#selectModal').modal('hide');
					$("#myModalLabel").text("修改成功");
					$("#tipModal").modal("show");
					$('#tip-icon').attr('class','glyphicon glyphicon glyphicon-ok');
					setTimeout("$('#tipModal').modal('hide');location.reload()", 2000);
				}else{
					$("#myModalLabel").text("修改失败");
					$("#tipModal").modal("show");
					$('#tip-icon').attr('class','glyphicon glyphicon glyphicon-remove');
					setTimeout("$('#tipModal').modal('hide');", 2000);
				}
			}
			
		});
	});
	$("#checkIdBtn").click(function(){
		$("#checkIdModal").modal("show");
	});
	
	$().ready(function() {
		 $("#checkIdForm").validate({
			 submitHandler: function(form) 
			   {      
			 $.ajax({
					url:"./checkUserStuId",
					data:{
				 			realName:$("#realNameForCheck").val(),
				 			stuId:$("#stuIdForCheck").val(),
							school:$("#li-userSchool").attr("name"),
							username:$("#p-username").attr("name"),
					},
					type:"post",
					success:function(data){
						if(data > 0){
							$('#checkIdModal').modal('hide');
							$("#myModalLabel").text("已提交，请耐心等待审核！");
							$("#tipModal").modal("show");
							$('#tip-icon').attr('class','glyphicon glyphicon glyphicon-ok');
							setTimeout("$('#tipModal').modal('hide');", 2000);
						}else{
							$("#myModalLabel").text("提交失败");
							$("#tipModal").modal("show");
							$('#tip-icon').attr('class','glyphicon glyphicon glyphicon-remove');
							setTimeout("$('#tipModal').modal('hide');", 2000);
						}
					}
					
				});
			   },  
		        debug:true,
		        rules: {
				   realNameForCheck: {
		  	        required: true,
		  	      },
		  	     stuIdForCheck: {
		  	        required: true,
		  	        digits:true
		  	      },
		  	    },
		  	    messages: {
		  	    	realNameForCheck: {
		  	        	required: "<span class='tips'>*请输入真实姓名</span>",
		  	      	},
		  	      	stuIdForCheck: {
		  	      		required:"<span class='tips'>*请输入学号</span>",
		  	      		digits:"<span class='tips'>*请输入正确的学号</span>"
		  	      	},
		  	    }
		    });
		});
	
});