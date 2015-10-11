// JavaScript Document
//打开层
function openPop(options){
	if(options.cover_layer){//遮盖层的显示
		$(options.cover_layer).click(function(){
			$(options.cover_layer).hide();
			$(options.list_qr_pop).hide();	
			if(options.button_list_qr_pop){
				$(options.button_list_qr_pop).hide();
			}	
		})
	}
		var docuW=$(document).width();//
		var docuH=$(document).height();
		var winW=$(window).innerWidth()//
		var winH=$(window).innerHeight()
		var selfW=$(options.list_qr_pop).outerWidth(true)
		var selfH=$(options.list_qr_pop).outerHeight(true)
		var as=$(window).scrollTop();
		var posL=winW/2-selfW/2;
		var posT=winH/2-selfH/2;
		var posWt=winH/2-selfH/2+as;
		if(options.cover_layer){
		$(options.cover_layer).show().width(docuW).height(docuH);
		}
		if(options.iframeUrlEle){
		var ull=$(options.seleEle).attr("Ul");
		$(options.list_qr_pop).show().css({"left":posL+"px","top":posT+"px"});
		
		$(options.list_qr_pop).find(options.iframeUrlEle).attr("src",ull)
		}else{
			if(options.list_qr_pop){
			$(options.list_qr_pop).show().css({"left":posL+"px","top":posWt+"px"});		
		}	
		}
		if(options.boolen){
			setTimeout(function(){
			$(options.cover_layer).fadeOut();
			$(options.list_qr_pop).fadeOut();		
			},3000)	
		}
}
function closePop(list_qr_pop,cover_layer){
	$(list_qr_pop).hide();
	$(cover_layer).hide();	
}