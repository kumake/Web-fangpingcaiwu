<!--#include file="../Sp_inc/conn.asp"-->
<!--#include file="../Sp_inc/class_Page.asp"-->
<!--#include file="UserAuthority.asp"-->
<%
	response.Expires=0
	Dim action:action = VerificationUrlParam("action","string","")
	Dim FormID:FormID = VerificationUrlParam("FormID","int","0")
	if action<>"" and action="del" then
		''取模型对应的详细信息
		Dim FormArray:FormArray = Con.QueryRow("select ID,FormName,FormTable from Sp_Form where ID="&FormID&"",0)
		Dim FormTable:FormTable = FormArray(2)
		'response.Write ModelTable
		'response.End()
		''删除信息
		Con.Execute("delete * from Sp_Form where ID="&FormID&"")
		Con.Execute("delete * from Sp_FormField where FormID="&FormID&"")
		''删除物理表结构		
		Con.Execute("drop table "&FormTable&"")
		ALert "删除自定义表单成功","setting.SelfForm.List.asp"
	end if	
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
	<TITLE>后台首页</TITLE>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<LINK href="images/style.css" type=text/css rel=stylesheet>
	<META content="MSHTML 6.00.3790.4237" name=GENERATOR>
	<script language="javascript" type="text/javascript" src="Scripts/common_management.js"></script>
	<script language="javascript" type="text/javascript">
		function showopen(url)
		{
			window.showModalDialog(url,"","dialogTop:250px,dialogLeft:500px;dialogWidth:500px,DialogHeight:250px,status:no'");
		}
	</script>
</HEAD>
<BODY>
<DIV id=wrap>
	<UL id=tags>
	  <LI class=selectTag style="LEFT: 0px; TOP: 0px"><A onfocus="this.blur()" onclick="selectTag('tagContent0',this)" href="javascript:void(0)">自定义表单</A></LI>
	</UL>
	<DIV id=tagContent>
	<DIV class="tagContent selectTag content" id="tagContent0">
		<!--第1个标签//-->
		<DIV>
			<TABLE cellSpacing="1" width="100%">
			  <TR class="content-td2">
				<TH width="5%" align="left"><input type="checkbox" name="checkbox" value="checkbox"></TH>
			    <TH width="20%" align="left">表单名称</TH>
			    <TH width="10%" align="left">表单表名称</TH>
			    <TH width="40%" align="left">表单描述</TH>
			    <TH width="25%" align="left"></TH>
			  </TR>
			  <%
				Dim total_record   	'总记录数
				Dim current_page	'当前页面
				Dim PCount			'循环页显示数目
				Dim pagesize		'每页显示记录数
				Dim showpageNum		'是否显示数字循环页
				if total = 0 then 
					Dim Tarray:Tarray = Con.QueryData("select count(*) as total from Sp_Form")
					total_record = Tarray(0,0)
				else
					total_record = total
				end if
				current_page = VerificationUrlParam("page","int","1")
				PCount = 6
				pagesize = 11
				showpageNum = true
				
				'选择字段，表，条件，关键字，是否升序，开始行（1是第一行），最大行数
				Dim sql:sql = Con.QueryPageByNum("*","Sp_Form", "", "ID", false,current_page,pagesize)
				'response.Write sql
				'response.End()
				set rs = Con.QUery(sql)
				if rs.recordcount<>0 then
				do while not rs.eof
			  %>
			  <TR class="content-td1">
				<TD>&nbsp;</TD>
				<TD><%=rs("formname")%></TD>
				<TD><%=rs("FormTable")%></TD>
				<TD><%=rs("memo")%></TD>
				<TD><a href="javascript:showopen('setting.SelfForm.show.asp?action=html&FormID=<%=rs("ID")%>&rnd=<%=Int((99999 - 11111 + 1) * Rnd + 11111)%>');">Html调用</a>&nbsp;<a href="javascript:showopen('setting.SelfForm.show.asp?action=javascript&FormID=<%=rs("ID")%>&rnd=<%=Rnd(10000)%>');">Js调用</a>&nbsp;<a href="setting.selfForm.Field.List.asp?FormID=<%=rs("ID")%>">字段</a>&nbsp;<a href="setting.selfForm.edit.asp?FormID=<%=rs("ID")%>">修改</a>&nbsp;<a href="javascript:if(confirm('Sp_CMS系统提示:\r\n\n确认删除?删除后不可恢复!'))location.href='?action=del&FormID=<%=rs("ID")%>';">删除</a></TD>
			  </TR>
			  <%
			   rs.movenext
			   loop
			   end if
			  %>
			</TABLE>
		</DIV>
		<div class="divpadding">
			<%PageIndexUrl total_record,current_page,PCount,pagesize,true,true,flase%>
		</div>
	</DIV>
	</DIV>
</DIV>
</BODY>
</HTML>
