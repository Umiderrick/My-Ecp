<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*,pb.db.*,pb.Thitypedealer"%>
<%
	List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
	Thitypedealer ttd = new Thitypedealer();
	TableValues tv = ttd.query("thitype");
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
<meta http-equiv="Content-Type" content="text/html;charset =UTF-8">
<title>三级类别管理</title>
<link href="css/global.css" rel="stylesheet" type="text/css" />
<link href="css/user.css" rel="stylesheet" type="text/css" />
<script src="js/jquery-1.7.2.min.js" language="javascript"></script>
<script src="js/user_menu_list.js" language="javascript"></script>
<script src="js/page.js" language="javascript"></script>
<script type="text/javascript" src="js/toggleMenu.js"></script>
<style>
.place_mid {
	margin: 0 auto;
	width: 500px;
}
</style>
<script src="js/user_myorder.js" language="javascript"></script>
<script type="text/javascript">
	function deletep(thitypeid) {
		$.post("ThitypeServlet", {
			"thitypeid" : thitypeid
		}, function() {
			window.location.reload(false);
		});
	}
	function update(thitypeid) {
		$.get("ThitypeupdServlet", {
			"thitypeid" : thitypeid
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
					<div class="clearfix ac">
						<a href="thi_type_insert.jsp" id="btn" class="btn_gray btn_fen_2">
							<span>新增</span> <i class="icon_graycircle"></i>
						</a>
					</div>
					<table width="918" border="0" cellspacing="0" cellpadding="0"
						class="table_user">
						<tr class="bor_bnone">
							<th width="20%">排序号</th>
							<th width="20%">二级分类编号</th>
							<th width="25%">三级分类编号</th>
							<th width="20%">三级分类名称</th>
							<th width="15%">操作</th>
							<c:forEach items="${list}" var="list" varStatus="sta">
								<tr>
									<td><a class="font_brown">${sta.count} </a></td>
									<td><a class="font_brown">${list.sectypeid}</a></td>
									<td><a class="font_brown">${list.thitypeid}</a></td>
									<td><a class="font_brown">${list.thitypename}</a></td>
									<td><a onclick="deletep('${list.thitypeid}')"
										class="alert_del_goods font_brown">删除</a> | <a
										href="thi_type_update.jsp"
										onclick="update('${list.thitypeid}');"
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