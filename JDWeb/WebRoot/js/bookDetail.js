		function selectGood(obj)
		{
			obj.style.border = "#0099FF solid 2px";
		}
		function unselectGood(obj)
		{
			obj.style.border = "white solid 2px";
		}
		//  前往产品浏览页面
  		function toBrowseProduct(obj)
  		{
  			window.open("./servlet/browseGoods?pid="+obj);
  		}