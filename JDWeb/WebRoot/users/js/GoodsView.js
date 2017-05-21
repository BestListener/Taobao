		//  鼠标移入确定键
		function mouseOverCon(obj)
		{
			obj.style.backgroundColor = "#EE5F00";
		}
		//  鼠标移出确定键
		function mouseOutCon(obj)
		{
			obj.style.backgroundColor = "#FF7011";
		}
		//  鼠标移入取消键
		function mouseOverCan(obj)
		{
			obj.style.backgroundColor = "#BBBBBB";
		}
		//  鼠标移出取消键
		function mouseOutCan(obj)
		{
			obj.style.backgroundColor = "#D5D5D5";
		}
		//  点击确认按钮
		function checkInfo()
		{
			var inputList = $("#goodsInfoTab").find("input");
			for(var index = 0; index < inputList.length; index++)
			{
				if( inputList[index].value == "" )
				{
					alert("请填完整你的商品信息");
					return;
				}
			}
			var option1=$("#firstClass option:selected");
			inputList = null;
			if( option1.val() == "种类" )
			{
				alert("请选择你的商品种类");
				return;
			}
			else if( option1.val() == "书" )
			{
				var inputList = $("#booksInfo").find("input");
			}
			else if( option1.val() == "美妆" )
			{
				var inputList = $("#cosmeticsInfo").find("input");
			}
			else if( option1.val() == "手表" )
			{
				var inputList = $("#watchInfo").find("input");
			}
			for(var index = 0; index < inputList.length; index++)
			{
				if( inputList[index].value == "" )
				{
					alert("请填完整你的商品信息");
					return;
				}
			}
			var option2=$("#secondClass option:selected");
			var option3=$("#brank option:selected");
			if( option2.val() == "类别")
			{
				alert("请选择你的商品类别");
				return;
			}
			if( option1.val() != "书" && option3.val() == "品牌")
			{
				alert("请选择你的商品品牌");
				return;
			}
			//  添加成功
			$("#productData").submit();
		}
		//  点击了取消按钮
		function comeback()
		{
			window.history.back();  
		}
		//  更新图片
		function updateShowPic()
		{
			var picFileList = $("#showImageSrc").get(0).files;
			//html5新对象 封装文件对象
			var formData = new FormData();
			formData.append("file" , picFileList[0]);
			(function($){
				$.ajax({  
	              	type:"POST",
					url:"./servlet/upLoadProductImage",
					data:formData,
					contentType:false,
					dataType:"text",
					processData:false,
					success:function(data){
						$("#saveShowImage").val(data);
						$("#showImage").attr("src","./"+data);
					},
					error:function(){
	                  alert("服务器出错，请重试！");
	             	}
	            });	
			})(jQuery);
		}
		function updateInterPic()
		{
			var picFileList = $("#interImageSrc").get(0).files;
			//html5新对象 封装文件对象
			var formData = new FormData();
			formData.append("file" , picFileList[0]);
			(function($){
				$.ajax({  
	              	type:"POST",
					url:"./servlet/upLoadProductImage",
					data:formData,
					contentType:false,
					dataType:"text",
					processData:false,
					success:function(data){
						$("#saveInterImage").val(data);
						$("#imageInter").attr("src","./"+data);
					},
					error:function(){
	                  alert("服务器出错，请重试！");
	             	}
	            });	
			})(jQuery);
		}
		function updateInfoPic()
		{
			var picFileList = $("#infoImageSrc").get(0).files;
			//html5新对象 封装文件对象
			var formData = new FormData();
			formData.append("file" , picFileList[0]);
			(function($){
				$.ajax({  
	              	type:"POST",
					url:"./servlet/upLoadProductImage",
					data:formData,
					contentType:false,
					dataType:"text",
					processData:false,
					success:function(data){
						$("#saveInfoImage").val(data);
						$("#infoImage").attr("src","./"+data);
					},
					error:function(){
	                  alert("服务器出错，请重试！");
	             	}
	            });	
			})(jQuery);
		}
		function comeback()
		{
			window.location.href = "./users/jsp/shopGoodsView.jsp";
		}
		function changeInfo()
		{
			var inputList = $("#content").find("input");
			for(var index = 0; index < inputList.length; index++)
			{
				if( inputList[index].value == "" && inputList[index].id != "showImageSrc" && inputList[index].id != "interImageSrc" && inputList[index].id != "infoImageSrc")
				{
					alert("请填完整你的商品信息");
					return;
				}
			}
			$("#productData").submit();
		}