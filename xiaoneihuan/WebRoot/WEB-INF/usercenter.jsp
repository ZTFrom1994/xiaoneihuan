<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
	<head>
		<title>个人中心</title>
		<link rel="icon" href="images/huan_icon.ico" type="image/x-icon" />
		<link rel="shortcut icon" href="images/huan_icon.ico">
		<link rel="Bookmark" href="images/huan_icon.ico">
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link href="bootstrap-3.3.5/css/bootstrap.min.css" rel="stylesheet">
		<link href="css/usercenter.css" rel="stylesheet">
		<script src="jQuery/jquery-1.9.1.js" type="text/javascript"></script>
		<script src="jQuery/jquery.validate.js" type="text/javascript"></script>
		<script src="bootstrap-3.3.5/js/bootstrap.min.js"></script>
		<script src="myjs/login.js" type="text/javascript"></script>
		<script type="text/javascript" src="myjs/usercenter.js"></script>
	</head>

	<body>
		<jsp:include page="/WEB-INF/topnav.jsp"></jsp:include>
		<div class="container container-top">
			<div class="rows">
				<div class="col-md-3">
					<div class="panel panel-default">
						<div class="panel-body panel-rePadding">
							<div class="head-div">
								<c:choose>
									<c:when test="${user.sex == '男'}">
										<img id="head-img" src="images/man-head.jpg" />
									</c:when>
									<c:otherwise>
										<img id="head-img" src="images/woman-head.jpg" />
									</c:otherwise>
								</c:choose>
								
							</div>
							<div class="username-div">
								<p id="p-username" name="${user.username}">
									${user.username}
								</p>
							</div>
							<div class="info-div">
								<ul class="list-group group-reMargin">
									<li class="list-group-item reBorder">
										性 　　别 : ${user.sex}
									</li>
									<c:choose>
										<c:when test="${empty user.stuId}">
											<li class="list-group-item reBorder">
												学 　　号 : 未填写
											</li>
										</c:when>
										<c:otherwise>
											<li class="list-group-item reBorder">
												学　　 号 : ${user.stuId}
											</li>
										</c:otherwise>
									</c:choose>

									<li class="list-group-item reBorder" id="li-userSchool" name="${user.school}">
										学　 　校 : ${user.school}
									</li>
									<c:choose>
										<c:when test="${empty user.realName}">
											<li class="list-group-item reBorder">
												真实姓名 : 未填写
											</li>
										</c:when>
										<c:otherwise>
											<li class="list-group-item reBorder">
												真实姓名 : ${user.realName}
											</li>
										</c:otherwise>
									</c:choose>
									<li class="list-group-item reBorder">
										注册时间 :
										<fmt:formatDate value="${user.registerDate}"
											pattern="yyyy-MM-dd" />
									</li>
								</ul>
							</div>
							<div class="checkTip">
								<c:choose>
									<c:when test="${user.isChecked == 'y'}">
										<p class="p-green">
											验证通过
										</p>
									</c:when>
									<c:otherwise>
										<p class="p-red">
											*当前账号未验证身份，不能发布商品！
										</p>
										<button id="checkIdBtn" type="button"
											class="btn btn-info btn-lg ">
											马上验证
										</button>
									</c:otherwise>
								</c:choose>

							</div>
						</div>
					</div>
				</div>
				<div class="col-md-9">
					<div class="panel panel-info ">
						<div class="panel-heading">
									<h3 class="panel-title">
										物品列表
									</h3>
						</div>
							<div class="panel-body panel-rePadding panel-reHeight">
								<c:choose>
									<c:when test="${empty goodsList}">
						   			<div class="col-md-12">您还未发布任何物品哦！</div>
						   		</c:when>
									<c:otherwise>
										<ul class="list-group group-reMargin">
											<c:forEach var="goods" items="${goodsList}">
												<li class="list-group-item reBorder"
													style="padding-left: 0px;" >
													<div class="rows">
														<div class="col-md-2">
															<c:forEach var="item" items="${goods.imageSet}" begin="0" end="0">
																<img class="media-object goods-img" src="${item.src}">
															</c:forEach>
														</div>
														<div class="col-md-4">
															<a href="./goClicksHandle?id=${goods.goodsId}" >${goods.goodsTitle}</a>
															<div class="panel-intro">
																	${goods.introduction}
															</div>
														</div>
														<div class="col-md-3 addLeftBorder">
															${goods.mainClass}
															</br>
															${goods.subClass}
															<br />
															${goods.fromSchool}
															<br />
															<fmt:formatDate value="${goods.publishDate}"
																pattern="yyyy-MM-dd" />
														</div>
														<div class="col-md-2 addLeftBorder">
															${goods.conditions}
															<br />
															点击量：${goods.clicks}
														</div>
														<div class="col-md-1 addLeftBorder"
															style="padding-left: 10px;">
															<c:choose>
																<c:when test="${goods.dealStatus=='寻求交易'}">
																	<span class="label label-danger toLeft">${goods.dealStatus}</span>
																</c:when>
																<c:when test="${goods.dealStatus=='交易中'}">
																	<span class="label label-info toLeft">${goods.dealStatus}</span>
																</c:when>
																<c:when test="${goods.dealStatus=='已交易'}">
																	<span class="label label-default toLeft">${goods.dealStatus}</span>
																</c:when>
																<c:otherwise>
																	<span class="label label-default toLeft">状态出错</span>
																</c:otherwise>
															</c:choose>
															<button class="btn btn-primary btn-xs changeStatus"
																name="${goods.goodsId}">
																更改状态
															</button>
														</div>
													</div>
	
												</li>
											</c:forEach>
										</ul>
									</c:otherwise>
								</c:choose>
							</div>
					</div>
				</div>
			</div>
		</div>

		<div class="modal fade modalReMarginTop" id="selectModal"
			tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
			aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header contentToCenter">
						<h4 class="modal-title" id="myModalLabel">
							请选择一个状态
						</h4>
					</div>
					<div class="modal-body" style="height: 220px;">
						<div class="rows contentToCenter">
							<div class="selections">已交易</div>
							<div class="selections">寻求交易</div>
							<div class="selections">交易中</div>
							<br />
						</div>
						<div class="sumbitChange-div " >
							<button class="btn btn-primary " id="submitChange">
								提交更改
							</button>
						</div>
					</div>

				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal -->
		</div>
		<div class="modal fade modalReMarginTop" id="checkIdModal"
			tabindex="-1" role="dialog" aria-labelledby="myModalLabel2"
			aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header contentToCenter">
						<h4 class="modal-title" id="myModalLabel2">
							请填写审核信息
						</h4>
					</div>
					<div class="modal-body" style="height: auto;">
						<div class="container" style="width: auto;">
							<form id="checkIdForm">
								<div class="rows">
									<div class="col-md-6">
												账号：${user.username}
									</div>
									<div class="col-md-6" >
												学校：${user.school}
									</div>
								</div>
								<div class="rows" style="margin-top: 30px">
									<div class="col-md-6">
										<input autofocus="autofocus" required="required"
											id="realNameForCheck" class="form-control form-in-style "
											placeholder="请输入真实姓名" maxlength="12" name="realNameForCheck"
											type="text">
									</div>
									<div class="col-md-6">
										<input id="stuIdForCheck" required="required"
											class="form-control form-in-style" placeholder="请输入学号"
											maxlength="10" name="stuIdForCheck" type="text">
									</div>

								</div>
								<div class="rows">
									<div id="sumbitCheck-div">
										<button class="btn btn-primary " type="submit"
											id="submitCheck">
													验证
										</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal -->
		</div>
		<jsp:include page="/WEB-INF/footer.jsp"></jsp:include>
	</body>
</html>
