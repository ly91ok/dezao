<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>登录</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="<%=path %>/css/common.css">
<link rel="stylesheet" type="text/css" href="<%=path %>/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=path %>/css/login.css">
  </head>
  
  <body>
    <div  style="margin-top: 280px;width: 100%;height: 180px;position: relative;">
    <div class="yuanpan" style="left: 100px;position: absolute;z-index: 900"></div>
    <div class="zhongjian" style="width: 100%;height: 180px;position: relative;z-index: 1000">
    	<form action="<%=path%>/Index!index.action" method="post">
    	<div class="dialog">
    		<p style="    padding-top: 13px;"><span>用户名:</span><input class="input" type="text" name="username"></p>
    		<p><span>密&nbsp;&nbsp;&nbsp;&nbsp;码:</span><input class="input" type="password" name="password"></p>
    		<p style="float: left;margin-right:5px"><span>验证码:</span><input style="width: 70px;" type="text" name="code"></p><p style="float: left;"><img src="<%=path %>/images/code.jpg"></p><input class="tijiao" type="submit" name="" value="登录" />
    	</div>
    	</form>
    </div>
</div>
  </body>
</html>
