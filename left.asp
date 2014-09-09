					<table id="__01" width="245" height="667" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td background="images/index_aa_01.jpg" width="245" height="45">
							 <div style="padding-top:15px; font-size:15px;  color:#fff; margin-left:20px;">服务热线：</div>
						    </td>
						</tr>
						<tr>
							<td>
								<img src="images/index_aa_02.jpg" width="245" height="33" alt=""></td>
						</tr>
						<tr>
							<td background="images/index_aa_03.jpg" width="245" height="165">
							<div id="left_lxwm">
							<p>联系人：</p>
							<p>手机：</p>
							<p>电话：</p>
							<p>传真：</p>
							<p>地址：</p>
							<p>邮箱：</p>
							<p>网站：</p>
							</div>
							</td>
						</tr>
						<tr>
							<td background="images/index_aa_04.jpg" width="245" height="39">
							<div style="padding-top:13px; margin-left:30px; color:#fff; font-weight:bold; font-size:13px;">新闻中心</div>
							</td>
						</tr>
						<tr>
							<td background="images/index_aa_03.jpg" width="245" height="359">
							<ul id="left_news">
									<%
									set rs = UICon.Query("select top 8 * from user_news order by id desc")
									do while not rs.eof
								
								%>
									<li>[]　<a  href="news_in.asp?categoryid=<%=rs("categoryID")%>&amp;itemid=<%=rs("id")%>" title="<%=rs("title")%>"  target="_blank" ><%
									if len(rs("title"))>14 then	
									response.write left(rs("title"),13)&"..."
									else
									response.write rs("title")
									end if
									%></a></li>	
									<li>　..........................................[<%=year(rs("PostTime"))%>-<%=month(rs("PostTime"))%>-<%=day(rs("PostTime"))%>]</li>
								<%
									rs.movenext
									loop
									rs.close
									set rs=nothing
								%>	
							</ul>
							</td>
						</tr>
						<tr>
							<td>
								<img src="images/index_aa_06.jpg" width="245" height="26" alt=""></td>
						</tr>
					</table>			
