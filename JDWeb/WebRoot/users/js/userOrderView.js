		//  鼠标移入删除按键
		function indeleteBtn(obj)
  		{
  			obj.style.backgroundColor = "#FF0000";
  		}
  		//  鼠标移出删除按键
  		function outdeleteBtn(obj)
  		{
  			obj.style.backgroundColor = "#FF4444";
  		}
  		//  鼠标移入确认收货按键
  		function inconfirmBtn(obj)
  		{
  			obj.style.backgroundColor = "#DD2C00";
  		}
  		//  鼠标移出确认收货按键
  		function outconfirmBtn(obj)
  		{
  			obj.style.backgroundColor = "#FF3300";
  		}
  		//  前往查看物品
		function browse(obj)
		{
			window.open("./servlet/browseGoods?pid="+obj);
		}
		//  显示按钮
  		function showBtn(btnid)
  		{
  			var btn = document.getElementById(btnid);
  			btn.style.display = "block";
  		}
		//  点击确认按钮
  		function clickConBtn(obj,pid,num)
  		{
  			//   扩展：弹出评论界面，用户可选择评论或者取消
  			var tr = obj.parentNode.parentNode.id;
  			var name = document.getElementById("name"+tr);
  			if( window.confirm("你确定物品   " + name.innerText + "  已经收到了吗？") )
  			{
  				var delbtn = document.getElementById("del"+tr);
  				var conbtn = document.getElementById("con"+tr);
				//  确定收货操作
  				(function($){
					$.ajax({  
		               type:"get",//请求方式  
		               url:"./servlet/userConfirmReceipt?oid="+tr+"&pid="+pid+"&num="+num,//发送请求地址  
		               timeout:30000,//超时时间：30秒  
		               dataType:"text",//设置返回数据的格式  
		               //请求成功后的回调函数 data为text格式  
		               success:function(data){
		               		if( data == "true" )
		               		{
								document.getElementById("state"+tr).innerText = "交易成功";
								conbtn.style.display = "none";
								delbtn.style.display = "block";
		               			alert("操作成功！");
		               		}
		               		else if( data == "false" )
		               		{
		               			alert("操作失败，请稍后重试！");
		               		}
		              },
		              error:function(){  
		                  alert("服务器出错，请重试！");
		              }
		            });	
				})(jQuery);
  			}
  		}