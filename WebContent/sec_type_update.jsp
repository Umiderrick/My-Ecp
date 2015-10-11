<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ page import="java.util.*,pb.db.*,pb.Sectypedealer,pb.Firtypedealer,pb.db.DataColumn"%>
<%
{
List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
	String sectypeid = session.getAttribute("sectypeid").toString();
	Sectypedealer std =new Sectypedealer();
	TableValues tv = std.query("sectype",sectypeid);
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
	List<Map<String,Object>> listf = new ArrayList<Map<String,Object>>();
	Firtypedealer ftd =new Firtypedealer();
	TableValues ftv = ftd.query("firtype");
	DataColumn[] fdcl=ftv.getDataColumns();
	for(int i=0;i<ftv.getValues().length;i++)
	{
		Map<String,Object> map2 = new HashMap<String,Object>();
		for(int j=0 ;j<ftv.getDataColumns().length;j++)
		{
			String fkey =fdcl[j].getName();
			String fvalue =ftv.getValues()[i][j].toString(); 
			if(fkey.equals("firtypeid") )
			{
			map2.put(fkey,fvalue);
			}
		}
		listf.add(map2);
	}
	request.setAttribute("listf", listf);
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>商品第二类别修改</title>
<meta content="text/html;charset =UTF-8">
<link type="text/css" rel="stylesheet" href="css/global.css">
<link type="text/css" rel="stylesheet" href="css/login.css">
<script src="js/jquery-1.7.2.js" type="text/javascript"></script>
<script src="js/register.js" type="text/javascript"></script>
<script type="text/javascript">
function submitMyForm(){
	var myForm =document.getElementById('Sectypeform');
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
				二级类别修改
				</h3>
			</div>
			<form id='Sectypeform' action="SectypeupdServlet" method=post>
			<table>
			<c:forEach items="${list}" var ="list" varStatus="sta"> 
				
				<div class="login_pass_span">
					<span>
						商品大类编号
					</span>
				</div>
				
				
				<select name ="firtypeid">
  					 <c:forEach items="${listf}" var ="listf" varStatus="sta2">  
             				<option >${listf.firtypeid}</option>       	
        			 </c:forEach> 
 			     </select>
 			     
				<div class="login_pass_span">
					<span>
						二级类别编号
					</span>
				</div>
				<div class="login_pass_input">
					<input type="text"  name ="sectypeid" value =${list.sectypeid} readonly= "true ">
				</div>
				<div class="login_pass_input">
					<span>
						二级类别名称
					</span>
				</div>
				<div class="login_pass_input">
					<input type="text"  name ="sectypename" value =${list.sectypename} >
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