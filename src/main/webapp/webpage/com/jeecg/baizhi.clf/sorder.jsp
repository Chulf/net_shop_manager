<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>订单表</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
 </head>
 <body style="overflow-y: hidden" scroll="no">
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="sorderController.do?save">
			<input id="id" name="id" type="hidden" value="${sorderPage.id }">
			<table style="width: 600px;" cellpadding="0" cellspacing="1" class="formtable">
				<tr>
					<td align="right">
						<label class="Validform_label">
							订单编号:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="orderNum" name="orderNum" ignore="ignore"  value="${sorderPage.orderNum}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							订单状态:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="orderStatus" name="orderStatus" ignore="ignore"  value="${sorderPage.orderStatus}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							订单总价:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="orderSalary" name="orderSalary" ignore="ignore"  value="${sorderPage.orderSalary}" datatype="d" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							用户名字:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="username" name="userId" ignore="ignore"  value="${sorderPage.userMsg}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
			</table>
		</t:formvalid>
 </body>