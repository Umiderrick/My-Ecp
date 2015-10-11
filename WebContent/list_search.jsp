<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ page import="java.util.*,pb.db.*,pb.*"%>
<%
	Object O =null;
	O = session.getAttribute("pattern");
	Searchdealer scd =new Searchdealer();
	List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
	if(null==O)
	{
		String thitypeid = session.getAttribute("thitypeid").toString();
		TableValues tv = scd.thitypesearch(thitypeid);
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
	}else{
	String pattern =O.toString();
	TableValues tv = scd.indexsearch(pattern);
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
	
	}
%>
<%
{List<Map<String,Object>> list1 = new ArrayList<Map<String,Object>>();
	Firtypedealer ftd =new Firtypedealer();
	TableValues tv1 = ftd.query("firtype");
	DataColumn[] dcl1=tv1.getDataColumns();
	for(int i=0;i<tv1.getValues().length;i++)
	{
		Map<String,Object> map1 = new HashMap<String,Object>();
		for(int j=0 ;j<tv1.getDataColumns().length;j++)
		{
			String key1 =dcl1[j].getName();
			String value1 =tv1.getValues()[i][j].toString();
			map1.put(key1,value1);
		}
		list1.add(map1);
	}
	
	request.setAttribute("list1", list1);
}
{List<Map<String,Object>> list2 = new ArrayList<Map<String,Object>>();
	Sectypedealer std =new Sectypedealer();
	TableValues tv2 = std.query("sectype");
	DataColumn[] dcl2=tv2.getDataColumns();
	for(int i=0;i<tv2.getValues().length;i++)
	{
		Map<String,Object> map2 = new HashMap<String,Object>();
		for(int j=0 ;j<tv2.getDataColumns().length;j++)
		{
			String key2 =dcl2[j].getName();
			String value2 =tv2.getValues()[i][j].toString();
			map2.put(key2,value2);
		}
		list2.add(map2);
	}
	
	request.setAttribute("list2", list2);
}
{List<Map<String,Object>> list3 = new ArrayList<Map<String,Object>>();
	Thitypedealer ttd =new Thitypedealer();
	TableValues tv3 = ttd.query("thitype");
	DataColumn[] dcl3=tv3.getDataColumns();
	for(int i=0;i<tv3.getValues().length;i++)
	{
		Map<String,Object> map3 = new HashMap<String,Object>();
		for(int j=0 ;j<tv3.getDataColumns().length;j++)
		{
			String key3 =dcl3[j].getName();
			String value3 =tv3.getValues()[i][j].toString();
			map3.put(key3,value3);
		}
		list3.add(map3);
	}
	
	request.setAttribute("list3", list3);
}
{List<Map<String,Object>> list4 = new ArrayList<Map<String,Object>>();
Attributedealer atd =new Attributedealer();
TableValues tv4 =atd.query("attribute");
DataColumn[] dcl4=tv4.getDataColumns();
for(int i=0;i<tv4.getValues().length;i++)
{
	Map<String,Object> map4 = new HashMap<String,Object>();
	for(int j=0 ;j<tv4.getDataColumns().length;j++)
	{
		String key4 =dcl4[j].getName();
		String value4 =tv4.getValues()[i][j].toString();
		map4.put(key4,value4);
	}
	list4.add(map4);
}

request.setAttribute("list4", list4);
}
{List<Map<String,Object>> list5 = new ArrayList<Map<String,Object>>();
Attributedealer agd =new Attributedealer();
TableValues tv5 = agd.query("attg");
DataColumn[] dcl5=tv5.getDataColumns();
for(int i=0;i<tv5.getValues().length;i++)
{
	Map<String,Object> map5 = new HashMap<String,Object>();
	for(int j=0 ;j<tv5.getDataColumns().length;j++)
	{
		String key5 =dcl5[j].getName();
		String value5 =tv5.getValues()[i][j].toString();
		map5.put(key5,value5);
	}
	list5.add(map5);
}

request.setAttribute("list5", list5);
}
{
String path = request.getContextPath(); 
String basePath = request.getScheme() + "://" 
+ request.getServerName() + ":" + request.getServerPort() 
+ path; 
request.setAttribute("basePath", basePath);
}
 %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品列表页</title>
<link type="text/css" rel="stylesheet" href="css/global.css">
<link type="text/css" rel="stylesheet" href="css/list.css">
<script src="js/jquery-1.7.2.min.js"></script>
<script src="js/toggleMenu.js" type="text/javascript"></script>
<script src="js/banner_slide.js" type="text/javascript"></script>
<script src="js/magni.js" type="text/javascript"></script>
<script src="js/img_scroll.js" type="text/javascript"></script>
<script src="js/header.js" type="text/javascript"></script>
<script src="js/page.js" type="text/javascript"></script>
<script src="js/list.js" type="text/javascript"></script> 
<script type="text/javascript">
$(function(){
	toggleMenu(".all_products",".second_menu",".third_menu");
	_scroll(5,".last_view_con",false,false);
	
})
function show(itemid){
	$.get("ItemshowServlet",{"itemid":itemid});
			}
function listsearch()
{	var pattern = document.getElementById('search').value;
	window.location.href='list_search.jsp';
	$.post("IndexServlet",{ "pattern": pattern },null);
	}
function thitypesearch(thityepid)
{	
	$.get("IndexServlet",{ "thityepid": thityepid });
	}
function attrigsearch(attrigid)
{	
	alert(attrigid);
	$.post("ListSearchServlet",{ "attrigid": attrigid },null);
	}			
</script>
<style>
	.place_mid{margin:0 auto;width :500px;}
</style>
</head>
<body>
<!-- begin 头部开始 -->
	<div class="ui_header">
	<div class="ui_header_top">
		<div class="w1200">
			<div class="welcome"> <span>您好！</span> <%=session.getAttribute("userName")%></div>
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
				<li class="all_products"> <a class="cur" href="#">全部商品分类</a>
					<ul class="second_menu" style="display: none; overflow: hidden;">
						<c:forEach items="${list1}" var ="list1">  
						<li>
						<dl>
								<dt><span>${list1.firtypename}</span> </dt>
								<dd>
								<c:forEach items="${list2}" var ="list2"> 
								<c:if test="${list2.firtypeid==list1.firtypeid}">
								<a href="#">${list2.sectypename}</a>
								</c:if>
								</c:forEach>
								</dd>
						</dl>
						<div class="third_menu">
								<div class="third_shadow_inset">
								<dl>
									<dd> 
									<c:forEach items="${list2}" var ="list2"> 
									<c:if test="${list2.firtypeid==list1.firtypeid}">
									 <dt><span>${list2.sectypename} </span></dt>
									 <dd> 
									 <c:forEach items="${list3}" var ="list3"> 
									 <c:if test="${list3.sectypeid==list2.sectypeid}">
									 <a onclick="thitypesearch('${list3.thitypeid}')">${list3.thitypename}</a> <span>|</span> 
									 </c:if>
									 </c:forEach>
									 </dd>
									</c:if>
									</c:forEach>
									</dd>
								</dl>
								</div>
							</div>
						</li>
						</c:forEach>
					</ul>
				</li>
				<li><a href="index.html">首页</a></li>
			</ul>
		</div>
		</div>
	</div>	
<!-- end 头部结束 --> 
<!-- begin 内容部分 开始-->
<div class="w1200">
<div class="w230 fl"> 
 <h3>类别筛选<strong>-三级类别筛选</strong></h3>
  <!--begin 内容部分左侧菜单分类  -->
  <div class="list_menu_wrap">
  		<c:forEach items="${list2}" var ="list2"> 
			<h3>${list2.sectypename}</h3>
							<ul class="hide">
								<c:forEach items="${list3}" var ="list3"> 
									<c:if test="${list3.sectypeid==list2.sectypeid}">
									   <li><a onclick="thitypesearch('${list3.thitypeid}')">${list3.thitypename}</a></li>
									 </c:if>
								</c:forEach>
						  </ul>
		</c:forEach>
  </div>
  <!--end 内容部分左侧菜单分类  --> 
</div>
<!--end 内容部分左侧  --> 
<!--begin 内容部分右侧  -->
<div class="w960 fr"> 
   <!-- begin 右侧商品筛选 -->
  <div class="product_select">
  <div class="select_title">
      <h3>属性筛选<strong>- &nbsp;商品筛选</strong></h3>
      <div class="extra"> <a href="###">重置筛选条件</a> </div>
    </div>
    <c:forEach items="${list4}" var ="list4"> 
   		<dl id="select_brand" class="fore clearfix">
      <dt>${list4.attname}</dt>
      <dd> 
	  	<span id="select_hold" style="display: none;">展开<i class="icon_arrowdown"></i></span>
        <ul class="tab">
			<li><a href="###" class="hove">不限</a></li>
			 <c:forEach items="${list5}" var ="list5">
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
          <dd><a class="cur" onfocus="this.blur();" href="###">销量</a> </dd>
          <dd class="price"><a onfocus="this.blur();" href="###">价格<i class=""></i></a></dd>
          <dd><a onfocus="this.blur();" href="###">评论数</a></dd>
          <dd><a onfocus="this.blur();" href="###">上架时间</a></dd>
        </dl>
      </div>
       <div class="turn_page"> 
                <span><a class="next_disabled" id="next" href="###"></a></span> 
                <span><a class="pre_able" id="pre" href="###"></a></span> 
                <span class="total">共<strong>？</strong>个商品</span>
       </div>
      </div>
    </div>
 
   <div class="product_filter_goods">
   
    <ul class="filter_goods ">
    <c:forEach items="${list}" var ="list" varStatus="sta">  
    	<li class="fore">
          <div class="p_img"> <a onclick="show('${list.itemid}')"  href="pshow.jsp"> <img width="220" height="220"  src="<%=request.getAttribute("basePath")%>${list.imgurl}"></a> </div>
          <div class="rate">${list.itemid} <a title="" href="pshow.html"><span class="title">${list.itemname}</span></a></div>
          <div class="p_price">
          <span class="title">价格</span><strong>${list.price}</strong>
       	  <span class="title">余量</span><strong>${list.qty}</strong>
          </div></li>
        			<c:if test="${sta.count%5==0}"> 
        			</ul><ul class="filter_goods ">
       				</c:if>
        		</c:forEach>
    </ul> 
 </div>

  <div class="product_paging fr"> 
      <div class="page_wrap">
        <ul class="page">
          <li class="pre"> <a href="###" class="icon_pre"> </a></li>
          <li class="pageNum numSelected"> <a href="###" class="hove">1</a> </li>
          <li class="pageNum"> <a href="###" class="unhove">2</a> </li>
          <li class="pageNum"> <a href="###" class="unhove">3</a> </li>
          <li class="pageNum"> <a href="###" class="unhove">4</a> </li>
          <li class="pageNum"> <a href="###" class="unhove">5</a> </li>
          <li class="point"> <a href="###" class="unhove"><strong>...</strong></a> </li>
          <li class="pageNum"> <a onfocus="this.blur();" href="###" class="unhove">200</a> </li>
          <li class="next"> <a href="###" class="icon_next"> </a></li>
        </ul>
      </div>
    </div> 
    <!-- end 右侧商品排序 --> 
   <!-- end 右侧最近浏览 --> 
  </div>
  <!--end 内容部分右侧  --> 
</div>
<!-- end   内容部分 结束--> 
</body>
</html>