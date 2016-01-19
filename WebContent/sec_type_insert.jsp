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
			if (key.equals("firtypeid")) {
				map.put(key, value);
			}
		}
		list.add(map);
	}

	request.setAttribute("list", list);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta content="text/html;charset =UTF-8">
<title>新增二级商品</title>
<link type="text/css" rel="stylesheet" href="css/global.css">
<link type="text/css" rel="stylesheet" href="css/login.css">
<script src="js/jquery-1.7.2.js" type="text/javascript"></script>
<script src="js/register.js" type="text/javascript"></script>
<script type="text/javascript">
	function submitMyForm() {
		var myForm = document.getElementById('Sectypeform');
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
				<h3>二级类别录入</h3>
			</div>
			<form id='Sectypeform' action="SectypeinsServlet" method="post">
				<table>
					<div class="lofin_reg">
						<div class="login_pass_span">
							<span> 商品大类编号 </span>
						</div>
						<select name="firtypeid">
							<c:forEach items="${list}" var="list" varStatus="sta">
								<option>${list.firtypeid}</option>
							</c:forEach>
						</select>
						<div class="login_pass_span">
							<span> 二级类别编号 </span>
						</div>
						<div class="login_pass_input">
							<input type="text" name="sectypeid">
						</div>
						<div class="login_pass_input">
							<span> 二级类别名称 </span>
						</div>
						<div class="login_pass_input">
							<input type="text" name="sectypename">
						</div>
						<div class="login_btn">
							<a class="btn_zong big" onclick="submitMyForm();">录入</a>
						</div>
					</div>
				</table>
			</form>
		</div>
	</div>
</body>
</html>