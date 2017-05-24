		//  鼠标移入删除按键
		function indeleteBtn(obj)
  		{
  			obj.style.backgroundColor = "#FF0000";
  		}
  		//  鼠标移出删除按键
  		function outdeleteBtn(obj)
  		{
  			obj.style.backgroundColor = "#FF4444";
  		}
  		//  鼠标移入确认发货按键
  		function inconfirmBtn(obj)
  		{
  			obj.style.backgroundColor = "#DD2C00";
  		}
  		//  鼠标移出确认发货按键
  		function outconfirmBtn(obj)
  		{
  			obj.style.backgroundColor = "#FF3300";
  		}
  		//  前往产品浏览页面
  		function toBrowseProduct(obj)
  		{
  			window.open("./servlet/browseGoods?pid="+obj);
  		}