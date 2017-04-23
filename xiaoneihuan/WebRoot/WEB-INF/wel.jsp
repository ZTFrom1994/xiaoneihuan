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

<title>My JSP 'wel.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="bootstrap-3.3.5/css/bootstrap.min.css" rel="stylesheet">
<script src="jQuery/jquery-1.9.1.js"></script>
<script src="bootstrap-3.3.5/js/bootstrap.min.js"></script>
<script src="myjs/wel.js"></script>
<link href="css/wel.css" rel="stylesheet" type="text/css">
</head>

<body>
	<div class="d-body">
		<div class="title-nav">
			<div class="d-title">
				<a id="t-home"><b>HOME 首页</b></a>
			</div>
			<div class="d-title">
				<a id="t-team"><b>TEAM 团队</b></a>
			</div>
			<div class="d-title">
				<a id="t-service"><b>SERVICES 服务</b></a>
			</div>
			<div class="d-title">
				<a id="t-about"><b>ABOUT 关于</b></a>
			</div>
			<div class="d-title">
				<a id="t-contact"><b>CONTACT 联系</b></a>
			</div>
		</div>
	</div>
	<div id="home">
		<div id="myCarousel" class="carousel slide" data-ride="carousel"
			data-interval="4000">
			<div class="carousel-inner">
				<div class="item active">
					<div class="container">
						<div class="jumbotron">
							<h1>欢迎来到校内换</h1>
							<p>国内首家校园以物换物网络平台</p>
						</div>
					</div>
				</div>
				<div class="item">
					<div class="container">
						<div class="jumbotron">
							<h1>交换的乐趣</h1>
							<p>实现每个物品的价值</p>
						</div>
					</div>
				</div>
				<div class="item">
					<div class="container">
						<div class="jumbotron">
							<h1>不仅仅是交换</h1>
							<p>在这里可以找到兴趣相投的人</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="in-button">
			<a class="btn btn-primary btn-lg"
				href="./getAllGoods"> 立即进入</a>
		</div>
	</div>

	<div id="team">
		<div id="team-introduce">
			<img src="img/logo.png" id="logo" />
			<div id="text">
				<ul>
					<li><h3>组成自校园精英</h3></li>
					<li><h3>完全 自主 协作</h3></li>
					<li><h3>新互联时代追随者</h3></li>
				</ul>
			</div>
		</div>
	</div>

	<div id="service">
		<div id="service1" class="service-introduce">
			<h1>完善的发布系统</h1>
		</div>
		<div id="service2" class="service-introduce">
			<h1>自动匹物品价值</h1>
		</div>
		<div id="service3" class="service-introduce">
			<h1>私密化信息处理</h1>
		</div>
	</div>
	<div id="about">
		<b>关于本站</b>
		<p>本站的开发的目的是为在校大学生提供一个交换自己闲置物品的平台，本网站所收集的部分公开资料来源于互联网，
			转载的目的在于传递更多信息及用于网络分享，并不代表本站赞同其观点和对其真实性负责，也不构成任何其他建议。
			本站部分作品是由网友自主投稿和发布、编辑整理上传，对此类作品本站仅提供交流平台，不为其版权负责。如果您发现网站上有侵犯您的知识产权的作品，
			请与我们取得联系，我们会及时修改或删除。本网站及其雇员一概毋须以任何方式就任何信息传递或传送的失误、不准确或错误，
			对用户或任何其他人士负任何直接或间接责任。在法律允许的范围内，本网站在此声明，
			不承担用户或任何人士就使用或未能使用本网站所提供的信息或任何链接所引致的任何直接、间接、附带、从属、殊、惩罚性或惩戒性的损害赔偿。</p>
	</div>
	<div id="contact">
			<form id="c-form" role="form">
			    <div class="form-group" >
					<p><h2>联系我们</h2></p> 
				</div>
				<div class="form-group" >
					<textarea class="form-control" rows="3" placeholder="想对我们说："></textarea> 
				</div>
				<div class="form-group" >
				<button type="button" class="btn btn-primary btn-lg btn-block " >提交</button>
			    </div>
			</form>
	</div>
	<div class="copyright">
		<span>Copyright &copy;西建大IT服务队</span>
		| <span>陕ICP备x号</span>
	</div>
</body>
</html>
