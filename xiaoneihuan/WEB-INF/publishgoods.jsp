<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<html>
	<head>
		<title>发布物品</title>
		<link rel="icon" href="images/huan_icon.ico" type="image/x-icon" />
		<link rel="shortcut icon" href="images/huan_icon.ico">
		<link rel="Bookmark" href="images/huan_icon.ico">
		<link rel="stylesheet" type="text/css"
			href="bootstrap-3.3.5/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="css/publishgoods.css">

		<script src="jQuery/jquery-1.9.1.js" type="text/javascript"></script>
		<script src="jQuery/jquery.cookie.js" type="text/javascript"></script>
		<script src="bootstrap-3.3.5/js/bootstrap.min.js"
			type="text/javascript"></script>
		<script src="myjs/publishgoods.js" type="text/javascript"></script>
		<script src="myjs/login.js" type='text/javascript'></script>
	</head>

	<body style="text-align: center">
		<jsp:include page="/WEB-INF/topnav.jsp"></jsp:include>
		<h2>
			<span class=" glyphicon glyphicon-pencil"
				style="margin-top: 30px; margin-bottom: 5px;"><b>发布我的物品</b>
			</span>
		</h2>
		<div class="container"
			style="width: 60%; border-top: 2px solid #8A8A8C;">
			<div class="rows">
				<div class="col-md-12 fitInfoMain">
					<div class="rows">
						<div class="col-md-12">
							<div class="rows">
								<div class="col-md-12">
									<p>
										<h4>
											物品基本信息
										</h4>
									</p>
								</div>
							</div>
							<div class="rows">
								<div class="col-md-12">
									<input type="text" class="form-control" id="title"
										maxlength="30" placeholder="请输入标题 不超过30个字">
								</div>
							</div>
							<div class="rows reMargin20">
								<div class="col-md-6">
									<input type="text" class="form-control" id="contactName"
										maxlength="10" placeholder="请输入联系人姓名">
								</div>
								<div class="col-md-6">
									<input type="text" class="form-control" id="contactNumber"
										maxlength="20" placeholder="请输入联系人电话">
								</div>
							</div>
							<div class="rows reMargin20">
								<div class="col-md-6">
									<input type="text" class="form-control" id="qqNumber"
										maxlength="20" placeholder="请输入联系人QQ">
								</div>
								<div class="col-md-6">
									<select class="myselect">
										<option>请选择新旧程度</option>
										<option>九成新以上</option>
										<option>八成新</option>
										<option>七成新</option>
										<option>六成新</option>
										<option>五成新</option>
										<option>四成新</option>
										<option>三成新</option>
										<option>二成新</option>
										<option>一成新</option>
									</select>
								</div>
							</div>

							<div class="rows reMargin20">
								<div class="col-md-6">
									<select class="myselect">
										<option>请选择大类别</option>
										<option>生活类</option>
										<option>数码类</option>
										<option>运动类</option>
										<option>文娱类</option>
									</select>
								</div>
								<div class="col-md-6">
									<select class="myselect">
										<option>请选择小类别</option>
									</select>
								</div>
							</div>
							<div class="rows reMargin20">
								<div class="col-md-6">
									<select class="myselect">
										<option>请选择所在城市</option>
										<option>西安市</option>
									</select>
								</div>
								<div class="col-md-6">
									<select class="myselect">
										<option>请选择学校名称</option>
										<option>西安建筑科技大学(老校区)</option>
										<option>西安建筑科技大学(草堂校区)</option>
										<option>西北工业大学(北校区)</option>
										<option>西安电子科技大学(北校区)</option>
									</select>
								</div>
							</div>
							<div class="rows desciption">
								<div class="col-md-12">
									<textarea class="form-control" rows="10" id="intro"
										placeholder="简单描述下："></textarea>
								</div>
							</div class="rows" >
							<p class="imageTip">
								*请上传至少一张图片，仅支持jpg,jpeg,png,bmp格式
							</p>
							<p id="img-flag" class="hideMe">
								0
							</p>
						</div>
						<div>
							<div class="rows">
								<div class="col-md-12">
									<jsp:include page="/WEB-INF/upload.jsp"></jsp:include>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- submit button -->
			<div class="rows reMargin20">
				<!-- remind you to fill sheet -->
				<div class="alert alert-danger alert-dismissable hideMe"
					id="tips-div">
					<button type="button" class="close" data-dismiss="alert"
						aria-hidden="true"></button>
					<p id="tips"></p>
				</div>
				<div class="col-md-12 font-center">
					<button id="publish-btn" type="button"
						class=" btn btn-primary btn-lg" style="width: 280px;">
						保存并提交
					</button>
				</div>
			</div>
		</div>
		<div class="modal fade" style="height: " id="confirmModal"
			tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
			aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">
							×
						</button>
						<h4 class="modal-title" id="myModalLabel">
							发布条款
						</h4>
					</div>
					<div class="modal-body rules">
						一.为保障校内换用户的权益，维护校内换的正常秩序，根据国家法律法规规范，以及《校内换服务协议》、《校内换规则》等相关协议和规则，发布物品前需要同意本条款。
						<br />
						二.校内换用户不得出售国家法律法规禁止出售，或根据校内换平台管理要求禁止出售的物品。禁售物品名录详见本规范附件一《禁发物品及信息名录及对应违规处理》。
						<br />
						三.校内换用户不得在校内换物品页面(包括但不限于物品标题、物品描述、物品图片)，以及社区和论坛等信息发布区块发布禁售物品相关信息。
						<br />
						四.校内换用户不得通过任何方式规避本规范及其他校内换禁售物品管理措施。
						<br />
						五.校内换用户发布特定品类物品及信息的，须符合特定的发布规范，详见本规范附件二《特定品类物品及信息发布规范》。
						<br />
						六.会员发布前述禁售物品及信息时，校内换有权对其发布的涉嫌违规信息进行提示、替换、删除等操作。
						<br />
						七.对于系统排查到的涉嫌违反第三条所列情形的物品，校内换将在两个工作日内进行人工排查，人工排查期间给予单个物品监管；对于系统排查到的涉嫌发布前述物品且情节严重或情节特别严重的，校内换将在两个工作日内进行人工排查，人工排查期间给予账号禁封处理。
						<br />
						八.校内换用户发布前述禁售物品及相关信息的，依据《校内换规则》将对其进行违规处理。发布禁售物品及相关信息的具体处理措施详见本规范附件一《禁发物品及信息名录及对应违规处理》。
						<br />
						九.校内换会员若违反本规范规定发布前述禁售物品及相关信息的，除依据本规范扣分处理外，校内换有权同时删除对应物品或信息。
						<br />
						十.本规范于2016年1月1日生效。
						<br />
						十一.校内换用户发布信息的行为，发生在本规范生效之日或修订之日以前的，适用当时的规则。发生在本规范生效之日或修订之日以后的，适用本规范。
						<br />
						十二.本规范适用于所有校内换用户。
						<br />

					</div>
					<label>
						<input id="agreementCheckBox" type="checkbox">
						我同意上述条款
					</label>
					<div class="my-modal-footer">
						<p class="font-red">
							特别提醒：物品一经发布，不可修改其信息。
						</p>
						<button type="button" class="btn btn-primary disabled"
							id="confirmSubmitBtn">
							提交
						</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->
		<jsp:include page="/WEB-INF/footer.jsp"></jsp:include>
	</body>
</html>