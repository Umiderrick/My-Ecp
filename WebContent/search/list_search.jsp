<%@ page language="java"
	import="java.util.*,pb.db.*,pb.firsttype.*,pb.secondtype.*,pb.thirdtype.*,pb.attribute.*,pb.attributeg.*"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	{
		List<Map<String, Object>> list1 = new ArrayList<Map<String, Object>>();
		Firtypedealer ftd = new Firtypedealer();
		TableValues tv1 = ftd.query("firtype");
		DataColumn[] dcl1 = tv1.getDataColumns();
		for (int i = 0; i < tv1.getValues().length; i++) {
			Map<String, Object> map1 = new HashMap<String, Object>();
			for (int j = 0; j < tv1.getDataColumns().length; j++) {
				String key1 = dcl1[j].getName();
				String value1 = tv1.getValues()[i][j].toString();
				map1.put(key1, value1);
			}
			list1.add(map1);
		}
		request.setAttribute("list1", list1);
	}
	{
		List<Map<String, Object>> list2 = new ArrayList<Map<String, Object>>();
		Sectypedealer std = new Sectypedealer();
		TableValues tv2 = std.query("sectype");
		DataColumn[] dcl2 = tv2.getDataColumns();
		for (int i = 0; i < tv2.getValues().length; i++) {
			Map<String, Object> map2 = new HashMap<String, Object>();
			for (int j = 0; j < tv2.getDataColumns().length; j++) {
				String key2 = dcl2[j].getName();
				String value2 = tv2.getValues()[i][j].toString();
				map2.put(key2, value2);
			}
			list2.add(map2);
		}

		request.setAttribute("list2", list2);
	}
	{
		List<Map<String, Object>> list3 = new ArrayList<Map<String, Object>>();
		Thitypedealer ttd = new Thitypedealer();
		TableValues tv3 = ttd.query("thitype");
		DataColumn[] dcl3 = tv3.getDataColumns();
		for (int i = 0; i < tv3.getValues().length; i++) {
			Map<String, Object> map3 = new HashMap<String, Object>();
			for (int j = 0; j < tv3.getDataColumns().length; j++) {
				String key3 = dcl3[j].getName();
				String value3 = tv3.getValues()[i][j].toString();
				map3.put(key3, value3);
			}
			list3.add(map3);
		}

		request.setAttribute("list3", list3);
	}
	{
		List<Map<String, Object>> list4 = new ArrayList<Map<String, Object>>();
		Attributedealer atd = new Attributedealer();
		TableValues tv4 = atd.query("attribute");
		DataColumn[] dcl4 = tv4.getDataColumns();
		for (int i = 0; i < tv4.getValues().length; i++) {
			Map<String, Object> map4 = new HashMap<String, Object>();
			for (int j = 0; j < tv4.getDataColumns().length; j++) {
				String key4 = dcl4[j].getName();
				String value4 = tv4.getValues()[i][j].toString();
				map4.put(key4, value4);
			}
			list4.add(map4);
		}
		request.setAttribute("list4", list4);
	}
	{
		List<Map<String, Object>> list5 = new ArrayList<Map<String, Object>>();
		Attributedealer agd = new Attributedealer();
		TableValues tv5 = agd.query("attg");
		DataColumn[] dcl5 = tv5.getDataColumns();
		for (int i = 0; i < tv5.getValues().length; i++) {
			Map<String, Object> map5 = new HashMap<String, Object>();
			for (int j = 0; j < tv5.getDataColumns().length; j++) {
				String key5 = dcl5[j].getName();
				String value5 = tv5.getValues()[i][j].toString();
				map5.put(key5, value5);
			}
			list5.add(map5);
		}
		request.setAttribute("list5", list5);
	}
	{
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
				+ path;
		request.setAttribute("basePath", basePath);
	}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品列表页</title>
<link type="text/css" rel="stylesheet" href="../css/global.css">
<link type="text/css" rel="stylesheet" href="../css/list.css">
<script src="../js/jquery-1.11.3.min.js"></script>
<script src="../js/toggleMenu.js" type="text/javascript"></script>
<script src="../js/banner_slide.js" type="text/javascript"></script>
<script src="../js/magni.js" type="text/javascript"></script>
<script src="../js/img_scroll.js" type="text/javascript"></script>
<script src="../js/header.js" type="text/javascript"></script>
<script src="../js/page.js" type="text/javascript"></script>
<script src="../js/list.js" type="text/javascript"></script>
<script type="text/javascript">
$(function() {
	toggleMenu(".all_products", ".second_menu", ".third_menu");
	_scroll(5, ".last_view_con", false, false);
	if("<%=session.getAttribute("userName")%>" == "null") {
		$("#welcom").show();
		$("#welcoml").hide();
	} else {
		$("#welcoml").show();
		$("#welcom").hide();
	}

	

})

/* 三级类别查询*/
		function thitypesearch(thitypeid) {
	$.get("../IndexServlet", {
		"thitypeid" : thitypeid
	},window.location.href= "list_search_thitype.jsp?thitypeid="+thitypeid);		}

/* begin 点击切换页签效果 并给价格页签增加上下箭头切换效果*/	
   $(function(){ 
	$(".order>dl>dd").click(function(){
	   //点击切换背景颜色  
	   $(this).children('a').addClass('cur');
	   $(this).siblings().children('a').css("padding-right","12px").removeClass('cur').children('i').removeClass();
	   //点击价格出现上下箭头 并切换
	   if($(this).children('a').children('i').attr("class")=="icon_orderdown")
		{   //点击价格出现下箭头 切换成上箭头
			 $(this).children('a').css("padding-right","20px").children('i').removeClass("icon_orderdown").addClass("icon_orderup");
			    $.ajax({
			        type: "GET",
			        url: "ListSearchServlet",
			        data: { "sorttype": "desc" ,"num" :"1" }
			      })
			        .done(function( data ) {
			        	$("#itemlist").empty();
			        	var html = ""
			        			 html+="<ul class='filter_goods'>"
									+	"</ul>"
			        			$("#itemlist").html(html);
			        			});
		} else {
				if($(this).children('a').children('i').attr("class")=="icon_orderup")
				{    //点击价格出现上箭头 切换成下箭头
					  $(this).children('a').css("padding-right","20px").children('i').removeClass("icon_orderup").addClass("icon_orderdown");	
					  $.ajax({
					        type: "GET",
					        url: "ListSearchServlet",
					        data: { "sorttype": "asc" ,"num" :"1" }
					      })
					        .done(function( data ) {
					        	$("#itemlist").empty();
					        	var html = ""
					        			 html+="<ul class='filter_goods'>"
											+	"</ul>"
					        			$("#itemlist").html(html);
					        			});
				}else{ 
					   //点击价格增加上箭头 
					   if($(this).attr("class")=="price")
					   {
							$(this).children('a').css("padding-right","20px").addClass('cur').children('i').addClass("icon_orderup");
							$.ajax({
						        type: "GET",
						        url: "ListSearchServlet",
						        data: { "sorttype": "desc" ,"num" :"1" }
						      })
						        .done(function( data ) {
						        	$("#itemlist").empty();
						        	var html = ""
						        			 html+="<ul class='filter_goods'>"
												+	"</ul>"
						        			$("#itemlist").html(html);
						        			});
					   } 
					}
	   }//end if else
	})
  })
</script>
<style>
.place_mid {
	margin: 0 auto;
	width: 500px;
}
</style>
</head>
<body>
	<div class="ui_header">
		<div class="ui_header_top">
			<div class="w1200">
				<div id="welcoml" class="welcome">
					<span>您好！</span>
					<%=session.getAttribute("userName")%>
					<span> 请尽情的购买</span>
				</div>
				<div id="welcom" class="welcome">
					<span>您好！</span> <span><a href="../login/login.jsp"><b>请登录</b></a></span>
				</div>
			</div>
		</div>
		<div class="ui_header_logo">
			<div class="ui_header_logo_bg">
				<div class="place_mid">
					<div class="w1200">
						<div class="ui_header_logo_search">
							<div class="serch_box">
								<input type="text" placeholder="请输入关键字" id="search" />
								<button onclick="listsearch()">搜索</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="ui_header_nav">
			<div class="w1200">
				<ul class="first_menu">
					<li class="all_products"><a class="" href="../index.jsp">首页</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="w1200">
		<div class="w230 fl">
			<h3>
				类别筛选<strong>-三级类别筛选</strong>
			</h3>
			<div class="list_menu_wrap">
				<c:forEach items="${list2}" var="list2">
					<h3>${list2.sectypename}</h3>
					<ul class="hide">
						<c:forEach items="${list3}" var="list3">
							<c:if test="${list3.sectypeid==list2.sectypeid}">
								<li><a onclick="thitypesearch('${list3.thitypeid}')">${list3.thitypename}</a></li>
							</c:if>
						</c:forEach>
					</ul>
				</c:forEach>
			</div>
		</div>
		<div class="w960 fr">
			<div class="product_select">
				<div class="select_title">
					<h3>
						属性筛选<strong>- &nbsp;商品筛选</strong>
					</h3>
				</div>
				<c:forEach items="${list4}" var="list4">
					<dl id="select_brand" class="fore clearfix">
						<dt>${list4.attname}</dt>
						<dd>
							<span id="select_hold" style="display: none;">展开<i
								class="icon_arrowdown"></i></span>
							<ul class="tab">
								<li><a href="###" class="hove">不限</a></li>
								<c:forEach items="${list5}" var="list5">
									<c:if test="${list5.attid==list4.attid}">
										<li><a onclick="attrigsearch('${list5.attrigid}')">${list5.attrigname}</a></li>
									</c:if>
								</c:forEach>
							</ul>

						</dd>
					</dl>
				</c:forEach>
			</div>
			<div class="product_filter">
				<div class="order_wrap">
					<div class="order">
						<dl>
							<dt class="order_01">排序:</dt>
							<dd class="price">
								<a onfocus="this.blur();">价格<i class=""></i></a>
							</dd>
						</dl>
					</div>
					<div class="turn_page">
						<span class="total">共<strong>${fn:length(list)}</strong>个商品
						</span>
					</div>
				</div>
			</div>

			<div class="product_filter_goods" id="itemlist">
				<ul class="filter_goods ">
					<c:forEach items="${list}" var="list" varStatus="sta">
						<li class="fore">
							<div class="p_img">
								<a onclick="show('${list.itemid}')"> <img width="220"
									height="220"
									src="<%=request.getAttribute("basePath")%>${list.imgurl}"></a>
							</div>
							<div class="rate">${list.itemid}
								<a><span class="title">${list.itemname}</span></a>
							</div>
							<div class="p_price">
								<span class="title">价格</span><strong>${list.price}</strong> <span
									class="title">余量</span><strong>${list.qty}</strong>
							</div>
						</li>
						<c:if test="${ sta.count ne 8 && sta.count% 4 eq 0  }">
				</ul>
				<ul class="filter_goods ">
					</c:if>
					</c:forEach>
				</ul>
			</div>

			<div class="page_wrap">
				<ul class="page">
					<li class="pre"><a href="###" class="icon_pre"> </a></li>
					<li class="pageNum numSelected"><a onclick="topfilter(1)"
						class="hove">1</a></li>
					<li class="pageNum"><a onclick="topfilter(2)" class="unhove">2</a></li>
					<li class="pageNum"><a onclick="topfilter(3)" class="unhove">3</a></li>
					<li class="point"><a class="unhove"><strong>...</strong></a></li>
					<li class="pageNum"><a onfocus="this.blur();" class="unhove">最後</a></li>
					<li class="next"><a class="icon_next"> </a></li>
				</ul>
			</div>
		</div>
	</div>
	
	<div[^>]*>[^<>]*(((?'Open'<div[^>]*>)[^<>]*)+((?'-Open'</div>)[^<>]*)+)*(?(Open)(?!))</div> 
</body>
</html>
<%
	session.removeAttribute("attrigid");
	session.removeAttribute("list");
%>