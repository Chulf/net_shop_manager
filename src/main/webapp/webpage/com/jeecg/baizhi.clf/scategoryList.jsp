<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/context/mytags.jsp" %>
<t:base type="jquery,easyui,tools,DatePicker"></t:base>
<div class="easyui-layout" fit="true">
    <div region="center" style="padding:0px;border:0px">
        <t:datagrid name="scategoryList" title="类别表" actionUrl="scategoryController.do?findCategoryByAdminId"
                    idField="id" fit="true">
            <t:dgCol title="编号" field="id" hidden="true"></t:dgCol>
            <t:dgCol title="类别名字" field="name" width="120"></t:dgCol>
            <t:dgCol title="操作" field="opt" width="100"></t:dgCol>
            <t:dgDelOpt title="删除" url="scategoryController.do?del&id={id}" urlclass="ace_button" urlfont="fa-trash-o"/>
            <t:dgToolBar title="录入" icon="icon-add" url="scategoryController.do?addorupdate"
                         funname="add"></t:dgToolBar>
            <t:dgToolBar title="编辑" icon="icon-edit" url="scategoryController.do?addorupdate"
                         funname="update" operationCode="updateCategory"></t:dgToolBar>
            <t:dgToolBar title="查看" icon="icon-search" url="scategoryController.do?addorupdate"
                         funname="detail"></t:dgToolBar>
        </t:datagrid>
    </div>
</div>