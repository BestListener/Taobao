		var curSelectClass;	//  当前选定的类别
  		var curSelectSort; //  当前选定的排序
  		//  初始化页面
  		function init()
  		{
  			//  默认类别为 “全部”
  			curSelectClass = "allClass";
  			//  默认排序为“销量”
  			curSelectSort = "sellNum";
  			var curClass = document.getElementById(curSelectClass);
  			var curSort = document.getElementById(curSelectSort);
  			curClass.style.color = "#EE5F00";
  			curClass.style.border = "#EE5F00 solid 1px";
  			curSort.style.color = "#EE5F00";
  			curSort.style.border = "#EE5F00 solid 1px";
  		}
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
  			}
  		}