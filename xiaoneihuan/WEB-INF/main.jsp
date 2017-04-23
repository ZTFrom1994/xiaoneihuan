<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
	<head>
		<title>欢迎来到校内换！</title>
		<link rel="icon" href="images/huan_icon.ico" type="image/x-icon" />
		<link rel="shortcut icon" href="images/huan_icon.ico">
		<link rel="Bookmark" href="images/huan_icon.ico">

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<link href="bootstrap-3.3.5/css/bootstrap.min.css" rel="stylesheet">
		<link href="css/main.css" rel="stylesheet" type="text/css">
		<link href="css/category.css" rel="stylesheet" type="text/css">
		<link href="css/goods.css" rel="stylesheet" type="text/css">

		<script src="jQuery/jquery-1.9.1.js" type='text/javascript'></script>
		<script src="bootstrap-3.3.5/js/bootstrap.min.js"
			type='text/javascript'></script>
		<script src="jQuery/jquery.parallaxmouse.min.js"></script>
		<script src="myjs/main.js" type='text/javascript'></script>
		<script src="myjs/search.js" type='text/javascript'></script>
		<script src="myjs/login.js" type='text/javascript'></script>

	</head>
	<body>
		<jsp:include page="/WEB-INF/topnav.jsp"></jsp:include>
		<!-- 动画效果 -->
		<article class="jq22-container">
		<div id="banner">
			<img id="warpbg" class="pelm left top" src="images/warpbg.png">
			<img id="star1" class="pelm top" src="images/star1.png">
			<img id="star2" class="pelm top" src="images/star2.png">
			<img id="star3" class="pelm" src="images/star3.png">
			<img id="star4" class="pelm left top" src="images/star4.png">
			<img id="star5" class="pelm left" src="images/star5.png">
			<img id="planet" class="pelm left top" src="images/planet.png">
			<img id="robot" class="pelm top" src="images/robot.png">
			<img id="astronaut" class="pelm top" src="images/astronaut.png">
			<img id="asteroid" class="pelm" src="images/asteroid.png">
		</div>
		</article>
		<div class="container " id="viewframe">
			<div class="rows">
				<div class="col-md-3">
					<div id="category">
						<div id="maincate">
							<a>全部类别</a>
						</div>
						<div class="category-classes">
							<h3>
								<a class="s-category">生活类</a>
							</h3>
							<div class="cate-selection">
								<a>衣服/裤子</a>
								<a>鞋子/手套</a>
								<a>香水/美妆</a>
							</div>
						</div>
						<div class="category-classes">
							<h3>
								<a class="s-category">数码类</a>
							</h3>
							<div class="cate-selection">
								<a>手机/通讯</a>
								<a>电脑/平板</a>
								<a>MP3/DV</a>
							</div>
						</div>
						<div class="category-classes">
							<h3>
								<a class="s-category">运动类</a>
							</h3>
							<div class="cate-selection">
								<a>运动装备</a>
								<a>户外/旅行</a>
								<a>自行车/配件</a>
							</div>
						</div>
						<div class="category-classes">
							<h3>
								<a class="s-category">文娱类</a>
							</h3>
							<div class="cate-selection">
								<a>书籍/书刊</a>
								<a>乐器/植物</a>
								<a>手办/模型</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-9">
					<div class="rows" id="showList">
						<c:choose>
							<c:when test="${empty goodsList}">
								<div id="goodsEmpty">
									<p>
										<h1>
											抱歉,找不到任何物品信息。
										</h1>
									</p>
								</div>
							</c:when>
							<c:otherwise>
								<c:forEach var="goods" items="${goodsList}">
									<div class="c-one">
										<div class="goods-img">
											<c:forEach var="item" items="${goods.imageSet}" begin="0" end="0">  
      										 <img src="${item.src}" />
   											 </c:forEach>
										</div>
										<div class="small-imgs-div">
											<c:forEach var="img" items="${goods.imageSet}">
												<div class="small-imgs">
													<image src="${img.src}" />
												</div>
											</c:forEach>
										</div>
										<div class="c-title">
											<a href="./goClicksHandle?id=${goods.goodsId}"><b>${goods.goodsTitle}</b>
											</a>
										</div>
										<div class="c-publish-info">
											<p>
												<c:choose>
													<c:when test="${goods.dealStatus=='寻求交易'}">
														<span class="label label-danger toLeft">${goods.dealStatus}</span>
													</c:when>
													<c:when test="${goods.dealStatus=='交易中'}">
														<span class="label label-primary toLeft">${goods.dealStatus}</span>
													</c:when>
													<c:when test="${goods.dealStatus=='已交易'}">
														<span class="label label-default toLeft">${goods.dealStatus}</span>
													</c:when>
												</c:choose>
												<c:choose>
													<c:when
														test="${goods.conditions == '九成新以上' || goods.conditions=='八成新' }">
														<span class="label label-warning toLeft"
															style="margin-left: 5px">${goods.conditions}</span>
													</c:when>
													<c:when
														test="${goods.conditions == '七成新' || goods.conditions=='六成新' || goods.conditions=='五成新'}">
														<span class="label label-success toLeft"
															style="margin-left: 5px">${goods.conditions}</span>
													</c:when>
													<c:otherwise>
														<span class="label label-info toLeft"
															style="margin-left: 5px">${goods.conditions}</span>
													</c:otherwise>
												</c:choose>
												<a href="toUserCenter&username=${goods.publisher}"
													class="toRight">${goods.publisher}</a>
											</p>
											<p>

												<span class="toLeft">${goods.city}</span>
												<span class="toRight">${goods.subClass}</span>
												<span class="toRight">${goods.mainClass}-</span>
											</p>
											<p>
												<span class="toLeft">${goods.fromSchool}</span>
												<span class="toRight"><fmt:formatDate
														value="${goods.publishDate}" pattern="yyyy-MM-dd" />
												</span>
											</p>
										</div>
									</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</div>

				</div>
			</div>
		</div>
		<!-- 翻页 -->
		<div class="rows">
			<div id="paging">
				<ul class="pagination pagination-lg" id="pageItems">
					<li>
						<a id="pageUp">&laquo;</a>
					</li>
					<c:forEach var="i" begin="1" end="${pageCount}" varStatus="status">
						<li>
							<a name="a${status.count}">${status.count}</a>
						</li>
					</c:forEach>
					<li>
						<a id="pageDown" href="">&raquo;</a>
					</li>
				</ul>
			</div>
		</div>
		<!-- 友情链接 -->
		<jsp:include page="/WEB-INF/footer.jsp"></jsp:include>
	</body>
</html>
