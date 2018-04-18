<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<t:base type="jquery,easyui,tools,DatePicker"></t:base>

<link rel="stylesheet" type="text/css" href="plug-in/ztree/css/zTreeStyle.css">
<script type="text/javascript" src="plug-in/ztree/js/jquery.ztree.core-3.5.min.js"></script>
<script type="text/javascript" src="plug-in/ztree/js/jquery.ztree.excheck-3.5.min.js"></script>
<script type="text/javascript">
    var setting = {
        check: {
            enable: false,
            chkboxType: { "Y": "", "N": "" }
        },
        data: {
            simpleData: {
                enable: true
            }
        },callback: {
            onExpand: zTreeOnExpand,
            onClick:onClick
        }
    };

</script>


<div class="easyui-layout" style="width:700px;height:400px;">
    <div data-options="region:'center'">
        <t:datagrid name="orderItem2" title="订单项" actionUrl="sorderController.do?findOrderItem&orderNum=${id}"
                    fit="true" fitColumns="true" idField="id" queryMode="group"  sortOrder="desc">
            <t:dgCol title="编号" field="id" hidden="true"></t:dgCol>
            <t:dgCol title="商品标题" field="name" width="60"></t:dgCol>
            <t:dgCol title="商品描述" field="description" width="120"></t:dgCol>
            <t:dgCol title="商品价格" field="price" width="60"></t:dgCol>
            <t:dgCol title="商品主图" field="imgsrc" image="true" imageSize="100,60" width="120"></t:dgCol>
            <t:dgCol title="购买数量" field="count" width="80"></t:dgCol>
        </t:datagrid>
    </div>
</div>
<script type="text/javascript">
    document.$lutn = frameElement.api;
</script>

