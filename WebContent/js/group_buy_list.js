// JavaScript Document
/*	
标题：团购js文件
作者：xucaihua
创建日期：2014年02月13日  
*/		
/* begin 实现鼠标放上图片呈现阴影效果*/
function img_hover(dom){
	dom.children().mouseover(function(){
		$(this).addClass("hove").siblings().removeClass("hove");	
	
	})		
	dom.mouseout(function(){
		$(this).children("li").removeClass("hove");
	})
} 
$(function(){
	img_hover($(".filter_goods"));	
})
/* end 实现鼠标放上图片呈现阴影效果*/	