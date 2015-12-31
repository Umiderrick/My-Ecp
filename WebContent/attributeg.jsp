<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ page import="java.util.*,pb.db.*,pb.Attributedealer,pb.db.DataColumn"%>
<%
	List<Map<String,Object>> listA = new ArrayList<Map<String,Object>>();
	Attributedealer atd =new Attributedealer();
	TableValues tv2 = atd.query("attribute");
	DataColumn[] dcls=tv2.getDataColumns();
	for(int i=0;i<tv2.getValues().length;i++)
	{
		Map<String,Object> map = new HashMap<String,Object>();
		for(int j=0 ;j<tv2.getDataColumns().length;j++)
		{
			String key =dcls[j].getName();
			String value =tv2.getValues()[i][j].toString();
			if(key.equals("attid") )
			{
			map.put(key,value);
			}
		}
		listA.add(map);
	}
	request.setAttribute("listA", listA);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset =UTF-8">
<title>属性字典</title>
<link href="css/global.css" rel="stylesheet" type="text/css"/>
<link href="css/user.css"  rel="stylesheet" type="text/css"/>
<script src="js/jquery-1.11.3.min.js" language="javascript"></script>
<script type="text/javascript">
function submitMyForm(){
	var myForm =document.getElementById('attform');
	myForm.submit();
}
function deletep(attgid)
{
	alert("确认删除" +attgid);
	 $.get("AttrigServlet", { "attgid": attgid },function(){
			window.location.reload(false);
		} );
}
function update(attgid)
{	
	alert("确认更新" +attgid);
	$.get("AttrigupdServlet",{"attgid":attgid});

}
</script>
</head>
<body>
<!-- begin 头部开始 -->
<div class="ui_header">
	<div class="ui_header_logo" >
	<div class="w1200">
	 <div class="ui_header_logo_search">
          <div class="search_box">
          <form id='attform' action="AttrigServlet" method="post">
           		<select name ="attid">
  					 <c:forEach items="${listA}" var ="listA" varStatus="sta">  
        				<option>${listA.attid}</option>       	
        			 </c:forEach> 
 			     </select>
 			     <div class="login_btn">
					<a class="btn_zong big" onclick="submitMyForm();">筛选</a>
				</div>
            </form>
          </div>
        </div>
        </div> 
	</div>
</div>
<!-- end 头部结束 --> 

<div class="w1200 clearfix overflow_v"> 
    <div class="content_wrap">
      <div class="my_order">
        <div class="my_order_table" >
        <div class="clearfix ac"><a href="attributeg_ins.jsp" id="btn" class="btn_gray btn_fen_2">
	             <span>新增</span>
	              <i class="icon_graycircle"></i></a></div>
          <table width="918" border="0" cellspacing="0" cellpadding="0" class="table_user">
            <tr class="bor_bnone">
              <th width="20%">排序号</th>
              <th width="20%">属性id</th>
              <th width="25%">属性字典编号</th>
              <th width="20%">属性字典名称</th>
              <th width="15%">操作</th> 
  
	  <c:forEach items="${listg}" var ="listgA" varStatus="sta2">  
			<tr>
			<td><a class="font_brown">${sta2.count} </a></td>
			<td><a class="font_brown">${listgA.attid}</a></td>
        	<td><a class="font_brown">${listgA.attrigid}</a></td>        	
        	<td><a class="font_brown">${listgA.attrigname}</a></td>
        	<td>
        			<a onclick="deletep('${listgA.attrigid}')">删除</a>
	          		|
	           		<a href="attributeg_upd.jsp" onclick="update('${listgA.attrigid}')" >修改</a>
			</td>
        	</tr> 
        	</c:forEach> 
        	 </table>
        </div>
      </div>
    </div>
</div>
</body>
</html>