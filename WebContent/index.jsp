<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page
	import="java.util.*,pb.db.*,pb.firsttype.Firtypedealer,pb.secondtype.Sectypedealer,pb.thirdtype.Thitypedealer"%>
<%
	List<Map<String, Object>> list1 = new ArrayList<Map<String, Object>>();
	List<Map<String, Object>> list2 = new ArrayList<Map<String, Object>>();
	List<Map<String, Object>> list3 = new ArrayList<Map<String, Object>>();
	Firtypedealer ftd = new Firtypedealer();
	Sectypedealer std = new Sectypedealer();
	Thitypedealer ttd = new Thitypedealer();
	TableValues tv1 = ftd.query("firtype");
	TableValues tv2 = std.query("sectype");
	TableValues tv3 = ttd.query("thitype");
	DataColumn[] dcl1 = tv1.getDataColumns();
	DataColumn[] dcl2 = tv2.getDataColumns();
	DataColumn[] dcl3 = tv3.getDataColumns();
	for (int i = 0; i < tv1.getValues().length; i++) {
		Map<String, Object> map1 = new HashMap<String, Object>();
		for (int j = 0; j < tv1.getDataColumns().length; j++) {
			String key1 = dcl1[j].getName();
			String value1 = tv1.getValues()[i][j].toString();
			map1.put(key1, value1);
		}
		list1.add(map1);
	}
	for (int i = 0; i < tv2.getValues().length; i++) {
		Map<String, Object> map2 = new HashMap<String, Object>();
		for (int j = 0; j < tv2.getDataColumns().length; j++) {
			String key2 = dcl2[j].getName();
			String value2 = tv2.getValues()[i][j].toString();
			map2.put(key2, value2);
		}
		list2.add(map2);
	}
	for (int i = 0; i < tv3.getValues().length; i++) {
		Map<String, Object> map3 = new HashMap<String, Object>();
		for (int j = 0; j < tv3.getDataColumns().length; j++) {
			String key3 = dcl3[j].getName();
			String value3 = tv3.getValues()[i][j].toString();
			map3.put(key3, value3);
		}
		list3.add(map3);
	}
	request.setAttribute("list1", list1);
	request.setAttribute("list2", list2);
	request.setAttribute("list3", list3);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset =UTF-8">
<title>主页</title>
<link href="css/global.css" rel="stylesheet" type="text/css" />
<link href="css/index.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.min.css" type="text/css" rel="stylesheet">
<script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<script type="text/javascript" src="js/toggleMenu.js"></script>
<script type="text/javascript" src="js/header.js"></script>
<script type="text/javascript" src="js/banner_slide.js"></script>
<script type="text/javascript" src="js/img_scroll.js"></script>
<script type="text/javascript" src="js/magni.js"></script>
<script type="text/javascript">
$(function(){
	toggleMenu(null,".second_menu",".third_menu");
		if("<%=session.getAttribute("userName")%>" == "null") {
			$("#welcoml").hide();
			$("#welcom").show();
			$("#welcoml_b").hide();
			$("#welcom_b").show();
		} else {
			$("#welcoml").show();
			$("#welcom").hide();
			$("#welcoml_b").show();
			$("#welcom_b").hide();
		}
	})
	function logout() {
		var uname = document.getElementById("uname").innerHTML;
		$.get("login/login", {
			"username" : uname
		}, function() {
			window.location.reload(false);
		});

	}
	function listsearch() {
		var pattern = document.getElementById('search').value;
		if (pattern == "") {
			window.location.href = "search/list_search_noresult.jsp"
		} else {
			$.post("IndexServlet", {
				"pattern" : pattern
			}, window.location.href = "search/list_search.jsp");
		}
	}
	function thitypesearch(thitypeid) {
		$.get("IndexServlet", {
			"thitypeid" : thitypeid
		},window.location.href= "search/list_search_thitype.jsp?thitypeid="+thitypeid);
	}
</script>
<style>
dl {
	margin-bottom: 0;
	margin-top: 0;
}

.ui_header_logo .ui_header_logo_bg {
	background: rgba(0, 0, 0, 0) url("res/images/bg/header_search.png")
		no-repeat scroll left center;
	margin: 0 auto;
	padding-bottom: 0;
	padding-top: 13px;
	width: 1200px;
}
</style>
</head>

<body>
	<div class="ui_header">
		<div class="ui_header_top">
			<div class="w1200">
				<div id="welcoml" class="welcome">
					欢迎<a id="uname"><%=session.getAttribute("userName")%></a>登录<a>|</a><a
						onclick="logout()">点此<b>注销</b></a>
				</div>
				<div id="welcom" class="welcome">
					欢迎您！<a href="login/login.jsp"><b>请登录</b></a>
				</div>
			</div>
		</div>
	</div>
	<div class="ui_header_logo">
		<div class="ui_header_logo_bg">
			<div class="w1200">
				<div class="ui_header_logo_pic">
					<a href="index.jsp"><img src="res/images/123312.png" /></a>
				</div>
				<div class="ui_header_logo_search">
					<div class="serch_box">
						<input type="text" placeholder="请输入关键字" id="search" />
						<button onclick="listsearch()">搜索</button>
					</div>
				</div>
				<div class="ui_header_logo_func">
					<a href="login/welcome.jsp" class="btn_zong"><i
						class="icon_account"></i><span>我的账户</span></a> <a
						href="cart/cart_step_1.jsp" class="btn_zong"><i
						class="icon_cart"></i><span>购物车</span></a>
				</div>
				<div class="ui_header_logo_posi">
					<div class="ui_header_logo_posi_account">
						<div class="posi_wrap_content">
							<div id="welcoml_b" class="wrap_top">
								<a> <b>您好，</b><%=session.getAttribute("userName")%><b>欢迎登录</b></a>
							</div>
							<div id="welcom_b" class="wrap_top">
								<b>您好，请</b><a href="login/login.jsp"><b>登录</b></a>
							</div>
							<div class="wrap_middle">
								<div class="wrap_middle_r">
									<a href="salorder/mysalorder.jsp">我的订单&nbsp;&nbsp;&gt;</a> <a
										href="remark/myremark.jsp">我的评价&nbsp;&nbsp;&gt;</a>
								</div>
							</div>
						</div>
						<div class="wrap_bottom"></div>
					</div>
				</div>
			</div>
		</div>
		<div class="ui_header_nav">
			<div class="w1200">
				<ul class="first_menu">
					<li class="all_products"><a href="#" class="hove">全部商品分类</a>
						<ul class="second_menu">
							<c:forEach items="${list1}" var="list1">
								<li>
									<dl>
										<dt>
											<span>${list1.firtypename}</span>
										</dt>
										<dd>
											<c:forEach items="${list2}" var="list2">
												<c:if test="${list2.firtypeid==list1.firtypeid}">
													<a>${list2.sectypename}</a>
												</c:if>
											</c:forEach>
										</dd>
									</dl>
									<div class="third_menu">
										<div class="third_shadow_inset">
											<dl>
												<c:forEach items="${list2}" var="list2">
													<c:if test="${list2.firtypeid==list1.firtypeid}">
														<dt>
															<span>${list2.sectypename} </span>
														</dt>
														<dd>
															<c:forEach items="${list3}" var="list3">
																<c:if test="${list3.sectypeid==list2.sectypeid}">
																	<a onclick="thitypesearch('${list3.thitypeid}')">${list3.thitypename}</a>
																	<span> </span>
																</c:if>
															</c:forEach>
														</dd>
													</c:if>
												</c:forEach>
											</dl>
										</div>
									</div>
								</li>
							</c:forEach>
						</ul></li>
					<li><a href="index.jsp">首页</a></li>
					<li><a href="#">品牌专区</a></li>
					<li><a href="#">促销区</a></li>
				</ul>
			</div>
		</div>

		<div class="banner_wrap">
			<div class="banner_slide">
				<div class="bannerpic lxfscroll">
					<div id="myCarousel" class="carousel slide">
						<ol class="carousel-indicators">
							<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
							<li data-target="#myCarousel" data-slide-to="1"></li>
							<li data-target="#myCarousel" data-slide-to="2"></li>
							<li data-target="#myCarousel" data-slide-to="3"></li>
						</ol>
						<div class="carousel-inner">
							<div class="item" onclick = "thitypesearch('0080101')">
								<img src="res/images/bg/lunbo2.png">
							</div>
							<div class="item active">
								<img src="res/images/bg/lunbo1.png">
							</div>
							<div class="item">
								<img src="res/images/bg/lunbo3.png">
							</div>
							<div class="item">
								<img src="res/images/bg/lunbo4.png">
							</div>
						</div>
						<a class="carousel-control left" href="#myCarousel"
							data-slide="prev"> <span
							class="glyphicon glyphicon-chevron-left"></span>
						</a> <a class="carousel-control right" href="#myCarousel"
							data-slide="next"> <span
							class="glyphicon glyphicon-chevron-right"></span>
						</a>
					</div>
				</div>
			</div>
		</div>
		<div class="ui_container">
			<div class="w1200">
				<div class="hot_show">
					<div class="sc_content" style="width: 964px;">
						<div class="prev_go" style="visibility: hidden;"></div>
						<div class="scroll_wrap" style="width: 920px;">
							<ul class="scroll_body" style="left: 0px;">
								<li><a onclick='gg(1001)'><img
										src="res/images/temp/index_sc05.jpg"></a></li>
								<li><a onclick='gg(1001)'><img
										src="res/images/temp/index_sc04.jpg"></a></li>
								<li><a onclick='gg(1001)'><img
										src="res/images/temp/index_sc03.jpg"></a></li>
								<li><a onclick='gg(1001)'><img
										src="res/images/temp/index_sc02.jpg"></a></li>
								<li class="end"><a onclick='gg()'><img
										src="res/images/temp/index_sc01.jpg"></a></li>
							</ul>
						</div>
						<div class="next_go scroll_end" style="visibility: hidden;"></div>
					</div>
				</div>
			</div>
			<div class="w1200">
				<div class="hot_show">
					<div class="sc_content" style="width: 964px;">
						<div class="prev_go" style="visibility: hidden;"></div>
						<div class="scroll_wrap" style="width: 920px;">
							<ul class="scroll_body" style="left: 0px;">
								<li><a onclick='gg(1001)'><img
										src="res/images/temp/index_sc05.jpg"></a></li>
								<li><a onclick='gg(1001)'><img
										src="res/images/temp/index_sc04.jpg"></a></li>
								<li><a onclick='gg(1001)'><img
										src="res/images/temp/index_sc03.jpg"></a></li>
								<li><a onclick='gg(1001)'><img
										src="res/images/temp/index_sc02.jpg"></a></li>
								<li class="end"><a onclick='gg()'><img
										src="res/images/temp/index_sc01.jpg"></a></li>
							</ul>
						</div>
						<div class="next_go scroll_end" style="visibility: hidden;"></div>
					</div>
				</div>
			</div>
		</div>
		<div class="ui_footer_top">
			<div class="w1200">
				<div class="ui_footer_top_l">
					<p class="ui_footer_top_l_name">服务热线 ：400-00000000</p>
					<p class="ui_footer_top_l_time">客服时间： 09:00-18:00（周一至周五）</p>
				</div>
				<div class="ui_footer_top_r">
					<dl>
						<dt>新手上路</dt>
						<dd>
							<a href="#">联系客服</a>
						</dd>
						<dd>
							<a href="#">会员制度</a>
						</dd>
						<dd>
							<a href="#">购物流程</a>
						</dd>
						<dd>
							<a href="#">服务条款</a>
						</dd>
					</dl>
					<dl>
						<dt>支付方式</dt>
						<dd>
							<a href="#">支付方式</a>
						</dd>
						<dd>
							<a href="#">支付等待时间</a>
						</dd>
						<dd>
							<a href="#">发票制度</a>
						</dd>
					</dl>
					<dl>
						<dt>配送说明</dt>
						<dd>
							<a href="#">国内配送</a>
						</dd>
						<dd>
							<a href="#">配送常见问题</a>
						</dd>
						<dd>
							<a href="#">商品的验货与签收</a>
						</dd>
						<dd>
							<a href="#">配送时间</a>
						</dd>
					</dl>
					<dl>
						<dt>账户管理</dt>
						<dd>
							<a href="#">账户注册</a>
						</dd>
						<dd>
							<a href="#">找回密码</a>
						</dd>
					</dl>
					<dl>
						<dt>售后服务</dt>
						<dd>
							<a href="#">退换货流程</a>
						</dd>
						<dd>
							<a href="#">退款说明</a>
						</dd>
					</dl>
					<dl>
						<dt>关于我们</dt>
						<dd>
							<a href="#">集团简介</a>
						</dd>
						<dd>
							<a href="#">友情链接</a>
						</dd>
						<dd>
							<a href="#">商家入驻</a>
						</dd>
					</dl>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
