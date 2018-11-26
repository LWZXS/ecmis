function resetWidth(){
	var winHeight;
	var winWidth;
	if (window.innerHeight){
		winHeight = window.innerHeight;
		winWidth = window.innerWidth;
	}else if ((document.body) && (document.body.clientHeight)){
		winHeight = document.body.clientHeight;
		winWidth = document.body.clientWidth;
	}
	$("#rightContent").css("height",winHeight>800?(winHeight-230)+"px":"550px");
	$(".main_body").css("width",winWidth>1366?(winWidth-200)+"px":"1160px");
}

$(function(){
	resetWidth();
	
	$(window).resize(function() {
		resetWidth();
	});
		
});