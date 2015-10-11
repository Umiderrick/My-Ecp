// JavaScript Document

	/*	
标题：banner_slide文件
作者：yuxingyang
创建日期：2013年11月20日  
*/

var pic_scroll=(function($){
	return function(num_n){
			var lxfscroll_ul = $(".lxfscroll ul");
			var lxfscroll_li = $(".lxfscroll li");
			var lxfscroll_lifirst = $(".lxfscroll li:first");
			var lxfscroll_tli = $(".lxfscroll_title li");
			var lxfscroll_speed = 750;//切换的速度
			var lxfscroll_autospeed = 3000;//自动播放的速度
			var lxfscroll_n = 0;
			var lxfscroll_imgwidth = $(".lxfscroll li").width();//获取图片宽度
			var lxfscroll_lilength = lxfscroll_li.length;//获取图片数量
			num_n = num_n == null ? lxfscroll_lilength : num_n;
			var dir="left";
			var lxfscroll_timer;
			var lxfscroll_alt = $(".lxfscroll_alt");
			/* 标题按钮事件 */
			function lxfscroll() {
				lxfscroll_tli.mouseenter(function(){
					var lxfscroll_index = lxfscroll_tli.index($(this));
					var lxfscroll_lipoint = lxfscroll_index*lxfscroll_imgwidth;
					var lxfscroll_imgTitle = $(".lxfscroll li img").eq(lxfscroll_index).attr("alt");
					lxfscroll_alt.text(lxfscroll_imgTitle);
					lxfscroll_tli.removeClass("cur");
					$(this).addClass("cur");
					  lxfscroll_ul.stop(true,false).animate({"left":-lxfscroll_lipoint+"px"},lxfscroll_speed);
				 });
			};
			
			 /*最后一张图自动切换到第一张图时专用*/
			function showFirPic() {
				lxfscroll_lifirst.clone().appendTo(lxfscroll_ul)
				var lxfscroll_lilast = $(".lxfscroll li:last");
				var lxfscroll_lipoint = -lxfscroll_n*lxfscroll_imgwidth; 
				lxfscroll_ul.stop(true,false).animate({"left":lxfscroll_lipoint+"px"},lxfscroll_speed,function() {
					lxfscroll_n=0;
					lxfscroll_ul.css("left","0px");
					lxfscroll_lilast.remove();
				});
				lxfscroll_tli.removeClass("cur").eq(0).addClass("cur"); //为第一个按钮添加选中的效果
			};
			/* 自动轮换 */
			function lxfscroll_autoroll() {
				if(lxfscroll_n>=num_n){
					showFirPic();
				}else{
					var lxfscroll_lipoint =lxfscroll_n*lxfscroll_imgwidth;
					var lxfscroll_imgTitle = $(".lxfscroll li img").eq(lxfscroll_n).attr("alt");
					lxfscroll_ul.stop(true,false).animate({"left":-lxfscroll_lipoint+"px"},lxfscroll_speed);
					lxfscroll_tli.removeClass("cur").eq(lxfscroll_n).addClass("cur");
					lxfscroll_alt.text(lxfscroll_imgTitle);		
				}
				lxfscroll_n++;
				lxfscroll_timer = setTimeout(lxfscroll_autoroll, lxfscroll_autospeed);
			};
			/* 鼠标悬停即停止自动轮换 */
			function lxfscroll_stoproll() {
				lxfscroll_li.hover(function() {
					clearTimeout(lxfscroll_timer);
					lxfscroll_n = $(this).prevAll().length+1;
				}, function() {
					lxfscroll_timer = setTimeout(lxfscroll_autoroll, lxfscroll_autospeed);
				});
				lxfscroll_tli.hover(function() {
					clearTimeout(lxfscroll_timer);
					lxfscroll_n = $(this).prevAll().length+1;
				}, function() {
					lxfscroll_timer = setTimeout(lxfscroll_autoroll, lxfscroll_autospeed);
				});
			};
			lxfscroll();
			lxfscroll_autoroll();lxfscroll_stoproll();//启动自动播放功能	
		}	
})(jQuery)
