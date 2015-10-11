// JavaScript Document
	/*	
标题：img_scroll文件
作者：yuxingyang
创建日期：2013年11月20日  
*/
var otherSkuImageIndex=0;
var _scroll=(function($){
		return function _scroll(show_n,dom,flag,flag1,dir){
			if(!dir){
				dir="left";
			}else{
				dir="top";	
			}
			if(flag){
				hover_img(dom);	
			}
			if(flag1){
				hover_cart(dom);	
			}
			var $this=$(dom).find(".scroll_body");
			var img_len=$this.children("li").length;
			if(img_len==0&&dir=="left"){
				$(dom).find(".sc_content").width("750px");
				
				return;	
			}else if(img_len==0&&dir=="top"){
				$(dom).find(".sc_content").height("750px");
				return;		
			}
			var mr=dir=="left"?($(dom).find(".scroll_body>li")?$(dom).find(".scroll_body>li").css("marginRight"):5):($(dom).find(".scroll_body>li")?$(dom).find(".scroll_body>li").css("marginBottom"):5);
			mr=parseInt(mr);
			var move_len=dir=="left"?$(dom).find(".scroll_body>li").width()+mr:$(dom).find(".scroll_body>li").height()+mr;		
				var go_len=dir=="left"?$(dom).find(".prev_go").width():$(dom).find(".prev_go").height();
				var go_len_mr=dir=="left"?parseInt($(dom).find(".prev_go").css("marginRight")):parseInt($(dom).find(".prev_go").css("marginBottom"));	
				go_len=go_len+go_len_mr;	
				if(img_len<show_n){
					img_len=show_n;
				}
				var space=mr;
				var scroll_width=show_n*move_len-space;	

				var sc_content_width=2*go_len+scroll_width;
				var len_li=$this.children("li").length;
				var n=0;
				var end_n=img_len-show_n;
				var flag=true;
				var flag1=true;
				if(dir=="left"){
				
				$(dom).find(".scroll_wrap").width(scroll_width+"px");
				$(dom).find(".sc_content").width(sc_content_width+"px");	
				}else{
				$(dom).find(".scroll_wrap").css("marginBottom",go_len_mr+"px");
				$(dom).find(".scroll_wrap").height(scroll_width+"px");
				$(dom).find(".sc_content").height(sc_content_width+"px");	
				}
					$(dom).find(".next_go").bind("click",function(){
						if($this.is(":animated")){
							return false;
						}
						if(!flag) return false;	
						flag1=true;
						$(this).siblings(".prev_go").removeClass("scroll_end");
						n++;	
						if(n>=end_n){
							$(this).addClass("scroll_end");
							flag=false;	
							n=end_n;
						}
					dir=="left"?$this.animate({"left":-n*move_len+"px"},'slow'):$this.animate({"top":-n*move_len+"px"},'slow');
					});
					$(dom).find(".prev_go").bind("click",function(){
						if($this.is(":animated")){
							return false;
						}
						if(!flag1) return false;	
						flag=true;
						$(this).siblings(".next_go").removeClass("scroll_end");
						n--;	
						if(n<=0){
							$(this).addClass("scroll_end");
							flag1=false;	
							n=0;
						}
						dir=="left"?$this.animate({"left":-n*move_len+"px"},'slow'):$this.animate({"top":-n*move_len+"px"},'slow');;

						
					});
		}
		
		function hover_img(dom){
			$(dom).find(".scroll_body").find("img").mouseover(function(){
				$(this).parents(".scroll_body").find("a").removeClass("cur");
				$(this).parent().addClass("cur");
				otherSkuImageIndex=$(dom).find(".scroll_body").find("img").index($(this))
				
				if($(dom).attr("class")=="phpto_img_middle"){
					$(".phpto_img_big").find("img")[0].src=otherSkuImagePhoto[0][otherSkuImageIndex];	
					return;
				}
				$("#magnifier").find("img")[0].src=otherSkuImageDetail[0][otherSkuImageIndex];
			})	
	}
	function hover_cart(dom){
		$(dom).find(".sc_content").hover(function(){
				$(this).children(".prev_go").css("visibility","visible");
				$(this).children(".next_go").css("visibility","visible");
		},function(){
			$(this).children(".prev_go").css("visibility","hidden");
			$(this).children(".next_go").css("visibility","hidden");	
		})	
	}
	})(jQuery);

