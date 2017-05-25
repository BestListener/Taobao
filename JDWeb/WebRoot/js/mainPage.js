		//  初始化图片轮放
		$(document).ready(function(){
			var sudoSlider = $("#slider").sudoSlider({
				numeric:true,
				continuous:true,
				resumePause:true,
				auto:true
			});
		});
		//  页面初始化函数
		function init()
		{		
			//   获取cookie值
			var val = getValue("mycookie");
			if( val != null )
			{
				$('#LoginBox').css({'display':'block'});
				$('#account').css({'display':'block'});
				$('#exitTop').css({'display':'block'});
				$('#username').text(val[1]);
				document.getElementById("boxUsername").innerText = val[1];
				var src = "./"+val[2];
				$('#userPic').attr("src",src);
				document.getElementById("shoppingNum").innerText = val[3];
			}
			else
			{
				$('#login').css({'display':'block'});
				$('#register').css({'display':'block'});
				$('#unLoginBox').css({'display':'block'});
				document.getElementById("boxUsername").innerText = "Hi,你好！";
				document.getElementById("shoppingNum").innerText = "";
			}
		}
		//  显示书子菜单
		function showbook()
		{
			$('#book').css({'backgroundColor':'#ff3a05'});
			$('#bk_unsel').css({'display':'none'});
			$('#bk_sel').css({'display':'block'});
			$('#book_sub').css({'display':'block'});
		}
		//  隐藏书子菜单
		function hiddenbook()
		{
			$('#book').css({'backgroundColor':'#ff6905'});
			$('#bk_unsel').css({'display':'block'});
			$('#bk_sel').css({'display':'none'});
			$('#book_sub').css({'display':'none'});
		}
		//  显示美妆子菜单
		function showCos()
		{
			$('#cosmetics').css({'backgroundColor':'#ff3a05'});
			$('#cos_unsel').css({'display':'none'});
			$('#cos_sel').css({'display':'block'});
			$('#cosmetics_sub').css({'display':'block'});
		}
		//  隐藏美妆子菜单
		function hiddenCos()
		{
			$('#cosmetics').css({'backgroundColor':'#ff6905'});
			$('#cos_unsel').css({'display':'block'});
			$('#cos_sel').css({'display':'none'});
			$('#cosmetics_sub').css({'display':'none'});
		}
		//  显示手表子菜单
		function showWatch()
		{
			$('#watch').css({'backgroundColor':'#ff3a05'});
			$('#wt_unsel').css({'display':'none'});
			$('#wt_sel').css({'display':'block'});
			$('#watch_sub').css({'display':'block'});
		}
		//  隐藏手表子菜单
		function hiddenWatch()
		{
			$('#watch').css({'backgroundColor':'#ff6905'});
			$('#wt_unsel').css({'display':'block'});
			$('#wt_sel').css({'display':'none'});
			$('#watch_sub').css({'display':'none'});
		}
		//  显示下划线
		function showline(obj)
		{
			obj.style.textDecoration = "underline";
		}
		//  隐藏下划线
		function hiddenline(obj)
		{
			obj.style.textDecoration = "none";
		}
		//  选中按钮
		function selectBtn(obj)
		{
			obj.style.backgroundColor = "#EE5F00";
		}
		//  未选中按钮
		function  unselectBtn(obj)
		{
			obj.style.backgroundColor = "#FF6600";
		}
		//  前往图书页
		function toBookPage()
		{
			window.location.href = "./jsp/searchBooks.jsp";
		}
		//  前往美妆页
		function toCosmeticsPage()
		{
			window.location.href = "./jsp/searchCosmetics.jsp";
		}
		//  前往手表页
		function toWatchPage()
		{
			window.location.href = "./jsp/searchWatch.jsp";
		}
		//  前往图书页
		function toBookPageBySub(obj)
		{
			window.location.href = "./jsp/searchBooks.jsp?fromPage="+obj.id;
		}
		//  前往美妆页
		function toCosmeticsPageBySub(obj)
		{
			window.location.href = "./jsp/searchCosmetics.jsp?fromPage="+obj.id;
		}
		//  前往手表页
		function toWatchPageBySub(obj)
		{
			window.location.href = "./jsp/searchWatch.jsp?fromPage="+obj.id;
		}
		//  前往查找页面
		function tosearchFromMain()
		{
			var input = document.getElementById("searchInput");
			var val = input.value;
			val = $.trim(val);
			if( val != "" )
				window.location.href = "./jsp/searchAll.jsp?search="+val;
		}