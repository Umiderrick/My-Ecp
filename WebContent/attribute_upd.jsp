<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page
	import="java.util.*,pb.db.*,pb.attribute.Attributedealer,pb.db.DataColumn"%>
<%
	List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
	String attid = session.getAttribute("attid").toString();
	Attributedealer atd = new Attributedealer();
	TableValues tv = atd.query("attribute", attid);
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
<title>属性修改界面</title>
<link type="text/css" rel="stylesheet" href="css/global.css">
<link type="text/css" rel="stylesheet" href="css/login.css">
<script type="text/javascript">
	function submitMyForm() {
		var myForm = document.getElementById('Attriform');
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
				<h3>属性修改</h3>
			</div>
			<form id='Attriform' action="AttributeupdServlet" method=post>
				<table>
					<c:forEach items="${list}" var="list" varStatus="sta">

						<div class="login_pass_span">
							<span> 属性编号 </span>
						</div>
						<div class="login_pass_input">
							<input type="text" name="attid" value=${list.attid
								}   readonly="true ">
						</div>
						<div class="login_pass_input">
							<span> 属性名称 </span>
						</div>
						<div class="login_pass_input">
							<input type="text" name="attname" value=${list.attname} >
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