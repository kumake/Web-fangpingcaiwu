<!--#include file="../Sp_inc/conn.asp"-->
<!--#include file="../Sp_inc/class_Page.asp"-->
<!--#include file="UserAuthority.asp"-->
<%
	Dim action:action = VerificationUrlParam("action","string","")
	Dim ItemID:ItemID = VerificationUrlParam("ItemID","int","0")
	if action<>"" and action="save" then 
  		dim UserGroup:UserGroup = F.ReplaceFormText("txt_UserGroup")
  		dim discount:discount = F.ReplaceFormText("txt_discount")
  		dim OverScore:OverScore = F.ReplaceFormText("txt_OverScore")
  		dim Overdiscount:Overdiscount = F.ReplaceFormText("txt_Overdiscount")
		dim upgradeNeedScore:upgradeNeedScore = F.ReplaceFormText("txt_upgradeNeedScore")
		
		Con.execute("update Sp_UserGroup set UserGroup='"&UserGroup&"',discount="&discount&",OverScore="&OverScore&",Overdiscount="&Overdiscount&",upgradeNeedScore="&upgradeNeedScore&" where ID="&ItemID&"")
		Alert "修改用户组成功","pulg.User.Group.asp"
	end if
	if ItemID = 0 then
		Alert "参数传递失败",""
	else
		set rs = Con.Query("select * from Sp_UserGroup where ID="&ItemID&"")
		if rs.recordcount=0 then
			Alert "找不到记录",""
		else
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
	<TITLE>后台首页</TITLE>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<LINK href="images/style.css" type=text/css rel=stylesheet>
	<META content="MSHTML 6.00.3790.4237" name=GENERATOR>
	<script src="Scripts/HtmlEditor.js" type="text/javascript"></script>
	<script language="javascript" type="text/javascript">
		function checkform()
		{
			if(document.getElementById("txt_UserGroup").value=="")
			{
				alert("Sp_CMS提示\r\n\n用户组名称必须填写!");
				return false;			
			}
			if(document.getElementById("txt_discount").value=="")
			{
				alert("Sp_CMS提示\r\n\n享受折扣必须填写!");
				return false;			
			}
			if(document.getElementById("txt_OverScore").value=="")
			{
				alert("Sp_CMS提示\r\n\n积分达到必须填写!");
				return false;			
			}
			if(document.getElementById("txt_Overdiscount").value=="")
			{
				alert("Sp_CMS提示\r\n\n当积分达到享受折扣必须填写!");
				return false;			
			}
			return true;
		}
	</script>
</HEAD>
<BODY>
<form action="?action=save&ItemID=<%=ItemID%>" method="post" onSubmit="javascript:return checkform();">
<DIV id=wrap>
	<UL id=tags>
	  <LI class=selectTag style="LEFT: 0px; TOP: 0px"><A onfocus="this.blur()" onclick="selectTag('tagContent0',this)" href="javascript:void(0)">修改加用户组</A></LI>
	</UL>
	<DIV id=tagContent>
	<DIV class="tagContent selectTag content" id=tagContent1>
		<!--第1个标签//-->
		<DIV>
			<TABLE cellSpacing="1" width="100%">
			  <TR class="content-td1">
				<TD width="15%">用户组名称：</TD>
				<TD colspan="3"><input name="txt_UserGroup" class="input" type="text" value="<%=rs("UserGroup")%>"><span class="huitext">&nbsp;必填</span></TD>
			  </TR>
			  <TR class="content-td1">
				<TD width="15%">享受折扣：</TD>
				<TD colspan="3"><input name="txt_discount" class="input" type="text" value="<%=rs("discount")%>"><span class="huitext">&nbsp;必填</span></TD>
			  </TR>
			  <TR class="content-td1">
				<TD width="15%">当积分达到：</TD>
				<TD width="17%"><input name="txt_OverScore" class="input" type="text" value="<%=rs("OverScore")%>"><span class="huitext">&nbsp;必填</span></TD>
			    <TD width="9%">享受折扣：</TD>
			    <TD width="59%"><input name="txt_Overdiscount" class="input" type="text" value="<%=rs("Overdiscount")%>">
		        <span class="huitext">&nbsp;必填</span></TD>
			  </TR>
			  <TR class="content-td1">
				<TD width="15%">升级需要积分：</TD>
				<TD colspan="3"><input name="txt_upgradeNeedScore" class="input" type="text" value="<%=rs("upgradeNeedScore")%>"><span class="huitext">&nbsp;必填</span></TD>
			  </TR>
			</TABLE>
		</DIV>
		<div class="divpadding">
		  <input name="btnsearch" value="增加用户组" class="button" type="submit">
		</div>
	</DIV>
	</DIV>
</DIV>
</form>
</BODY>
</HTML>
<%
	end if
	end if
%>
