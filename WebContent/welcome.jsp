<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" import="java.util.*,pb.db.*,pb.*"
	pageEncoding="UTF-8"%>
<%
	{
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		String username = session.getAttribute("userName").toString();
		Userdealer usd = new Userdealer();
		TableValues tv = usd.query(username);
		DataColumn dcl[] = tv.getDataColumns();
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
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户中心-账户中心</title>
<link href="css/global.css" rel="stylesheet" type="text/css">
<link href="css/user.css" rel="stylesheet" type="text/css">
<script src="js/jquery-1.7.2.min.js" language="javascript"></script>
<script src="js/user_menu_list.js" language="javascript"></script>
<script type="text/ecmascript" src="js/tabs.js"></script>
<script type="text/javascript" src="js/openPop.js"></script>
</head>
<body>
	<div class="ui_header">
		<div class="ui_header_top">
			<div class="w1200"></div>
		</div>
		<div class="ui_header_logo">
			<div class="ui_header_logo_bg">
				<div class="w1200">
					<div class="ui_header_logo_posi">
						<div class="ui_header_logo_posi_account">
							<div class="posi_wrap_content">
								<div class="wrap_top"></div>
								<div class="wrap_middle">
									<div class="wrap_middle_l"></div>
									<div class="wrap_middle_r"></div>
								</div>
							</div>
							<div class="wrap_bottom"></div>
						</div>
						<div class="ui_header_logo_posi_cart"></div>
					</div>
				</div>
			</div>
		</div>
		<div class="ui_header_nav">
			<div class="w1200">
				<ul class="first_menu">
				</ul>
			</div>
		</div>
	</div>
	<div class="w1200">
		<div class="breadcrumb">
			<span><a href="###" onfocus="this.blur();">用户中心</a>&nbsp;&gt;&nbsp;<a
				href="###" onfocus="this.blur();">账户中心</a></span>
		</div>
	</div>
	<div class="w1200">
		<div class="w230 fl">
			<div class="sort_menu_wrap">
				<h2>
					<i class="icon_user"></i>用户中心
				</h2>
				<div>
					<h3 class="open">
						<i class="icon_order"></i>订单中心<i class="icon_arrowup"></i>
					</h3>
					<ul>
						<li><a href="mysalorder.jsp">我的订单</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="w960 fr">
			<div class="title mar_t36">
				<h3>账户信息</h3>
			</div>
			<div class="tab_change" style="margin-top: 15px;">
				<a href="#" class="cur">基本信息</a>
			</div>

			<div class="tab_change_con">
				<div style="display: block;" class="tab_con">
					<c:forEach items="${list}" var="list">
						<div class="fl pa_tb15" style="width: 830px;">
							<dl class="account_list">
								<dt>用户名：</dt>
								<dd>
									<b><%=session.getAttribute("userName")%></b>
								</dd>
							</dl>
							<dl class="account_list">
								<dt>
									<b>*</b> 手机号：
								</dt>
								<dd>
									<input class="input_account_215 fl" type="text"
										value="${list.phone}">
							</dl>
							<dl class="account_list">
								<dt>地址：</dt>
								<dd>
									<input class="input_account_215 fl" type="text"
										value="${list.address}">
								</dd>
							</dl>
						</div>
					</c:forEach>
					<div class="clr"></div>
					<div class="account_data_title">时间</div>
					<%
						{
						Calendar calendar = Calendar.getInstance();
						Date date = calendar.getTime();
						calendar.setTime(date);
						int d = calendar.get(Calendar.DAY_OF_WEEK);
						int h = calendar.get(Calendar.HOUR_OF_DAY);
						int m = calendar.get(Calendar.MINUTE);
						int s = calendar.get(Calendar.SECOND);
						String t = "";
						if (h > 0 && h < 12)
							t = "上午好";
						else if (h >= 12)
							t = "下午好";
						String day[] = {"日", "一", "二", "三", "四", "五", "六"  };
						out.println(t + "，今天是星期" + day[d-1] +" 时间：" + h + ":" + m + ":" + s);
						}
					%>
				</div>
			</div>
		</div>
	</div>
</body>
</html>