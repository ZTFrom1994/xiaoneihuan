<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
		<title>出错了！</title>
		<link rel="icon" href="images/huan_icon.ico" type="image/x-icon" />
		<link rel="shortcut icon" href="images/huan_icon.ico">
		<link rel="Bookmark" href="images/huan_icon.ico">
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" type="text/css"
			href="bootstrap-3.3.5/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css"
			href="css/error.css">
			
	</head>

	<body>
		<div class="container font-center">
			<div class="rows">
					<img  src="images/error.png">
					<p><label><h1>出错了！</h1></label><a href="index.jsp">返回首页</a></p>
				</div>
			</div>
		</div>
	</body>
</html>
