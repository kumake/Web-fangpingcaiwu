<!--#include file="../Sp_inc/conn.asp"-->
<!--#include file="../Sp_inc/class_Page.asp"-->
<!--#include file="UserAuthority.asp"-->
<!--#include file="../plugIn/Setting.Config.asp"-->
<%
	Dim action:action = VerificationUrlParam("action","string","")
	Dim ItemID:ItemID = VerificationUrlParam("ItemID","int","")
	if action<>"" and action="del" then
		''删除信息
		Con.Execute("delete * from Sp_OrderForm where ID="&ItemID&"")
		ALert "删除成功","pulg.order.list.asp"
	elseif action="batchdel" then
		Dim batchdelItemID:batchdelItemID = F.ReplaceFormText("ItemID")
		Con.Execute("delete * from Sp_OrderForm where ID in ("&batchdelItemID&")")
		''''''需求订单子项
		if config_IsShowOrderItem = 1 then
			Con.Execute("delete * from Sp_OrderItem where orderid in ("&batchdelItemID&")")
		end if
		''''''
		Alert "批量删除成功","pulg.order.list.asp"
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
		//////批量操作信息
		function SelectALLCheck(obj)
		{
			for (var i=0;i<document.forms[0].elements.length;i++) 
			{ 
				var e = document.forms[0].elements[i]; 
				if (e.name != obj.name && e.disabled==false && e.type=="checkbox") 
				{
					e.checked = obj.checked;
				}				
			} 			
		}
		/////
		function checkedItem()
		{
			var Item = 0;
			for (var i=0;i<document.forms[0].elements.length;i++) 
			{ 
				var e = document.forms[0].elements[i]; 
				if (e.name == "ItemID" && e.disabled==false && e.type=="checkbox") 
				{
					if(e.checked)
					{
						Item = Item + 1
					}
				}				
			} 
			return Item;
		}
		//////
		function batchAction()
		{
			if(checkedItem()==0)
			{
				alert("Sp_CMS系统提示:\r\n\n请选择要批量操作的信息!");
				return false;
			}
			return true;
		}
	</script>
</HEAD>
<BODY>
<form action="?action=batchdel" method="post" onSubmit="javascript:return batchAction();">
<DIV id=wrap>
	<UL id=tags>
	  <LI class=selectTag style="LEFT: 0px; TOP: 0px"><A onfocus="this.blur()" onclick="selectTag('tagContent0',this)" href="javascript:void(0)">产品订单管理</A></LI>
	</UL>
	<DIV id=tagContent>
	<DIV class="tagContent selectTag content" id="tagContent0">
		<!--第1个标签//-->
		<DIV>
			<TABLE cellSpacing="1" width="100%">
			  <TR class="content-td2">
				<TH width="5%" align="left"><input type="checkbox" onClick="javascript:SelectALLCheck(this);" name="checkbox" value="checkbox"></TH>
			    <TH width="10%" align="left">订单编号</TH>
				<TH width="10%" align="left">用户名称</TH>
			    <TH width="15%" align="left">联系方式</TH>
			    <TH width="22%" align="left">预定时间</TH>
			    <TH width="13%" align="left">货款状态</TH>
				<TH width="15%" align="left">订单状态</TH>
			    <TH width="10%" align="left"></TH>
			  </TR>
			  <%
				Dim total_record   	'总记录数
				Dim current_page	'当前页面
				Dim PCount			'循环页显示数目
				Dim pagesize		'每页显示记录数
				Dim showpageNum		'是否显示数字循环页
				Dim strwhere:strwhere = "1=1"
				if total = 0 then 
					Dim Tarray:Tarray = Con.QueryData("select count(*) as total from Sp_OrderForm where "&strwhere&"")
					total_record = Tarray(0,0)
				else
					total_record = total
				end if
				current_page = VerificationUrlParam("page","int","1")
				PCount = 6
				pagesize = 11
				showpageNum = true
				
				'选择字段，表，条件，关键字，是否升序，开始行（1是第一行），最大行数
				Dim sql:sql = Con.QueryPageByNum("*","Sp_OrderForm", ""&strwhere&"", "ID", false,current_page,pagesize)
				'response.Write sql
				'response.End()
				set rs = Con.QUery(sql)
				if rs.recordcount<>0 then
				do while not rs.eof
			  %>
			  <TR class="content-td1">
				<TD><input type="checkbox" name="ItemID" value="<%=rs("id")%>"></TD>
				<td><%=rs("id")%></td>
				<TD><%=rs("username")%></TD>
				<TD><%if rs("tel")<>"" then:response.Write rs("tel"):else:response.Write rs("email"):end if%></TD>
				<TD><%=year(rs("addtime"))%>-<%=month(rs("addtime"))%>-<%=day(rs("addtime"))%></TD>
				<TD>
				<%
				if rs("moneystatus")=1 then
				response.Write "款到"
				elseif rs("moneystatus")=0 then
				response.Write "未收款"
				end if
				%>
				</TD>
				<TD align="center">
				<%
				if rs("status")=1 then
				response.Write "款到发货"
				elseif rs("status")=2 then
				response.Write "确认收货"
				elseif rs("status")=0 then
				response.Write "新单处理中"
				elseif rs("status")=-1 then
				response.Write "无效订单"
				elseif rs("status")=-2 then
				response.Write "缺货订单"
				end if
				%>
				</TD>
				<TD><a href="plug.order.view.asp?ItemID=<%=rs("id")%>">详细</a>&nbsp;<a href="javascript:if(confirm('Sp_CMS系统提示:\r\n\n确认删除?删除后不可恢复!'))location.href='?action=del&ItemID=<%=rs("ID")%>';">删除</a></TD>
			  </TR>
			  <%
			   rs.movenext
			   loop
			   end if
			  %>
			</TABLE>
		</DIV>
		<div class="divpadding">
			<input name="btnrestore" value="批量删除" class="button" type="submit">
		</div>
		<div class="divpadding">
			<%PageIndexUrl total_record,current_page,PCount,pagesize,true,true,flase%>
		</div>
	</DIV>
	</DIV>
</DIV>
</form>
</BODY>
</HTML>
