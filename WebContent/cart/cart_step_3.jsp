、<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="utf-8">
<title>订单支付</title>
<link type="text/css" rel="stylesheet" href="../css/global.css">
<link type="text/css" rel="stylesheet" href="../css/cart.css">
</head>
<body>
	<div class="cart_header">
		<div class="ui_header_top"></div>
		<div class="w990">
			<div class="cart_header_logo fl"></div>
			<div class="cart_step_tips fr">
				<div class="cart_step_tips_txt clearfix">
					<span>我的购物车</span> <span>填写核对订单信息</span> <span class="dq">成功提交订单</span>
				</div>
				<div class="cart_step_tips_bg step3"></div>
			</div>
		</div>
	</div>
	<div class="w990">
		<h3 class="h3_mycart_tit">
			<i></i><span>我的购物车</span>
		</h3>
	</div>
	<div class="w990">
		<div class="cart_order_content">
			<div class="cart_order">
				<p class="cart_order_tip">订单提交成功，请您尽快付款！</p>
				<p class="pad10">
					订单号:<%=session.getAttribute("salorderid")%><span
						style="margin-left: 40px;">应付金额（元）：<b>￥<%=session.getAttribute("total")%>元
					</b></span>
				</p>
			</div>
		</div>
	</div>
</body>
</html>
<%
	session.removeAttribute("salorderid");
	session.removeAttribute("total");
%>