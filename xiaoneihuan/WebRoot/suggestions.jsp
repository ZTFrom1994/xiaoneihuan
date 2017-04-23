<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>意见反馈</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<title>发布物品</title>
		<link rel="icon" href="img/huan_icon.ico" type="image/x-icon" />
		<link rel="shortcut icon" href="img/huan_icon.ico">
		<link rel="Bookmark" href="img/huan_icon.ico">
		<link rel="stylesheet" type="text/css"href="bootstrap-3.3.5/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="css/suggestions.css"/>
		<script src="jQuery/jquery-1.9.1.js" type="text/javascript" ></script>
		<script src="jQuery/jquery.validate.js"  type="text/javascript"></script>
		<script src="jQuery/messages_zh.js"  type="text/javascript"></script>
		<script src="bootstrap-3.3.5/js/bootstrap.min.js" type="text/javascript" ></script> 
		<script src="myjs/suggestions.js" ></script>
		<script type="text/javascript" src="myjs/login.js"></script>
	</head>
	
	<body>
	<jsp:include page="/WEB-INF/topnav.jsp"></jsp:include> 
		<div class="container" style="margin-top:30px">
			<div class="rows">
				<div class="col-md-3" style="height:auto;">
				<div clsss="list-group" >
					<a  class="list-group-item active">意见反馈</a>
					<a  class="list-group-item ">法律条款</a>
					<a  class="list-group-item ">关于我们</a>
					<a  class="list-group-item ">联系我们</a>
				</div>
				</div>
				<div class="col-md-9" style="height:auto;"> 
						<div class="panel panel-default" style="height:auto">
		   						<div class="panel-body" style="padding-top:0px">
		      						<div class="page-header" id="panelTitle" >
   												<h2>意见反馈</h2>
									</div>
		      						<form class="form-horizontal" role="form" id="suggestionsForm" >
										   <div class="form-group">
										      <label for="title" class="col-sm-2 control-label ">*标题</label>
										      <div class="col-sm-5">
										         <input type="text" class="form-control" id="title"  name="title"
										            placeholder="请输入标题"  >
										      </div>
										   </div>
										   <div class="form-group">
										      <label for="content" class="col-sm-2 control-label">内容:</label>
										      <div class="col-sm-7">
										        <textarea id="content" class="form-control" rows="14" placeholder="想对我们说：" name="content"></textarea> 
										      </div>
										   </div>
										   <div class="form-group">
										      <label for="title" class="col-sm-2 control-label ">联系邮箱:</label>
										      <div class="col-sm-5">
										         <input type="text" class="form-control" id="email"  name="email" style="float:left"
										            placeholder="请输入联系邮箱">
										      </div>
										   </div>
										   <div class="form-group">
										      <div class="col-sm-offset-2 col-sm-10">
										         <button type="submit" id="sumbitBtn" class="btn btn-default">提交</button>
										      </div>
										   </div>
										</form>
		   						</div>
						</div>
				</div>
			</div>
		</div>
		<jsp:include page="/WEB-INF/footer.jsp"></jsp:include>
	</body>
</html>
