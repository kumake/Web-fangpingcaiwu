<!--#include file="../Sp_inc/conn.asp"-->
<!--#include file="UserAuthority.asp"-->
<%
	'action
	Dim leftUrl:leftUrl = VerificationUrlParam("leftUrl","string","")
	''''父亲模型信息ID
	DIm MainUrl:MainUrl = VerificationUrlParam("MainUrl","string","")
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>模型框架管理</title>
</head>
<frameset cols="190,*" frameborder="NO" border="0" framespacing="0">
  <frame src="<%=leftUrl%>" id="leftUrl" scrolling="NO" noresize>
  <frame src="<%=MainUrl%>" id="MainUrl" scrolling="yes" name="mainModel">
</frameset>
<noframes><body>
</body></noframes>
</html>
