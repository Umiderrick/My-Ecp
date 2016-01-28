<%@ page language="java" import="java.util.*,pb.db.*,pb.cart.Cartdealer"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String username = session.getAttribute("userName").toString();
	Cartdealer ctd = new Cartdealer();
	List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
	Map<String, Object> mapi = new HashMap<String, Object>();
	TableValues tv = ctd.cartsearch(username);
	DataColumn[] dcl = tv.getDataColumns();
	for (int i = 0; i < tv.getValues().length; i++) {
		Map<String, Object> map = new HashMap<String, Object>();
		for (int j = 0; j < tv.getDataColumns().length; j++) {
			String key = dcl[j].getName();
			String value = tv.getValues()[i][j].toString();
			map.put(key, value);
		}
		list.add(map);
	}
	request.setAttribute("list", list);

	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;
	request.setAttribute("basePath", basePath);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta content="text/html;charset =UTF-8">
<title>购物车</title>
<link type="text/css" rel="stylesheet" href="css/global.css">
<link type="text/css" rel="stylesheet" href="css/cart.css">
<script src="js/jquery-1.7.2.js" type="text/javascript"></script>
<script src="js/cart_step_1.js" type="text/javascript"></script>
<script>
	function deletecart(itemid) {
		$.post("CartServlet", {
			"itemid" : itemid,
		}, function() {
			window.location.reload(false);
		});
	}
	function updatenum() {
		var itemid = new Array();
		$(".p_txt").each(function(i, n) {
			itemid.push(n.innerHTML);
		});
		var nnum = new Array();
		$(".num").each(function(i, n) {
			nnum.push(n.value);
		});
		$.post("SalorderinsServlet", {
			"itemid" : JSON.stringify(itemid),
			"nnum" : JSON.stringify(nnum)
		},  window.location.href = 'cart_step_2.jsp')
	}
</script>
<style type="text/css">
img {
	vertical-align: middle;
	max-width: 100%;
	height: auto;
}
</style>
</head>
<body>
	<div class="cart_header">
		<div class="ui_header_top"></div>
		<div class="w990">
			<div class="cart_header_logo fl">
				<a href="javascript:;"></a>
			</div>
			<div class="cart_step_tips fr">
				<div class="cart_step_tips_txt clearfix">
					<span class="dq">我的购物车</span> <span>填写核对订单信息</span> <span>成功提交订单</span>
				</div>
				<div class="cart_step_tips_bg step1"></div>
			</div>
		</div>
	</div>
	<div class="w990">
		<h3 class="h3_mycart_tit">
			<i></i><span>我的购物车</span>
		</h3>
	</div>
	<div class="cart_list posr">
		<div class="cart_thead clearfix">
			<div class="row2">
				<span>商品</span>
			</div>
			<div class="row3 ac">
				<span>价格</span>
			</div>
			<div class="row4 ac">
				<span>属性</span>
			</div>
			<div class="row5 ac">
				<span>数量</span>
			</div>
			<div class="row6 ac">
				<span>操作</span>
			</div>
		</div>
		<div class="cart_tbody_con">
			<c:forEach items="${list}" var="list">
				<div class="cart_tbody clearfix">
					<div class="row2">
						<div class="p_goods clearfix">
							<a class="p_img fl"><img
								src="<%=request.getAttribute("basePath")%>${list.imgurl}"></a>
							<a class="p_txt fl">${list.itemid}</a>
						</div>
					</div>
					<div class="row3 ac">
						<span class="p_price">${list.price}</span>
					</div>
					<div class="row4 ac">
						<a>${list.attrigid}</a>
					</div>
					<div class="row5">
						<div class="p_quantity ac">
							<a class="jian_goods">-</a> <input value="${list.num}" id="num"
								class="num" type="text"> <a class="jia_goods">+</a>
						</div>
					</div>
					<br>
					<div class="row6 ac">
						<span class="p_del"><a
							onclick="deletecart('${list.itemid}')" class="alert_del_goods">删除</a></span>
					</div>
				</div>
			</c:forEach>
		</div>
		<div class="p_total">
			<div class="ar p_total_txt">
				<span class="l">金额总计：</span><span class="r">￥</span><span
					id="price_sum" class="r"></span>
			</div>
			<div class="p_total_btn clearfix">
				<a class="fl btn_jxgw" href="list_search.jsp">继续购物</a> <a
					class="fr btn_qjs" onclick="updatenum()">去结算<em>&gt;</em></a>
			</div>
		</div>
	</div>
</body>
</html>
