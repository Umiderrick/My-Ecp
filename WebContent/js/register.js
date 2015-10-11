//检验姓名：称呼是1-6字的中文
function isChinese(s){
    var patrn=/^\s*[\u4e00-\u9fa5]{1,6}\s*$/; 
    if (!patrn.exec(s)) return false 
    return true 
}

function isMail(str) {
	var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;
       return reg.test(str);
}

function isNum(str){
	var reg1=/^[1-9]\d*$/;
	return reg1.test(str);
}
	
function isTeshu(str){
	var reg2=/^.*[@!#$%^&*()]+.*$/
	return reg2.test(str);
}
function isKong(str){
	var reg2=/(^\s+)|(\s+$)/g;
	return reg2.test(str);
}
function isMobileNumber(str){
   var	reg3=/^1[358]{1}\d{9}$/
   return reg3.test(str)
}

function isUnit(str){
	var reg4=/^[\u2E80-\u2EFF\u2F00-\u2FDF\u3000-\u303F\u31C0-\u31EF\u3200-\u32FF\u3300-\u33FF\u3400-\u4DBF\u4DC0-\u4DFF\u4E00-\u9FBF\uF900-\uFAFF\uFE30-\uFE4F\uFF00-\uFFEF]+$/ 
	return reg4.test(str)
}

function isPhone(str){
	var reg5=/^\d{3}-\d{8}|\d{4}-\d{7}$/
	return reg5.test(str);
}

function isNumber(str) {
    if(trim(str) == ""){
        return false;
    }
    for (var i=0; i < str.length; i++)
	{	var ch=str.charAt(i);
		if ((ch != "0") && (ch != "1") && (ch != "2") && (ch != "3") && (ch != "4") && (ch != "5") && (ch != "6") && (ch != "7") && (ch != "8") && (ch != "9"))
			return false;
	}
    return true;
}

function isEmailNum(str){
	var reg6=/^\d{6}/
	return reg6.test(str);
}

function getByteLen(val){
	var len = 0;
	for (var i = 0; i < val.length; i++) {
		if (val[i].match(/[^\x00-\xff]/ig) != null) //全角
			len += 2;
		else
	 len += 1;
	}
	return len;
}

function trim(str){
	return str.replace(/\s*/g, "");
}


//校验开始

//用户名

function admin_focus(){
		flag=true;
		$(".divAdmin").addClass("info").removeClass("error");
		$(".divAdmin").text("请输入邮箱或用户名其中用户名为5-25个字符，一个汉字为两个字符");
}
function login_admin_focu(){
		flag=true;
		$(".divAdmin").addClass("info").removeClass("error");
		$(".divAdmin").text("请输入邮箱或用户名");	
}
function admin_blur(){
	if(!flag){
			return;	
		}
	var value_input=$(this).val();
	if(getByteLen(value_input)<5||getByteLen(value_input)>25){
			$(".divAdmin").addClass("error").removeClass("info");
			$(".divAdmin").text("输入字符长度不符合");
			return;
	}
	if(isTeshu(value_input)){
		if(value_input.indexOf("@")!=-1){
			if(!isMail(value_input)){
				$(".divAdmin").addClass("error").removeClass("info");
				$(".divAdmin").text("请填写正确的邮箱");	
			}	
		}else{
			$(".divAdmin").addClass("error").removeClass("info");
			$(".divAdmin").text("不能包含特殊字符");		
		}
		return;	
	}
	$(".divAdmin").removeClass("info");
	$(".divAdmin").text("");
}
//密码校验
function password_focus(){
		flag=true;
		$(".divPassword").addClass("info").removeClass("error");
		$(".divPassword").text("6-20位字符，可使用字母、数字或符号的组合不建议使用纯数字、纯字母、纯符号");	
}
function password_blur(dom){
		if(!flag){
			return;	
		}
		var len = $(this).val().length;
		if(len <6 || len >20){
			$(".divPassword").text("密码长度只能在6-20位字符之间");
			$(".divPassword").addClass("error");
			return;
		}
		$(".divPassword").removeClass("info");
		$(".divPassword").text("");
}

//确认密码校验
function password2_focus(){
	flag=true;
	$(".divPassword02").addClass("info").removeClass("error");		
	$(".divPassword02").text("请再次输入密码");
}

function password2_blur(){
	if(!flag){
			return;	
	}
	var value_input = $(this).val();
	if(value_input !== $(".txtPassword").val()) {
		$(".divPassword02").text("输入不一致，请重试！");
		$(".divPassword02").addClass("error").removeClass("info");	
		return;
	}
	$(".divPassword02").removeClass("info");	
	$(".divPassword02").text("");
}
//验证码
function code_focus(){
		flag=true;
		$(".divCode").removeClass("error");
}

function code_blur(){

}

function verify(){
	$(".input_register01").blur();
	//验证码函数调用
	
    if($("div.error").length==0&&$(".check").is(":checked")){
		alert("ok") ;
		return;
		}
   alert("请返回修改错误")
}

