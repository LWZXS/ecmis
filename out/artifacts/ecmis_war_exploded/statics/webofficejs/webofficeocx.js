if(!!window.ActiveXObject||"ActiveXObject" in window){ 
	document.write('<object classid="clsid:FF09E4FA-BFAA-486E-ACB4-86EB0AE875D5" codebase="http://localhost/ecmis/statics/ocx/WebOffice.ocx#Version=2018,1,6,2" id="WebOffice" width="100%" height="900" >');
	document.write('<param name="BorderStyle" value="1">');
	document.write('<param name="Caption" value="Office..."> ');
	document.write('<param name="BorderColor" value="10000">  ');
	document.write('<param name="TitlebarColor" value="52479">');
	document.write('<param name="TitlebarTextColor" value="0">');
	document.write('<param name="Menubar" value="1">  ');
	document.write('<param name="ForeColor" value="1">  ');
	/*if(Titlebar){
		document.write('<param name="Titlebar" value='+Titlebar+'>  ');
	}
	if(Toolbar){
		document.write('<param name="Toolbars" value='+Toolbar+'>'); 
	}*/
	document.write('</object>');
}else{
	document.write('<object id="WebOffice" CLSID="{FF09E4FA-BFAA-486E-ACB4-86EB0AE875D5}" TYPE="application/x-itst-activex"  width=100% height=900></object> ');
}