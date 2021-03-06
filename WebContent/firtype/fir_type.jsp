<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*,pb.db.*,pb.firsttype.Firtypedealer,pb.db.DataColumn"%>
<%
	List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
	Firtypedealer ftd = new Firtypedealer();
	TableValues tv = ftd.query("firtype");
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
<title>商品大类录入</title>
<link href="../css/global.css" rel="stylesheet" type="text/css" />
<link href="../css/user.css" rel="stylesheet" type="text/css" />
<script src="../js/jquery-1.11.3.min.js" language="javascript"></script>
<script src="../js/user_menu_list.js" language="javascript"></script>
<script src="../js/page.js" language="javascript"></script>
<script type="text/javascript" src="../js/toggleMenu.js"></script>
<script src="../js/user_myorder.js" language="javascript"></script>
<script type="text/javascript">
	function deletep(firtypeid) {
		$.post("FirsttypeServlet", {
			"firtypeid" : firtypeid
		}, function() {
			window.location.reload(false);
		});
	}
	function update(firtypeid) {
		$.get("FirtypeupdServlet", {
			"firtypeid" : firtypeid
		});
	}
</script>
</head>
<body>
	<div class="ui_header">
		<div class="ui_header_logo">
			<div class="ui_header_logo_bg"></div>
		</div>
	</div>
	<div class="w1200 clearfix overflow_v">
		<div class="content_wrap">
			<div class="my_order">
				<div class="my_order_table">
					<div class="clearfix ac">
						<a href="fir_type_insert.jsp" id="btn" class="btn_gray btn_fen_2">
							<span>增加新类别</span> <i class="icon_graycircle"></i>
						</a> <a href="../sectype/sec_typ.jsp" id="btn" class="btn_gray btn_fen_2"> <span>进入二级类别</span>
							<i class="icon_graycircle"></i>
						</a> <a href="../thitype/thi_typ.jsp" id="btn" class="btn_gray btn_fen_2"> <span>进入三级类别</span>
							<i class="icon_graycircle"></i>
						</a>
					</div>
					<table class="table_user">
						<tr class="bor_bnone">
							<th width="15%">排序号</th>
							<th width="25%">编号</th>
							<th width="30%">商品大类名称</th>
							<th width="40%">操作</th>
						<tr>
							<c:forEach items="${list}" var="list" varStatus="sta">
								<tr>
									<td><a class="font_brown">${sta.count} </a></td>
									<td><a class="font_brown">${list.firtypeid}</a></td>
									<td><a class="font_brown">${list.firtypename}</a></td>
									<td><a onclick="deletep('${list.firtypeid}');"
										class="alert_del_goods font_brown">删除</a> | <a
										href="fir_type_update.jsp"
										onclick="update('${list.firtypeid}');"
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
