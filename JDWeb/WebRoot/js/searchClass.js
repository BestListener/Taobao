		var classes = new Object();
  		classes['allClass'] = "全部";
  		classes['childBooks'] = "儿童文学";
  		classes['novel'] = "小说";
  		classes['literature'] = "文学";
  		classes['hotBooks'] = "畅销书";
  		//  选中类别
  		function selectClass(obj)
  		{
  			obj.style.color = "#EE5F00";
  			obj.style.border = "#EE5F00 solid 1px";
  		}
  		//  未选中类别
  		function unselectClass(obj)
  		{
  			if( obj.id != curSelectClass )
  			{
  				obj.style.color = "black";
  				obj.style.border = "white solid 1px";
  			}
  		}
  		//  点击选中类别
  		function classOnClick(obj)
  		{
  			//  当点击的类别未被选中时
  			if( obj.id != curSelectClass )
  			{
  				var cancelSelect = document.getElementById(curSelectClass);
  				cancelSelect.style.color = "black";
  				cancelSelect.style.border = "white solid 1px";
  				obj.style.color = "#EE5F00";
  				obj.style.border = "#EE5F00 solid 1px";
  				curSelectClass = obj.id;
  				var url = getIframeUrl();
  				document.getElementById("goodsView").src = url;
  			}
  		}
  		//  选中排序
  		function selectSort(obj)
  		{
  			obj.style.color = "#EE5F00";
  			obj.style.border = "#EE5F00 solid 1px";
  		}
  		//  未选中
  		function unselectSort(obj)
  		{
  			if( obj.id != curSelectSort )
  			{
  				obj.style.color = "black";
  				obj.style.border = "none";
  			}	
  		}
  		//  点击选中排序
  		function sortOnClick(obj)
  		{
  			//  当点击的排序未被选中时
  			if( obj.id != curSelectSort )
  			{
  				var cancelSelect = document.getElementById(curSelectSort);
  				cancelSelect.style.color = "black";
  				cancelSelect.style.border = "none";
  				obj.style.color = "#EE5F00";
  				obj.style.border = "#EE5F00 solid 1px";
  				curSelectSort = obj.id;
  				var url = getIframeUrl();
  				document.getElementById("goodsView").src = url;
  			}
  		}
  		//  点击查找按钮
  		function tosearch()
  		{
  			var url = getIframeUrl();
  			document.getElementById("goodsView").src = url;
  		}
  		//  获取iframe要传入的url
  		function getIframeUrl()
  		{
  			//  设置本页的主题参数
  			var url = "./servlet/getProductList?firstClass=书";
  			//  设置本页的细节参数
  			url = url+"&secondClass="+classes[curSelectClass]+"&sort="+curSelectSort;
  			var search = document.getElementById("searchValue").value;
  			search = $.trim(search);
  			if( search != "" )
  			{
  				url = url+"&search="+search;
  			}
  			return url;
  		}
  		function clearInput()
  		{
  			var val = document.getElementById("searchValue").value;
  			if( val != "" )
  			{
  				document.getElementById("searchValue").value = "";
  				var url = getIframeUrl();
  				document.getElementById("goodsView").src = url;
  			}
  		}