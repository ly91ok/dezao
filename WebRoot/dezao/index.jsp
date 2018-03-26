<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>首页</title>
    
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
<style type="text/css">
    .search-people {width: 150px;margin: 0 auto;border:1px solid #00963b; margin-top: 20%;padding: 10px}
    .search-people p {margin: 0 auto; color: #00963b}
</style>
  </head>
  
  <body>
  	<dir class="search-people">
    <p style="margin-bottom: 20px;text-align: center;">已查询人数</p>
    <p style="text-align: center;" id="searchNum">10000</p>
	</dir>
  </body>
  <script type="text/javascript" src="<%=path%>/js/jquery1.9.js"></script>
  <script type="text/javascript">
  	$(function(){
  		$.ajax({
  			type:"get",
  			url:"<%=path%>/system/Dezao!getSearchNum.action",
  			data:"",
  			dataType:"json",
  			success:function(data){
  				$("#searchNum").html(data.searchNum);
  			}
  		});
  	});
  </script>
</html>
