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
//  获取名字为name的value值
function getValue(name){
	var mycookie = getCookie(name);
	var val = null;
	if( mycookie != "" )	//  如果存在mycookie，则对cookie值进行处理
	{	
		val = mycookie.split("#");
		var index = val[0].indexOf("=") + 1;
		val[0] = val[0].substring( index , val[0].length );
		val[1] = decodeURI( val[1] );
	}
	return val;
}