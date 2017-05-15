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
  		//  鼠标移入确认发货按键
  		function inconfirmBtn(obj)
  		{
  			obj.style.backgroundColor = "#DD2C00";
  		}
  		//  鼠标移出确认发货按键
  		function outconfirmBtn(obj)
  		{
  			obj.style.backgroundColor = "#FF3300";
  		}
		function clickConBtn(obj)
  		{
  			//   扩展：弹出评论界面，用户可选择评论或者取消
  		}
  		//  点击删除按钮
  		function clickDelBtn(obj)
  		{
  			var tr = obj.parentNode.parentNode;
  			if( window.confirm("你确定要删除订单号为：" + tr.id + " 的订单吗？") )
  			{
				//  确定删除操作
  			}
  		}
  		//  点击确认按钮