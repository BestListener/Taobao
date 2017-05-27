		//  鼠标移入下架按键
		function indeleteBtn(obj)
  		{
  			obj.style.backgroundColor = "#FF0000";
  		}
  		//  鼠标移出下架按键
  		function outdeleteBtn(obj)
  		{
  			obj.style.backgroundColor = "#FF4444";
  		}
  		//  鼠标移入修改按键
  		function inconfirmBtn(obj)
  		{
  			obj.style.backgroundColor = "#AAAAAA";
  		}
  		//  鼠标移出修改按键
  		function outconfirmBtn(obj)
  		{
  			obj.style.backgroundColor = "#CCCCCC";
  		}
		//  点击修改按钮
  		function clickConBtn(obj)
  		{
  			var id = obj.parentNode.parentNode.id;
  			window.parent.location.href = "./servlet/getProduct?pid="+id;
  		}
  		//  前往产品浏览页面
  		function toBrowseProduct(obj)
  		{
  			var id = obj.parentNode.parentNode.id;
  			window.open("./servlet/browseGoods?pid="+id);
  		}