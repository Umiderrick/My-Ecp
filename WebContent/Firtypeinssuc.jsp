<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset =UTF-8">
<title> 商品大类录入成功 </title>
<link type="text/css" rel="stylesheet" href="css/global.css">
<link type="text/css" rel="stylesheet" href="css/find_pass_step.css">
</head>

<body>

<div class="w990">
    <div class="pass_fill_info">
    	<div class="find_pass_finish">
        	<p class="finish_tip_finish">商品大类：<%=session.getAttribute("firtypename")%>录入成功</p>
            <p>点击&nbsp;&nbsp;<a href="management.jsp">返回</a>管理页面</p>
        </div>  
    </div>
</div>
</body>
</html>