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
<title>社会实践成绩查询入口</title>
<link href="<%=path %>/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path %>/js/jquery1.9.js"></script>
         <script type="text/javascript" src="<%=path %>/js/layer-v2.3/layer/layer.js"></script>
		<link rel="stylesheet" href="<%=path %>/js/layer-v2.3/layer/skin/layer.css" type="text/css"/>
<style type="text/css">
body {    margin: 0 0;
    background: #ececec;}

  .top {width: 100%: height:100px;
        padding-top: 16px;
    padding-bottom: 2px;
background: -webkit-gradient(linear, left top, left bottom, from(#24dc0f), to(#31880c));
    background: -moz-linear-gradient(top, #24dc0f, #31880c);
    filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#24dc0f', endColorstr='#31880c');
  }

.item {width: 100%;text-align: center;}
.item p {color: #00963b;} 
.item p.input {border:1px solid #00963b;padding: 7px;width: 100px;margin: 0 auto}
.item p input {background: #ececec;width: 100%;}

.tijiao {
  padding-right: 10px;
  padding-left: 10px;
  margin: 0 auto;
  display: block;
  margin-top: 20px;
  font-size: 1.1em;
    color: #fef4e9;
     border: solid 1px #b2d485;
     border-radius: 4px;
background: -webkit-gradient(linear, left top, left bottom, from(#24dc0f), to(#31880c));
    background: -moz-linear-gradient(top, #24dc0f, #31880c);
    filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#24dc0f', endColorstr='#31880c');
}

</style>
  </head>
  
  <body>
   <form id="SearchForm" name="SearchForm" method="post">
  	<div class="top">
  <p style="    text-align: center;
    color: white;
    font-size: 1.2em;
    margin-top: -6px;">社会实践成绩查询入口</p>
  <p style="    text-align: center;
    margin-bottom: 5px;"><img src="<%=path %>/images/top_title.png" style="width: 100px"></p>
</div>

<div class="item" style="margin-top: 30px">
    <p>姓名</p>
    <p class="input"><input type="text" name="name" id="username"></p>
</div>

<div class="item" style="margin-top: 10px">
    <p>手机号码</p>
    <p class="input"><input type="text" name="phone" id="phone"></p>
</div>

<div class="item" style="margin-top: 10px">
    <p>身份证号码</p>
    <p class="input"><input type="text" name="postNo" id="postNo"></p>
</div>
<div class="clear"></div>

<button class="tijiao"  id="btn" type="button">查询</button>
   </form> 
  </body>
  <script type="text/javascript">
  	$(function () {
	    $("#btn").click(function () {
	      var username = $("#username").val();
	      var phone = $("#phone").val();
	      var postNo = $("#postNo").val();
	      if(phone==''){
	      	layer.msg("请填写手机号码！");
	        return false;
	      }
	      if(!checkMobile(phone)) {
	        layer.msg("手机号码不正确！");
	        return false;
	      }
	      else {
	        document.SearchForm.action = '<%=path%>/Index!search.action';
	        document.SearchForm.submit();
	      }
	    });
	  });
	  
	  function checkMobile(s){  
	    var length = s.length;  
	    if(length == 11 && /^[1][3,4,5,7,8][0-9]{9}$/.test(s) )   
	    {   
	        return true;   
	    }else{   
	        return false;   
	    }   
	}   
	 
  </script>
</html>
