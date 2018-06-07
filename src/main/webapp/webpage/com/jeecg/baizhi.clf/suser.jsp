<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>用户表</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
 </head>
 <body style="overflow-y: hidden" scroll="no">
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="suserController.do?save">
			<input id="id" name="id" type="hidden" value="${suserPage.id }">
			<table style="width: 600px;" cellpadding="0" cellspacing="1" class="formtable">
				<tr>
					<td align="right">
						<label class="Validform_label">
							用户名:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="username" name="username"   value="${suserPage.username}" datatype="*" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							用户密码:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="password" name="password" datatype="*"  value="${suserPage.password}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							电话号:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="phone" name="phone" datatype="*"  value="${suserPage.phone}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							邮箱地址:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="email" name="email" datatype="*"  value="${suserPage.email}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							店铺选择:
						</label>
					</td>
					<td class="value">
						<t:dictSelect field="shopId" datatype="*" dictText="name1" dictField="id" dictTable="s_url" defaultVal="${suserPage.shopId}"></t:dictSelect>
						<span class="Validform_checktip"></span>
					</td>
				</tr>
			</table>
		</t:formvalid>
 </body>