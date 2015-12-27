<%@ page language="java"  pageEncoding="UTF-8" import="java.util.*,pb.db.*,pb.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%
	String itemid = session.getAttribute("itemid").toString();
	List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
	Itemdealer itd =new Itemdealer();
	TableValues tv = itd.query("item",itemid);
	DataColumn[] dcl=tv.getDataColumns();
	for(int i=0;i<tv.getValues().length;i++)
	{
		Map<String,Object> map = new HashMap<String,Object>();
		for(int j=0 ;j<tv.getDataColumns().length;j++)
		{
			String key =dcl[j].getName();
			String value =tv.getValues()[i][j].toString();
			map.put(key,value);
		}
		list.add(map);
	}
	request.setAttribute("list", list);
%>
<html>
<% 
String path = request.getContextPath(); 
String basePath = request.getScheme() + "://" 
+ request.getServerName() + ":" + request.getServerPort() 
+ path; 
request.setAttribute("basePath", basePath);
%>
<head>
<meta content="text/html;charset =UTF-8">
<title>详情</title>
<link href="css/global.css" rel="stylesheet" type="text/css">
<link href="css/pshow.css" rel="stylesheet" type="text/css">
<link href="css/login.css" rel="stylesheet" type="text/css">
<link href="css/cart.css" rel="stylesheet"  type="text/css" >
<script type="text/javascript" src="js/jquery-1.7.2.js"></script>
<script type="text/javascript" src="js/toggleMenu.js"></script>
<script type="text/javascript" src="js/banner_slide.js"></script>
<script type="text/javascript" src="js/magni.js"></script>
<script src="js/list.js" type="text/javascript"></script> 
<script type="text/javascript" src="js/img_scroll.js"></script>
<script type="text/javascript" src="js/header.js"></script>
<script type="text/javascript" src="js/openPop.js"></script>
<script type="text/javascript">
$(function(){	
//	laze_load()
	toggleMenu(".all_products",".second_menu",".third_menu");
	_scroll(5,".preview_scroll",true,false);
	_scroll(5,".last_view_con",false,false);
	magnifier.init({
	   cont : document.getElementById('magnifier'),//小图像容器
	   img : document.getElementById('magnifierImg'),//大图像图片
	   mag : document.getElementById('mag'),//放大之后的图片容器
	   scale :2//放大倍数
	});
	function litile_pic(){
		$(this).addClass("cur").siblings().removeClass("cur");//栏目块头部的标题标签切换功能
		return false;
	}
	$(".product_litile_pic&amp;gt;a,.show_wrap_h3.right&amp;gt;h3&amp;gt;a:not(:only-child)").on("click",litile_pic);
					
	$("a.btn_fen_little:has(span:contains('回复'))").on("click",function(){
		var g=$(this).parents("dl").next("div.reply_box");
		if(g.css("display")=="none"){
			g.show();		
		}else{
			g.hide();		
		}
		return false;
	})
	function f_reply_btn(){
		var g,$this;
		$("dl.reply").live({"mouseenter":function(){
			$this=$(this)
			g=$this.find("dd.reply_btn");
			g.show();
		},"mouseleave":function(){
		if($this.next("div.reply_box").css("display")=="block")	return;
			g.hide();
		}
		})
	}
	//回复
	f_reply_btn();
	
})
function subcart(){
	var itemid =document.getElementById('itemid').innerHTML;
	var num =document.getElementById('num').value;
	$.get("CartServlet",{ "itemid": itemid ,"num":num});
}
</script>
<style>
.product_intro_mainName strong {
    color: #E4393C;
    display: block;
    font-size: 16px;
	float: left;
}
.product_intro_mainName{ overflow:hidden; margin-bottom:10px; margin-top:5px}
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
.reply_btn a{  position: absolute;right: 0;top: -20px;}
.reply_btn{ position:relative; width:100%; display:none;}
.reply-wrap{border: 1px solid #E7E3E2;margin-top: 8px; overflow:hidden}
.reply-input{ padding:10px; padding-top:0px; padding-right:5px;width:780px; *width:750px; float:left;}
.reply-wrap p{ padding:5px 10px}
.comments_list .comment_con_r .formation dl.reply dt a{ color:#B27068}
.comments_list .comment_con_r .formation dl.reply dt em{ color:#999}
</style>
</head>
<body>
<div class="ui_header">
	<div class="ui_header_top">
		<div class="w1200">
	</div>
	</div>
	<div class="ui_header_logo">
	</div>
	<div class="ui_header_nav">
		</div>
</div>
<div class="w1200">
<c:forEach items="${list}" var ="list"> 
	<div class="preview">
		<div style="cursor: crosshair;" id="magnifier"> 
		 <img width='350' height='350' src="<%=request.getAttribute("basePath")%>${list.imgurl}" id="img">
		 <div id="Browser" style="width: 173px; height: 173px; opacity: 0.5; top: 0px; left: 175px; display: none;"></div>
		</div>
		<div style="width: 350px; height: 350px; position: absolute; left: 360px; top: 0px; display: none;" id="mag">
		<img src="<%=request.getAttribute("basePath")%>${list.imgurl}" style="position: absolute; width: 700px; height: 700px; top: -350px; left: -222px;" id="magnifierImg">
		</div>
	</div>
	<div class="product_intro">
		<div class="product_intro_wrap">
			<h3 id ="itemid" class="product_intro_title">${list.itemid}</h3>
			<h3 class="product_intro_mainName"><strong class="mainName01">${list.itemname}</strong></h3>
			<div class="summary">
				<dl class="w150">
					<dt> 价格：</dt>
					<dd><span class="txt_red">￥${list.price}</span></dd>
				</dl>
				<dl class="w150">
					<dt>余量：</dt>
					<dd><span class="txt_red">${list.qty}</span></dd>
				</dl>
				<dl class="w150">
					<dt>购买数量：</dt>
					<dd><span class="txt_red"><input type="text" id="num" /></span></dd>
				</dl>
			</div>
		</div>
		</div>
</c:forEach>
<div class="product_intro">
		<div class="product_intro_wrap" style="border-bottom:0 none"><a>物品属性</a>
			 <div class="product_select">
  				<div class="select_title">
    			</div>
   				<dl id="select_brand" class="fore clearfix">
      				<dt>123213</dt>
      				<dd> 
        			<ul class="tab">
					<li><a href="###" class="hove">不限</a></li>
					<li><a >2222</a></li>
        </ul>
     
      </dd>
   	</dl>
  </div>
				<dl class="w150">
					<dt class="kong"></dt>
					<dd> <a onclick="subcart()" class="btn_zong big" href="cart_step_1.jsp"><i class="icon_addcart"></i><span class="shadow_txt"><img src="res/images/bg/txt/txt1.png"></span></a>  </dd>
				</dl>
		</div>
</div>	
</div>					
</body>				
</html>