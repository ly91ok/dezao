<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    
    <title>数据录入</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"></head>
<link rel="stylesheet" type="text/css" href="<%=path %>/css/common.css">
<link rel="stylesheet" type="text/css" href="<%=path %>/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=path %>/css/user_import.css">
	<script src="<%=path %>/js/jszip.js"></script>
         <script src="<%=path %>/js/xlsx.js"></script>
         <script src="<%=path %>/js/jquery1.9.js"></script>
         <script type="text/javascript" src="<%=path %>/js/layer-v2.3/layer/layer.js"></script>
		<link rel="stylesheet" href="<%=path %>/js/layer-v2.3/layer/skin/layer.css" type="text/css"/>
         <style>

    .file_input {
        width: 172px!important;/*因为file-input在部分浏览器中会自带一个输入框，需要双击才可以点击上传,放大后将其定位到div外面就好啦*/
        height: 36px!important;
        position: absolute;
        top: 0;
        left:0;
        z-index:1;
        -moz-opacity: 0;
        -ms-opacity: 0;
        -webkit-opacity: 0;
        opacity: 0;  /*css属性——opcity不透明度，取值0-1*/
        filter: alpha(opacity=0); /*兼容IE8及以下--filter属性是IE特有的，它还有很多其它滤镜效果，而filter: alpha(opacity=0); 兼容IE8及以下的IE浏览器(如果你的电脑IE是8以下的版本，使用某些效果是可能会有一个允许ActiveX的提示,注意点一下就ok啦)*/
        cursor: pointer;
    }
</style>
  </head>
  
  <body>
  	<div class="center" style="width: 420px;margin-top: 10%;">
	<div style="width: 100%;">
				<div class="search-people" onclick="download()">
				    示例下载
				</div>
					<div class="search-people" style="float: right;position:relative;">
				    上传
				    <input type="file" name="xlfile" id="xlf" class="file_input" />
				</div>
		</div>
	    <div class="clear"></div>
	<div style=" text-align: center;margin-top: 53px;width: 100%"><img src="<%=path %>/images/tanhao.png"></div>
	<p style="width: 100%;text-align: center;color: #00963b;font-size: 1.2em;margin-top: 10px">务必按照示例格式导入</p>
	</div>
    <pre id="out" ></pre>
  </body>
  <script>
  	function download(){
  		window.location.href="<%=path %>/dezao/demo.xlsx";
  	}
  
</script>
  
  <script type="text/javascript">
	var X = XLSX;
	function fixdata(data) {
		var o = "", l = 0, w = 10240;
		for(; l<data.byteLength/w; ++l) o+=String.fromCharCode.apply(null,new Uint8Array(data.slice(l*w,l*w+w)));
		o+=String.fromCharCode.apply(null, new Uint8Array(data.slice(l*w)));
		return o;
	}
	var list;
	function to_csv(workbook) {
		var result = [];
		workbook.SheetNames.forEach(function(sheetName) {
			var csv = X.utils.sheet_to_csv(workbook.Sheets[sheetName]);
			console.log(csv);
			if(csv.length > 0){
				result.push("SHEET: " + sheetName);
				result.push("");
				//result.push(csv.replace(new RegExp("\u0000","gm"),''));
				result.push(csv.replace(/(^\s*)|(\s*$)/g, ""));
			}
		});
		list=result.join("\n");
		return result.join("\n");
	}
	
	function to_json(workbook) {
	  var result = {};
	  workbook.SheetNames.forEach(function(sheetName) {
	    var rObjArr = XLSX.utils.sheet_to_row_object_array(workbook.Sheets[sheetName]);
	    if(rObjArr.length > 0){
	      result[sheetName] = rObjArr;
	    }
	  });
	  return result;
	}
	
	function process_wb(wb) {
		//var output = to_csv(wb);
		var output = JSON.stringify(to_json(wb), 2, 2);
		if(out.innerText === undefined) out.textContent = output;
		else out.innerText = output;
		if(typeof console !== 'undefined') console.log("output", new Date());
		
		var index = layer.load(0, {shade: [0.7,'#fff']}); //0代表加载的风格，支持0-2
			$.ajax({
				type:'post',
				data:'csv='+output,
				url:'<%=path %>/system/Dezao!importData.action',
				dataType:'json',
				success:function(data){
					layer.close(index);
					if(data.result==1){
						layer.alert(data.msg);
					}else{
						layer.msg("失败");
					}
				}
			})
		
		
	}
	var xlf = document.getElementById('xlf');
	function handleFile(e) {
		var files = e.target.files;
		var f = files[0];
		{
			var reader = new FileReader();
			var name = f.name;
			reader.onload = function(e) {
				if(typeof console !== 'undefined') console.log("onload", new Date());
				var data = e.target.result;
				var arr = fixdata(data);
				var wb = X.read(btoa(arr), {type: 'base64'});
				process_wb(wb);
				
			};
			reader.readAsArrayBuffer(f);
		}
	}
	if(xlf.addEventListener) xlf.addEventListener('change', handleFile, false);
</script>
</html>
