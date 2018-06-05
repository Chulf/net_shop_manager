<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/context/mytags.jsp" %>
<t:base type="jquery,easyui,tools,DatePicker"></t:base>

<div class="easyui-layout" fit="true">
    <div region="center" style="padding:0px;border:0px">
        <t:datagrid name="sproductList" title="商品/La Merce" actionUrl="sproductController.do?findProductByAdmin" idField="id" fit="true">
            <t:dgCol title="编号" field="id" hidden="true"></t:dgCol>
            <t:dgCol title="商品标题/Il titolo" field="name" width="120"></t:dgCol>
            <t:dgCol title="商品描述/Descrizione" field="description" width="120"></t:dgCol>
            <t:dgCol title="商品编号/num" field="productNum" width="120" query="true"></t:dgCol>
            <t:dgCol title="商品价格/Il prezzo" field="price" width="120"></t:dgCol>
            <t:dgCol title="中文单位/Unità cinese" field="chinaUnit" width="120"></t:dgCol>
            <t:dgCol title="意大利单位/Unità italiana" field="italyUnit" width="120"></t:dgCol>
            <t:dgCol title="商品主图/La principale figura" field="imgsrc" image="true"  imageSize="120,80" width="120"></t:dgCol>
            <t:dgCol title="类别外键/La Politica Estera" field="categoryId" width="120"></t:dgCol>
            <t:dgCol title="类别名字/La categoria" field="categoryName" width="120"></t:dgCol>
            <t:dgCol title="来源/Fonti di" field="source" width="120"></t:dgCol>
            <t:dgCol title="商品内容/IL contenuto" field="content" width="120" hidden="true"></t:dgCol>
            <t:dgCol title="操作/Operazione" field="opt" width="100"></t:dgCol>
            <t:dgDelOpt title="删除/Cancellare" url="sproductController.do?del&id={id}" urlclass="ace_button" urlfont="fa-trash-o"/>
            <t:dgToolBar title="添加新的商品/Aggiungere" icon="icon-add" url="sproductController.do?addorupdate" funname="add" width="770"
                         height="500"></t:dgToolBar>
            <t:dgToolBar title="添加仓库商品/IL Magazzino Merci" icon="icon-add" url="sproductController.do?sproductSelect" funname="openProductSelect" width="870"
                         height="500" operationCode="openProductSelect"></t:dgToolBar>
            <t:dgToolBar title="编辑/Editore" icon="icon-edit" url="sproductController.do?addorupdate" funname="update"
                         width="770" height="500"></t:dgToolBar>
            <t:dgToolBar title="查看/Vista" icon="icon-search" url="sproductController.do?addorupdate" funname="detail"
                         width="770" height="500"></t:dgToolBar>
        </t:datagrid>
    </div>
</div>

<script type="text/javascript">

    var iframe = "";
    function openProductSelect(title,addurl,thisPage,width,height){

        createwindow2(title,addurl,width,height);
    }


    function createwindow2(title, addurl,width,height) {
        width = width?width:700;
        height = height?height:400;
        if(width=="100%" || height=="100%"){
            width = window.top.document.body.offsetWidth;
            height =window.top.document.body.offsetHeight-100;
        }
        //--author：JueYue---------date：20140427---------for：弹出bug修改,设置了zindex()函数
        if(typeof(windowapi) == 'undefined'){
            $.dialog({
                content: 'url:'+addurl,
                lock : true,
                zIndex: getzIndex(),
                width:width,
                height:height,
                title:title,
                opacity : 0.3,
                cache:false,
                ok: function(){
                    iframe = this.iframe.contentWindow;
                    addProduct();
                    return false;
                },
                cancelVal: '关闭',
                cancel: true /*为true等价于function(){}*/
            });
        }else{

            /*W.*/$.dialog({//使用W，即为使用顶级页面作为openner，造成打开的次级窗口获取不到关联的主窗口
                content: 'url:'+addurl,
                lock : true,
                width:width,
                zIndex:getzIndex(),
                height:height,
                parent:windowapi,
                title:title,
                opacity : 0.3,
                cache:false,
                ok: function(){
                    iframe = this.iframe.contentWindow;
                    console.info("iframe:"+iframe);
                    addProduct();
                    return false;
                },
                cancelVal: '关闭',
                cancel: true /*为true等价于function(){}*/
            });

        }
        //--author：JueYue---------date：20140427---------for：弹出bug修改,设置了zindex()函数

    }
    function addProduct() {
        //var obj = $('#sproductList2', iframe.document);
        console.log($(iframe.document)[0].ProList);
        //var ids = Array.asArray($(iframe.document)[0].ProList);
        //把set集合转为数组
        var ids2 = Array.from($(iframe.document)[0].ProList);
        //把选择的所有商品添加到当前管理员商店
        $.ajax({
            url:"${pageContext.request.contextPath}/sproductController.do?addStoreProduct",
            type:'get',
            data:"ids="+ids2,
            success:function(data){
                //关闭dialog窗口
                iframe.document.$lutn.close();
                $('#sproductList').datagrid('reload');
            }
        })
        console.info(ids2);
    }
</script>