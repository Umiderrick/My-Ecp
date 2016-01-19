<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*,pb.db.*,pb.item.Itemdealer,pb.thirdtype.Thitypedealer"%>
<%
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
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset =UTF-8">
<title>新增商品</title>
<link type="text/css" rel="stylesheet" href="css/global.css">
<link type="text/css" rel="stylesheet" href="css/login.css">
<script src="js/jquery-1.7.2.js" type="text/javascript"></script>
<script src="js/register.js" type="text/javascript"></script>
<script type="text/javascript">
	function submitMyForm() {
		var myForm = document.getElementById('itemform');
		myForm.submit();
	}
	function previewImage(file) {
		var MAXWIDTH = 260;
		var MAXHEIGHT = 180;
		var div = document.getElementById('preview');
		if (file.files && file.files[0]) {
			div.innerHTML = '<img id=imghead>';
			var img = document.getElementById('imghead');
			img.onload = function() {
				var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT,
						img.offsetWidth, img.offsetHeight);
				img.width = rect.width;
				img.height = rect.height;
				img.style.marginTop = rect.top + 'px';
			}
			var reader = new FileReader();
			reader.onload = function(evt) {
				img.src = evt.target.result;
			}
			reader.readAsDataURL(file.files[0]);
		} else //兼容IE
		{
			var sFilter = 'filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src="';
			file.select();
			var src = document.selection.createRange().text;
			div.innerHTML = '<img id=imghead>';
			var img = document.getElementById('imghead');
			img.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = src;
			var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth,
					img.offsetHeight);
			status = ('rect:' + rect.top + ',' + rect.left + ',' + rect.width
					+ ',' + rect.height);
			div.innerHTML = "<div id=divhead style='width:"+rect.width+"px;height:"+rect.height+"px;margin-top:"+rect.top+"px;"+sFilter+src+"\"'></div>";
		}
	}
	function clacImgZoomParam(maxWidth, maxHeight, width, height) {
		var param = {
			top : 0,
			left : 0,
			width : width,
			height : height
		};
		if (width > maxWidth || height > maxHeight) {
			rateWidth = width / maxWidth;
			rateHeight = height / maxHeight;

			if (rateWidth > rateHeight) {
				param.width = maxWidth;
				param.height = Math.round(height / rateWidth);
			} else {
				param.width = Math.round(width / rateHeight);
				param.height = maxHeight;
			}
		}

		param.left = Math.round((maxWidth - param.width) / 2);
		param.top = Math.round((maxHeight - param.height) / 2);
		return param;
	}
</script>
<style>
.place_mid {
	margin: 0 auto;
	width: 500px;
}

#preview {
	width: 260px;
	height: 190px;
	border: 1px solid #000;
	overflow: hidden;
}

#imghead {
	filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=image);
}
</style>

</head>

<body>
	<div class="w990">
		<div class="place_mid">
			<div class="login_title">
				<h3>商品录入</h3>

			</div>
			<form id='itemform' action="IteminsServlet" method="post"
				enctype="multipart/form-data">
				<table>
					<div class="login_reg">
						<div class="login_pass_span">
							<span> 商品编号 </span>
						</div>
						<div class="login_pass_input">
							<input type="text" name="itemid">
						</div>
						<div class="login_pass_span">
							<span> 商品名称 </span>
						</div>
						<div class="login_pass_input">
							<input type="text" name="itemname">
						</div>
						<div class="login_pass_input">
							<span> 商品余量 </span>
						</div>
						<div class="login_pass_input">
							<input type="text" name="qty">
						</div>
						<div class="login_pass_input">
							<span> 商品价格 </span>
						</div>
						<div class="login_pass_input">
							<input type="text" name="price">
						</div>
						<div class="login_pass_input">
							<span> 商品三级类别 </span>
						</div>
						<select name="thitypeid">
							<c:forEach items="${list}" var="list">
								<option>${list.thitypeid}</option>
							</c:forEach>
						</select>
						<div id="preview">
							<img id="imghead" width=100 height=100 border=0
								src='<%=request.getContextPath()%>'>
						</div>
						<input type="file" onchange="previewImage(this)" name="imgurl" />
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