<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"></head>
<link rel="stylesheet" type="text/css" href="<%=path %>/css/common.css">
<link rel="stylesheet" type="text/css" href="<%=path %>/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=path %>/css/left2.css">
<script type="text/javascript" src="<%=path %>/js/jquery1.9.js"></script>
<script type="text/javascript">
    
    $(function(){
     
     $(".item").click(function(){
     	var index3 = $(this).index() 
		$(".item").removeClass("current");
		$(".item").eq(index3).addClass("current");
        switch(index3){
        	case 0:
        	$("#iframe_content",window.parent.document).attr("src","<%=path%>/dezao/index.jsp");
        	break;
        	case 1:
        	 $("#iframe_content",window.parent.document).attr("src","<%=path%>/dezao/user_import.jsp");
        	break;
        	case 2:
        	$("#iframe_content",window.parent.document).attr("src","<%=path%>/system/Dezao!getCharacterList.action");
        	break;
        	case 3:
        	$("#iframe_content",window.parent.document).attr("src","<%=path%>/system/Dezao!getCommentList.action");
        	break;
        }
      
     });

    })

</script>
<body>
	<div class="left-menu">
		<div class="item current">首页</div>
		<div class="item">身份信息录入</div>
		<div class="item">性格内容</div>
		<div class="item">评语</div>
	</div>
   
   <div class="orange" style="margin-top: 32px;padding: 10px 0 10px 0">
   	 <img src="<%=path %>/images/dianhua.png"/>
   	 <span style="color: white;font-size: 1.3em">0574-27974324</span>
   </div>

</body>
</html>