//  获取名字为name的Cookie
function getCookie(name) {   
	 var search;  
	 search = name + "=";
	 offset = document.cookie.indexOf(search);
	if (offset != -1) { 
		offset += search.length; 
		end = document.cookie.indexOf(";", offset); 
		if (end == -1) 
			end = document.cookie.length; 
		return document.cookie.substring(offset, end); 
	} 
	else 
		return "";
} 
//  删除名字为name的Cookie
function delCookie(name){
	var expdate = new Date(); 
	expdate.setTime(expdate.getTime() - 1); 
	var cval = getCookie(name);
	if(cval != null)
	{
		document.cookie = name + "=" + cval + ";expires=" + expdate.toGMTString();
	}
}
//  获取名字为name的value值
function getValue(name){
	var mycookie = getCookie(name);
	var val;
	if( mycookie != "" )	//  如果存在mycookie，则显示用户名
	{	
		val = mycookie.split("#");
		var index = val[0].indexOf("=") + 1;
		val[0] = val[0].substring( index , val[0].length );
		val[0] = decodeURI( val[0] );
	}
	return val;
}