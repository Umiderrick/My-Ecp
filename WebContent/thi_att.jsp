<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ page import="java.util.*,pb.db.*,pb.Thiattdealer"%>
<%
	List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
	Thiattdealer atd =new Thiattdealer();
	TableValues tv = atd.query("thi_att");
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>三级类别属性管理</title>
<link href="css/global.css" rel="stylesheet" type="text/css"/>
<link href="css/user.css"  rel="stylesheet" type="text/css"/>
<script src="js/jquery-1.7.2.min.js" language="javascript"></script>
<script type="text/javascript">
function deletep(thitypeid,attid)
{
	alert("确认删除" +thitypeid);
	$.post("ThiattServlet",{"thitypeid":thitypeid,"attid":attid},null);
}
</script>
</head>
<body>
<div class="ui_header">
	<div class="ui_header_logo" >
	</div>
</div>
	<div class="w1200 clearfix overflow_v"> 
        <div class="my_order_table" >
        	<a href="thi_att_ins.jsp" id="btn" class="btn_gray btn_fen_2">
	             <span>新增</span>
	              <i class="icon_graycircle"></i></a>
          <table width="800" border="0" cellspacing="0" cellpadding="0" class="table_user">
            <tr class="bor_bnone">
              <th width="15%">排序号</th>
              <th width="35%">三级类别编号</th>
              <th width="40%">属性编号</th>
              <th width="10%">操作</th> 
              </tr>
              <c:forEach items="${list}" var ="list" varStatus="sta">  
        		<tr>
        		<td><a>${sta.count} </a></td>
        		<td><a>${list.thitypeid}</a></td>
        		<td><a>${list.attid}</a></td>        	
      	 	<td>
	      	  		<a onclick="deletep('${list.thitypeid}','${list.attid}')" >删除</a>
			</td>
			</tr>
        	</c:forEach> 
        </table>
      </div>
	</div>
</body>
</html>