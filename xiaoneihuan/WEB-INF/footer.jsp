<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'footer.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="css/footer.css" rel="stylesheet" type="text/css">
  </head>
  <body>
    <footer class="main-footer">
		<div class="container">
			<div class="row">
				<div class="col-sm-4">
					<div class="widget">
						<h4 class="title">友情链接</h4>
						<div class="content friend-links hello">
							<a href="http://www.bootcss.com/" title="Bootstrap中文网"
								target="_blank">Bootstrap中文网</a><br> <a
								href="http://www.golaravel.com/" title="Laravel中文网"
								target="_blank">Laravel中文网</a><br> <a
								href="http://www.golaravel.com/" title="Laravel中文网"
								target="_blank">南山社联管理系统</a>
						</div>
					</div>
				</div>

				<div class="col-sm-4">
					<div class="widget">
						<h4 class="title">我们用到的技术</h4>
						<div class="content tag-cloud friend-links">
							<a href="http://www.bootcss.com/" title="Bootstrap中文网"
								target="_blank">Bootstrap</a><br> <a
								href="http://www.ghostchina.com/" title="html中国" target="_blank">html</a><br>
							<a href="http://www.jquery123.com/" title="jQuery中文文档"
								target="_blank">jQuery</a>
						</div>
					</div>
				</div>

				<div class="col-sm-4">
					<div class="widget">
						<h4 class="title">赞助商</h4>
						<div class="content friend-links">
							<a href="http://www.xauat.edu.cn/zh-cn/index.php"
								title="西安建筑科技大学" target="_blank">西安建筑科技大学</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- 页脚 -->
	
	<div class="copyright">
		<span>Copyright &copy; <a href="http://expo.bootcss.com">优站精选</a></span>
		| <span><a href="http://www.miibeian.gov.cn/" target="_blank">陕ICP备x号</a></span>
	</div>
  </body>
</html>
