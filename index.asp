<!--#include file="conn.asp"-->
<!--#include file="sp_inc/class_page.asp"-->
<!--#include file="plugIn/Setting.Config.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=config_sitename%></title>
<meta name="keywords" content="<%=config_seokeyword%>">
<meta name="description" content="<%=config_seocontent%>">
<link href="css/public.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.proLi{ width:160px; line-height:30px; border-bottom:#CCCCCC solid 1px; display:block; background:url(images/li.jpg) no-repeat 30px 50%; padding-left:50px; margin-left:32px;}
 -->
</style>
</head>
<body>
<div id="container">
<table id="__01" width="961" height="1146" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td>
			<!--#include file="head.asp" --></td>
	</tr>
	<tr>
		<td  width="961" height="667">
		<table id="__01" width="961" height="667" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td>
					<!--#include file="left.asp" -->
					</td>
					<td>
						<table id="__01" width="716" height="681" border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td>
									<img src="images/dsde_02_01.jpg" width="716" height="32" alt=""></td>
							</tr>
							<tr>
								<td width="716" height="169">
								<div id="index_gsjj">
								<p>　　南京方平财务是经南京市财政局资质认可，工商局批准登记成立专业提供公司注册、增资验资、代理记账、财税筹划、财务咨询服务的财务管理    南京方平财务是经南京市财政局资质认可，工商局批准登记成立专业提供公司注册、增资验资、代理记账、财税筹划、财务咨询服务的财务管理机构。公司秉着“用我们的服务赢得客户的满意”这一宗旨，竭诚为社会各界创业人士提供优质、高效、专业的财务管理和咨询服务。 </p>          
<p>　　在您办理公司之前，您只需提供相应的材料便可足不出户完成工商注册；在您办理公司之后，您只需安心做业务，财税方面放心交给我们来打理。 </p>
								</div>
								</td>
							</tr>
							<tr>
								<td>
								<table id="__01" width="716" height="297" border="0" cellpadding="0" cellspacing="0">
									<tr>
										<td>
											<img src="images/dsfs_01.jpg" alt="" width="389" height="37" border="0" usemap="#Map"></td>
										<td>
											<img src="images/dsfs_02.jpg" width="327" height="37" alt=""></td>
									</tr>
									<tr>
										<td width="389" height="260">
										<ul id="index_fwfw">
<!--											<li>　　<a href="">工商注册服务</a></li>
											<li>　　<a href="">工商注册服务</a></li>
											<li>　　<a href="">工商注册服务</a></li>
											<li>　　<a href="">工商注册服务</a></li>
											<li>　　<a href="">工商注册服务</a></li>
											<li>　　<a href="">工商注册服务</a></li>
											<li>　　<a href="">工商注册服务</a></li> -->
											<%
												set rs = UICon.Query("select top 7 * from user_ywfw order by indexid")
												do while not rs.eof
											
											%>
												<li>　　<a  href="ywfw_in.asp?categoryid=<%=rs("categoryID")%>&amp;itemid=<%=rs("id")%>" title="<%=rs("title")%>"  ><%=rs("title")%></a></li>	
											<%
												rs.movenext
												loop
												rs.close
												set rs=nothing
											%>
										</ul>
										</td>
										<td width="327" height="260">
										<div id="index_txfw">
										<p><strong>工商注册</strong></p>
										<p>1、代理工商注册登记</p>
										<p>2、代理公司验资、增资、审计</p>
										<p>3、代理工商年检     4、代理公司变更、注销</p>
										<p><strong>财务进账</strong></p>
										<p>1、代理记账、纳税申报</p>
										<p>2、代理申请一般纳税人</p>
										<p>3、财税筹划、咨询</p>
										</div>
										</td>
									</tr>
								</table>
								</td>
							</tr>
							<tr>
								<td>
								<table id="__01" width="716" height="183" border="0" cellpadding="0" cellspacing="0">
									<tr>
										<td>
											<img src="images/sdc_01.jpg" alt="" width="358" height="30" border="0" usemap="#Map2"></td>
										<td>
											<img src="images/sdc_02.jpg" alt="" width="358" height="30" border="0" usemap="#Map3"></td>
									</tr>
									<tr>
										<td width="358" height="153">
										<table id="__01" width="358" height="153" border="0" cellpadding="0" cellspacing="0">
											<tr>
												<td>
												<table id="__01" width="358" height="85" border="0" cellpadding="0" cellspacing="0">
													<tr>
														<td>
															<img src="images/sdc_ii_01.jpg" width="97" height="85" alt=""></td>
														<td width="261" height="85">
															<div style="padding-top:20px; margin-left:10px; font-weight:bold; font-size:13px; color:#000;">公司注册常见问题　<a  style="color:#BF5201" href="gszc.asp">...[详细内容]</a></div>
														</td>
													</tr>
												</table>
												</td>
											</tr>
											<tr>
												<td  width="358" height="68">
										<ul id="index_gszc">
								<%
									set rs = UICon.Query("select top 2 * from user_wxcs order by id desc")
									do while not rs.eof
								
								%>
									<li><em>[<%=year(rs("PostTime"))%>-<%=month(rs("PostTime"))%>-<%=day(rs("PostTime"))%>]</em>·　<a  href="gszc_in.asp?categoryid=<%=rs("categoryID")%>&amp;itemid=<%=rs("id")%>" title="<%=rs("title")%>"  target="_blank" ><%=rs("title")%></a></li>	
								<%
									rs.movenext
									loop
									rs.close
									set rs=nothing
								%>
										</ul>
												
												</td>
											</tr>
										</table>
										</td>
										<td width="358" height="153">
										<table id="__01" width="358" height="153" border="0" cellpadding="0" cellspacing="0">
											<tr>
												<td>
												<table id="__01" width="358" height="87" border="0" cellpadding="0" cellspacing="0">
													<tr>
														<td>
															<img src="images/sdc_gg_01.jpg" width="91" height="87" alt=""></td>
														<td width="267" height="87">
															<div style="padding-top:20px; margin-left:10px; font-weight:bold; font-size:13px; color:#000;">代理记账业务常见流程　<a  style="color:#BF5201" href="dljz.asp">...[详细内容]</a></div>
														</td>
													</tr>
												</table>
												</td>
											</tr>
											<tr>
												<td width="358" height="66">
										<ul id="index_dljz">
								<%
									set rs = UICon.Query("select top 2 * from user_dljz order by id desc")
									do while not rs.eof
								
								%>
									<li><em>[<%=year(rs("PostTime"))%>-<%=month(rs("PostTime"))%>-<%=day(rs("PostTime"))%>]</em>·　<a  href="dljz_in.asp?categoryid=<%=rs("categoryID")%>&amp;itemid=<%=rs("id")%>" title="<%=rs("title")%>"  target="_blank" ><%=rs("title")%></a></li>	
								<%
									rs.movenext
									loop
									rs.close
									set rs=nothing
								%>
										</ul>
												</td>
											</tr>
										</table>
										</td>
									</tr>
								</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>
			<!--#include file="footer.asp" --></td>
	</tr>
</table>
</div>

<map name="Map" id="Map"><area shape="rect" coords="272,9,356,28" href="ywfw.asp" />
</map>
<map name="Map2" id="Map2"><area shape="rect" coords="283,6,355,25" href="gszc.asp" />
</map>
<map name="Map3" id="Map3"><area shape="rect" coords="281,5,354,25" href="#" /></map></body>
</html>
