<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"> 
<title>查询结果</title>
<link href="<%=path %>/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path %>/js/jquery1.9.js"></script>
<style type="text/css">
  body {padding: 0px;background: whitesmoke;margin: 0}

    .top {width: 100%: height:100px;
        padding-top: 16px;
    padding-bottom: 2px;
background: -webkit-gradient(linear, left top, left bottom, from(#24dc0f), to(#31880c));
    background: -moz-linear-gradient(top, #24dc0f, #31880c);
    filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#24dc0f', endColorstr='#31880c');
  }


.content-top {padding: 8px;}
  .pingding {border: 1px solid #00963b;
    float: left;
    width: 49%;
    color: #00963b;
   text-align: center;padding-top: 30px;padding-bottom: 30px;}
.item-title {padding: 8px;}
.item-content {padding: 8px;word-wrap: break-word;}
.item-content span {color: #00963b;}
.item-title span {color: #00963b;}
#empty p {margin: 0 auto;width: 200px;text-align: center;color: #00963b;margin-bottom:10px;}
</style>

  </head>
  
  <body>
  <% 
  	Map<String,Object> map = (Map<String,Object>)request.getAttribute("result");
  	if(map!=null){
  	%>
  	  <div class="top">
  <p style="    text-align: center;
    color: white;
    font-size: 1.2em;
    margin-top: -6px;">查询结果</p>
</div>
<div class="clear"></div>

<div id="content">
  <div class="content-top">
    <div  style="width: 100%;margin-top: 14px;">
     <div class="pingding">
         综合评定
     </div>
    <div class="pingding">
        <%=map.get("level").toString() %>
     </div>

  </div>
</div>
     <div class="clear"></div>

<div class="item-title"><span>性格分析:</span></div>
<div class="item-content">
  <span><%=map.get("character_analysis").toString() %></span>
</div>
<div class="clear"></div>
<div class="item-title"><span>评&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;语:</span></div>
<div class="item-content">
  <span><%=map.get("comment").toString() %></span>
</div>
<div class="clear"></div>
<div style="width: 100px;float: right;margin-right: 30px;margin-top: 30px"><img src="<%=path %>/images/erweima.jpg" style="width: 100px;"></div>
</div>
  	
	  
	  
  <% 	
  	}else{
  		%>
  		<div id="empty" style="margin-top: 150px">
		    <p>该学生信息未收录</p>
		    <p>请稍后再试,或联系管理员</p>
		    <p>0574-27974324</p>
		</div>
  		<%
  	}	
  %>
  
    <div id="nodata"></div>
  </body>
</html>
