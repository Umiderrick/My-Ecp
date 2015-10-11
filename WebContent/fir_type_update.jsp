<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ page import="java.util.*,pb.db.*,pb.Firtypedealer,pb.db.DataColumn"%>
<%
List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
	String firtypeid = session.getAttribute("firtypeid").toString();
	Firtypedealer ftd =new Firtypedealer();
	TableValues tv = ftd.query("firtype",firtypeid);
	DataColumn[] dcl=tv.getDataColumns();
	for(int i=0;i<tv.getValues().length;i++)
	{
		Map<String,Object> map = new HashMap<String,Object>();
		for(int j=0 ;j<tv.getDataColumns().length;j++)
		{
			String key =dcl[j].getName();
			String value =tv.getValues()[i][j].toString();
			map.put(key,value);
		}
		list.add(map);
	}
	request.setAttribute("list", list);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta content="text/html;charset =UTF-8">
<title>商品大类修改界面</title>
<link type="text/css" rel="stylesheet" href="css/global.css">
<link type="text/css" rel="stylesheet" href="css/login.css">
<script src="js/jquery-1.7.2.js" type="text/javascript"></script>
<script src="js/register.js" type="text/javascript"></script>
<script type="text/javascript">
function submitMyForm(){
	var myForm =document.getElementById('Firtypeform');
	myForm.submit();
}
</script>
<style>
	.place_mid{margin:0 auto;width :500px;}
</style>
</head>
<body>
<div class="w990">
		<div class="place_mid">
			<div class="login_title">
				<h3>
				一级类别修改
				</h3>
			</div>
			<form id='Firtypeform' action="FirtypeupdServlet" method=post>
			<table>
			<c:forEach items="${list}" var ="list" varStatus="sta"> 
				<div class="login_user_span">
					<span>排序号</span>
				</div>
					<a class="font_brown">${sta.count}</a>
				<div class="login_pass_span">
					<span>
						一级类别编号
					</span>
				</div>
				<div class="login_pass_input">
					<input type="text"  name ="firtypeid" value = ${list.firtypeid} readonly= "true">
				</div>
				<div class="login_pass_input">
					<span>
						一级类别名称
					</span>
				</div>
				<div class="login_pass_input">
					<input type="text"  name ="firtypename" value = ${list.firtypename}>
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