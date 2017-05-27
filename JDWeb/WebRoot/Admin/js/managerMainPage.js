		var curSelectOption; //  当前选中的选项
		var options;		 //  选项对应的页面 
		options = new Object();
		options['system_info'] = "./Admin/jsp/systemInfo.html";
		options['add_manager'] = "./Admin/jsp/addManager.jsp";
		options['user_manger'] = "./Admin/jsp/userManager.jsp";
		options['shop_check'] = "./Admin/jsp/shopManager.jsp";
		function init()
		{
			//  默认选择为system_info
			curSelectOption = "system_info";  
			var curSelect = document.getElementById(curSelectOption);
			curSelect.style.backgroundColor = "#E6E6E6";
			curSelect.style.color = "black";
			skipTo(curSelectOption);
		}
		//  指向该选项时
		function tarOption(obj)
		{
			obj.style.backgroundColor = "#E6E6E6";
			obj.style.color = "black";
		}
		//  当鼠标移出选项时
		function unTarOption(obj)
		{
			if( obj.id != curSelectOption )
			{
				obj.style.backgroundColor = "white";
				obj.style.color = "#666666";
			}
		}
		//  点击选中选项
		function selectOption(obj)
		{
			if( obj.id != curSelectOption )
			{
				var curSelect = document.getElementById(curSelectOption);
				curSelect.style.backgroundColor = "white";
				curSelect.style.color = "#666666";
				obj.style.backgroundColor = "#E6E6E6";
				obj.style.color = "black";
				curSelectOption = obj.id;
				skipTo(curSelectOption);
			}
		}
		//  跳向指向页面
		function skipTo(obj)
		{
			var pageSrc = options[obj];
			document.getElementById("right_info_box").src = pageSrc;
		}
		//  退出帐号
		function exit()
		{
			window.location.href = "/JDWeb/servlet/admin/exit";
		}