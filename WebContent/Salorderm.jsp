<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*,pb.db.*,pb.salorder.Salorderdealer"%>
<%
	List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
	Salorderdealer sod = new Salorderdealer();
	TableValues tv = sod.query("salorder");
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
<title>订单管理页面</title>
<link href="css/global.css" rel="stylesheet" type="text/css">
<link href="css/user.css" rel="stylesheet" type="text/css">
<script src="js/jquery-1.11.3.min.js" language="javascript"></script>
<script type="text/javascript">
	function deletep(salorderid,num) {
		$.get("SalorderServlet", {
			"salorderid" : salorderid,
			"num" :num
		}, function() {
			window.location.reload(false);
		});
	}
	function update(salorderid) {
		$.get("SalorderupdServlet", {
			"salorderid" : salorderid
		});
		window.location.href = "Salorderup.jsp";
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
								<th width="10%">订单号</th>
								<th width="10%">用户名</th>
								<th width="10%">商品编号</th>
								<th width="5%">购买数量</th>
								<th width="10%">属性</th>
								<th width="20%">地址</th>
								<th width="20%">总价</th>
								<th width="10%">操作</th>
							</tr>
							<c:forEach items="${list}" var="list" varStatus="sta">
								<tr>
									<td><a class="font_brown">${sta.count} </a></td>
									<td><a class="font_brown">${list.salorderid}</a></td>
									<td><a class="font_brown">${list.username}</a></td>
									<td><a class="font_brown">${list.itemid}</a></td>
									<td><a class="font_brown">${list.num}</a></td>
									<td><a class="font_brown">${list.attrigid}</a></td>
									<td><a class="font_brown">${list.address}</a></td>
									<td><a class="font_brown">${list.total}</a></td>
									<td><a onclick="deletep('${list.salorderid}','${list.num}')"
										class="alert_del_goods font_brown">删除</a> | <a
										class="alert_del_goods font_brown"
										onclick="update('${list.salorderid}')">修改</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>