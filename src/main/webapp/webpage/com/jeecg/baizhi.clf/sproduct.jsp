<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>商品表</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
 </head>
 <body >
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="sproductController.do?save">
			<input id="id" name="id" type="hidden" value="${sproductPage.id }">
			<table style="width:600px;" cellpadding="0" cellspacing="1" class="formtable">
				<tr>
					<td align="right">
						<label class="Validform_label">

							商品标题:

						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="name" name="name"
							   <c:if test="${sproductPage.flag =='Y'}"> readonly="readonly"</c:if>
							   datatype="*2-10" value='${sproductPage.name}' />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							商品描述:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="description"
								<c:if test="${sproductPage.flag =='Y'}"> readonly="readonly"</c:if>
							   name="description" datatype="*2-200"  required="required" value="${sproductPage.description}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							商品价格:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="price" name="price"  datatype="d" value="${sproductPage.price}" />
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							商品主图:
						</label>
					</td>
					<td class="value">
						<t:webUploader type="image" dataType="*"
									   displayTxt="false" bizType="photosucai" name="imgsrc" auto="true"  fileNumLimit="1" pathValues="${sproductPage.imgsrc}"></t:webUploader>
						<span class="Validform_checktip Validform_right" style="display: none;">图片已上传</span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							类别外键:
						</label>
					</td>
					<td class="value"><t:dictSelect field="categoryId" datatype="*" type="select" typeGroupCode="sex" hasLabel="false" dictTable="s_category" dictField="id" title="店长" dictText="name" defaultVal="${sproductPage.categoryId}"></t:dictSelect>
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							商品内容:
						</label>
					</td>
					<td class="value">
						<script type="text/javascript"  charset="utf-8" src="plug-in/ueditor/ueditor.config.js"></script>
						<script type="text/javascript"  charset="utf-8" src="plug-in/ueditor/ueditor.all.min.js"></script>
						<textarea name="content" datatype="*" id="content"
								<c:if test="${sproductPage.flag =='Y'}"> readonly="readonly"</c:if>
								  style="width: 450px;height:300px" value=${sproductPage.content}></textarea>
						<script type="text/javascript">
							var editor = UE.getEditor('content');
						</script>
						<span class="Validform_checktip"></span>
						<label class="Validform_label" style="display: none;">商品内容</label>
				</tr>
			</table>
		</t:formvalid>
 </body>