<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>店铺表</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
 </head>
 <body style="overflow-y: hidden" scroll="no">
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="surlController.do?save">
			<input id="id" name="id" type="hidden" value="${surlPage.id }">
			<table style="width: 600px;" cellpadding="0" cellspacing="1" class="formtable">
				<tr>
					<td align="right">
						<label class="Validform_label">
							店铺地址:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="url" name="url" datatype="*" value="${surlPage.url}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>

				<tr>
					<td align="right" width="100px"><label class="Validform_label">店铺状态:</label></td>
					<td class="value">
						<select required="required" name="status" value="">
							<option value="Y" <c:if test="${surlPage.status == 'Y'}">selected="selected"</c:if>>激活</option>
							<option value="N" <c:if test="${surlPage.status == 'N'}">selected="selected"</c:if>>关闭</option>
						</select>
						<span class="Validform_checktip"></span>
					</td>
			    </tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							分配店长:
						</label>
					</td>
					<td class="value"><t:dictSelect field="adminId" type="select" typeGroupCode="sex" hasLabel="false" dictTable="t_s_base_user" dictField="id" title="店长" dictText="username" defaultVal="${surlPage.adminId}"></t:dictSelect>
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							中文店名:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="name1" name="name1" datatype="*" value="${surlPage.name1}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							意大利店名:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="name2" name="name2" datatype="*" value="${surlPage.name2}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
			</table>
		</t:formvalid>
 </body>