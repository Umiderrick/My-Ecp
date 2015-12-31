<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ page import="java.util.*,pb.db.*,pb.Itemdealer,pb.Attributedealer,pb.Attrigdealer,pb.db.DataColumn"%>
<%
{
	List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
	Itemdealer ttd =new Itemdealer();
	TableValues tv = ttd.query("item");
	DataColumn[] dcl=tv.getDataColumns();
	for(int i=0;i<tv.getValues().length;i++)
	{
		Map<String,Object> map = new HashMap<String,Object>();
		for(int j=0 ;j<tv.getDataColumns().length;j++)
		{
			String key =dcl[j].getName();
			String value =tv.getValues()[i][j].toString(); 
			if(key.equals("itemid"))
			{
			map.put(key,value);
			}
		}
		list.add(map);
	}
	request.setAttribute("list", list);
}
	{
	List<Map<String,Object>> list2 = new ArrayList<Map<String,Object>>();
	Attributedealer ttd =new Attributedealer();
	TableValues tv2 = ttd.query("attribute");
	DataColumn[] dcls=tv2.getDataColumns();
	for(int i=0;i<tv2.getValues().length;i++)
	{
		Map<String,Object> map = new HashMap<String,Object>();
		for(int j=0 ;j<tv2.getDataColumns().length;j++)
		{
			String key =dcls[j].getName();
			String value =tv2.getValues()[i][j].toString(); 
			if(key.equals("attid"))
			{
			map.put(key,value);
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品属性录入</title>
<link type="text/css" rel="stylesheet" href="css/global.css">
<link type="text/css" rel="stylesheet" href="css/login.css">
<script src="js/jquery-1.7.2.js" type="text/javascript"></script>
<script src="js/register.js" type="text/javascript"></script>
<style>
	.place_mid{margin:0 auto;width :500px;}
</style>
<script type="text/javascript">
	function submitMyForm(){
	var myForm =document.getElementById('itmattform');
	myForm.submit();
	}
	function filterp(){
		var attid =document.getElementById('attid').value;
		$.get("ItemattinsServlet",{ "attid": attid },function(data){
			$("#attrigid").html('');
			$.each(data,function(index,item)
					{
				var attid =data[index].attid;
				var attrigid =data[index].attrigid;
				var attrigname = data[index].attrigname;
				$("#attrigid").html($("#attrigid").html() + "<option>" +attrigid +"</option>");
					})
				},"json");
			
			
	}
</script>
</head>
<body>
<div class="w990">
		<div class="place_mid">
			<div class="login_title">
				<h3>
					商品属性录入
				</h3>
			</div>
			<form id='itmattform' action="ItemattinsServlet" method="post">
			<table>
			<div class="login_reg">
				<div class="login_pass_span">
					<span>
						商品编号
					</span>
				</div>
				<select name ="itemid">
  					 <c:forEach items="${list}" var ="list" varStatus="sta">  
        				<option>${list.itemid}</option>       	
        				</c:forEach> 
 			     </select>
				<div class="login_pass_span">
					<span>
						属性编号
					</span>
				</div>
				<select  id ="attid" name ="attid"   >
  					 <c:forEach items="${list2}" var ="list2">  
        						<option>${list2.attid}</option>       	
        			 </c:forEach> 
 			    </select>
 			    <div class="login_btn">
					<a class="btn_zong small" onclick="filterp()">筛选</a>
				</div>
				<div class="login_pass_span">
					<span>
						子属性编号
					</span>
				</div>
				<select  id = "attrigid"name ="attrigid">
  				<!--   <c:forEach items="${listg}" var ="listgA" varStatus="sta">  
        				<option>${listgA.attrigid}</option>       	
        				</c:forEach> 
        		-->		
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