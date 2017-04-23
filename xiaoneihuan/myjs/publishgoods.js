$(function(){
	//登录检查
	$.ajax({
		url:"./loginCheck", 
		type:"post",
		data:{},
		dataType:"text",
		success:function(data){
			if(data==0){ 
				window.location.href="index.jsp";
			}
		}
	});
	
	$("#publish-btn").click(function(){
		//可上传的条件
		//所有的东西都填了
		var errorMsg="出现一些问题：";
		if($("#title").val()!=""){
				if($("#contactName").val()!=""){
					if($("#contactNumber").val()!=""){
						if($("#qqNumber").val()!=""){
							if($(".myselect:eq(0)").find("option:selected").text()!="请选择新旧程度"){
								if($(".myselect:eq(1)").find("option:selected").text()!="请选择大类别"){
									if($(".myselect:eq(2)").find("option:selected").text()!="请选择小类别"){
										if($(".myselect:eq(3)").find("option:selected").text()!="请选择所在城市"){
											if($(".myselect:eq(4)").find("option:selected").text()!="请选择学校名称"){
												if($("#intro").val()!=""){
													if($("#img-flag").html()=="1"){
														$("#confirmModal").modal("show");
													}else{
														errorMsg="*至少上传一张图片\n";
														$("#tips").html(errorMsg);
														$("#tips-div").css("display","block");
													}
												}
												else{
													errorMsg="*请填写简介 \n";
													$("#tips").html(errorMsg);
													$("#tips-div").css("display","block");
												}
											}else{
												errorMsg="*请选择学校\n";
												$("#tips").html(errorMsg);
												$("#tips-div").css("display","block");
											}
										}else{
											errorMsg="*请选择所在城市\n";
											$("#tips").html(errorMsg);
											$("#tips-div").css("display","block");
										}
									}else{
										errorMsg="*请选择小类别\n";
										$("#tips").html(errorMsg);
										$("#tips-div").css("display","block");
									}
								}else{
									errorMsg="*请选择大类别\n";
									$("#tips").html(errorMsg);
									$("#tips-div").css("display","block");
								}
							}else{
								errorMsg="*请选择新旧程度\n";
								$("#tips").html(errorMsg);
								$("#tips-div").css("display","block");
							}
						}else{
							errorMsg="*请填写QQ号码\n";
							$("#tips").html(errorMsg);
							$("#tips-div").css("display","block");
						}
					}else{
						errorMsg="*请填写联系人电话\n";
						$("#tips").html(errorMsg);
						$("#tips-div").css("display","block");
					}	
				}else{
					errorMsg="*请填写联系人姓名\n";
					$("#tips").html(errorMsg);
					$("#tips-div").css("display","block");
				}
		}else{
			errorMsg="*请填写标题\n";
			$("#tips").html(errorMsg);
			$("#tips-div").css("display","block");
		}
	});
	$("#agreementCheckBox").change(function() {
		  if($(this).prop("checked")==true){
			  $("#confirmSubmitBtn").attr("class","btn btn-primary ");
		  }else{
			  $("#confirmSubmitBtn").attr("class","btn btn-primary disabled");
		  }
	 });
	$("#confirmSubmitBtn").click(function(){
		$("#confirmModal").modal("hide");
			$.ajax({
				url:"./publishGoods",
				type:"post",
				data:{ 
					title:$("#title").val(),
					intro:$("#intro").val(),
					contactName:$("#contactName").val(),
					contactNumber:$("#contactNumber").val(),
					qqNumber:$("#qqNumber").val(),
					mainClass:$(".myselect:eq(1)").find("option:selected").text(),
					condition:$(".myselect:eq(0)").find("option:selected").text(),
			        subClass:$(".myselect:eq(2)").find("option:selected").text(),
			        city:$(".myselect:eq(3)").find("option:selected").text(),
			        fromSchool:$(".myselect:eq(4)").find("option:selected").text()
			    },
				dataType:"text",
			    success:function(data){
					if (data==1) {
						$("#myModalLabel").text("发布成功");
						$("#tipModal").modal("show");
						$('#tip-icon').attr('class','glyphicon glyphicon glyphicon-ok');
						 setTimeout("$('#tipModal').modal('hide');location.href='./getGoods?action=search&searchText="+$("#title").val()+"'", 2000);
					}
					else{
						$(".p-tip:eq(0)").text("　");
						$(".p-tip:eq(1)").text("　");
						$("#myModalLabel").text("发布失败");
						$("#tipModal").modal("show");
						$('#tip-icon').attr('class','glyphicon glyphicon glyphicon-remove');
						 setTimeout("$('#tipModal').modal('hide');", 2000);
					}
				}
			});
	});
	
	$(".myselect:eq(1)").click(function(){
		     // 先清空第二个
		$(".myselect:eq(2)").empty();
		$(".myselect:eq(2)").append($("<option>").text("请选择小类别")); 
		if ($(".myselect:eq(1)").find("option:selected").text()=='生活类'){
			$(".myselect:eq(2)").append($("<option>").text("衣服/裤子"));
			$(".myselect:eq(2)").append($("<option>").text("鞋子/手套"));
			$(".myselect:eq(2)").append($("<option>").text("香水/美妆"));
		}else if($(".myselect:eq(1)").find("option:selected").text()=='数码类'){
			$(".myselect:eq(2)").append($("<option>").text("手机/通讯"));
			$(".myselect:eq(2)").append($("<option>").text("电脑/平板"));
			$(".myselect:eq(2)").append($("<option>").text("MP3/DV"));
		}
		else if($(".myselect:eq(1)").find("option:selected").text()=='运动类'){
			$(".myselect:eq(2)").append($("<option>").text("运动装备"));
			$(".myselect:eq(2)").append($("<option>").text("户外/旅行"));
			$(".myselect:eq(2)").append($("<option>").text("自行车/配件"));
		}
		else if($(".myselect:eq(1)").find("option:selected").text()=='文娱类'){
			$(".myselect:eq(2)").append($("<option>").text("书籍/书刊"));
			$(".myselect:eq(2)").append($("<option>").text("乐器/植物"));
			$(".myselect:eq(2)").append($("<option>").text("手办/模型"));
		}
	});
	// logout
	$("#logout").click(function(){
		$.ajax({
			url:"./logout", 
			type:"post",
			data:{
			
		    },
			dataType:"text",
		    success:function(data){
				if (data>0) {
					$("#myModalLabel").text("退出成功");
					$("#tipModal").modal("show");
					$("#loginIcon").css("display","inline");
					$("#name").css("display","none");
					setTimeout("$('#tipModal').modal('hide');", 2000);
					setTimeout("window.location.href='index.jsp';", 2000);
					
				} else {
					window.alert("退出失败");
				}
			}
		});
	});
});
