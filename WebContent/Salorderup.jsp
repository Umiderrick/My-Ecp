<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*,pb.db.*,pb.salorder.Salorderdealer,pb.db.DataColumn"%>
<%
	List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
	String salorderid = session.getAttribute("salorderid").toString();
	Salorderdealer sod = new Salorderdealer();
	TableValues tv = sod.query("salorder", salorderid);
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
<title>订单修改页面</title>
<link type="text/css" rel="stylesheet" href="css/global.css">
<link type="text/css" rel="stylesheet" href="css/login.css">
<script src="js/jquery-1.7.2.js" type="text/javascript"></script>
<script src="js/register.js" type="text/javascript"></script>
<script type="text/javascript">
	function submitMyForm() {
		var myForm = document.getElementById('Salorderform');
		myForm.submit();
	}
</script>
<style>
.place_mid {
	margin: 0 auto;
	width: 500px;
}
</style>
</head>
<body>
	<div class="w990">
		<div class="place_mid">
			<div class="login_title">
				<h3>订单修改</h3>
			</div>
			<div>
				<form id='Salorderform' action="SalorderupdServlet" method=post>
					<table>
						<c:forEach items="${list}" var="list" varStatus="sta">
							<div class="lofin_reg">
								<div class="login_pass_span">
									<span> 订单编号 </span>
								</div>
								<div class="login_pass_input">
									<input type="text" name="salorderid" value=${list.salorderid } readonly="readonly">
								</div>
								<div class="login_pass_span">
									<span> 用户名 </span>
								</div>
								<div class="login_pass_input">
									<input type="text" name="username" value=${list.username }>
								</div>
								<div class="login_pass_span">
									<span> 商品号 </span>
								</div>
								<div class="login_pass_input">
									<input type="text" name="itemid" value=${list.itemid } >
								</div>
								<div class="login_pass_span">
									<span> 数量 </span>
								</div>
								<div class="login_pass_input">
									<input type="text" name="num" value=${list.num }>
								</div>
								<div class="login_pass_span">
									<span> 地址 </span>
								</div>
								<div class="login_pass_input">
									<input type="text" name="address" value=${list.address }>
								</div>
								<div class="login_pass_span">
									<span> 属性 </span>
								</div>
								<div class="login_pass_input">
									<input type="text" name="attrigid" value=${list.attrigid }>
								</div>
								<div class="login_pass_span">
									<span> 总价 </span>
								</div>
								<div class="login_pass_input">
									<input type="text" name="total" value=${list.total }>
								</div>
								<div class="login_btn">
									<a class="btn_zong big" onclick="submitMyForm();">修改</a>
								</div>
							</div>
						</c:forEach>
					</table>
				</form>
			</div>
		</div>
	</div>
</body>
</html>