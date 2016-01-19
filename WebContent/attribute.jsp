<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*,pb.db.*,pb.attribute.Attributedealer"%>
<%
	List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
	Attributedealer atd = new Attributedealer();
	TableValues tv = atd.query("attribute");
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
<title>属性管理界面</title>
<link href="css/global.css" rel="stylesheet" type="text/css" />
<link href="css/user.css" rel="stylesheet" type="text/css" />
<script src="js/jquery-1.7.2.min.js" language="javascript"></script>
<script type="text/javascript">
	function deletep(attid) {
		alert("确认删除" + attid);
		$.post("AttributeServlet", {
			"attid" : attid
		}, function() {
			window.location.reload(false);
		});
	}
	function update(attid) {
		$.get("AttributeupdServlet", {
			"attid" : attid
		});

	}
</script>
</head>

<body>
	<div class="ui_header">
		<div class="ui_header_logo"></div>
	</div>
	<div class="w1200 clearfix overflow_v">
		<div class="content_wrap">
			<div class="my_order">
				<div class="my_order_table">
					<a href="attribute_ins.jsp" id="btn" class="btn_gray btn_fen_2">
						<span>新增</span> <i class="icon_graycircle"></i>
					</a> <a href="attributeg.jsp" id="btn" class="btn_gray btn_fen_2">
						<span>属性子表管理</span> <i class="icon_graycircle"></i>
					</a> <a href="thi_att.jsp" id="btn" class="btn_gray btn_fen_2"> <span>三级类别属性管理</span>
						<i class="icon_graycircle"></i></a> <a href="item_att.jsp" id="btn"
						class="btn_gray btn_fen_2"> <span>商品属性管理</span> <i
						class="icon_graycircle"></i></a>
					<table width="800" border="0" cellspacing="0" cellpadding="0"
						class="table_user">
						<tr class="bor_bnone">
							<th width="15%">排序号</th>
							<th width="35%">属性编号</th>
							<th width="40%">属性名称</th>
							<th width="10%">操作</th>
							<c:forEach items="${list}" var="list" varStatus="sta">
								<tr>
									<td><a class="font_brown">${sta.count} </a></td>
									<td><a class="font_brown">${list.attid}</a></td>
									<td><a class="font_brown">${list.attname}</a></td>
									<td><a onclick="deletep('${list.attid}')"
										class="alert_del_goods font_brown">删除</a> | <a
										href="attribute_upd.jsp" onclick="update('${list.attid}');"
										class="alert_del_goods font_brown">修改</a></td>
								</tr>
							</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
