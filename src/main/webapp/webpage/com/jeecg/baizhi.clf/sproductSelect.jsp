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
    function onClick(event, treeId, treeNode){
        var departname = treeNode.name;
        if(departname == "所有类别"){
            location.href="${pageContext.request.contextPath}/sproductController.do?sproductSelect";
            return;
        }
        var queryParams = $('#sproductList2').datagrid('options').queryParams;
        queryParams.categoryId = treeNode.id;
        $('#sproductList2').datagrid('options').queryParams=queryParams;
        $("#sproductList2").datagrid("reload");

    }
    //加载展开方法
    function zTreeOnExpand(event, treeId, treeNode){
        var treeNodeId = treeNode.id;
        $.post(
                'scategoryController.do?getCategoryInfo',
                {parentid:treeNodeId},
                function(data){
                    var d = $.parseJSON(data);
                    if (d.success) {
                        var dbDate = eval(d.msg);
                        var tree = $.fn.zTree.getZTreeObj("departSelect");

                        if (!treeNode.zAsync){
                            tree.addNodes(treeNode, dbDate);
                            treeNode.zAsync = true;
                        } else{
                            tree.reAsyncChildNodes(treeNode, "refresh");
                        }
                        //tree.addNodes(treeNode, dbDate);
                    }
                }
        );
    }

    //首次进入加载level为1的
    $(function(){
        $.post(
                'scategoryController.do?getCategoryInfo',
                function(data){
                    var d = $.parseJSON(data);
                    if (d.success) {
                        var dbDate = eval(d.msg);
                        var obj = {name: "所有类别", icon: "plug-in/ztree/css/img/diy/gysroot.png", id: "4028978162275573016227f2d3bdxx1f"}
                        console.info(dbDate);
                        dbDate.push(obj);
                        console.info(dbDate);
                        $.fn.zTree.init($("#departSelect"), setting, dbDate);
                    }
                }
        );
    });
</script>


<div class="easyui-layout" style="width:900px;height:500px;">
    <div data-options="region:'west',split:true" title="<t:mutiLang langKey='common.department'/>" style="width:150px;">
        <ul id="departSelect" class="ztree" ></ul>
    </div>
    <div data-options="region:'center'">
        <t:datagrid  checkbox="true" name="sproductList2" title="商品列表" actionUrl="sproductController.do?findStoreProduct&flag=Y"
                    fit="true" fitColumns="true" idField="id" queryMode="group"  sortOrder="desc">
            <t:dgCol title="编号" field="id" hidden="true"></t:dgCol>
            <t:dgCol title="商品标题" field="name" width="120"></t:dgCol>
            <t:dgCol title="商品编号" field="productNum" width="120"></t:dgCol>
            <t:dgCol title="商品描述" field="description" width="120"></t:dgCol>
            <t:dgCol title="商品价格" field="price" width="120"></t:dgCol>
            <t:dgCol title="商品主图" field="imgsrc" image="true" imageSize="100,60" width="120"></t:dgCol>
            <t:dgCol title="类别外键" field="categoryId" width="120"></t:dgCol>
            <t:dgCol title="类别名字" field="categoryName" width="120"></t:dgCol>
            <t:dgCol title="商品内容" field="content" width="120" hidden="true"></t:dgCol>
        </t:datagrid>
    </div>
</div>

<script type="text/javascript">
    document.$lutn = frameElement.api;
    var proList = new Set();

    $('#sproductList2').datagrid({

        onCheck:function (index,row) {
            proList.add(row.id);
            document.ProList = proList;
        },
        onUncheck:function(index,row) {
            proList.delete(row.id);
            document.ProList = proList;
        },
        onCheckAll:function(rows){
            //proList = new Set();
            $.each(rows,function(i,e){
                proList.add(e.id);
            })
            document.ProList = proList;
        },
        onUncheckAll:function(){
            proList = new Set();
            document.ProList = proList;
        }
    })
</script>
