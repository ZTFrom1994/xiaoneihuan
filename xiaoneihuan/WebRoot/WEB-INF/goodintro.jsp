<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'goodintro.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="bootstrap-3.3.5/css/bootstrap.min.css" >
	<link rel="stylesheet" type="text/css" href="css/goodintro.css">
	<script src="jQuery/jquery-1.9.1.js"></script>
	<script src="bootstrap-3.3.5/js/bootstrap.min.js"></script>
  </head>
  
  <body background="img/1133185.jpg"> 
   <jsp:include page="/WEB-INF/topnav.jsp"></jsp:include> 
   
   <div class="container" style="margin-top:10px;"> 
		<div class="rows">
		 	<div class="col-md-2"></div>
		 	<div class="col-md-7" style="padding-top:10px;text-align:center;">
		 	     <div class="good-title"><p><h2>${good[0].goodstitle}</h2></p></div>
		 	      <div class="good-detail">
		 	            <img src="${good[0].imgsrc}" width="50%" height="300px" >
		 	            <div class="info" >
			 	            <p><span><b>发布账号：</b></span><a href="UserAction.do?flag=toUserCenter&username=${good[0].ownername}">${good[0].ownername}</a></p>
			 	            <p><span><b>学　　校：</b></span><a href="" >${good[0].fromschool} </a></p>
			 	            <p><span><b>发布时间：</b></span><fmt:formatDate value="${good[0].publishdate}" pattern="yyyy-MM-dd" /></p>
		 	                <p style="color:red"><span style="color:#333333"><b>物品状态：</b></span >${good[0].dealstatus}</p>
		 	                <p><span><b>查看次数：</b></span>${good[0].clicks}</p> 
			 	            <p><span><b>类　　别：</b></span>
			 	               <a href="GoodsAction.do?flag=getGoods&action=search&searchBy=mainClass&searchText=${good[0].mainclass}"><span class="label label-success">${good[0].mainclass}</span></a>
			 	               <a href="GoodsAction.do?flag=getGoods&action=search&searchBy=subClass&searchText=${good[0].subclass}"><span class="label label-warning" style="margin-left:5px">${good[0].subclass}</span></a>
			 	            </p>
			 	            <p><span><b>简　　介：</b></span>${good[0].introduction}</p>
		 	            </div>
		 	      </div>
		 	      
		 	       <div class="good-deal">
		 	        <button type="button" class="btn  btn-danger btn-lg btn-block">我要交换</button>
		 	        <a href="GoodsAction.do?flag=getGoods&action=search&searchText=">继续浏览</a>
					</div>
		   </div>
			 <div class="col-md-2"></div>  
		</div>
	</div>
   <jsp:include page="/WEB-INF/footer.jsp"></jsp:include>
  </body>
</html>
