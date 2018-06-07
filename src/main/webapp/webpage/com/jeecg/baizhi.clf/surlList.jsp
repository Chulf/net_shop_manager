<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/context/mytags.jsp" %>
<t:base type="jquery,easyui,tools,DatePicker"></t:base>
<div class="easyui-layout" fit="true">
    <div region="center" style="padding:0px;border:0px">
        <t:datagrid name="surlList" title="店铺表" actionUrl="surlController.do?datagrid" idField="id" fit="true">
            <t:dgCol title="编号" field="id" hidden="true"></t:dgCol>
            <t:dgCol title="店铺地址" field="url" width="120"></t:dgCol>
            <t:dgCol title="店铺状态" field="status" width="120"></t:dgCol>
            <t:dgCol title="店长外键" field="adminId" width="120"></t:dgCol>
            <t:dgCol title="店长名字" field="adminName" width="120"></t:dgCol>
            <t:dgCol title="中文店名" field="name1" width="120"></t:dgCol>
            <t:dgCol title="意大利店名" field="name2" width="120"></t:dgCol>
            <t:dgCol title="店长电话" field="tel" width="120"></t:dgCol>
            <t:dgCol title="店长微信" field="wx" width="120"></t:dgCol>
            <t:dgCol title="是否推荐" field="recommend" formatterjs="statusFmt" width="60"></t:dgCol>
            <t:dgCol title="操作" field="opt" width="100"></t:dgCol>
            <t:dgDelOpt title="删除" url="surlController.do?del&id={id}" urlclass="ace_button" urlfont="fa-trash-o"/>
            <t:dgToolBar title="录入" icon="icon-add" url="surlController.do?addorupdate" funname="add"></t:dgToolBar>
            <t:dgToolBar title="编辑" icon="icon-edit" url="surlController.do?addorupdate" funname="update"></t:dgToolBar>
            <t:dgToolBar title="查看" icon="icon-search" url="surlController.do?addorupdate"
                         funname="detail"></t:dgToolBar>
        </t:datagrid>
    </div>
    <script>
        function statusFmt(value, row, index){
            if (value == 'Y')
                return '<span style="color:red;font-size: 20px;">★</span>';
            return '<span style="color:black;font-size: 20px;">☆</span>';
        }
    </script>
</div>