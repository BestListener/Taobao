		var classes = new Object();
  		classes['allClass'] = "全部";
  		classes['washFace'] = "洁面";
  		classes['milk'] = "乳液";
  		classes['mask'] = "面膜";
  		classes['eleWatch'] = "电子表";
  		classes['machineWatch'] = "机械表";
  		classes['solarWatch'] = "太阳能表";
  		classes['freeWatch'] = "休闲表";
  		classes['sportWatch'] = "运动表";
  		var branks = new Object();
  		branks['allBranks'] = "全部";
  		branks['Olaiya'] = "欧莱雅";
  		branks['zishenTang'] = "资生堂";
  		branks['proya'] = "PROYA/珀莱雅";
  		branks['IK'] = "IK colouring/阿帕琦";
  		branks['binger'] = "BINGER/宾格";
  		branks['beston'] = "Bestdon/邦顿";
  		branks['caston'] = "卡诗顿";
  		//  选中类别/品牌
  		function selectClass(obj)
  		{
  			obj.style.color = "#EE5F00";
  			obj.style.border = "#EE5F00 solid 1px";
  		}
  		//  未选中类别/品牌
  		function unselectClass(obj)
  		{
  			if( obj.id != curSelectClass && obj.id != curSelectBrand )
  			{
  				obj.style.color = "black";
  				obj.style.border = "white solid 1px";
  			}			
  		}
  		//  点击选中品牌
  		function branksOnClick(obj)
  		{
  			//  当点击的品牌未被选中时
  			if( obj.id != curSelectBrand )
  			{
  				var cancelSelect = document.getElementById(curSelectBrand);
  				cancelSelect.style.color = "black";
  				cancelSelect.style.border = "white solid 1px";
  				obj.style.color = "#EE5F00";
  				obj.style.border = "#EE5F00 solid 1px";
  				curSelectBrand = obj.id;
  				var url = getIframeUrl();
  				document.getElementById("goodsView").src = url;
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