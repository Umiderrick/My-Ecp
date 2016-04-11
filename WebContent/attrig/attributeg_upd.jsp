<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*,pb.db.*,pb.attributeg.Attrigdealer,pb.attribute.Attributedealer"%>
<%
	{
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		String attgid = session.getAttribute("attgid").toString();
		Attrigdealer agd = new Attrigdealer();
		TableValues tv = agd.query("attg", attgid);
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
	}
	{
		List<Map<String, Object>> lista = new ArrayList<Map<String, Object>>();
		Attributedealer atd = new Attributedealer();
		TableValues tva = atd.query("attribute");
		DataColumn[] dcls = tva.getDataColumns();
		for (int i = 0; i < tva.getValues().length; i++) {
			Map<String, Object> map = new HashMap<String, Object>();
			for (int j = 0; j < tva.getDataColumns().length; j++) {
				String key = dcls[j].getName();
				String value = tva.getValues()[i][j].toString();
				if (key.equals("attid")) {
					map.put(key, value);
				}
			}
			lista.add(map);
		}
		request.setAttribute("listA", lista);

	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>属性字典修改界面</title>
<link type="text/css" rel="stylesheet" href="css/global.css">
<link type="text/css" rel="stylesheet" href="css/login.css">
<script src="js/jquery-1.7.2.js" type="text/javascript"></script>
<script type="text/javascript">
	function submitMyForm() {
		var myForm = document.getElementById('attrigform');
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
				<h3>属性字典修改</h3>
			</div>
			<form id='attrigform' action="AttrigupdServlet" method=post>
				<table>
					<c:forEach items="${list}" var="list" varStatus="sta">

						<div class="login_pass_span">
							<span> 属性编号 </span>
						</div>
						<select name="attid">
							<c:forEach items="${listA}" var="listA">
								<option>${listA.attid}</option>
							</c:forEach>
						</select>

						<div class="login_pass_span">
							<span> 属性字典编号 </span>
						</div>
						<div class="login_pass_input">
							<input type="text" name="attrigid" value=${list.attrigid } readonly="readonly">
						</div>
						<div class="login_pass_input">
							<span> 属性字典名称 </span>
						</div>
						<div class="login_pass_input">
							<input type="text" name="attrigname" value=${list.attrigname} >
						</div>
					</c:forEach>
					<div class="login_btn">
						<a class="btn_zong big" onclick="submitMyForm();">修改</a>
					</div>
				</table>
			</form>
		</div>
	</div>
</body>
</html>