<!DOCTYPE html>
<%@ page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html charset=utf-8">
<meta
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;"
	name="viewport" />
<title>ant setting</title>
<link href="${pageContext.request.contextPath}/themes/gray/easyui.css"
	type="text/css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/themes/icon.css"
	type="text/css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/demo.css"
	type="text/css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/custom.css"
	type="text/css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/jquery-1.10.2.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.validate.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.easyui.min.js"></script>

</head>



<body>

	<div class="easyui-layout" style="width: 100%; height: 700px;">
		<div data-options="region:'north',split:true,collapsible:true"
			title="preconditions" style="height: 100px">
			<jsp:include page="./inner/body_top.jsp"></jsp:include>
		</div>
		<div data-options="region:'south',split:true,collapsible:false"
			title="get result" style="height: 130px;">

			<jsp:include page="./inner/body_bottom.jsp"></jsp:include>
		</div>
		<div data-options="region:'east',split:true" title="view&modification"
			style="width: 380px;">

			<jsp:include page="./inner/body_mid_right.jsp"></jsp:include>

		</div>
		<div data-options="region:'west',split:true" title="product"
			style="width: 200px;">

			<jsp:include page="./inner/body_mid_left.jsp"></jsp:include>
		</div>
		<div data-options="region:'center',title:'setting'">

			<jsp:include page="./inner/body_mid_center.jsp"></jsp:include>

		</div>
	</div>

	<jsp:include page="./dialog/add_product.jsp"></jsp:include>

	<jsp:include page="./dialog/load_localdata.jsp"></jsp:include>
	
	<script src="${pageContext.request.contextPath}/js/custom.js"></script>
</body>