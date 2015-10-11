// JavaScript Document
/*	
标题：ToggleMenu文件
作者：yuxingyang
创建日期：2013年11月15日  
*/

function toggleMenu(parent_menu,second_menu,third_menu){
	var third_t=$(".third_menu").outerHeight();
	if(parent_menu){
		$(parent_menu).children("a").addClass("cur");
		$(parent_menu).children("a").removeClass("hove");
		$(second_menu).hide();
		$(parent_menu).children("a").hover(function(){
				time_menu=setTimeout(function(){
				$(second_menu).slideDown("slow",function(){
					$(".cover_bug_forManig").show();
					$(this).addClass("hove");
					$(second_menu).css("overflow","visible");	
				});	
				},300);	
			
		},function(){
			try{
				clearTimeout(time_menu);
			}catch(e){
			var $this=$(this);
			
			$this.removeClass("hove");
			$(second_menu).css("overflow","hidden");
			$(second_menu).slideUp("slow");	
			$(".cover_bug_forManig").hide();
					
			}	
	});
	$(parent_menu).mouseleave(function(){
		$this=$(this);
		time_menu=setTimeout(function(){
			$(parent_menu).children("a").removeClass("hove");
			$this.removeClass("hove");
			$(second_menu).css("overflow","hidden");
			$(second_menu).slideUp("slow");	
			$(".cover_bug_forManig").hide();
		},300);		
	});	
	}
	$(second_menu).children("li").children("dl").mouseenter(function(){
		try{
			clearTimeout(time_menu);
			clearTimeout(time_menu1);
		}catch(e){
			try{
				clearTimeout(time_menu1);	
				clearTimeout(time_menu);
			}catch(e){
					
			}	
		}
		var self_t=$(this).parent().outerHeight();
		var next_len=$(this).parent().nextAll().length
		var bottom_h=self_t*(next_len+1);
		
		var $dl=$(this).parent("li").siblings().children("dl");
		$dl.removeClass("hove");
		$dl.next(third_menu).hide();
		$(this).addClass("hove");

		if(bottom_h-third_t<0){
			$(this).next(third_menu).show().css("top","auto").css("bottom","0px");	
			return;
		}
		var s=$(this).next(third_menu)
		$(this).next(third_menu).show();
	});
	$(second_menu).mouseleave(function(){
		var $dl=$(this).children("li").children("dl");
		time_menu1=setTimeout(function(){
			$dl.removeClass("hove");
			$dl.next(third_menu).hide();	
		},300);		
	});
	$(third_menu).hover(function(){
		try{
			clearTimeout(time_menu);
			clearTimeout(time_menu1);
		}catch(e){
			try{
				clearTimeout(time_menu1);	
				clearTimeout(time_menu);
			}catch(e){
					
			}	
		}
		$(this).addClass("hove");
		$(this).show();
	},function(){
		$(this).removeClass("hove");
		$(this).hide();	
	});
}
function IeBrowser(num){
	var bro=navigator.userAgent.match("MSIE "+num);
	if(bro) return true;
	return false;
}