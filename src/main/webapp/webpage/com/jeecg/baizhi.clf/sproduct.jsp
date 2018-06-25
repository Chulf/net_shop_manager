<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/context/mytags.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>商品表</title>
    <t:base type="jquery,easyui,tools,DatePicker"></t:base>
</head>
<body>
<t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="sproductController.do?save"
             beforeSubmit="formatterImg">
    <input id="id" name="id" type="hidden" value="${sproductPage.id }">
    <table style="width:600px;" cellpadding="0" cellspacing="1" class="formtable">
        <c:choose>
            <c:when test="${sproductPage.flag =='Y' && sessionScope.LOCAL_CLINET_USER.userName != 'SuperAdmin'}">
                <tr>
                    <td align="right">
                        <label class="Validform_label">
                            商品价格/Il prezzo:
                        </label>
                    </td>
                    <td class="value">
                        <input class="inputxt" id="price1" errormsg="请输入最多两位小数的价格!" name="price" datatype="/^\d+(?:\.\d{1,2})?$/" value="${sproductPage.price}" />
                        <span class="Validform_checktip"></span>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <label class="Validform_label">
                            商品描述/Descrizione:
                        </label>
                    </td>
                    <td class="value">
                        <input class="inputxt" id="description1" name="description"  datatype="*2-200" value="${sproductPage.description}" />
                        <span class="Validform_checktip"></span>
                    </td>
                </tr>
                <h1><font
                        color="red">${sessionScope.LOCAL_CLINET_USER.userName}您只能更改仓库商品的价格和描述为您的自定义，仓库商品的其它信息不能更改！/You can only change the price and description of a warehouse item for your customizations. Other information for warehouse items cannot be changed!</font>
                </h1>
            </c:when>

            <c:otherwise>
                <tr>
                    <td align="right">
                        <label class="Validform_label">

                            商品标题/Il titolo:

                        </label>
                    </td>
                    <td class="value">
                        <input class="inputxt" id="name" name="name"
                               datatype="*2-50" value='${sproductPage.name}'/>
                        <span class="Validform_checktip"></span>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <label class="Validform_label">

                            商品编号/num:

                        </label>
                    </td>
                    <td class="value">
                        <input class="inputxt" id="productNum" name="productNum"
                               datatype="*2-10" value='${sproductPage.productNum}'/>
                        <span class="Validform_checktip"></span>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <label class="Validform_label">
                            商品描述/Descrizione:
                        </label>
                    </td>
                    <td class="value">
                        <input class="inputxt" id="description"
                               name="description" datatype="*2-200" required="required"
                               value="${sproductPage.description}"/>
                        <span class="Validform_checktip"></span>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <label class="Validform_label">
                            商品价格/Il prezzo:
                        </label>
                    </td>
                    <td class="value">
                        <input class="inputxt" id="price" errormsg="请输入最多两位小数的价格!" name="price" datatype="/^\d+(?:\.\d{1,2})?$/" value="${sproductPage.price}" />
                        <span class="Validform_checktip"></span>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <label class="Validform_label">
                            中文单位/Unità cinese:
                        </label>
                    </td>
                    <td class="value">
                        <input class="inputxt" id="chinaUnit"
                               name="chinaUnit" datatype="*2-10" required="required"
                               value="${sproductPage.chinaUnit}"/>
                        <span class="Validform_checktip"></span>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <label class="Validform_label">
                            意大利单位/Unità italiana:
                        </label>
                    </td>
                    <td class="value">
                        <input class="inputxt" id="italyUnit"
                               name="italyUnit" datatype="*2-10" required="required"
                               value="${sproductPage.italyUnit}"/>
                        <span class="Validform_checktip"></span>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <label class="Validform_label">
                            商品主图/La principale figura:
                        </label>
                    </td>
                    <td class="value">
                        <t:webUploader type="image" dataType="*"
                                       displayTxt="false" bizType="photosucai" name="imgsrc" auto="true"
                                       fileNumLimit="1" pathValues="${sproductPage.imgsrc}"></t:webUploader>
                        <span class="Validform_checktip Validform_right" style="display: none;">图片已上传</span>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <label class="Validform_label">
                            类别/La categoria:
                        </label>
                    </td>
                    <td class="value"><t:dictSelect field="categoryId" datatype="*" type="select" typeGroupCode="sex"
                                                    hasLabel="false" dictTable="s_category" dictField="s.id" title="店长"
                                                    dictText="s.name"
                                                    dictCondition="s inner join s_admin_category sa on s.id = sa.category_id where admin_id='${sessionScope.LOCAL_CLINET_USER.id}'"
                                                    defaultVal="${sproductPage.categoryId}"></t:dictSelect>
                        <span class="Validform_checktip"></span>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <label class="Validform_label">
                            商品内容/IL contenuto:
                        </label>
                    </td>
                    <td class="value">
                        <script type="text/javascript" charset="utf-8" src="plug-in/ueditor/ueditor.config.js"></script>
                        <script type="text/javascript" charset="utf-8"
                                src="plug-in/ueditor/ueditor.all.min.js"></script>
                        <textarea name="content" datatype="*" id="content"
                                  style="width: 450px;height:300px">${sproductPage.content}</textarea>
                        <script type="text/javascript">
                            var editor = UE.getEditor('content');
                        </script>
                        <span class="Validform_checktip"></span>
                        <label class="Validform_label" style="display: none;">商品内容</label>
                </tr>
            </c:otherwise>
        </c:choose>
    </table>
</t:formvalid>
<script type="text/javascript">
    function formatterImg() {
        var imgsrc = $("input[name='imgsrc']").val();
        if(!imgsrc){
            return;
        }
        var imgsrc2 = imgsrc.split(",")[0];
        console.info(imgsrc2);
        if ($("input[name='imgsrc']")[1]){
            $("input[name='imgsrc']").val(imgsrc2);
            $("input[name='imgsrc']")[1].remove();
        }
    }
</script>
</body>