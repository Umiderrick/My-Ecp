<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ page import="java.util.*,pb.db.*,pb.Itemdealer"%>
<%
List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
Itemdealer idl =new Itemdealer();
TableValues tv = idl.query("item");
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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<% 
String path = request.getContextPath(); 
String basePath = request.getScheme() + "://" 
+ request.getServerName() + ":" + request.getServerPort() 
+ path; 
request.setAttribute("basePath", basePath);
%>
<title>商品管理界面</title>
<link href="css/global.css" rel="stylesheet" type="text/css"/>
<link type="text/css" rel="stylesheet" href="css/brand.css">
<script src="js/jquery-1.7.2.js" type="text/javascript"></script>
<script type="text/javascript">
function deletep(itemid)
{
	alert("确认删除" +itemid	);
	$.post("ItemServlet",{"itemid":itemid},function(){
		window.location.reload(false);
	});
}
function update(itemid)
{	
	$.get("ItemupdServlet",{"itemid":itemid});

}
</script>
</head>
<body>
<!-- begin 头部开始 -->
<div class="ui_header">
  <div class="ui_header_logo">
    <div class="ui_header_logo_bg">
    </div>
  </div>
</div>
<!-- end 头部结束 --> 
<!-- begin 商品排序 -->
<div class="w1200">
  <div class="product_filter">
    <div class="order_wrap">
      <div class="order">
        <dl>
          <dd><a class="cur" onfocus="this.blur();" href="item_ins.jsp">商品录入</a> </dd>
        </dl>
      </div>
    </div>
  <div class="product_filter_goods">
      <ul class="filter_goods ">
      <c:forEach items="${list}" var ="list" varStatus="sta"> 
        <li class="fore">
          <div class="p_img" > <a href="#"> <img width="220" height="220"  src=" <%=request.getAttribute("basePath")%>${list.imgurl}"></a> </div>
          <div class="rate">${list.itemid} <a title="" href="#">
          <span class="title">${list.itemname}</span></a> 
          <a class="reduce" onclick="deletep('${list.itemid}')">删除</a>
          <a class="reduce" onclick="update('${list.itemid}')" href ="item_upd.jsp">修改</a>
          </div>
          <div class="p_price">
          <span class="title">价格</span><strong>${list.price}</strong>
       	  <span class="title">余量</span><strong>${list.qty}</strong>
          </div>
        </li>
        <c:if test="${sta.count%5==0}"> 
        </ul><ul class="filter_goods ">
       	</c:if>
        </c:forEach>
       </ul>
 </div>
</div>
</div>
</body>
</html>
