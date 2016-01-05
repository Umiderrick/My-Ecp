<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ page import="java.util.*,pb.db.*,pb.Thitypedealer,pb.Sectypedealer,pb.db.DataColumn"%>
<%
	{
List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
	String thitypeid = session.getAttribute("thitypeid").toString();
	Thitypedealer ttd =new Thitypedealer();
	TableValues tv = ttd.query("thitype",thitypeid);
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
	}
{
	List<Map<String,Object>> lists = new ArrayList<Map<String, Object>>();
		Sectypedealer std = new Sectypedealer();
		TableValues stv = std.query("sectype");
		DataColumn[] fdcl = stv.getDataColumns();
		for (int i = 0; i < stv.getValues().length; i++) {
			Map<String, Object> map2 = new HashMap<String, Object>();
			for (int j = 0; j < stv.getDataColumns().length; j++) {
				String fkey = fdcl[j].getName();
				String fvalue = stv.getValues()[i][j].toString();
				if (fkey.equals("sectypeid")) {
					map2.put(fkey, fvalue);
				}
			}
			lists.add(map2);
		}
		request.setAttribute("lists", lists);
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>商品第三类别修改</title>
<link type="text/css" rel="stylesheet" href="css/global.css">
<link type="text/css" rel="stylesheet" href="css/login.css">
<script src="js/jquery-1.7.2.js" type="text/javascript"></script>
<script src="js/register.js" type="text/javascript"></script>
<script type="text/javascript">
function submitMyForm(){
	var myForm =document.getElementById('Thitypeform');
	myForm.submit();
}
</script>
<style>
	.place_mid{margin:0 auto; width :500px;}
</style>
</head>
<body>
<div class="w990">
		<div class="place_mid">
			<div class="login_title">
				<h3>
				三级类别修改
				</h3>
			</div>
			<form id='Thitypeform' action="ThitypeupdServlet" method=post>
			<table>
			<c:forEach items="${list}" var ="list" varStatus="sta"> 
				
				<div class="login_pass_span">
					<span>
						二级类别编号
					</span>
				</div>
				
				
				<select name ="sectypeid">
  					 <c:forEach items="${lists}" var ="lists" varStatus="sta2">  
             				<option >${lists.sectypeid}</option>       	
        			 </c:forEach> 
 			     </select>
 			     
				<div class="login_pass_span">
					<span>
						三级类别编号
					</span>
				</div>
				<div class="login_pass_input">
					<input type="text"  name ="thitypeid" value =${list.thitypeid} readonly= "true ">
				</div>
				<div class="login_pass_input">
					<span>
						三级类别名称
					</span>
				</div>
				<div class="login_pass_input">
					<input type="text"  name ="thitypename" value =${list.thitypename} >
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