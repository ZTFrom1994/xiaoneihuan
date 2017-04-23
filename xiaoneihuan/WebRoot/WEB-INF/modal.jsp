<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="css/modal.css" rel="stylesheet" type="text/css">
  </head>
  
  <body> 	
    <!-- login模态框（Modal） -->
	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog"
		aria-labelledby="LoginModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header modal-header-style">
					<h3 class="modal-title" id="LoginModalLabel">
						<p class="text-center">
							<span class="glyphicon glyphicon-user">登录Here</span>
						</p>
					</h3>
				</div>
				<div class="modal-body ">
					<input  autofocus="autofocus" required="required" id="l-username"
						class="form-control form-in-style "  placeholder="请输入用户名" maxlength="12"
						name="username" type="text"> 
					<input autofocus="autofocus"
						id="l-password" required="required"
						class="form-control form-in-style" placeholder="请输入密码" maxlength="10"
						name="password" type="password">
					<div class="checkbox">
						<label> <input id="rememberCheckBox" type="checkbox" >记住账号
						</label>
					</div>
					<button type="submit" id="loginbtn"
						class="btn btn-primary btn-lg btn-block" >登录</button>
				</div>
				
				<div class="modal-footer-style">
					<p>
						<a >忘记密码？</a><a  id="register">注册</a>
					</p>
				</div>
			</div>
		</div>
	</div>
	
	<!-- register模态框（Modal） -->
	<div class="modal fade" id="registerModal" tabindex="-1" role="dialog"
		aria-labelledby="registerModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header modal-header-style">
					<!-- <button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button> -->
					<h3 class="modal-title" id="registerModalLabel">
						<p class="text-center">
							<span class="glyphicon glyphicon-user"> 注册Here</span>
						</p>
					</h3>
				</div>
				<div class="modal-body ">
					<input autofocus="autofocus" class="form-control form-in-style"
						placeholder="请输入用户名" id="r-username" name="username" value="" maxlength="12"
						type="text">
					<input autofocus="autofocus"
						class="form-control form-in-style" placeholder="请输入密码" maxlength="10"
						id="r-password" value="" name="password" type="password">
					<input autofocus="autofocus" class="form-control form-in-style" maxlength="10"
						placeholder="确认密码" id="checkpsd" name="checkpsd" type="password">
				   <select class="select-school"  style="width:47%;">
										         <option>请选择学校</option>
										         <option>西安建筑科技大学</option>
										         <option>西北工业大学</option>
										         <option>西安文理学院</option>
										         <option>西安交通大学</option>
      				</select>
      				<select class="select-sex"  style="width:50%;">
										         <option>请选择性别</option>
										         <option>男</option>
										         <option>女</option>
      				</select>
					<button id="registerbtn" class="btn btn-primary btn-lg btn-block" style="margin-top:10px">确定</button>
				</div>
				<div class="modal-footer-style">
					<p>
						已有账号？<a id="loginNow">立即登录</a>
					</p>
				</div>
			</div>
		</div>
	</div>

	<!-- 提示模态框 -->
	<div class="modal fade" id="tipModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog"
			style="width:400px;text-align:center;top:15px;">
			<div class="modal-content">
				<div class="modal-header" style="text-align:center;">
					<h4 class="modal-title" id="myModalLabel">注册成功！</h4>
				</div>
				<div class="modal-body" style="text-align:center;">
					<span id="tip-icon"
						style="text-align:center;font-size:240px;border-top:1px solid #EBEBEB"
						class=" glyphicon glyphicon-ok"></span>
				</div>

			</div>
		</div>
	</div>
  </body>
</html>
