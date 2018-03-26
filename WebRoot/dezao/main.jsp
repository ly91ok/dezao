<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"></head>
<link rel="stylesheet" type="text/css" href="<%=path %>/css/common.css">
<link rel="stylesheet" type="text/css" href="<%=path %>/css/bootstrap.min.css">

<body>
<table id="tfm_table" cellpadding="0" cellspacing="0"  width="100%"  height="100%" >
    <tr>
        <td class="top" valign="top" style=" height: 107px;"><iframe src="<%=path %>/dezao/top.html" width="100%" height="81" frameborder="0" id="iframe_top" name="iframe_top" scrolling="no"></iframe>
        </td>
    </tr>
    <tr>
        <td  valign="top"  >
          <table  id="content" cellpadding="0" cellspacing="0" width="100%" height="100%" style="overflow:hidden;table-layout:fixed;">
          	<tr>
            	<td valign="top" width="250" nowrap="nowrap" id="tfm_left" style="overflow:hidden;">
            	    <iframe src="<%=path %>/dezao/left2.jsp" width="240" height="100%" frameborder="0" id="iframe_left" name="iframe_left" scrolling="no"></iframe>
                </td>
                <td class="right-content" valign="top" align="left">
                    <iframe  src="<%=path %>/dezao/index.jsp" width="100%" height="100%" frameborder="0" id="iframe_content" name="iframe_content"></iframe>
                </td>
            </tr>
          </table>
        </td>
    </tr>
</table>

</body>
</html>
