		function init()
		{
			window.parent.scrollTo(0,0); 
		}
		function toAddGoods()
		{
			window.location.href = "./users/jsp/shopAddGoods.jsp";
		}
		//  查找物品，返回查找数据
		function searchGoods()
		{
			var input = document.getElementById("inputText");
			if( input.value != "" )
			{
				var searchVal = input.value;
				//  清空两侧空格
				document.getElementById("goodsList").src = "./servlet/getProductInfo?search="+searchVal;
			}
		}
		//  清空查找栏,返回全部数据
		function clearInput()
		{
			var input = document.getElementById("inputText");
			if( input.value != "" )
			{
				input.value = "";
				document.getElementById("goodsList").src = "./servlet/getProductInfo";
			}
		}