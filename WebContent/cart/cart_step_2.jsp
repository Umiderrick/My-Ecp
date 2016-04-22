<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*,pb.db.*,pb.login.*,pb.cart.*,pb.item.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String username = session.getAttribute("userName").toString();
	List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
	List<Map<String, Object>> listc = new ArrayList<Map<String, Object>>();
	Userdealer usd = new Userdealer();
	Cartdealer ctd = new Cartdealer();
	Itemdealer itd = new Itemdealer();
	TableValues tv = usd.query(username);
	TableValues tvc = ctd.cartsearch(username);
	DataColumn[] dcl = tv.getDataColumns();
	DataColumn[] dclc = tvc.getDataColumns();
	for (int i = 0; i < tv.getValues().length; i++) {
		Map<String, Object> map = new HashMap<String, Object>();
		for (int j = 0; j < tv.getDataColumns().length; j++) {
			String key = dcl[j].getName();
			String value = tv.getValues()[i][j].toString();
			map.put(key, value);
		}
		list.add(map);
	}

	for (int i = 0; i < tvc.getValues().length; i++) {
		Map<String, Object> mapc = new HashMap<String, Object>();
		for (int j = 0; j < tvc.getDataColumns().length; j++) {
			String keyc = dclc[j].getName();
			String valuec = tvc.getValues()[i][j].toString();
			mapc.put(keyc, valuec);
		}
		listc.add(mapc);
	}
	request.setAttribute("list", list);
	request.setAttribute("listc", listc);
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;
	request.setAttribute("basePath", basePath);

	double sum = 0;
	for (int i = 0; i < listc.size(); i++) {
		Map<String, Object> map = listc.get(i);
		sum += Double.parseDouble(((String) map.get("price"))) * Integer.parseInt((String) map.get("num"));
	}
%>
<html>
<head>
<meta charset="utf-8">
<title>订单提交</title>
<link type="text/css" rel="stylesheet" href="../css/global.css">
<link type="text/css" rel="stylesheet" href="../css/cart.css">
<link type="text/css" rel="stylesheet" href="../css/user.css">
<link type="text/css" rel="stylesheet" href="../css/register.css">
<script src="../js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="../js/tabs.js" type="text/ecmascript"></script>
<script src="../js/openPop.js" type="text/javascript"></script>
<script>
	function subsal() {
		var username = document.getElementById('username').innerHTML;
		var phone = document.getElementById('phone').innerHTML;
		var address = document.getElementById('address').innerHTML;
		var attrigid = document.getElementById('attrigid').innerHTML;
		var itemid = new Array();
		$(".p_txt").each(function(i, n) {
			itemid.push(n.innerHTML);
		});
		var num = new Array();
		$(".cl_num").each(function(i, n) {
			num.push(n.innerHTML);
		});
		var total = document.getElementById('total').innerHTML;
		$.post("../salorder/SalorderServlet", {
			"username" : username,
			"phone" : phone,
			"address" : address,
			"attrigid" :attrigid,
			"itemid" : JSON.stringify(itemid),
			"num" : JSON.stringify(num),
			"total" : total
		}, window.location.href = "cart_step_3.jsp");
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
			<div class="cart_step_tips fr">
				<div class="cart_step_tips_txt clearfix">
					<span>我的购物车</span> <span class="dq">填写核对订单信息</span> <span>成功提交订单</span>
				</div>
				<div class="cart_step_tips_bg step2"></div>
			</div>
		</div>
	</div>
	<div class="w990">
		<h3 class="h3_mycart_tit">
			<i></i><span>我的购物车</span>
		</h3>
	</div>
	<div class="w990">
		<h3 class="h3_bort nobor">
			<span class="fl">核对订单信息</span>
		</h3>
	</div>
	<div class="w990 order_step borb1px">
		<h4>收货人信息</h4>
		<div class="moren_info">
			<c:forEach items="${list}" var="list">
				<p>
					用户名: <span id='username'>${list.username}</span>
				</p>
				<p>
					联系电话: <span id='phone'>${list.phone}</span>
				</p>
				<p>
					收货地址: <span id='address'>${list.address}</span>
				</p>
			</c:forEach>
		</div>
	</div>
	<div class="w990 posr">
		<a class="backto_cart_step_1" href="cart_step_1.jsp">返回修改购物车</a>
		<h3 class="h3_bort marb15">商品清单</h3>
		<div class="cart_list cart_order_list">
			<div class="cart_thead clearfix">
				<div class="row2">
					<span>商品</span>
				</div>
				<div class="row3 ac">价格</div>
				<div class="row4 ac">属性</div>
				<div class="row5 ac">
					<span>数量</span>
				</div>
			</div>
			<div class="cart_tbody_con">
				<c:forEach items="${listc}" var="listc">
					<div class="cart_tbody clearfix">
						<div class="row2 padl20">
							<div class="p_goods clearfix">
								<a class="p_img fl"><img alt=""
									src="<%=request.getAttribute("basePath")%>${listc.imgurl}"></a>
								<a class="p_txt fl" id='itemid'>${listc.itemid}</a>
							</div>
						</div>
						<div class="row3 ac">
							<span class="p_price">￥${listc.price}</span>
						</div>
						<div class="row4 ac">
							<span id ='attrigid' >${listc.attrigid}</span>
						</div>
						
						<div class="row5 ac">
								<a id='num' class ="cl_num">${listc.num}</a>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="p_total">
			<div class="ar p_total_txt">
				<a style="margin: 7px 0 0 15px;" class="fr btn_qjs"
					onclick="subsal()">提交订单</a>
				<div class="fr">
					<span class="l">金额总计：</span><span class="r" id="total"><%=sum%></span>
				</div>
			</div>
		</div>
	</div>
	<div class="cover_layer"></div>
</body>
</html>