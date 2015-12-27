<%@ page language="java"  pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset =UTF-8">
<title>购物车</title>
<link type="text/css" rel="stylesheet" href="css/global.css">
<link type="text/css" rel="stylesheet" href="css/cart.css">
<script src="js/jquery-1.7.2.js" type="text/javascript"></script>
<script src="js/cart_step_1.js" type="text/javascript"></script>
</head>
<body>
<!--begin 购物车头部-->
<div class="cart_header">
	<div class="ui_header_top"><!--和公用头部-->
		<div class="w990">
		</div>
	</div>
	<div class="w990">
		<!--begin logo-->
		<div class="cart_header_logo fl"><a href="javascript:;"><img src="res/images/bg/logo.png"></a></div>
		<!--end logo-->
		<!--begin 当前第几步提示-->
		<div class="cart_step_tips fr">
			<div class="cart_step_tips_txt clearfix">
				<span class="dq">我的购物车</span>
				<span>填写核对订单信息</span>
				<span>成功提交订单</span>
			</div>
			<div class="cart_step_tips_bg step1"></div>
			<!--div class="cart_step_tips_bg step2"></div>
			<div class="cart_step_tips_bg step3"></div-->
		</div>
		<!--end 当前第几步提示-->
	</div>
</div>
<!--end 购物车头部-->
<div class="w990">
	<!--购物车标题-->
	<h3 class="h3_mycart_tit"><i></i><span>我的购物车</span></h3>
</div>
<!--begin购物车列表-->
<!--各自页在此做各自页在此做各自页在此做各自页在此做-->
<div class="cart_list posr">
	<!--表头-->
	<div class="cart_thead clearfix">
		<div class="row1 ar"><input id="checkall" name="checkall" type="checkbox"><label for="checkall">全选</label></div>
		<div class="row2"><span>商品</span></div>
		<div class="row3 ac">价格</div>
		<div class="row5 ac">库存</div>
		<div class="row6 ac"><span>数量</span></div>
		<div class="row7 ac">操作</div>
	</div>
	<!--表体-->
	<div class="cart_tbody_con">
		<div class="cart_tbody clearfix">
			<div class="row1"><input id="" name="" type="checkbox"></div>
			<div class="row2">
				<!--商品信息-->
				<div class="p_goods clearfix">
					<a class="p_img fl" href="javascript:;"><img alt="" src="res/images/temp/account_show.jpg"></a>
					<a class="p_txt fl" href="javascript:;">床品家纺 全棉缎纹印花双人加大1.8米全棉缎纹印花双人加大1.8米床四件套W-AD58-4虹</a>
				</div>
			</div>
			<div class="row3 ac"><span class="p_price">￥5999.00</span></div>
			<div class="row4 ac"><span class="p_line50">100</span></div>
			<div class="row5 ac"><span class="p_line50">有货</span></div>
			<div class="row6">
				<div class="p_quantity ac">
					<a class="jian_goods" href="javascript:;">-</a>
					<input value="3" class="num" id="" name="" type="text">
					<a class="jia_goods" href="javascript:;">+</a>
					<!--div class="ac js">仅剩<span>3</span>件</div-->
				</div>
			</div>
			<div class="row7 ac posr">
				<span class="p_del p_line50"><a class="alert_del_goods" href="javascript:;">删除</a></span>
			</div>
		</div>
		<!--end 营销活动 === 满赠-->
		<div class="cart_tbody clearfix">
			<div class="row1"><input id="" name="" type="checkbox"></div>
			<div class="row2">
				<!--商品信息-->
				<div class="p_goods clearfix">
					<a class="p_img fl" href="javascript:;"><img alt="" src="res/images/temp/account_show.jpg"></a>
					<a class="p_txt fl" href="javascript:;">床品家纺 全棉缎纹印花双人加大1.8米全棉缎纹印花双人加大1.8米床四件套W-AD58-4虹</a>
				</div>
			</div>
			<div class="row3 ac"><span class="p_price">￥5999.00</span></div>
			<div class="row4 ac"><span class="p_line50">100</span></div>
			<div class="row5 ac"><span class="p_line50">有货</span></div>
			<div class="row6">
				<div class="p_quantity ac">
					<a class="jian_goods" href="javascript:;">-</a>
					<input value="2" class="num" id="" name="" type="text">
					<a class="jia_goods" href="javascript:;">+</a>
					<div class="ac js"></div>
				</div>
			</div>
			<div class="row7 ac posr">
				<span class="p_del p_line50"><a class="alert_del_goods" href="javascript:;">删除</a></span>
			</div>
		</div>
	</div>
	<!--弹出删除商品-->
	<div class="alert_del_goods_box pad0 hide">
		<a class="close_dialog" href="javascript:;"></a>
		<div class="alert_del_goods_con">
			<h4 class="bg">删除商品</h4>
			<p>确定从购物车中删除此商品？</p>
			<a class="del_goods_ok" href="javascript:;">确认</a>
			<a class="del_goods_qx" href="javascript:;">取消</a>
		</div>
	</div>
	<!--统计-->
	<div class="p_total">
		<div class="pad5 clearfix">
			<span class="fl p_del_all"><a class="del_goods_checked" href="javascript:;"><i class="fl"></i><span class="fl">删除选中的商品</span></a></span>
			<span class="fr p_total_num">共 <em>3</em> 件商品 总计：￥699.00</span>
		</div>
		<div class="ar p_total_txt"><span class="l">金额总计（不含运费）：</span><span class="r">￥1580.00</span></div>
		<div class="p_total_btn clearfix">
			<a class="fl btn_jxgw" href="javascript:;">继续购物</a>
			<a class="fr btn_qjs" href="cart_step_2.html">去结算<em>&gt;</em></a>
		</div>
	</div>
</div>

<!--end 购物车列表-->
<!--购买该商品的用户还购买了 通用-->

<!--底部 参见 footer.html-->


<!--end底部 参见 footer.html-->


</body></html>