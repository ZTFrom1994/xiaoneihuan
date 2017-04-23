$(function(){
	$("#loginIcon").css("display","inline");
	$("#logoutIcon").css("display","none");
	
	$("#register").click(function(){
		$("#loginModal").modal("hide");
		$("#registerModal").modal("show");
	});
	$("#login").click(function(){
		$("#loginModal").modal("show");
	});
	$("#loginNow").click(function(){
		$("#registerModal").modal("hide");
		$("#loginModal").modal("show");
	});
	//check the username whether enabled
	$("#r-username").change(function(){
		$.ajax({
			url:"./checkUsername",
			data:{
					username:$("#r-username").val()
			},
			type:"post",
			success:function(data){
				if(data==0){
					//username is repeat
					$("#r-username").attr("data-toggle","tooltip");
				    $("#r-username").attr("data-placement","auto");
				    $("#r-username").attr("title","此用户名被注册过了，换个名字吧！");
				    $("#r-username").attr("data-trigger","manual");
				    $("#r-username").tooltip("show");
				}else{
					 $("#r-username").tooltip("hide");
				}
			}
			
		});
	});
	

	//register
	$("#registerbtn").click(function(){
		var upattern =/^[a-zA-Z\d]\w{6,10}[a-zA-Z\d]$/;
		var ppattern =/^[a-zA-Z\d]\w{4,8}[a-zA-Z\d]$/;  
		
		if(!upattern.test($("#r-username").val())){
			    $("#r-username").attr("data-toggle","tooltip");
			    $("#r-username").attr("data-placement","auto");
			    $("#r-username").attr("title","用户名必须由8-12位字母 、数字及下划线组成");
			    $("#r-username").attr("data-trigger","manual");
			    $("#r-username").tooltip("show");
		}
		else if(!ppattern.test($("#r-password").val())){
			$("#r-password").attr("data-toggle","tooltip");
		    $("#r-password").attr("data-placement","auto");
		    $("#r-password").attr("title","密码由6-10位数字、字母组成");
		    $("#r-password").attr("data-trigger","manual");
		    $("#r-username").tooltip("hide");
		    $("#r-password").tooltip("show");
		}
		else if($("#r-password").val()!=$("#checkpsd").val()) {
			$("#checkpsd").attr("data-toggle","tooltip");
		    $("#checkpsd").attr("data-placement","auto");
		    $("#checkpsd").attr("data-trigger","manual");
		    $("#checkpsd").attr("title","两次输入的密码不一致");
		    $("#r-username").tooltip("hide");
		    $("#r-password").tooltip("hide");
		    $("#checkpsd").tooltip("show");
		    setTimeout("$('#checkpsd').tooltip('hide');", 2000);
		}
		else if($(".select-school").find("option:selected").text()=="请选择学校"){
			$(".select-school").attr("data-toggle","tooltip");
		    $(".select-school").attr("data-placement","auto");
		    $(".select-school").attr("data-trigger","manual");
		    $(".select-school").attr("title","请选择学校");
		    $("#r-username").tooltip("hide");
		    $("#r-password").tooltip("hide");
		    $("#checkpsd").tooltip("hide");
		    $(".select-school").tooltip("show");
		}else if($(".select-sex").find("option:selected").text()=="请选择性别"){
			$(".select-sex").attr("data-toggle","tooltip");
		    $(".select-sex").attr("data-placement","auto");
		    $(".select-sex").attr("data-trigger","manual");
		    $(".select-sex").attr("title","请选择性别");
		    $("#r-username").tooltip("hide");
		    $("#r-password").tooltip("hide");
		    $("#checkpsd").tooltip("hide");
		    $(".select-school").tooltip("hide");
		    $(".select-sex").tooltip("show");
		}else{
			$("#r-username").tooltip("hide");
		    $("#r-password").tooltip("hide");
		    $("#checkpsd").tooltip("hide");
		    $(".select-school").tooltip("hide");
		    $(".select-sex").tooltip("hide");
		$.ajax({
			url:"./registerUser",
			type:"post",
			data:{
				username:$("#r-username").val(),
				password:$("#r-password").val(),
				school:$(".select-school").find("option:selected").text(),
				sex:$(".select-sex").find("option:selected").text(),
		    },
			dataType:"text",
		    success:function(data){
				if (data>0) {
					$("#myModalLabel").text("注册成功");
					$("#tipModal").modal("show");
					$("#name").css("display","inline");
					$("#loginIcon").css("display","none");
					$('#tip-icon').attr('class','glyphicon glyphicon glyphicon-ok');
					 setTimeout("$('#tipModal').modal('hide');$('#registerModal').modal('hide');location.reload();", 2000);
				} else {
					$("#tip-icon").attr("class","glyphicon glyphicon-remove"); 
					$("#myModalLabel").text("注册失败 "); 
					$("#tipModal").modal("show");
					setTimeout("$('#tipModal').modal('hide');location.reload();", 2000);
				}
			}
		});
		}
	});
//	window.alert($.cookie('username'));
	if($.cookie('username') != null){
		$("#l-password").focus();
		$("#l-username").val($.cookie('username'));
	}
	//登陆
	$("#loginbtn").click(function(){
		if($("#l-username").val()!=""){
			$("#l-username").css("border","1px solid #ccc");
			if($("#l-password").val()!=""){
				$("#l-password").css("border","1px solid #ccc");
				$.ajax({
					url:"./login",
					type:"post",
					data:{
						username:$("#l-username").val(),
						password:$("#l-password").val(),
				    },
					dataType:"text",
				    success:function(data){
						if (data>0) {
							//设置记住账号的cookie
							if($("#rememberCheckBox").prop("checked")==true){
								if($.cookie("username")==null){
									$.cookie('username',$("#l-username").val(), { expires: 7 ,path: '/' });
								}else{
									$.cookie("username",$("#l-username").val());
								}
							}else{
								$.cookie('username',null, {path: '/' });
							}
							$("#myModalLabel").text("登陆成功");
							$("#tipModal").modal("show");
							$("#loginIcon").css("display","none");
							$("#name").css("display","inline");
							$('#tip-icon').attr('class','glyphicon glyphicon glyphicon-ok');
							setTimeout("$('#tipModal').modal('hide');$('#loginModal').modal('hide');location.reload();", 2000);
						} else {
							$("#tip-icon").attr("class","glyphicon glyphicon-remove"); 
							$("#myModalLabel").text("用户名或密码错误！"); 
							$("#tipModal").modal("show");
							setTimeout("$('#tipModal').modal('hide');", 2000);
						}
						
					}
				});
			}else{
				$("#l-password").css("border","1px solid red");
			}
		}else{
			$("#l-username").css("border","1px solid red");
		}
	});
	
	//logout
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
					setTimeout("$('#tipModal').modal('hide');location.reload();", 2000);
				} else {
					window.alert("退出失败");
				}
			}
		});
	});
   
}
);

