// JavaScript Document
var ui_import=(function(){
	return function(_script){
		var path="js/";
		var arr=_script.split(",");
		for(var x=0; x<arr.length; x++){
			var script=document.createElement("script");
			script.src=path+arr[x];
			var header=document.documentElement.children[0];
			header.appendChild(script);	
		}
	}	
}())
