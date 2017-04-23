<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
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
	<link rel="stylesheet" type="text/css" href="css/topnav.css" >
	<script src="jQuery/jquery.cookie.js" type='text/javascript' ></script>
	<script type="text/javascript" src="myjs/topnav.js"></script>
  </head>
  
  <body >
    <!-- 导航栏 -->
	<nav class="navbar  navinner" role="navigation">
		<div class="navbar-header" >
			<img src="images/font-logo.png" >
		</div>
		<div>
			<ul class="nav navbar-nav navbar-left">
				<li ><a href="index.jsp" >首页</a></li>
				<li ><a id="a-publish">我要发布 </a></li>
				<li class="dropdown">
				<a  class="dropdown-toggle" data-toggle="dropdown" >他人发布 <b class="caret"></b></a> 
					<ul class="dropdown-menu">
						<li><a id="a-latest-time" >最新发布</a></li>
						<li><a id="a-hotgoods" >热门物品</a></li>
						<li><a id="a-recent-deal" >最近交易</a></li>
					</ul></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li>
					<div class="navbar-form " >  
						<div class="form-group">
							<input type="text" class="form-control" id="searchText" placeholder="标题/发布人/学校/类别">
						</div>
						<a id="searchGoods"><input type="button"  class="btn btn-default" value="搜索"  /> </a>
					</div>  
				</li>
				<c:choose>
				 <c:when test="${empty currentUser}">
		                         <li id="loginIcon" ><a  id="login" >登陆/注册</a></li>
		         </c:when>
		   
		         <c:otherwise> 
		         	<li class="dropdown"  id="name"> 
						<a class="dropdown-toggle"   href="#" data-toggle="dropdown" id="a-name" >${currentUser}　<b class='caret'></b></a>
						<ul class="dropdown-menu" >  
							<li><a href="./goUserCenter">个人中心</a></li>
							<!-- <li><a href="#">消息：  <span class="badge pull-right " >3</span></a></li> -->
							<li><a href="suggestions.jsp">意见反馈</a></li>
							<li><a id="logout">退出</a></li>
						</ul>
			  		</li>
				</c:otherwise> 
				</c:choose>
				
			   
			</ul>
		</div>
	</nav>
	<jsp:include page="/WEB-INF/modal.jsp"></jsp:include>
  </body>
</html>
