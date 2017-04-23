<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
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

		<title>物品详情</title>
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
		<link rel="stylesheet" type="text/css" href="css/goodsshow.css">

		<script src="jQuery/jquery-1.9.1.js" type="text/javascript"></script>
		<script type="text/javascript" src="jQuery/jquery.imagezoom.min.js"></script>
		<script src="bootstrap-3.3.5/js/bootstrap.min.js"
			type="text/javascript"></script>
		<script src="myjs/login.js" type="text/javascript"></script>
		<script src="myjs/goodsshow.js" type="text/javascript"></script>

	</head>

	<body>
		<jsp:include page="/WEB-INF/topnav.jsp"></jsp:include>

		<div class="container reMarginTop" >
			<div class="rows">
				<div class="col-md-1"></div>
				<div class="col-md-4">
					<div class="box">
						<div class="tb-booth tb-pic tb-s310">
							<a >
								<c:forEach var="img" begin="0" end="0" items="${goods.imageSet}">
									<img src="${img.src}" class="jqzoom" /> 
								</c:forEach>
							</a>
						</div>
						<ul class="tb-thumb" id="thumblist">
							<c:forEach var="img"  items="${goods.imageSet}">
								<li >
									<div class="tb-pic tb-s40">
										<a><img src="${img.src}" mid="${img.src}" big="${img.src}"> </a>
									</div>
								</li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<div class="col-md-6 goodsInfo ">
					<div class="rows">
						<div class="col-md-12">
							<p id="p-title">
								<label>
									标题：
								</label>
								${goods.goodsTitle}
							</p>
						</div>
					</div>

					<div class="rows">
						<div class="col-md-6">
							<p>
								<label >
									类　别：
								</label>
								${goods.mainClass}-${goods.subClass}
							</p>
						</div>
						<div class="col-md-6">
							<c:choose>
								<c:when test="${goods.conditions == '九成新以上' || goods.conditions=='八成新' }">
									<p><label>新旧程度：</label><label class="label label-warning " >${goods.conditions}</label ></p>
								</c:when>
								<c:when test="${goods.conditions == '七成新' || good.conditions=='六成新' || goods.conditions=='五成新'}">
									<p><label>新旧程度：</label><label class="label label-success " >${goods.conditions}</label ></p>
								</c:when>
								<c:otherwise>
									<p><label>新旧程度：</label><label class="label label-info " >${goods.conditions}</label ></p>
								</c:otherwise>
							</c:choose>
						</div>
					</div>

					<div class="rows">
						<div class="col-md-6">
							<p>
								<label>
									发布人：
								</label>
								${goods.publisher}
							</p>
						</div>
						<div class="col-md-6">
							<p>
								<label>
									发布时间：
								</label>
								<fmt:formatDate value="${goods.publishDate}" pattern="yyyy-MM-dd" />
							</p>
						</div>
					</div>
					<div class="rows">
						<div class="col-md-6 ">
							<p>
								<label>
									城　市：
								</label>
								${goods.city}
							</p>
						</div>
						<div class="col-md-6 ">
							<p>
								<label>
									来自学校：
								</label>
								${goods.fromSchool}
							</p>
						</div>
					</div>
					<div class="rows">
						<div class="col-md-6 ">
							<p>
								<label>
									点击量：
								</label> 
								<c:choose>
									<c:when test="${goods.clicks>50}">
										<span class="red-font">${goods.clicks}</span>
									</c:when>
									<c:otherwise>
										<span >${goods.clicks}</span>
									</c:otherwise>
								</c:choose>
								
								
							</p>
						</div>
						<div class="col-md-6">
							<c:choose> 
								<c:when test="${goods.dealStatus=='寻求交易'}"> 
									<p><label >商品状态：</label><label class="label label-danger "  >${goods.dealStatus}</label ></p>
								</c:when>
								<c:when test="${goods.dealStatus=='交易中'}">
									<p><label >商品状态：</label><label class="label label-primary " >${goods.dealStatus}</label ></p>
								</c:when>
								<c:when test="${goods.dealStatus=='已交易'}">
									<p><label >商品状态：</label><label class="label label-default " >${goods.dealStatus}</label ></p>
								</c:when>
							</c:choose>
						</div>
					</div>
					<div class="rows">
						<div class="col-md-12">
							<div class="panel panel-warning">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordion"
											href="#collapseFour"> 立即查看联系方式</a>
									</h4>
								</div>
								<div id="collapseFour" class="panel-collapse collapse">
									<div class="panel-body">
										<c:choose>
											<c:when test="${goods.dealStatus =='已交易'}">
												<label  class="red-font" > *该物品已交易，将不提供联系人信息！</label>
											</c:when>
											<c:otherwise>
												<c:choose>
													<c:when test="${logged=='y' }">
													<div class="rows">
																<p>
																	<label>姓　名：</label>
																	${goods.contactName}
																</p>
																<p>
																	<label>电　话：</label>
																	${goods.contactNumber}
																</p>
																<p>
																	<label>Q　Q：</label>
																	${goods.qqNumber}
																</p>
														</div>
													</c:when>
													<c:otherwise>
														<label>请登录后查看联系方式！</label><a id="goLogin">点此登录</a>
													</c:otherwise>
												</c:choose>
											</c:otherwise>
											
										</c:choose>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="rows">
						<div class="col-md-12">
							<div class="panel panel-info">
								<div class="panel-heading">
									<h3 class="panel-title">
										简介：
									</h3>
								</div>
								<div class="panel-body panel-intro">
									${goods.introduction}
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-1 "></div>
			</div>
		</div>

		<jsp:include page="/WEB-INF/footer.jsp"></jsp:include>

	</body>
</html>
