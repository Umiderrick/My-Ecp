/*	
标题：分页js文件
作者：xucaihua
创建日期：2013年11月22日  
*/
$(function(){
		$(".pre").hover(function(){
				 $(this).children("a").removeClass("icon_pre").addClass("icon_prehover");
			},function(){
				 $(this).children("a").removeClass("icon_prehover").addClass("icon_pre");	
			});
		$(".next").hover(function(){
			 $(this).children("a").removeClass("icon_next").addClass("icon_nexthover");
		},function(){
			 $(this).children("a").removeClass("icon_nexthover").addClass("icon_next");	
		});
		
	$(".pageNum").hover(function(){
	   $(".numSelected").children("a").removeClass("hove").addClass("unhove");
       $(".pageNum").children("a").removeClass("hove").addClass("unhove");
		},function(){ 
		    $(".numSelected").children("a").removeClass("unhove").addClass("hove");
		});
		
	})
