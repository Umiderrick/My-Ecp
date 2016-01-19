<%@ page language="java" pageEncoding="UTF-8"
	import="java.util.*,pb.db.*,pb.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String itemid = session.getAttribute("itemid").toString();
	List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
	List<Map<String, Object>> lista = new ArrayList<Map<String, Object>>();
	List<Map<String, Object>> listag = new ArrayList<Map<String, Object>>();
	List<Map<String, Object>> listr = new ArrayList<Map<String, Object>>();
	Itemdealer itd = new Itemdealer();
	Remarkdealer rmd = new Remarkdealer();
	TableValues tv = itd.query("item", itemid);
	DataColumn[] dcl = tv.getDataColumns();
	TableValues tvag = itd.queryattg(itemid);
	DataColumn[] dclag = tvag.getDataColumns();
	TableValues tva = itd.queryatt(itemid);
	DataColumn[] dcla = tva.getDataColumns();
	TableValues tvr = rmd.queryI(itemid);
	DataColumn[] dclr = tvr.getDataColumns();
	for (int i = 0; i < tv.getValues().length; i++) {
		Map<String, Object> map = new HashMap<String, Object>();
		for (int j = 0; j < tv.getDataColumns().length; j++) {
			String key = dcl[j].getName();
			String value = tv.getValues()[i][j].toString();
			map.put(key, value);
		}
		list.add(map);
	}
	for (int i = 0; i < tvag.getValues().length; i++) {
		Map<String, Object> mapag = new HashMap<String, Object>();
		for (int j = 0; j < tvag.getDataColumns().length; j++) {
			String keyag = dclag[j].getName();
			String valueag = tvag.getValues()[i][j].toString();
			mapag.put(keyag, valueag);
		}
		listag.add(mapag);
	}
	for (int i = 0; i < tva.getValues().length; i++) {
		Map<String, Object> mapa = new HashMap<String, Object>();
		for (int j = 0; j < tva.getDataColumns().length; j++) {
			String keya = dcla[j].getName();
			String valuea = tva.getValues()[i][j].toString();
			mapa.put(keya, valuea);
		}
		lista.add(mapa);
	}
	for (int i = 0; i < tvr.getValues().length; i++) {
		Map<String, Object> mapr = new HashMap<String, Object>();
		for (int j = 0; j < tvr.getDataColumns().length; j++) {
			String keyr = dclr[j].getName();
			String valuer = tvr.getValues()[i][j].toString();
			mapr.put(keyr, valuer);
		}
		listr.add(mapr);
	}
	request.setAttribute("list", list);
	request.setAttribute("listag", listag);
	request.setAttribute("lista", lista);
	request.setAttribute("listr", listr);
%>
<html>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;
	request.setAttribute("basePath", basePath);
%>
<head>
<meta content="text/html;charset =UTF-8">
<title>详情</title>
<link href="css/global.css" rel="stylesheet" type="text/css">
<link href="css/pshow.css" rel="stylesheet" type="text/css">
<link href="css/login.css" rel="stylesheet" type="text/css">
<link href="css/cart.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/jquery-1.7.2.js"></script>
<script type="text/javascript" src="js/toggleMenu.js"></script>
<script type="text/javascript" src="js/banner_slide.js"></script>
<script type="text/javascript" src="js/magni.js"></script>
<script src="js/list.js" type="text/javascript"></script>
<script type="text/javascript" src="js/img_scroll.js"></script>
<script type="text/javascript" src="js/header.js"></script>
<script type="text/javascript" src="js/openPop.js"></script>
<script type="text/javascript">
	$(function() {
		//	laze_load()
		toggleMenu(".all_products", ".second_menu", ".third_menu");
		_scroll(5, ".preview_scroll", true, false);
		_scroll(5, ".last_view_con", false, false);
		magnifier.init({
			cont : document.getElementById('magnifier'),//小图像容器
			img : document.getElementById('magnifierImg'),//大图像图片
			mag : document.getElementById('mag'),//放大之后的图片容器
			scale : 2
		//放大倍数
		});
		function litile_pic() {
			$(this).addClass("cur").siblings().removeClass("cur");//栏目块头部的标题标签切换功能
			return false;
		}
		$(
				".product_litile_pic&amp;gt;a,.show_wrap_h3.right&amp;gt;h3&amp;gt;a:not(:only-child)")
				.on("click", litile_pic);

		$("a.btn_fen_little:has(span:contains('回复'))").on("click", function() {
			var g = $(this).parents("dl").next("div.reply_box");
			if (g.css("display") == "none") {
				g.show();
			} else {
				g.hide();
			}
			return false;
		})
		function f_reply_btn() {
			var g, $this;
			$("dl.reply").live({
				"mouseenter" : function() {
					$this = $(this)
					g = $this.find("dd.reply_btn");
					g.show();
				},
				"mouseleave" : function() {
					if ($this.next("div.reply_box").css("display") == "block")
						return;
					g.hide();
				}
			})
		}
		//回复
		f_reply_btn();

	})

	//加减商品个数
	function setProduct(op) {
		var id_num = $("#num");
		var num = parseInt(id_num.val());
		if (op == 'add') {
			num = num + 1;
		} else if (op == 'reduce') {

			if (num < 1) {
				alert("不能小于0!");
			} else {
				num = num - 1;
			}
		}
		id_num.val(num);
	}
	function subcart() {
		var itemid = document.getElementById('itemid').innerHTML;
		var num = document.getElementById('num').value;
		var $attrigname = $("i.selected_ok").prev().text();
		$.get("CartServlet", {
			"itemid" : itemid,
			"num" : num,
			"attrigname":$attrigname
		});
	}
	function remark() {
		window.location.href = 'makeremark.jsp';
	}
	function selectatt(attrigid) {
		var gname =attrigid.innerHTML;
		$("#"+attrigid).after("<i class=selected_ok>  </i>");
		 }
</script>
<style>
.product_intro_mainName strong {
	color: #E4393C;
	display: block;
	font-size: 16px;
	float: left;
}

.product_intro_mainName {
	overflow: hidden;
	margin-bottom: 10px;
	margin-top: 5px
}

.summary .li-img {
	line-height: 28px;
	margin-right: 10px;
	margin-top: -3px;
}

.summary .li-img img {
	border: 1px solid #DDDDDD;
	float: left;
	margin-right: 5px;
}

.product_intro .product_intro_wrap dl a:hover {
	text-decoration: underline;
}

.hl_red {
	color: #E4393C;
}
</style>
<style>
.reply_btn a {
	position: absolute;
	right: 0;
	top: -20px;
}

.reply_btn {
	position: relative;
	width: 100%;
	display: none;
}

.reply-wrap {
	border: 1px solid #E7E3E2;
	margin-top: 8px;
	overflow: hidden
}

.reply-input {
	padding: 10px;
	padding-top: 0px;
	padding-right: 5px;
	width: 780px;
	*width: 750px;
	float: left;
}

.reply-wrap p {
	padding: 5px 10px
}

.comments_list .comment_con_r .formation dl.reply dt a {
	color: #B27068
}

.comments_list .comment_con_r .formation dl.reply dt em {
	color: #999
}

.show_wrap_h3.right h3 {
	padding-left: 0px;
	border: 0px none;
	height: 30px;
}
</style>
</head>
<body>
	<div class="ui_header">
		<div class="ui_header_top">
			<div class="w1200"></div>
		</div>
		<div class="ui_header_logo"></div>
		<div class="ui_header_nav"></div>
	</div>
	<div class="w1200">
		<c:forEach items="${list}" var="list">
			<div class="preview">
				<div style="cursor: crosshair;" id="magnifier">
					<img width='350' height='350'
						src="<%=request.getAttribute("basePath")%>${list.imgurl}" id="img">
					<div id="Browser"
						style="width: 173px; height: 173px; opacity: 0.5; top: 0px; left: 175px; display: none;"></div>
				</div>
				<div
					style="width: 350px; height: 350px; position: absolute; left: 360px; top: 0px; display: none;"
					id="mag">
					<img src="<%=request.getAttribute("basePath")%>${list.imgurl}"
						style="position: absolute; width: 700px; height: 700px; top: -350px; left: -222px;"
						id="magnifierImg">
				</div>
			</div>
			<div class="product_intro">
				<div class="product_intro_wrap">
					<h3 id="itemid" class="product_intro_title">${list.itemid}</h3>
					<h3 class="product_intro_mainName">
						<strong class="mainName01">${list.itemname}</strong>
					</h3>
					<div class="summary">
						<dl class="w150">
							<dt>价格：</dt>
							<dd>
								<span class="txt_red">￥${list.price}</span>
							</dd>
						</dl>
						<dl class="w150">
							<dt>余量：</dt>
							<dd>
								<span class="txt_red">${list.qty}</span>
							</dd>
						</dl>
					</div>
				</div>
			</div>
		</c:forEach>
		<div class="product_intro">
			<div class="product_intro_wrap" style="border-bottom: 0 none">
				<a>物品属性</a>
				<div class="product_proper">
					<c:forEach items="${lista}" var="lista">
						<dl class="w150">
							<dt>${lista.attname}：</dt>
							<dd>
								<div class="product_litile_pic">
									<c:forEach items="${listag}" var="listag" varStatus="sta2">
										<c:if test="${lista.attid == listag.attid}">
											<a id="attresInfo" class="cur">
											 <span	id="${listag.attrigid}" onclick="selectatt('${listag.attrigid}')" class="product_pic_size">${listag.attrigname}</span> 
											</a>
										</c:if>
									</c:forEach>
								</div>
							</dd>
						</dl>
					</c:forEach>
					<dl class="w150" style="_clear: both">
						<dt>购买数量：</dt>
						<dd>
							<div class="product_pic_price">
								<span class="product_reduce" onclick="setProduct('reduce')"></span>
								<span class="product_num"> <input class="num" id="num"
									value="1" type="text">
								</span> <span class="product_add" onclick="setProduct('add')"></span>
							</div>
						</dd>
					</dl>
					<dl class="w150">
						<dt class="kong"></dt>
						<dd>
							<a onclick="subcart()" class="btn_zong big"
								href="cart_step_1.jsp"><i class="icon_addcart"></i><span
								class="shadow_txt"><img src="res/images/bg/txt/txt1.png"></span></a>
						</dd>
					</dl>
				</div>
			</div>
		</div>
	</div>
	<div class="w1200">
		<div class="w960">
			<div class="show_wrap_h3 right product_detail">
				<h3>
					<a class="cur">商品评价</a>
				</h3>
				<c:forEach items="${list}" var="list">
					<div class="hiddenGoodsInfo" id="goodsintruduce">
						<ul class="detail_list">
							<li>商品名称 ： ${list.itemname}</li>
							<li>商品号： ${list.itemid}</li>
							<li>类别 ： ${list.thitypeid}</li>
						</ul>
					</div>
				</c:forEach>
			</div>
			<div id="pinglun" class="show_wrap_h3 right comments_list">
				<h3>
					<a id="skucommsum" class="cur">全部评价(0)</a> <a id="Good">好评(0)</a> <a
						id="Middle">中评(0)</a> <a id="Bad">差评(0)</a> <span
						class="btn_zong btn_fen_little"> <a onclick="remark()">发表评论</a>
					</span>
				</h3>
				<div id="comments"></div>
				<c:forEach items="${listr}" var="listr">
					<div class="clearfix">
						<div style="padding: 0px 0 0 90px;" class="fl">${listr.neirong}</div>
						<div class="page_wrap">
							<ul class="page">
								<li>${listr.username}</li>
							</ul>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>