<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page
	import="java.util.*,pb.db.*,pb.thirdtype.Thitypedealer,pb.attribute.Attributedealer"%>
<%
	{
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Thitypedealer ttd = new Thitypedealer();
		TableValues tv = ttd.query("thitype");
		DataColumn[] dcl = tv.getDataColumns();
		for (int i = 0; i < tv.getValues().length; i++) {
			Map<String, Object> map = new HashMap<String, Object>();
			for (int j = 0; j < tv.getDataColumns().length; j++) {
				String key = dcl[j].getName();
				String value = tv.getValues()[i][j].toString();
				if (key.equals("thitypeid")) {
					map.put(key, value);
				}
			}
			list.add(map);
		}

		request.setAttribute("list", list);
	}
	{
		List<Map<String, Object>> list2 = new ArrayList<Map<String, Object>>();
		Attributedealer ttd = new Attributedealer();
		TableValues tv2 = ttd.query("attribute");
		DataColumn[] dcls = tv2.getDataColumns();
		for (int i = 0; i < tv2.getValues().length; i++) {
			Map<String, Object> map = new HashMap<String, Object>();
			for (int j = 0; j < tv2.getDataColumns().length; j++) {
				String key = dcls[j].getName();
				String value = tv2.getValues()[i][j].toString();
				if (key.equals("attid")) {
					map.put(key, value);
				}
			}
			list2.add(map);
		}

		request.setAttribute("list2", list2);
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>三级属性录入</title>
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
		var myForm = document.getElementById('thiattform');
		myForm.submit();
	}
</script>
</head>
<body>
	<div class="w990">
		<div class="place_mid">
			<div class="login_title">
				<h3>三级属性录入</h3>
			</div>
			<form id='thiattform' action="ThiattinsServlet" method="post">
				<table>
					<div class="lofin_reg">
						<div class="login_pass_span">
							<span> 三级类别编号 </span>
						</div>

						<select name="thitypeid">
							<c:forEach items="${list}" var="list" varStatus="sta">
								<option>${list.thitypeid}</option>
							</c:forEach>
						</select>

						<div class="login_pass_span">
							<span> 属性编号 </span>
						</div>
						<select name="attid">
							<c:forEach items="${list2}" var="list2" varStatus="sta">
								<option>${list2.attid}</option>
							</c:forEach>
						</select>

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