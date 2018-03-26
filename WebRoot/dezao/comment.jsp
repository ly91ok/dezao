<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"  %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>评语</title>
    
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"></head>
<link rel="stylesheet" type="text/css" href="<%=path %>/css/common.css">
<link rel="stylesheet" type="text/css" href="<%=path %>/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=path %>/css/comment.css">
	<script src="<%=path %>/js/jquery1.9.js"></script>
         <script type="text/javascript" src="<%=path %>/js/layer-v2.3/layer/layer.js"></script>
		<link rel="stylesheet" href="<%=path %>/js/layer-v2.3/layer/skin/layer.css" type="text/css"/>
  </head>
  
  <body>
  <div class="comment-main">
    <s:iterator value="#request.list" id="map">
    	 <div class="item-comment">
        	<img src="<%=path %>/images/${map.logo }">
        	<p class="comment-xingzuo">${map.name }</p>
        	<p class="comment-birthday">${map.start_date }-${map.end_date }</p>
           
            <div class="comment-edit">
            	<p class="title">评语编辑</p>
            	<p style="text-align: center;"><span class="shuzi" onclick="edit('${map.id}',1)">1</span>
            	<span class="shuzi" onclick="edit('${map.id}',2)">2</span>
            	<span class="shuzi" onclick="edit('${map.id}',3)">3</span>
            	<span class="shuzi" onclick="edit('${map.id}',4)">4</span></p>
            </div>

        </div>
    </s:iterator>
    </div>
  </body>
  <script type="text/javascript">
  	function edit(id,num){
  		$.ajax({
  			type:'get',
  			data:{id:id,num:num},
  			url:'<%=path%>/system/Dezao!getComment.action',
  			dataType:'json',
  			success:function(data){
  				var str=data.comment
  				layer.prompt({
		  		offset: '100px',
				formType: 2,
				value: str,
				title: '编辑',
				area: ['500px', '250px'] //自定义文本域宽高
				}, function(value, index, elem){
					$.ajax({
						type:'post',
						data:{id:id,num:num,comment:value},
						url:'<%=path%>/system/Dezao!updateComment.action',
						dataType:'json',
						success:function(datas){
							if(datas.result==1){
								layer.msg("更新成功",{"offset":"100px"});
							}else{
								layer.msg("更新失败",{"offset":"100px"});
							}
						}
					});
					
				});
  			}
  		})
  		
  	}
  </script>
</html>
