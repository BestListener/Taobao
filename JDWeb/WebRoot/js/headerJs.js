		//--------------------header部分js函数--------------------
		//  前往登录
		function toLogin()
		{
			window.location.href = "http://localhost:8080/JDWeb/userLogin.html";
		}
		//  前往注册
		function toRegister()
		{
			window.location.href = "http://localhost:8080/JDWeb/userRegister.html";
		}
		//  前往淘宝首页
		function toMainPage()
		{
			window.location.href = "http://localhost:8080/JDWeb/mainPage.html";
		}
		//  改变字体颜色
		function changeFontColor(obj)
		{
			obj.style.color = "#EE5F00";
		}
		//  恢复字体颜色
		function recoverFontColor(obj)
		{
			obj.style.color = "#5E5E5E";
		}
		//  显示我的淘宝子菜单
		function showaccout()
		{
			$('#myaccount').css({'backgroundColor':'white'});
			$('#myaccount').css({'borderLeft':'#E6E6E6 solid 1px'});
			$('#myaccount').css({'borderRight':'#E6E6E6 solid 1px'});
			$('#myaccount_sub').css({'display':'block'});
		}
		//  隐藏我的淘宝子菜单
		function hiddenaccout()
		{
			$('#myaccount').css({'backgroundColor':'#EEEEEE'});
			$('#myaccount').css({'borderLeft':'none'});
			$('#myaccount').css({'borderRight':'none'});
			$('#myaccount_sub').css({'display':'none'});
		}
		//  显示购物车子菜单
		function showSpc()
		{
			$('#shoppingCart').css({'backgroundColor':'white'});
			$('#shoppingCart').css({'borderLeft':'#E6E6E6 solid 1px'});
			$('#shoppingCart').css({'borderRight':'#E6E6E6 solid 1px'});
			$('#shoppingCart_sub').css({'display':'block'});
		}
		//  隐藏购物车子菜单
		function hiddenSpc()
		{
			$('#shoppingCart').css({'backgroundColor':'#EEEEEE'});
			$('#shoppingCart').css({'borderLeft':'none'});
			$('#shoppingCart').css({'borderRight':'none'});
			$('#shoppingCart_sub').css({'display':'none'});
		}
		//  显示收藏夹子菜单
		function showFav()
		{
			$('#favorite').css({'backgroundColor':'white'});
			$('#favorite').css({'borderLeft':'#E6E6E6 solid 1px'});
			$('#favorite').css({'borderRight':'#E6E6E6 solid 1px'});
			$('#favorite_sub').css({'display':'block'});
		}
		//  隐藏收藏夹子菜单
		function hiddenFav()
		{
			$('#favorite').css({'backgroundColor':'#EEEEEE'});
			$('#favorite').css({'borderLeft':'none'});
			$('#favorite').css({'borderRight':'none'});
			$('#favorite_sub').css({'display':'none'});
		}
		//  显示卖家中心子菜单
		function showSc()
		{
			$('#sellerCenter').css({'backgroundColor':'white'});
			$('#sellerCenter').css({'borderLeft':'#E6E6E6 solid 1px'});
			$('#sellerCenter').css({'borderRight':'#E6E6E6 solid 1px'});
			$('#sellerCenter_sub').css({'display':'block'});
		}
		//  隐藏卖家中心子菜单
		function hiddenSc()
		{
			$('#sellerCenter').css({'backgroundColor':'#EEEEEE'});
			$('#sellerCenter').css({'borderLeft':'none'});
			$('#sellerCenter').css({'borderRight':'none'});
			$('#sellerCenter_sub').css({'display':'none'});
		}
		//  选中选项
		function select(obj)
		{
			obj.style.backgroundColor = "#EEEEEE";
		}
		//  还原样式
		function unselect(obj)
		{
			obj.style.backgroundColor = "white";
		}
		//--------------------------------------------------------