<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>登陆页面</title>
<style type="text/css">  
.align-center{  
    margin:0 auto;      /* 居中 这个是必须的，，其它的属性非必须 */  
    width:500px;        /* 给个宽度 顶到浏览器的两边就看不出居中效果了 */  
    background:red;     /* 背景色 */  
    text-align:center;  /* 文字等内容居中 */  
}  

.align-center2{  
    margin:0 auto;      /* 居中 这个是必须的，，其它的属性非必须 */  
    width:500px;        /* 给个宽度 顶到浏览器的两边就看不出居中效果了 */  
    background:green;     /* 背景色 */  
    text-align:center;  /* 文字等内容居中 */  

    }

 a.button {
    display: inline-block;
    float: none;
    position: relative;
    height: 25px;
    width: 80px;
    margin: 0 10px 18px 0;
     
    text-decoration: none;
    font: 12px "Helvetica Neue", Helvetica, Arial, sans-serif;
    font-weight: bold;
    line-height: 25px;
    text-align: center;
    -webkit-border-radius: 3px; 
    -moz-border-radius: 3px;
    border-radius: 3px;
}
a.button:before,
a.button:after {
    content: '';
    position: absolute;
    left: -1px;
    height: 25px;
    width: 80px;
    bottom: -1px;
     
    -webkit-border-radius: 3px; 
    -moz-border-radius: 3px;
    border-radius: 3px;
}
 
a.button:before { 
    height: 23px;
    bottom: -4px;
    border-top: 0;
     
    -webkit-border-radius: 0 0 3px 3px; 
    -moz-border-radius: 0 0 3px 3px;
    border-radius: 0 0 3px 3px;
     
    -webkit-box-shadow: 0 1px 1px 0px #bfbfbf;
    -moz-box-shadow: 0 1px 1px 0px #bfbfbf;
    box-shadow: 0 1px 1px 0px #bfbfbf;
}
a.gray,
a.gray:hover,
a.gray:visited {
    color: #555;
    border-bottom: 4px solid #b2b1b1;
    text-shadow: 0px 1px 0px #fafafa;
     
    background: #eee;
    background: -webkit-gradient(linear, left top, left bottom, from(#eee), to(#e2e2e2));
    background: -moz-linear-gradient(top,  #eee,  #e2e2e2);
     
    box-shadow: inset 1px 1px 0 #f5f5f5;
}
 
.gray:before,
.gray:after {
    border: 1px solid #cbcbcb;
    border-bottom: 1px solid #a5a5a5;
}
 
.gray:hover {
    background: #e2e2e2;
    background: -webkit-gradient(linear, left top, left bottom, from(#e2e2e2), to(#eee));
    background: -moz-linear-gradient(top,  #e2e2e2,  #eee);
}

a.button:active {
    border: none;
    bottom: -4px;
    margin-bottom: 22px;
     
    -webkit-box-shadow: 0 1px 1px #fff;
    -moz-box-shadow:  0 1px 1px #fff;
    box-shadow:  1px 1px 0 #fff, inset 0 1px 1px rgba(0, 0, 0, 0.3);
}
 
a.button:active:before,
a.button:active:after {
    border: none;   
     
    -webkit-box-shadow: none;
    -moz-box-shadow: none;
    box-shadow: none;
}

</style> 
<script type="text/javascript">
 function clickFunc(){     
	 top.location="register.jsp";    
 }
function submitMyForm(){
	var myForm =document.getElementById('MyForm');
	myForm.submit();
 }
  
</script>
</head>
<body>
<div class="align-center"> 登陆界面 </div>
<div class="align-center2">
<form id='MyForm' action="login" method="post">
<br>
用户名 <input type="text" name = "username" /> <br><br>
&nbsp;密码&nbsp;&nbsp; <input type="password" name = "password"> <br><br>
&nbsp; &nbsp; <a class='gray button'  onclick="submitMyForm();">提交</a>&nbsp; 
<a class='gray button' onclick="clickFunc();">注册</a>
</form>
</div>
</body>
</html>