<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="UTF-8">
<!-- 引用控制层插件样式 -->
<link rel="stylesheet" href="control/css/zyUpload.css" type="text/css">
<!-- 引用核心层插件 -->
<script src="core/zyFile.js"></script>
<!-- 引用控制层插件 -->
<script src="control/js/zyUpload.js"></script>
<!-- 引用初始化JS -->
<script src="core/jq22.js"></script>
</head>
<body>
<div id="demo" class="demo"></div>
</body>
</html>