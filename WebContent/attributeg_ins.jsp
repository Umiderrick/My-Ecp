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
			if (key.equals("attid")) {
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
<title>新增属性字典</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="css/global.css">
<link type="text/css" rel="stylesheet" href="css/login.css">
<script src="js/jquery-1.7.2.js" type="text/javascript"></script>
<script src="js/register.js" type="text/javascript"></script>
<style>
.place_mid {
	margin: 0 auto;
	width: 500px;
}
</style>
<script type="text/javascript">
	function submitMyForm() {
		var myForm = document.getElementById('attgform');
		myForm.submit();
	}
</script>

</head>
<body>

	<div class="w990">
		<div class="place_mid">
			<div class="login_title">
				<h3>属性字典录入</h3>
			</div>
			<form id='attgform' action="AttriginsServlet" method="post">
				<table>
					<div class="lofin_reg">
						<div class="login_pass_span">
							<span> 主属性编码 </span>
						</div>
						<select name="attid">
							<c:forEach items="${list}" var="list" varStatus="sta">
								<option>${list.attid}</option>
							</c:forEach>
						</select>
						<div class="login_pass_span">
							<span> 属性字典编号 </span>
						</div>
						<div class="login_pass_input">
							<input type="text" name="attrigid">
						</div>
						<div class="login_pass_input">
							<span> 属性字典名称 </span>
						</div>
						<div class="login_pass_input">
							<input type="text" name="attrigname">
						</div>
					</div>
					<div class="login_btn">
						<a class="btn_zong big" onclick="submitMyForm();">录入</a>
					</div>
				</table>
			</form>
		</div>
	</div>
</body>
</html>