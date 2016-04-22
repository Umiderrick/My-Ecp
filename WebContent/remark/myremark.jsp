<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" import="java.util.*,pb.db.*,pb.remark.*"
	pageEncoding="UTF-8"%>
<%
	String username = session.getAttribute("userName").toString();
	List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
	Remarkdealer rmd = new Remarkdealer();
	TableValues tv = rmd.queryU(username);
	DataColumn[] dcl = tv.getDataColumns();
	for (int i = 0; i < tv.getValues().length; i++) {
		Map<String, Object> map = new HashMap<String, Object>();
		for (int j = 0; j < tv.getDataColumns().length; j++) {
			String key = dcl[j].getName();
			String value = tv.getValues()[i][j].toString();
			map.put(key, value);
		}
		list.add(map);
	}
	request.setAttribute("list", list);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户中心-评价中心</title>
<link href="../css/global.css" rel="stylesheet" type="text/css">
<link href="../css/user.css" rel="stylesheet" type="text/css">
<script src="../js/jquery-1.11.3.min.js" language="javascript"></script>
<script type="text/javascript">
	function deletep(remarkid) {
		$.get("RemarkServlet", {"remarkid" : 
	remarkid
		}, function() {
			window.location.reload(false);
		})
	}
	function update(remarkid) {

	}
</script>
</head>
<body>
<div class="ui_header">
		<div class="ui_header_logo">
			<div class="w1200"></div>
		</div>
	</div>

	<div class="w1200 clearfix overflow_v">
		<div class="content_wrap">
			<div class="my_order">
				<div class="my_order_table">
					<div class="clearfix ac"></div>
					<table class="table_user" border="0" cellpadding="0"
						cellspacing="0" width="918">
						<tbody>
							<tr class="bor_bnone">
								<th width="5%">排序号</th>
								<th width="10%">评价编号</th>
								<th width="50%">内容</th>
								<th width="10%">评价等级</th>
								<th width="15%">商品编号</th>
								<th width="15%">操作</th>
							</tr>
							<c:forEach items="${list}" var="list" varStatus="sta">
								<tr>
									<td><a class="font_brown">${sta.count} </a></td>
									<td><a class="font_brown">${list.remarkid}</a></td>
									<td><a class="font_brown">${list.neirong}</a></td>
									<td><a class="font_brown">${list.levels}</a></td>
									<td><a class="font_brown">${list.itemid}</a></td>
									<td><a onclick="deletep('${list.remarkid}')"class="alert_del_goods font_brown">删除评论</a> | 
										<a onclick="update('${list.remarkid}')" class="alert_del_goods font_brown">修改等级</a></td>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>