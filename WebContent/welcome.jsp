<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登陆成功</title>
</head>
<body>
		欢迎你！<%=session.getAttribute("userName")%>登陆成功！
	<br>
	<%	Calendar calendar = Calendar.getInstance();
		Date date = calendar.getTime();
		calendar.setTime(date);
		int d = calendar.get(Calendar.DAY_OF_WEEK);
		int h = calendar.get(Calendar.HOUR_OF_DAY);
		int m = calendar.get(Calendar.MINUTE);
		int s = calendar.get(Calendar.SECOND);
		String t = "";
		if (h > 0 && h < 12)
			t = "上午好";
		else if (h >= 12)
			t = "下午好";
		String day[] = { "一", "二", "三", "四", "五", "六", "日" };
		out.println(t + "，今天是星期" + day[d]+h+":"+m+":"+s);
	%>
	<a href="login.jsp" onclick="alert('注销成功!')">注销</a>
</body>
</html>