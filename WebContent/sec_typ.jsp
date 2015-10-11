<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ page import="java.util.*,pb.db.*,pb.Sectypedealer"%>
<%
	List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
	Sectypedealer std =new Sectypedealer();
	TableValues tv = std.query("sectype");
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
<meta content="text/html;charset =UTF-8">
<title>商品第二类别</title>
<link href="css/global.css" rel="stylesheet" type="text/css"/>
<link href="css/user.css"  rel="stylesheet" type="text/css"/>
<script src="js/jquery-1.7.2.js" type="text/javascript"></script>
<script src="js/register.js" type="text/javascript"></script>
<style>
	.place_mid{margin:0 auto;width :500px;}
</style>

<script type="text/javascript">
function deletep(sectypeid)
{
	alert("确认删除" +sectypeid);
	 $.post("SectypeServlet",{"sectypeid":sectypeid},new function(data){
		 window.location.reload();
		 
	 });
}

function update(sectypeid)
{	
	alert("确认更新" +sectypeid);
	$.get("SectypeupdServlet",{"sectypeid":sectypeid});
}
</script>

</head>

<body >
<!-- begin 头部开始 -->
<div class="ui_header">
	<div class="ui_header_logo" >
	</div>
</div>
<!-- end 头部结束 --> 

<div class="w1200 clearfix overflow_v"> 
  <!--begin 下方录入大类表  -->
    <div class="content_wrap">
      <div class="my_order">
        <div class="my_order_table" >
        <div class="clearfix ac">
        		<a  href="sec_type_insert.jsp" id="btn" class="btn_gray btn_fen_2">
	             <span>新增</span>
	              <i class="icon_graycircle"></i>
	              </a>
	    </div>
          <table width="918" border="0" cellspacing="0" cellpadding="0" class="table_user">
            <tr class="bor_bnone">
              <th width="20%">排序号</th>
              <th width="20%">一级分类名称</th>
              <th width="25%">二级分类编号</th>
              <th width="20%">二级分类名称</th>
              <th width="15%">操作</th> 
              <c:forEach items="${list}" var ="list" varStatus="sta">  
        					<tr>
        					<td><a class="font_brown">${sta.count} </a></td>
        					<td><a class="font_brown">${list.firtypeid}</a></td>
        					<td><a class="font_brown">${list.sectypeid}</a></td>        	
        					<td><a class="font_brown">${list.sectypename}</a></td>
      					 	<td>
	      	  				<a onclick="deletep('${list.sectypeid}')" >删除</a>
	          				|
	           				<a href="sec_type_update.jsp" onclick="update('${list.sectypeid}')" >修改</a>
							</td>
							</tr>
        	</c:forEach>  
        </table>
        </div>
      </div>
    </div>
  <!--end 内容部分右侧  --> 
</div>
</body>
</html>
