-- MySQL dump 10.13  Distrib 5.7.21, for Linux (x86_64)
--
-- Host: localhost    Database: net_shop
-- ------------------------------------------------------
-- Server version	5.7.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cgform_button`
--

DROP TABLE IF EXISTS `cgform_button`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cgform_button` (
  `ID` varchar(32) NOT NULL COMMENT '主键ID',
  `BUTTON_CODE` varchar(50) DEFAULT NULL COMMENT '按钮编码',
  `button_icon` varchar(20) DEFAULT NULL COMMENT '按钮图标',
  `BUTTON_NAME` varchar(50) DEFAULT NULL COMMENT '按钮名称',
  `BUTTON_STATUS` varchar(2) DEFAULT NULL COMMENT '按钮状态',
  `BUTTON_STYLE` varchar(20) DEFAULT NULL COMMENT '按钮样式',
  `EXP` varchar(255) DEFAULT NULL COMMENT '表达式',
  `FORM_ID` varchar(32) DEFAULT NULL COMMENT '表单ID',
  `OPT_TYPE` varchar(20) DEFAULT NULL COMMENT '按钮类型',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`ID`),
  KEY `index_formid` (`FORM_ID`) USING BTREE,
  KEY `index_button_code` (`BUTTON_CODE`) USING BTREE,
  KEY `index_button_status` (`BUTTON_STATUS`) USING BTREE,
  KEY `index_button_order` (`order_num`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cgform_button_sql`
--

DROP TABLE IF EXISTS `cgform_button_sql`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cgform_button_sql` (
  `ID` varchar(32) NOT NULL COMMENT '主键ID',
  `BUTTON_CODE` varchar(50) DEFAULT NULL COMMENT '按钮编码',
  `CGB_SQL` varchar(1000) DEFAULT NULL COMMENT 'SQL内容',
  `CGB_SQL_NAME` varchar(50) DEFAULT NULL COMMENT 'Sql名称',
  `CONTENT` varchar(1000) DEFAULT NULL COMMENT '备注',
  `FORM_ID` varchar(32) DEFAULT NULL COMMENT '表单ID',
  PRIMARY KEY (`ID`),
  KEY `index_formid` (`FORM_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cgform_enhance_java`
--

DROP TABLE IF EXISTS `cgform_enhance_java`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cgform_enhance_java` (
  `id` varchar(36) NOT NULL,
  `button_code` varchar(32) DEFAULT NULL COMMENT '按钮编码',
  `cg_java_type` varchar(32) NOT NULL COMMENT '类型',
  `cg_java_value` varchar(200) NOT NULL COMMENT '数值',
  `form_id` varchar(32) NOT NULL COMMENT '表单ID',
  `active_status` varchar(2) DEFAULT '1' COMMENT '生效状态',
  PRIMARY KEY (`id`),
  KEY `index_fmid` (`form_id`) USING BTREE,
  KEY `index_buttoncode` (`button_code`) USING BTREE,
  KEY `index_status` (`active_status`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cgform_enhance_js`
--

DROP TABLE IF EXISTS `cgform_enhance_js`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cgform_enhance_js` (
  `ID` varchar(32) NOT NULL COMMENT '主键ID',
  `CG_JS` longtext COMMENT 'JS增强内容',
  `CG_JS_TYPE` varchar(20) DEFAULT NULL COMMENT '类型',
  `CONTENT` varchar(1000) DEFAULT NULL COMMENT '备注',
  `FORM_ID` varchar(32) DEFAULT NULL COMMENT '表单ID',
  PRIMARY KEY (`ID`),
  KEY `index_fmid` (`FORM_ID`) USING BTREE,
  KEY `index_jstype` (`CG_JS_TYPE`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cgform_field`
--

DROP TABLE IF EXISTS `cgform_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cgform_field` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `content` varchar(200) NOT NULL COMMENT '字段备注',
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `create_name` varchar(32) DEFAULT NULL COMMENT '创建人名字',
  `dict_field` varchar(100) DEFAULT NULL COMMENT '字典code',
  `dict_table` varchar(100) DEFAULT NULL COMMENT '字典表',
  `dict_text` varchar(100) DEFAULT NULL COMMENT '字典Text',
  `field_default` varchar(20) DEFAULT NULL COMMENT '表字段默认值',
  `field_href` varchar(200) DEFAULT NULL COMMENT '跳转URL',
  `field_length` int(11) DEFAULT NULL COMMENT '表单控件长度',
  `field_name` varchar(32) NOT NULL COMMENT '字段名字',
  `field_valid_type` varchar(300) DEFAULT NULL COMMENT '表单字段校验规则',
  `field_must_input` varchar(2) DEFAULT NULL COMMENT '字段是否必填',
  `is_key` varchar(2) DEFAULT NULL COMMENT '是否主键',
  `is_null` varchar(5) DEFAULT NULL COMMENT '是否允许为空',
  `is_query` varchar(5) DEFAULT NULL COMMENT '是否查询条件',
  `is_show` varchar(5) DEFAULT NULL COMMENT '表单是否显示',
  `is_show_list` varchar(5) DEFAULT NULL COMMENT '列表是否显示',
  `length` int(11) NOT NULL COMMENT '数据库字段长度',
  `main_field` varchar(100) DEFAULT NULL COMMENT '外键主键字段',
  `main_table` varchar(100) DEFAULT NULL COMMENT '外键主表名',
  `old_field_name` varchar(32) DEFAULT NULL COMMENT '原字段名',
  `order_num` int(11) DEFAULT NULL COMMENT '原排列序号',
  `point_length` int(11) DEFAULT NULL COMMENT '小数点',
  `query_mode` varchar(10) DEFAULT NULL COMMENT '查询模式',
  `show_type` varchar(10) DEFAULT NULL COMMENT '表单控件类型',
  `type` varchar(32) NOT NULL COMMENT '数据库字段类型',
  `update_by` varchar(32) DEFAULT NULL COMMENT '修改人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `update_name` varchar(32) DEFAULT NULL COMMENT '修改人名称',
  `table_id` varchar(32) NOT NULL COMMENT '表ID',
  `extend_json` varchar(500) DEFAULT NULL COMMENT '扩展参数JSON',
  `fill_rule_code` varchar(500) DEFAULT NULL COMMENT '填值规则code',
  PRIMARY KEY (`id`),
  KEY `inex_table_id` (`table_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cgform_ftl`
--

DROP TABLE IF EXISTS `cgform_ftl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cgform_ftl` (
  `ID` varchar(32) NOT NULL COMMENT '主键ID',
  `CGFORM_ID` varchar(36) NOT NULL COMMENT '表单ID',
  `CGFORM_NAME` varchar(100) NOT NULL COMMENT '表单名字',
  `CREATE_BY` varchar(36) DEFAULT NULL COMMENT '创建人',
  `CREATE_DATE` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATE_NAME` varchar(32) DEFAULT NULL COMMENT '创建人名字',
  `FTL_CONTENT` longtext COMMENT '设计模板内容',
  `FTL_STATUS` varchar(50) DEFAULT NULL COMMENT '模板激活状态',
  `FTL_VERSION` int(11) NOT NULL COMMENT '模板编号',
  `FTL_WORD_URL` varchar(200) DEFAULT NULL COMMENT '上传Word路径',
  `UPDATE_BY` varchar(36) DEFAULT NULL COMMENT '修改人',
  `UPDATE_DATE` datetime DEFAULT NULL COMMENT '修改时间',
  `UPDATE_NAME` varchar(32) DEFAULT NULL COMMENT '修改人名字',
  `editor_type` varchar(10) DEFAULT '01' COMMENT '类型',
  PRIMARY KEY (`ID`),
  KEY `inex_table_id` (`CGFORM_ID`) USING BTREE,
  KEY `index_ftl_status` (`FTL_STATUS`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cgform_head`
--

DROP TABLE IF EXISTS `cgform_head`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cgform_head` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `content` varchar(200) NOT NULL COMMENT '表描述',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `create_name` varchar(32) DEFAULT NULL COMMENT '创建人名称',
  `is_checkbox` varchar(5) NOT NULL COMMENT '是否带checkbox',
  `is_dbsynch` varchar(20) NOT NULL COMMENT '同步数据库状态',
  `is_pagination` varchar(5) NOT NULL COMMENT '是否分页',
  `is_tree` varchar(5) NOT NULL COMMENT '是否是树',
  `jform_pk_sequence` varchar(200) DEFAULT NULL COMMENT '主键生成序列',
  `jform_pk_type` varchar(100) DEFAULT NULL COMMENT '主键类型',
  `jform_type` int(11) NOT NULL COMMENT '表类型:单表、主表、附表',
  `jform_version` varchar(10) NOT NULL COMMENT '表单版本号',
  `querymode` varchar(10) NOT NULL COMMENT '查询模式',
  `relation_type` int(11) DEFAULT NULL,
  `sub_table_str` varchar(1000) DEFAULT NULL COMMENT '子表',
  `tab_order` int(11) DEFAULT NULL COMMENT '附表排序序号',
  `table_name` varchar(50) NOT NULL COMMENT '表名',
  `update_by` varchar(32) DEFAULT NULL COMMENT '修改人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `update_name` varchar(32) DEFAULT NULL COMMENT '修改人名字',
  `tree_parentid_fieldname` varchar(50) DEFAULT NULL COMMENT '树形表单父id',
  `tree_id_fieldname` varchar(50) DEFAULT NULL COMMENT '树表主键字段',
  `tree_fieldname` varchar(50) DEFAULT NULL COMMENT '树开表单列字段',
  `jform_category` varchar(50) NOT NULL DEFAULT 'bdfl_ptbd' COMMENT '表单分类',
  `form_template` varchar(50) DEFAULT NULL COMMENT 'PC表单模板',
  `form_template_mobile` varchar(50) DEFAULT NULL COMMENT '表单模板样式(移动端)',
  `table_type` varchar(50) DEFAULT NULL COMMENT '''0''为物理表，‘1’为配置表',
  `table_version` int(11) DEFAULT NULL COMMENT '表版本',
  `physice_id` varchar(32) DEFAULT NULL COMMENT '物理表id(配置表用)',
  PRIMARY KEY (`id`),
  KEY `index_table_type` (`table_type`) USING BTREE,
  KEY `index_physice_id` (`physice_id`) USING BTREE,
  KEY `index_form_templdate` (`form_template`) USING BTREE,
  KEY `index_templdate_mobile` (`form_template_mobile`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cgform_index`
--

DROP TABLE IF EXISTS `cgform_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cgform_index` (
  `id` varchar(36) NOT NULL COMMENT '主键',
  `create_name` varchar(50) DEFAULT NULL COMMENT '创建人名称',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人登录名称',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_name` varchar(50) DEFAULT NULL COMMENT '更新人名称',
  `update_by` varchar(50) DEFAULT NULL COMMENT '更新人登录名称',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `index_name` varchar(100) DEFAULT NULL COMMENT '索引名称',
  `index_field` varchar(500) DEFAULT NULL COMMENT '索引栏位',
  `index_type` varchar(32) DEFAULT NULL COMMENT '索引类型',
  `table_id` varchar(32) DEFAULT NULL COMMENT '主表id',
  PRIMARY KEY (`id`),
  KEY `index_table_id` (`table_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cgform_template`
--

DROP TABLE IF EXISTS `cgform_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cgform_template` (
  `id` varchar(36) NOT NULL,
  `create_name` varchar(50) DEFAULT NULL COMMENT '创建人名称',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人登录名称',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_name` varchar(50) DEFAULT NULL COMMENT '更新人名称',
  `update_by` varchar(50) DEFAULT NULL COMMENT '更新人登录名称',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `sys_org_code` varchar(50) DEFAULT NULL COMMENT '所属部门',
  `sys_company_code` varchar(50) DEFAULT NULL COMMENT '所属公司',
  `template_name` varchar(100) DEFAULT NULL COMMENT '模板名称',
  `template_code` varchar(50) DEFAULT NULL COMMENT '模板编码',
  `template_type` varchar(32) DEFAULT NULL COMMENT '模板类型',
  `template_share` varchar(10) DEFAULT NULL COMMENT '是否共享',
  `template_pic` varchar(100) DEFAULT NULL COMMENT '预览图',
  `template_comment` varchar(200) DEFAULT NULL COMMENT '模板描述',
  `template_list_name` varchar(200) DEFAULT NULL COMMENT '列表模板名称\r\n',
  `template_add_name` varchar(200) DEFAULT NULL COMMENT '录入模板名称',
  `template_update_name` varchar(200) DEFAULT NULL COMMENT '编辑模板名\r\n称',
  `template_detail_name` varchar(200) DEFAULT NULL COMMENT '查看页面模\r\n板名称',
  `status` int(11) DEFAULT NULL COMMENT '有效状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cgform_uploadfiles`
--

DROP TABLE IF EXISTS `cgform_uploadfiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cgform_uploadfiles` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `CGFORM_FIELD` varchar(100) NOT NULL COMMENT '表单字段',
  `CGFORM_ID` varchar(36) NOT NULL COMMENT '表单ID',
  `CGFORM_NAME` varchar(100) NOT NULL COMMENT '表单名称',
  PRIMARY KEY (`id`),
  KEY `FK_qwig8sn3okhvh4wye8nn8gdeg` (`id`),
  KEY `index_fieldid` (`CGFORM_FIELD`) USING BTREE,
  KEY `index_formid` (`CGFORM_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jeecg_custom_info`
--

DROP TABLE IF EXISTS `jeecg_custom_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jeecg_custom_info` (
  `id` varchar(36) NOT NULL,
  `create_name` varchar(50) DEFAULT NULL COMMENT '创建人名称',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人登录名称',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_name` varchar(50) DEFAULT NULL COMMENT '更新人名称',
  `update_by` varchar(50) DEFAULT NULL COMMENT '更新人登录名称',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `sys_org_code` varchar(50) DEFAULT NULL COMMENT '所属部门',
  `sys_company_code` varchar(50) DEFAULT NULL COMMENT '所属公司',
  `cust_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `cust_addr` varchar(200) DEFAULT NULL COMMENT '地址',
  `cust_code` varchar(50) DEFAULT NULL COMMENT '客户编号',
  `email` varchar(50) DEFAULT NULL COMMENT 'email',
  `cust_charge` varchar(50) DEFAULT NULL COMMENT '负责人',
  `sex` varchar(10) DEFAULT NULL COMMENT '性别',
  `age` varchar(32) DEFAULT NULL COMMENT '年龄',
  `position` varchar(32) DEFAULT NULL COMMENT '职务',
  `phone` varchar(32) DEFAULT NULL COMMENT '电话',
  `bank` varchar(100) DEFAULT NULL COMMENT '往来银行',
  `money` varchar(100) DEFAULT NULL COMMENT '现金情况',
  `promoter` varchar(50) DEFAULT NULL COMMENT '承办人',
  `account` varchar(100) DEFAULT NULL COMMENT '账号',
  `turnover` varchar(32) DEFAULT NULL COMMENT '资金周转',
  `payment_attr` varchar(100) DEFAULT NULL COMMENT '付款态度',
  `sax_num` varchar(100) DEFAULT NULL COMMENT '税号',
  `pay_date` varchar(100) DEFAULT NULL COMMENT '付款日期',
  `begin_pay_date` varchar(100) DEFAULT NULL COMMENT '开始交易日期',
  `main_bus` varchar(100) DEFAULT NULL COMMENT '主营产品',
  `bus_pro` varchar(100) DEFAULT NULL COMMENT '营业项目',
  `warehouse` varchar(100) DEFAULT NULL COMMENT '仓库情况',
  `people` varchar(100) DEFAULT NULL COMMENT '员工人数及素质',
  `transportation` varchar(100) DEFAULT NULL COMMENT '运输方式',
  `operation` varchar(100) DEFAULT NULL COMMENT '经营体制',
  `car` varchar(20) DEFAULT NULL COMMENT '服务车数目',
  `shopkeeper` varchar(100) DEFAULT NULL COMMENT '零售商数及覆盖情况',
  `wholesale` varchar(10) DEFAULT NULL COMMENT '批发商数',
  `bus_scope` varchar(100) DEFAULT NULL COMMENT '营业范围',
  `area` varchar(100) DEFAULT NULL COMMENT '门市面积',
  `management` varchar(200) DEFAULT NULL COMMENT '经营方针',
  `stock1` varchar(10) DEFAULT NULL COMMENT '进货',
  `stock2` varchar(10) DEFAULT NULL COMMENT '进货',
  `sale1` varchar(10) DEFAULT NULL COMMENT '销售',
  `sale2` varchar(10) DEFAULT NULL COMMENT '销售',
  `inventory1` varchar(100) DEFAULT NULL COMMENT '存货',
  `inventory2` varchar(100) DEFAULT NULL COMMENT '存货',
  `max_money` varchar(100) DEFAULT NULL COMMENT '最高信用额度',
  `cust_level` varchar(100) DEFAULT NULL COMMENT '客户等级',
  `all_avg_inventory` varchar(100) DEFAULT NULL COMMENT '总体月均库存数',
  `avg_inventory` varchar(100) DEFAULT NULL COMMENT '月均库存数',
  `price` varchar(100) DEFAULT NULL COMMENT '价格折扣',
  `promise` varchar(100) DEFAULT NULL COMMENT '支持和服务的承诺',
  `competing_goods` varchar(100) DEFAULT NULL COMMENT '竞品经营情况',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jeecg_custom_record`
--

DROP TABLE IF EXISTS `jeecg_custom_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jeecg_custom_record` (
  `id` varchar(36) NOT NULL,
  `create_name` varchar(50) DEFAULT NULL COMMENT '创建人名称',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人登录名称',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_name` varchar(50) DEFAULT NULL COMMENT '更新人名称',
  `update_by` varchar(50) DEFAULT NULL COMMENT '更新人登录名称',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `sys_org_code` varchar(50) DEFAULT NULL COMMENT '所属部门',
  `sys_company_code` varchar(50) DEFAULT NULL COMMENT '所属公司',
  `custom_id` varchar(32) DEFAULT NULL COMMENT '客户编号',
  `header` varchar(32) DEFAULT NULL COMMENT '负责人',
  `establish_date` datetime DEFAULT NULL COMMENT '成立日期',
  `custom_name` varchar(32) DEFAULT NULL COMMENT '客户名称',
  `capital_lines` double DEFAULT NULL COMMENT '资本额',
  `address` varchar(32) DEFAULT NULL COMMENT '地址',
  `phone` varchar(32) DEFAULT NULL COMMENT '电话',
  `business_type` varchar(32) DEFAULT NULL COMMENT '营业类型',
  `fax` varchar(32) DEFAULT NULL COMMENT '传真',
  `banks` varchar(32) DEFAULT NULL COMMENT '主要往来银行',
  `other_business` varchar(32) DEFAULT NULL COMMENT '其他投资事业',
  `turnover` varchar(32) DEFAULT NULL COMMENT '平均每日营业额',
  `business` varchar(32) DEFAULT NULL COMMENT '主要业务往来',
  `pay_type` varchar(32) DEFAULT NULL COMMENT '付款方式',
  `business_contacts` varchar(32) DEFAULT NULL COMMENT '与本公司往来',
  `collection` varchar(32) DEFAULT NULL COMMENT '收款记录',
  `business_important_contacts` varchar(32) DEFAULT NULL COMMENT '最近与本公司往来重要记录',
  `business_record` varchar(32) DEFAULT NULL COMMENT '最近交易数据跟踪',
  `customer_opinion` varchar(32) DEFAULT NULL COMMENT '客户意见',
  `credit_evaluation` varchar(32) DEFAULT NULL COMMENT '信用评定',
  `preparer` varchar(32) DEFAULT NULL COMMENT '填表人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jeecg_demo`
--

DROP TABLE IF EXISTS `jeecg_demo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jeecg_demo` (
  `id` varchar(32) NOT NULL COMMENT 'id',
  `name` varchar(255) NOT NULL COMMENT '名称',
  `age` int(10) DEFAULT NULL COMMENT '年龄',
  `birthday` datetime DEFAULT NULL COMMENT '生日',
  `content` varchar(255) DEFAULT NULL COMMENT '个人介绍',
  `dep_id` varchar(255) DEFAULT NULL COMMENT '部门',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(255) DEFAULT NULL COMMENT '电话',
  `salary` double(16,2) DEFAULT NULL COMMENT '工资',
  `sex` varchar(255) DEFAULT NULL COMMENT '性别',
  `touxiang` varchar(255) DEFAULT NULL COMMENT '头像',
  `fujian` varchar(255) DEFAULT NULL COMMENT '附件',
  `status` varchar(255) DEFAULT NULL COMMENT '入职状态',
  `create_date` datetime DEFAULT NULL COMMENT 'createDate',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建人id',
  `create_name` varchar(32) DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(32) DEFAULT NULL COMMENT '修改人id',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `update_name` varchar(32) DEFAULT NULL COMMENT '修改人',
  `sys_org_code` varchar(200) DEFAULT NULL COMMENT '部门编码',
  `sys_company_code` varchar(200) DEFAULT NULL COMMENT '公司编码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jeecg_multi_upload`
--

DROP TABLE IF EXISTS `jeecg_multi_upload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jeecg_multi_upload` (
  `id` varchar(36) NOT NULL,
  `create_name` varchar(50) DEFAULT NULL COMMENT '创建人名称',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人登录名称',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_name` varchar(50) DEFAULT NULL COMMENT '更新人名称',
  `update_by` varchar(50) DEFAULT NULL COMMENT '更新人登录名称',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `sys_org_code` varchar(50) DEFAULT NULL COMMENT '所属部门',
  `sys_company_code` varchar(50) DEFAULT NULL COMMENT '所属公司',
  `bpm_status` varchar(32) DEFAULT '1' COMMENT '流程状态',
  `test_file_1` longtext COMMENT '测试文件1',
  `test_file_2` longtext COMMENT '测试文件2',
  `test_file_3` longtext COMMENT '测试文件3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jeecg_order_custom`
--

DROP TABLE IF EXISTS `jeecg_order_custom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jeecg_order_custom` (
  `ID` varchar(32) NOT NULL,
  `CREATE_DT` datetime DEFAULT NULL,
  `CRTUSER` varchar(12) DEFAULT NULL,
  `CRTUSER_NAME` varchar(10) DEFAULT NULL,
  `DEL_DT` datetime DEFAULT NULL,
  `DELFLAG` int(11) DEFAULT NULL,
  `GO_ORDER_CODE` varchar(32) NOT NULL,
  `GOC_BUSS_CONTENT` varchar(33) DEFAULT NULL,
  `GOC_CONTENT` varchar(66) DEFAULT NULL,
  `GOC_CUS_NAME` varchar(16) DEFAULT NULL,
  `GOC_IDCARD` varchar(18) DEFAULT NULL,
  `GOC_PASSPORT_CODE` varchar(10) DEFAULT NULL,
  `GOC_SEX` varchar(255) DEFAULT NULL,
  `MODIFIER` varchar(12) DEFAULT NULL,
  `MODIFIER_NAME` varchar(10) DEFAULT NULL,
  `MODIFY_DT` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jeecg_order_main`
--

DROP TABLE IF EXISTS `jeecg_order_main`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jeecg_order_main` (
  `ID` varchar(32) NOT NULL,
  `CREATE_DT` datetime DEFAULT NULL,
  `CRTUSER` varchar(12) DEFAULT NULL,
  `CRTUSER_NAME` varchar(10) DEFAULT NULL,
  `DEL_DT` datetime DEFAULT NULL,
  `DELFLAG` int(11) DEFAULT NULL,
  `GO_ALL_PRICE` decimal(10,2) DEFAULT NULL,
  `GO_CONTACT_NAME` varchar(16) DEFAULT NULL,
  `GO_CONTENT` varchar(66) DEFAULT NULL,
  `GO_ORDER_CODE` varchar(12) NOT NULL,
  `GO_ORDER_COUNT` int(11) DEFAULT NULL,
  `GO_RETURN_PRICE` decimal(10,2) DEFAULT NULL,
  `GO_TELPHONE` varchar(11) DEFAULT NULL,
  `GODER_TYPE` varchar(255) DEFAULT NULL,
  `MODIFIER` varchar(12) DEFAULT NULL,
  `MODIFIER_NAME` varchar(10) DEFAULT NULL,
  `MODIFY_DT` datetime DEFAULT NULL,
  `USERTYPE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jeecg_order_product`
--

DROP TABLE IF EXISTS `jeecg_order_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jeecg_order_product` (
  `ID` varchar(32) NOT NULL,
  `CREATE_DT` datetime DEFAULT NULL,
  `CRTUSER` varchar(12) DEFAULT NULL,
  `CRTUSER_NAME` varchar(10) DEFAULT NULL,
  `DEL_DT` datetime DEFAULT NULL,
  `DELFLAG` int(11) DEFAULT NULL,
  `GO_ORDER_CODE` varchar(12) NOT NULL,
  `GOP_CONTENT` varchar(66) DEFAULT NULL,
  `GOP_COUNT` int(11) DEFAULT NULL,
  `GOP_ONE_PRICE` decimal(10,2) DEFAULT NULL,
  `GOP_PRODUCT_NAME` varchar(33) DEFAULT NULL,
  `GOP_PRODUCT_TYPE` varchar(1) NOT NULL,
  `GOP_SUM_PRICE` decimal(10,2) DEFAULT NULL,
  `MODIFIER` varchar(12) DEFAULT NULL,
  `MODIFIER_NAME` varchar(10) DEFAULT NULL,
  `MODIFY_DT` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jeecg_p3demo`
--

DROP TABLE IF EXISTS `jeecg_p3demo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jeecg_p3demo` (
  `id` varchar(36) NOT NULL COMMENT 'id',
  `create_name` varchar(50) DEFAULT NULL COMMENT '创建人名称',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人登录名称',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_name` varchar(50) DEFAULT NULL COMMENT '更新人名称',
  `update_by` varchar(50) DEFAULT NULL COMMENT '更新人登录名称',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `sys_org_code` varchar(50) DEFAULT NULL COMMENT '所属部门',
  `sys_company_code` varchar(50) DEFAULT NULL COMMENT '所属公司',
  `bpm_status` varchar(32) DEFAULT NULL COMMENT '流程状态',
  `name` varchar(32) DEFAULT NULL COMMENT '姓名',
  `sex` int(11) DEFAULT NULL COMMENT '性别',
  `age` int(11) DEFAULT NULL COMMENT '年龄',
  `address` varchar(32) DEFAULT NULL COMMENT '地址',
  `phone` varchar(32) DEFAULT NULL COMMENT '电话',
  `memo` text COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jform_cgdynamgraph_head`
--

DROP TABLE IF EXISTS `jform_cgdynamgraph_head`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jform_cgdynamgraph_head` (
  `ID` varchar(36) NOT NULL COMMENT '主键ID',
  `CGR_SQL` varchar(1000) NOT NULL COMMENT '移动报表SQL',
  `CODE` varchar(36) NOT NULL COMMENT '移动报表编码',
  `CONTENT` varchar(500) NOT NULL COMMENT '描述',
  `NAME` varchar(100) NOT NULL COMMENT '移动报表名字',
  `update_name` varchar(32) DEFAULT NULL COMMENT '修改人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `update_by` varchar(32) DEFAULT NULL COMMENT '修改人id',
  `create_name` varchar(32) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建人id',
  `db_source` varchar(36) DEFAULT NULL COMMENT '动态数据源',
  `graph_type` varchar(36) DEFAULT NULL COMMENT '移动报表类型',
  `data_structure` varchar(36) DEFAULT NULL COMMENT '数据结构类型',
  `is_pagination` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `index_code` (`CODE`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jform_cgdynamgraph_item`
--

DROP TABLE IF EXISTS `jform_cgdynamgraph_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jform_cgdynamgraph_item` (
  `ID` varchar(36) NOT NULL,
  `S_FLAG` varchar(2) DEFAULT NULL COMMENT '是否查询',
  `S_MODE` varchar(10) DEFAULT NULL COMMENT '查询模式',
  `CGRHEAD_ID` varchar(36) DEFAULT NULL COMMENT '报表ID',
  `DICT_CODE` varchar(36) DEFAULT NULL COMMENT '字段code',
  `FIELD_HREF` varchar(120) DEFAULT NULL COMMENT '字段跳转URL',
  `FIELD_NAME` varchar(36) DEFAULT NULL COMMENT '字段名字',
  `FIELD_TXT` longtext COMMENT '字段文本',
  `FIELD_TYPE` varchar(10) DEFAULT NULL COMMENT '字段类型',
  `IS_SHOW` varchar(5) DEFAULT NULL COMMENT '是否显示',
  `ORDER_NUM` int(11) DEFAULT NULL COMMENT '排序',
  `REPLACE_VA` varchar(36) DEFAULT NULL COMMENT '取值表达式',
  PRIMARY KEY (`ID`),
  KEY `index1` (`CGRHEAD_ID`) USING BTREE,
  KEY `index2` (`IS_SHOW`) USING BTREE,
  KEY `index3` (`ORDER_NUM`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jform_cgdynamgraph_param`
--

DROP TABLE IF EXISTS `jform_cgdynamgraph_param`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jform_cgdynamgraph_param` (
  `id` varchar(36) NOT NULL,
  `create_name` varchar(50) DEFAULT NULL COMMENT '创建人名称',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人登录名称',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_name` varchar(50) DEFAULT NULL COMMENT '更新人名称',
  `update_by` varchar(50) DEFAULT NULL COMMENT '更新人登录名称',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `sys_org_code` varchar(50) DEFAULT NULL COMMENT '所属部门',
  `sys_company_code` varchar(50) DEFAULT NULL COMMENT '所属公司',
  `param_name` varchar(32) NOT NULL COMMENT '参数名称',
  `param_desc` varchar(32) DEFAULT NULL COMMENT '参数说明',
  `param_value` varchar(32) DEFAULT NULL COMMENT '数值',
  `seq` int(11) DEFAULT NULL COMMENT '排序',
  `cgrhead_id` varchar(36) DEFAULT NULL COMMENT '动态报表ID',
  PRIMARY KEY (`id`),
  KEY `index_headid` (`cgrhead_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jform_cgreport_head`
--

DROP TABLE IF EXISTS `jform_cgreport_head`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jform_cgreport_head` (
  `ID` varchar(36) NOT NULL,
  `CGR_SQL` varchar(1000) NOT NULL COMMENT '报表SQL',
  `CODE` varchar(36) NOT NULL COMMENT '报表编码',
  `CONTENT` varchar(1000) NOT NULL COMMENT '描述',
  `NAME` varchar(100) NOT NULL COMMENT '报表名字',
  `update_name` varchar(32) DEFAULT NULL COMMENT '修改人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `update_by` varchar(32) DEFAULT NULL COMMENT '修改人id',
  `create_name` varchar(32) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建人id',
  `db_source` varchar(36) DEFAULT NULL COMMENT '动态数据源',
  `return_val_field` varchar(100) DEFAULT NULL COMMENT '返回值字段',
  `return_txt_field` varchar(100) DEFAULT NULL COMMENT '返回文本字段',
  `pop_retype` varchar(2) DEFAULT '1' COMMENT '返回类型，单选或多选',
  PRIMARY KEY (`ID`),
  KEY `index_code` (`CODE`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jform_cgreport_item`
--

DROP TABLE IF EXISTS `jform_cgreport_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jform_cgreport_item` (
  `ID` varchar(36) NOT NULL,
  `S_FLAG` varchar(2) DEFAULT NULL COMMENT '是否查询',
  `S_MODE` varchar(10) DEFAULT NULL COMMENT '查询模式',
  `CGRHEAD_ID` varchar(36) DEFAULT NULL COMMENT '报表ID',
  `DICT_CODE` varchar(36) DEFAULT NULL COMMENT '字典CODE',
  `FIELD_HREF` varchar(120) DEFAULT NULL COMMENT '字段跳转URL',
  `FIELD_NAME` varchar(36) DEFAULT NULL COMMENT '字段名字',
  `FIELD_TXT` longtext COMMENT '字段文本',
  `FIELD_TYPE` varchar(10) DEFAULT NULL COMMENT '字段类型',
  `IS_SHOW` varchar(5) DEFAULT NULL COMMENT '是否显示',
  `ORDER_NUM` int(11) DEFAULT NULL COMMENT '排序',
  `REPLACE_VA` varchar(36) DEFAULT NULL COMMENT '取值表达式',
  PRIMARY KEY (`ID`),
  KEY `index_CGRHEAD_ID` (`CGRHEAD_ID`) USING BTREE,
  KEY `index_isshow` (`IS_SHOW`) USING BTREE,
  KEY `index_order_num` (`ORDER_NUM`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jform_cgreport_param`
--

DROP TABLE IF EXISTS `jform_cgreport_param`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jform_cgreport_param` (
  `id` varchar(36) NOT NULL,
  `create_name` varchar(50) DEFAULT NULL COMMENT '创建人名称',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人登录名称',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_name` varchar(50) DEFAULT NULL COMMENT '更新人名称',
  `update_by` varchar(50) DEFAULT NULL COMMENT '更新人登录名称',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `sys_org_code` varchar(50) DEFAULT NULL COMMENT '所属部门',
  `sys_company_code` varchar(50) DEFAULT NULL COMMENT '所属公司',
  `param_name` varchar(32) NOT NULL COMMENT '参数名称',
  `param_desc` varchar(32) DEFAULT NULL COMMENT '参数说明',
  `param_value` varchar(32) DEFAULT NULL COMMENT '数值',
  `seq` int(11) DEFAULT NULL COMMENT '排序',
  `cgrhead_id` varchar(36) DEFAULT NULL COMMENT '动态报表ID',
  PRIMARY KEY (`id`),
  KEY `idx_cgrheadid` (`cgrhead_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jform_contact`
--

DROP TABLE IF EXISTS `jform_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jform_contact` (
  `id` varchar(36) NOT NULL COMMENT '主键',
  `create_name` varchar(50) DEFAULT NULL COMMENT '创建人名称',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人登录名称',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_name` varchar(50) DEFAULT NULL COMMENT '更新人名称',
  `update_by` varchar(50) DEFAULT NULL COMMENT '更新人登录名称',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `sys_org_code` varchar(50) DEFAULT NULL COMMENT '所属部门',
  `sys_company_code` varchar(50) DEFAULT NULL COMMENT '所属公司',
  `bpm_status` varchar(32) DEFAULT '1' COMMENT '流程状态',
  `name` varchar(100) NOT NULL COMMENT '姓名',
  `sex` varchar(50) NOT NULL COMMENT '性别',
  `groups` varchar(200) DEFAULT NULL COMMENT '所属分组',
  `company` varchar(200) DEFAULT NULL COMMENT '公司名称',
  `position` varchar(100) DEFAULT NULL COMMENT '职位',
  `mobile` varchar(30) DEFAULT NULL COMMENT '移动电话',
  `office_phone` varchar(30) DEFAULT NULL COMMENT '办公电话',
  `email` varchar(100) DEFAULT NULL COMMENT '电子邮箱',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jform_contact_group`
--

DROP TABLE IF EXISTS `jform_contact_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jform_contact_group` (
  `id` varchar(36) NOT NULL COMMENT '主键',
  `create_name` varchar(50) DEFAULT NULL COMMENT '创建人名称',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人登录名称',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_name` varchar(50) DEFAULT NULL COMMENT '更新人名称',
  `update_by` varchar(50) DEFAULT NULL COMMENT '更新人登录名称',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `sys_org_code` varchar(50) DEFAULT NULL COMMENT '所属部门',
  `sys_company_code` varchar(50) DEFAULT NULL COMMENT '所属公司',
  `bpm_status` varchar(32) DEFAULT '1' COMMENT '流程状态',
  `name` varchar(32) NOT NULL COMMENT '分组名称',
  PRIMARY KEY (`id`),
  KEY `index_name` (`name`),
  KEY `index_bpm_status` (`bpm_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jform_employee_cost_claim`
--

DROP TABLE IF EXISTS `jform_employee_cost_claim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jform_employee_cost_claim` (
  `id` varchar(36) NOT NULL DEFAULT '' COMMENT 'id',
  `staff_name` varchar(50) DEFAULT NULL COMMENT '职工姓名',
  `depart` varchar(50) DEFAULT NULL COMMENT '部门',
  `staff_no` varchar(30) DEFAULT NULL COMMENT '员工编号',
  `staff_post` varchar(50) DEFAULT NULL COMMENT '职位',
  `pay_way` varchar(10) DEFAULT NULL COMMENT '打款方式',
  `acct_bank` varchar(100) DEFAULT NULL COMMENT '开户行',
  `card_no` varchar(30) DEFAULT NULL COMMENT '卡号',
  `tele_no` varchar(20) DEFAULT NULL COMMENT '联系手机号',
  `cost_all` decimal(7,2) DEFAULT NULL COMMENT '费用合计',
  `documents` varchar(2) DEFAULT NULL COMMENT '单据数量',
  `cost_upper` varchar(50) DEFAULT NULL COMMENT '费用大写',
  `prepaid_fee` decimal(7,2) DEFAULT NULL COMMENT '预支款项',
  `real_fee` decimal(7,2) DEFAULT NULL COMMENT '实际支付',
  `fill_time` date DEFAULT NULL,
  `apply_time` date DEFAULT NULL,
  `apply_by` varchar(50) DEFAULT NULL COMMENT '申请人',
  `comments` varchar(100) DEFAULT NULL COMMENT '备注',
  `depart_approve` varchar(100) DEFAULT NULL COMMENT '部门审批',
  `finance_approve` varchar(100) DEFAULT NULL COMMENT '财务审批',
  `mgr_approve` varchar(100) DEFAULT NULL COMMENT '总经理审批',
  `treasurer` varchar(100) DEFAULT NULL COMMENT '出纳',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jform_employee_entry`
--

DROP TABLE IF EXISTS `jform_employee_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jform_employee_entry` (
  `id` varchar(36) NOT NULL,
  `create_name` varchar(50) DEFAULT NULL COMMENT '创建人名称',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人登录名称',
  `create_date` datetime DEFAULT NULL COMMENT '填表日期',
  `update_name` varchar(50) DEFAULT NULL COMMENT '更新人名称',
  `update_by` varchar(50) DEFAULT NULL COMMENT '更新人登录名称',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `sys_org_code` varchar(50) DEFAULT NULL COMMENT '所属部门',
  `sys_company_code` varchar(50) DEFAULT NULL COMMENT '所属公司',
  `employee_name` varchar(32) DEFAULT NULL COMMENT '姓名',
  `employee_depart` varchar(50) DEFAULT NULL COMMENT '部门',
  `employee_job` varchar(32) DEFAULT NULL COMMENT '职务',
  `employee_birthday` datetime DEFAULT NULL COMMENT '生日',
  `employee_origin` varchar(50) DEFAULT NULL COMMENT '籍贯',
  `employee_degree` varchar(32) DEFAULT NULL COMMENT '学历',
  `employee_identification` varchar(50) DEFAULT NULL COMMENT '身份证',
  `employee_entry_date` datetime DEFAULT NULL COMMENT '入职日期',
  `employee_code` varchar(32) DEFAULT NULL COMMENT '工号',
  `employee_phone` varchar(32) DEFAULT NULL COMMENT '手机',
  `employee_mail` varchar(150) DEFAULT NULL COMMENT '邮箱',
  `employee_msn` varchar(32) DEFAULT NULL COMMENT 'MSN',
  `hr_pic` varchar(2) DEFAULT NULL COMMENT '照片',
  `hr_archives` varchar(2) DEFAULT NULL COMMENT '档案表',
  `hr_identification` varchar(2) DEFAULT NULL COMMENT '身份证',
  `hr_degree` varchar(2) DEFAULT NULL COMMENT '学位证',
  `hr_other` varchar(2) DEFAULT NULL COMMENT '其他证件',
  `hr_tel` varchar(2) DEFAULT NULL COMMENT '分配电话',
  `hr_op_user` varchar(32) DEFAULT NULL COMMENT '经办人',
  `hr_op_date` datetime DEFAULT NULL COMMENT '日期',
  `depart_opinion` varchar(200) DEFAULT NULL COMMENT '部门意见',
  `depart_op_user` varchar(32) DEFAULT NULL COMMENT '经办人',
  `depart_op_date` datetime DEFAULT NULL COMMENT '日期',
  `manager_opinion` varchar(200) DEFAULT NULL COMMENT '总经理意见',
  `manager_op_user` varchar(32) DEFAULT NULL COMMENT '经办人',
  `manager_op_date` datetime DEFAULT NULL COMMENT '日期',
  `employee_opinion` varchar(200) DEFAULT NULL COMMENT '新员工意见',
  `employee_op_user` varchar(32) DEFAULT NULL COMMENT '经办人',
  `employee_op_date` datetime DEFAULT NULL COMMENT '日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jform_employee_leave`
--

DROP TABLE IF EXISTS `jform_employee_leave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jform_employee_leave` (
  `id` varchar(36) NOT NULL COMMENT '主键',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `apply_date` datetime DEFAULT NULL COMMENT '申请日期',
  `duty` varchar(100) DEFAULT NULL COMMENT '职务',
  `leave_category` varchar(100) DEFAULT NULL COMMENT '请假类别',
  `leave_reason` varchar(100) DEFAULT NULL COMMENT '请假原因',
  `leave_start_date` datetime DEFAULT NULL COMMENT '请假开始时间',
  `leave_end_date` datetime DEFAULT NULL COMMENT '请假结束时间',
  `total` int(5) DEFAULT NULL COMMENT '共计',
  `contact_way` varchar(20) DEFAULT NULL COMMENT '紧急联系方式',
  `duty_deputy` varchar(100) DEFAULT NULL COMMENT '批定职务代理人',
  `leader_approval` varchar(50) DEFAULT NULL COMMENT '直接主管审批',
  `dept_principal_approval` varchar(50) DEFAULT NULL COMMENT '部门负责人审批',
  `hr_principal_approval` varchar(50) DEFAULT NULL COMMENT 'HR负责人审批',
  `hr_records` varchar(50) DEFAULT NULL COMMENT '行政部备案',
  `department` varchar(50) DEFAULT NULL COMMENT '部门',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jform_employee_meals_cost`
--

DROP TABLE IF EXISTS `jform_employee_meals_cost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jform_employee_meals_cost` (
  `id` varchar(36) NOT NULL DEFAULT '' COMMENT 'id',
  `fk_id` varchar(36) DEFAULT NULL COMMENT '外键',
  `meals_date` date DEFAULT NULL,
  `meals_cost` decimal(7,2) DEFAULT NULL COMMENT '餐费',
  `meals_addr` varchar(100) DEFAULT NULL COMMENT '吃饭地点',
  `meals_number` int(2) DEFAULT NULL COMMENT '同行人数',
  `comments` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jform_employee_other_cost`
--

DROP TABLE IF EXISTS `jform_employee_other_cost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jform_employee_other_cost` (
  `id` varchar(36) NOT NULL DEFAULT '' COMMENT 'id',
  `fk_id` varchar(36) DEFAULT NULL COMMENT '外键',
  `item` varchar(20) DEFAULT NULL COMMENT '事项',
  `cost` decimal(7,2) DEFAULT NULL COMMENT '费用',
  `begin_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `comments` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jform_employee_resignation`
--

DROP TABLE IF EXISTS `jform_employee_resignation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jform_employee_resignation` (
  `id` varchar(36) NOT NULL COMMENT '主键',
  `create_name` varchar(50) DEFAULT NULL COMMENT '创建人名称',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人登录名称',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_name` varchar(50) DEFAULT NULL COMMENT '更新人名称',
  `update_by` varchar(50) DEFAULT NULL COMMENT '更新人登录名称',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `sys_org_code` varchar(50) DEFAULT NULL COMMENT '所属部门',
  `sys_company_code` varchar(50) DEFAULT NULL COMMENT '所属公司',
  `name` varchar(32) DEFAULT NULL COMMENT '姓名',
  `code` varchar(32) DEFAULT NULL COMMENT '员工编号',
  `job` varchar(32) DEFAULT NULL COMMENT '职务',
  `join_time` datetime DEFAULT NULL COMMENT '入职时间',
  `out_type` varchar(32) DEFAULT NULL COMMENT '离职方式',
  `apply_out_time` datetime DEFAULT NULL COMMENT '申请离职日期',
  `out_time` datetime DEFAULT NULL COMMENT '正式离职日期',
  `id_card` varchar(32) DEFAULT NULL COMMENT '身份证编号',
  `out_content` varchar(200) DEFAULT NULL COMMENT '离职须知',
  `out_reason` varchar(100) DEFAULT NULL COMMENT '离职原因',
  `interview_record` varchar(100) DEFAULT NULL COMMENT '面谈记录',
  `office_change` varchar(100) DEFAULT NULL COMMENT '办公物品移交',
  `hr_check` varchar(32) DEFAULT NULL COMMENT '人力资源部审核',
  `should_send_salary` double(32,0) DEFAULT NULL COMMENT '应发薪资',
  `should_deduct_pay` double(32,0) DEFAULT NULL COMMENT '应扣薪资',
  `pay` double(32,0) DEFAULT NULL COMMENT '实发薪资',
  `get_time` datetime DEFAULT NULL COMMENT '领取日期',
  `boss_check` varchar(32) DEFAULT NULL COMMENT '总经理审批',
  `description` varchar(32) DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jform_graphreport_head`
--

DROP TABLE IF EXISTS `jform_graphreport_head`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jform_graphreport_head` (
  `id` varchar(36) NOT NULL COMMENT 'id',
  `cgr_sql` varchar(1000) NOT NULL COMMENT '查询数据SQL',
  `code` varchar(36) NOT NULL COMMENT '编码',
  `content` varchar(1000) NOT NULL COMMENT '描述',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `ytext` varchar(100) NOT NULL COMMENT 'y轴文字',
  `categories` varchar(1000) NOT NULL COMMENT 'x轴数据',
  `is_show_list` varchar(5) DEFAULT NULL COMMENT '是否显示明细',
  `x_page_js` varchar(1000) DEFAULT NULL COMMENT '扩展JS',
  PRIMARY KEY (`id`),
  KEY `index_code` (`code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jform_graphreport_item`
--

DROP TABLE IF EXISTS `jform_graphreport_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jform_graphreport_item` (
  `id` varchar(36) NOT NULL COMMENT 'id',
  `search_flag` varchar(2) DEFAULT NULL COMMENT '是否查询',
  `search_mode` varchar(10) DEFAULT NULL COMMENT '查询模式',
  `cgreport_head_id` varchar(36) DEFAULT NULL COMMENT 'cgreportHeadId',
  `dict_code` varchar(500) DEFAULT NULL COMMENT '字典Code',
  `field_href` varchar(120) DEFAULT NULL COMMENT '字段href',
  `field_name` varchar(36) DEFAULT NULL COMMENT '字段名',
  `field_txt` varchar(1000) DEFAULT NULL COMMENT '字段文本',
  `field_type` varchar(10) DEFAULT NULL COMMENT '字段类型',
  `is_show` varchar(5) DEFAULT NULL COMMENT '是否显示',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  `replace_va` varchar(36) DEFAULT NULL COMMENT '取值表达式',
  `is_graph` varchar(5) DEFAULT NULL COMMENT '显示图表',
  `graph_type` varchar(50) DEFAULT NULL COMMENT '图表类型',
  `graph_name` varchar(100) DEFAULT NULL COMMENT '图表名称',
  `tab_name` varchar(50) DEFAULT NULL COMMENT '标签名称',
  PRIMARY KEY (`id`),
  KEY `index_headid` (`cgreport_head_id`) USING BTREE,
  KEY `index_isshow` (`is_show`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='jform_graphreport_item';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jform_leave`
--

DROP TABLE IF EXISTS `jform_leave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jform_leave` (
  `id` varchar(36) NOT NULL COMMENT '主键',
  `title` varchar(50) NOT NULL COMMENT '请假标题',
  `people` varchar(20) NOT NULL COMMENT '请假人',
  `sex` varchar(10) NOT NULL COMMENT '性别',
  `begindate` datetime NOT NULL COMMENT '请假开始时间',
  `enddate` datetime NOT NULL COMMENT '请假结束时间',
  `day_num` int(11) DEFAULT NULL COMMENT '请假天数',
  `hol_dept` varchar(32) NOT NULL COMMENT '所属部门',
  `hol_reson` varchar(255) NOT NULL COMMENT '请假原因',
  `dep_leader` varchar(20) DEFAULT NULL COMMENT '部门审批人',
  `content` varchar(255) DEFAULT NULL COMMENT '部门审批意见',
  `file_str` varchar(300) DEFAULT NULL COMMENT '附件',
  `create_by` varchar(100) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jform_order_customer`
--

DROP TABLE IF EXISTS `jform_order_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jform_order_customer` (
  `id` varchar(36) NOT NULL COMMENT '主键',
  `name` varchar(100) DEFAULT NULL COMMENT '客户名',
  `money` double(10,2) DEFAULT NULL COMMENT '单价',
  `sex` varchar(4) DEFAULT NULL COMMENT '性别',
  `telphone` varchar(32) DEFAULT NULL COMMENT '电话',
  `fk_id` varchar(36) NOT NULL COMMENT '外键',
  `sf_pic` varchar(500) DEFAULT NULL COMMENT '身份证扫描件',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jform_order_main`
--

DROP TABLE IF EXISTS `jform_order_main`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jform_order_main` (
  `id` varchar(36) NOT NULL COMMENT '主键',
  `order_code` varchar(50) DEFAULT NULL COMMENT '订单号',
  `order_date` datetime DEFAULT NULL COMMENT '订单日期',
  `order_money` double(10,3) DEFAULT NULL COMMENT '订单金额',
  `content` varchar(500) DEFAULT NULL COMMENT '备注',
  `ctype` varchar(500) DEFAULT NULL COMMENT '订单扫描件',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jform_order_ticket`
--

DROP TABLE IF EXISTS `jform_order_ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jform_order_ticket` (
  `id` varchar(36) NOT NULL COMMENT '主键',
  `ticket_code` varchar(100) NOT NULL COMMENT '航班号',
  `tickect_date` datetime NOT NULL COMMENT '航班时间',
  `fck_id` varchar(36) NOT NULL COMMENT '外键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jform_price1`
--

DROP TABLE IF EXISTS `jform_price1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jform_price1` (
  `id` varchar(36) NOT NULL,
  `a` double NOT NULL COMMENT '机构合计',
  `b1` double NOT NULL COMMENT '行政小计',
  `b11` varchar(100) NOT NULL COMMENT '行政省',
  `b12` varchar(100) NOT NULL COMMENT '行政市',
  `b13` varchar(100) NOT NULL COMMENT '行政县',
  `b2` double NOT NULL COMMENT '事业合计',
  `b3` double NOT NULL COMMENT '参公小计',
  `b31` varchar(100) NOT NULL COMMENT '参公省',
  `b32` varchar(100) NOT NULL COMMENT '参公市',
  `b33` varchar(100) NOT NULL COMMENT '参公县',
  `c1` double NOT NULL COMMENT '全额拨款',
  `c2` double NOT NULL COMMENT '差额拨款',
  `c3` double NOT NULL COMMENT '自收自支',
  `d` int(11) NOT NULL COMMENT '经费合计',
  `d1` longtext NOT NULL COMMENT '机构资质',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jform_resume_degree_info`
--

DROP TABLE IF EXISTS `jform_resume_degree_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jform_resume_degree_info` (
  `id` varchar(36) NOT NULL COMMENT 'id',
  `resume_id` varchar(36) DEFAULT NULL COMMENT '简历主键',
  `begin_date` datetime DEFAULT NULL COMMENT '开始时间',
  `end_date` datetime DEFAULT NULL COMMENT '结束时间',
  `school_name` varchar(100) DEFAULT NULL COMMENT '学校名称',
  `major` varchar(100) DEFAULT NULL COMMENT '专业',
  `degree` varchar(30) DEFAULT NULL COMMENT '学历',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jform_resume_exp_info`
--

DROP TABLE IF EXISTS `jform_resume_exp_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jform_resume_exp_info` (
  `id` varchar(36) NOT NULL COMMENT 'id',
  `resume_id` varchar(36) DEFAULT NULL COMMENT '简历信息表ID',
  `begin_date` datetime DEFAULT NULL COMMENT '开始日期',
  `end_date` datetime DEFAULT NULL COMMENT '结束日期',
  `company_name` varchar(200) NOT NULL COMMENT '公司名称',
  `depart_name` varchar(100) DEFAULT NULL COMMENT '部门名称',
  `post` varchar(50) DEFAULT NULL COMMENT '职位',
  `experience` varchar(2000) DEFAULT NULL COMMENT '工作描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jform_resume_info`
--

DROP TABLE IF EXISTS `jform_resume_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jform_resume_info` (
  `id` varchar(36) NOT NULL COMMENT 'id',
  `name` varchar(50) NOT NULL COMMENT '姓名',
  `sex` varchar(10) NOT NULL COMMENT '性别',
  `birthday` datetime DEFAULT NULL COMMENT '生日',
  `telnum` varchar(30) DEFAULT NULL COMMENT '电话号码',
  `email` varchar(50) DEFAULT NULL COMMENT '电子邮箱',
  `degree` varchar(50) DEFAULT NULL COMMENT '最高学历',
  `workyear` varchar(20) DEFAULT NULL COMMENT '工作年限',
  `cardid` varchar(50) DEFAULT NULL COMMENT '身份证号',
  `habitation` varchar(100) DEFAULT NULL COMMENT '现居地',
  `residence` varchar(100) DEFAULT NULL COMMENT '户口所在地',
  `salary` varchar(20) DEFAULT NULL COMMENT '期望薪资',
  `work_place` varchar(50) DEFAULT NULL COMMENT '期望工作地点',
  `work_type` varchar(50) DEFAULT NULL COMMENT '工作类型',
  `arrival_time` datetime DEFAULT NULL COMMENT '到岗时间',
  `introduction` varchar(500) DEFAULT NULL COMMENT '自我评价',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jform_tree`
--

DROP TABLE IF EXISTS `jform_tree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jform_tree` (
  `id` varchar(36) NOT NULL COMMENT '主键',
  `create_name` varchar(50) DEFAULT NULL COMMENT '创建人名称',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人登录名称',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_name` varchar(50) DEFAULT NULL COMMENT '更新人名称',
  `update_by` varchar(50) DEFAULT NULL COMMENT '更新人登录名称',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `name` varchar(32) DEFAULT NULL COMMENT '物料编码',
  `father_id` varchar(32) DEFAULT NULL COMMENT '父ID',
  `age` varchar(32) DEFAULT NULL COMMENT 'age',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jfrom_order`
--

DROP TABLE IF EXISTS `jfrom_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jfrom_order` (
  `id` varchar(36) NOT NULL,
  `create_name` varchar(50) DEFAULT NULL COMMENT '创建人名称',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人登录名称',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_name` varchar(50) DEFAULT NULL COMMENT '更新人名称',
  `update_by` varchar(50) DEFAULT NULL COMMENT '更新人登录名称',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `sys_org_code` varchar(50) DEFAULT NULL COMMENT '所属部门',
  `sys_company_code` varchar(50) DEFAULT NULL COMMENT '所属公司',
  `bpm_status` varchar(32) DEFAULT '1' COMMENT '流程状态',
  `receiver_name` varchar(56) DEFAULT NULL COMMENT '收货人',
  `receiver_mobile` varchar(32) DEFAULT NULL COMMENT '联系电话',
  `receiver_state` varchar(32) DEFAULT NULL COMMENT '收货省',
  `receiver_city` varchar(32) DEFAULT NULL COMMENT '收货市',
  `receiver_district` varchar(32) DEFAULT NULL COMMENT '收货区',
  `receiver_address` varchar(128) DEFAULT NULL COMMENT '收货地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jfrom_order_line`
--

DROP TABLE IF EXISTS `jfrom_order_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jfrom_order_line` (
  `id` varchar(36) NOT NULL COMMENT '主键',
  `create_name` varchar(50) DEFAULT NULL COMMENT '创建人名称',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人登录名称',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_name` varchar(50) DEFAULT NULL COMMENT '更新人名称',
  `update_by` varchar(50) DEFAULT NULL COMMENT '更新人登录名称',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `sys_org_code` varchar(50) DEFAULT NULL COMMENT '所属部门',
  `sys_company_code` varchar(50) DEFAULT NULL COMMENT '所属公司',
  `bpm_status` varchar(32) DEFAULT '1' COMMENT '流程状态',
  `orderid` varchar(36) DEFAULT NULL COMMENT '订单ID',
  `item_name` varchar(128) DEFAULT NULL COMMENT '商品名称',
  `qty` int(32) DEFAULT NULL COMMENT '商品数量',
  `price` decimal(32,0) DEFAULT NULL COMMENT '商品价格',
  `amount` decimal(32,0) DEFAULT NULL COMMENT '金额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jp_chat_message_his`
--

DROP TABLE IF EXISTS `jp_chat_message_his`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jp_chat_message_his` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `msg_from` varchar(255) NOT NULL,
  `msg_to` varchar(255) DEFAULT NULL,
  `msg_data` varchar(5000) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=218 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jp_demo_activity`
--

DROP TABLE IF EXISTS `jp_demo_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jp_demo_activity` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `name` varchar(100) NOT NULL COMMENT '活动名称',
  `begin_time` datetime DEFAULT NULL COMMENT '活动开始时间',
  `end_time` datetime DEFAULT NULL COMMENT ' 活动结束时间',
  `hdurl` varchar(300) DEFAULT NULL COMMENT '入口地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='红包活动表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jp_demo_auth`
--

DROP TABLE IF EXISTS `jp_demo_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jp_demo_auth` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '序号',
  `auth_id` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '权限编码',
  `auth_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '权限名称',
  `auth_type` varchar(2) COLLATE utf8_bin DEFAULT NULL COMMENT '权限类型 0:菜单;1:功能',
  `auth_contr` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '权限控制',
  `parent_auth_id` char(12) COLLATE utf8_bin DEFAULT NULL COMMENT '上一级权限编码',
  `leaf_ind` char(2) COLLATE utf8_bin DEFAULT NULL COMMENT '是否叶子节点',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_authid` (`auth_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='运营系统权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jp_demo_order_custom`
--

DROP TABLE IF EXISTS `jp_demo_order_custom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jp_demo_order_custom` (
  `ID` varchar(32) NOT NULL,
  `CREATE_DT` datetime DEFAULT NULL,
  `CRTUSER` varchar(12) DEFAULT NULL,
  `CRTUSER_NAME` varchar(10) DEFAULT NULL,
  `DEL_DT` datetime DEFAULT NULL,
  `DELFLAG` int(11) DEFAULT '0',
  `GO_ORDER_CODE` varchar(12) NOT NULL COMMENT '团购订单号',
  `GOC_BUSS_CONTENT` varchar(33) DEFAULT NULL COMMENT '业务',
  `GOC_CONTENT` varchar(66) DEFAULT NULL COMMENT '备注',
  `GOC_CUS_NAME` varchar(16) DEFAULT NULL COMMENT '姓名',
  `GOC_IDCARD` varchar(18) DEFAULT NULL COMMENT '身份证号',
  `GOC_PASSPORT_CODE` varchar(10) DEFAULT NULL COMMENT '护照号',
  `GOC_SEX` varchar(255) DEFAULT NULL COMMENT '性别',
  `MODIFIER` varchar(12) DEFAULT NULL,
  `MODIFIER_NAME` varchar(10) DEFAULT NULL,
  `MODIFY_DT` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jp_demo_order_main`
--

DROP TABLE IF EXISTS `jp_demo_order_main`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jp_demo_order_main` (
  `ID` varchar(32) NOT NULL,
  `CREATE_DT` datetime DEFAULT NULL,
  `CRTUSER` varchar(12) DEFAULT NULL,
  `CRTUSER_NAME` varchar(10) DEFAULT NULL,
  `DEL_DT` datetime DEFAULT NULL,
  `DELFLAG` int(11) DEFAULT '0',
  `GO_ALL_PRICE` decimal(10,2) DEFAULT NULL COMMENT '总价(不含返款)',
  `GO_CONTACT_NAME` varchar(16) DEFAULT NULL COMMENT '联系人',
  `GO_CONTENT` varchar(66) DEFAULT NULL COMMENT '备注',
  `GO_ORDER_CODE` varchar(12) NOT NULL COMMENT '订单号',
  `GO_ORDER_COUNT` int(11) DEFAULT NULL COMMENT '订单人数',
  `GO_RETURN_PRICE` decimal(10,2) DEFAULT NULL COMMENT '返款',
  `GO_TELPHONE` varchar(11) DEFAULT NULL COMMENT '手机',
  `GODER_TYPE` varchar(255) DEFAULT NULL COMMENT '订单类型',
  `MODIFIER` varchar(12) DEFAULT NULL,
  `MODIFIER_NAME` varchar(10) DEFAULT NULL,
  `MODIFY_DT` datetime DEFAULT NULL,
  `USERTYPE` varchar(255) DEFAULT NULL COMMENT '顾客类型 : 1直客 2同行',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jp_demo_order_product`
--

DROP TABLE IF EXISTS `jp_demo_order_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jp_demo_order_product` (
  `ID` varchar(32) NOT NULL,
  `CREATE_DT` datetime DEFAULT NULL,
  `CRTUSER` varchar(12) DEFAULT NULL,
  `CRTUSER_NAME` varchar(10) DEFAULT NULL,
  `DEL_DT` datetime DEFAULT NULL,
  `DELFLAG` int(11) DEFAULT '0',
  `GO_ORDER_CODE` varchar(12) NOT NULL COMMENT '团购订单号',
  `GOP_CONTENT` varchar(66) DEFAULT NULL COMMENT '备注',
  `GOP_COUNT` int(11) DEFAULT NULL COMMENT '个数',
  `GOP_ONE_PRICE` decimal(10,2) DEFAULT NULL COMMENT '单价',
  `GOP_PRODUCT_NAME` varchar(33) DEFAULT NULL COMMENT '产品名称',
  `GOP_PRODUCT_TYPE` varchar(1) NOT NULL COMMENT '服务项目类型',
  `GOP_SUM_PRICE` decimal(10,2) DEFAULT NULL COMMENT '小计',
  `MODIFIER` varchar(12) DEFAULT NULL,
  `MODIFIER_NAME` varchar(10) DEFAULT NULL,
  `MODIFY_DT` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jp_inner_mail`
--

DROP TABLE IF EXISTS `jp_inner_mail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jp_inner_mail` (
  `id` varchar(36) NOT NULL COMMENT '主键',
  `create_name` varchar(50) DEFAULT NULL COMMENT '创建人名称',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人登录名称',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `title` varchar(100) DEFAULT NULL COMMENT '主题',
  `attachment` varchar(1000) DEFAULT NULL COMMENT '附件',
  `content` longtext COMMENT '内容',
  `status` varchar(50) DEFAULT NULL COMMENT '状态',
  `receiver_names` varchar(300) DEFAULT NULL COMMENT '接收者姓名列表',
  `receiver_ids` varchar(300) DEFAULT NULL COMMENT '收件人标识列表',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jp_inner_mail_attach`
--

DROP TABLE IF EXISTS `jp_inner_mail_attach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jp_inner_mail_attach` (
  `id` varchar(32) NOT NULL,
  `mailid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jp_inner_mail_receiver`
--

DROP TABLE IF EXISTS `jp_inner_mail_receiver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jp_inner_mail_receiver` (
  `id` varchar(36) NOT NULL,
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `mail_id` varchar(36) DEFAULT NULL COMMENT '邮件标识',
  `user_id` varchar(36) DEFAULT NULL COMMENT '收件人标识',
  `status` varchar(50) DEFAULT NULL COMMENT '收件状态',
  `isdelete` char(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_userid` (`user_id`) USING BTREE,
  KEY `index_mailid` (`mail_id`) USING BTREE,
  KEY `index_status` (`status`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_admin_category`
--

DROP TABLE IF EXISTS `s_admin_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_admin_category` (
  `id` varchar(255) NOT NULL COMMENT '主键',
  `category_id` varchar(255) DEFAULT NULL COMMENT '类别外键',
  `admin_id` varchar(255) DEFAULT NULL COMMENT '管理员外键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_admin_product`
--

DROP TABLE IF EXISTS `s_admin_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_admin_product` (
  `id` varchar(255) NOT NULL COMMENT '主键 ',
  `product_id` varchar(255) DEFAULT NULL COMMENT '商品外键',
  `admin_id` varchar(255) DEFAULT NULL COMMENT '管理员外键',
  `price` double DEFAULT NULL COMMENT '商品价格',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_banner`
--

DROP TABLE IF EXISTS `s_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_banner` (
  `id` varchar(255) NOT NULL,
  `imgSrc` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_category`
--

DROP TABLE IF EXISTS `s_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_category` (
  `id` varchar(255) NOT NULL COMMENT '主键',
  `name` varchar(255) DEFAULT NULL COMMENT '类别名字',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_order`
--

DROP TABLE IF EXISTS `s_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_order` (
  `id` varchar(255) NOT NULL COMMENT '主键',
  `order_num` varchar(255) DEFAULT NULL COMMENT '订单编号',
  `order_status` varchar(255) DEFAULT NULL COMMENT '订单状态',
  `order_salary` double DEFAULT NULL COMMENT '订单总价',
  `shop_id` varchar(255) DEFAULT NULL COMMENT '普通店长外键',
  `user_id` varchar(255) DEFAULT NULL COMMENT '用户外键',
  `time` datetime DEFAULT NULL COMMENT '下单时间',
  `admin_id` varchar(255) DEFAULT NULL COMMENT '管理员外键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_order_item`
--

DROP TABLE IF EXISTS `s_order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_order_item` (
  `id` varchar(255) NOT NULL COMMENT '主键',
  `order_id` varchar(255) DEFAULT NULL COMMENT '订单编号',
  `product_id` varchar(255) DEFAULT NULL COMMENT '商品主键',
  `price` double DEFAULT NULL COMMENT '单价',
  `count` int(11) DEFAULT NULL COMMENT '数量',
  `name` varchar(100) DEFAULT NULL COMMENT '商品名字',
  `description` varchar(100) DEFAULT NULL COMMENT '商品描述',
  `imgSrc` varchar(100) DEFAULT NULL COMMENT '商品主图',
  `productNum` varchar(100) DEFAULT NULL COMMENT '商品编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_product`
--

DROP TABLE IF EXISTS `s_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_product` (
  `id` varchar(255) NOT NULL COMMENT '主键',
  `name` varchar(255) NOT NULL COMMENT '商品标题',
  `description` varchar(255) NOT NULL COMMENT '商品描述',
  `price` double NOT NULL COMMENT '商品价格',
  `imgSrc` varchar(255) NOT NULL COMMENT '商品主图',
  `category_id` varchar(255) NOT NULL COMMENT '类别外键',
  `content` mediumtext NOT NULL COMMENT '商品内容',
  `flag` varchar(255) DEFAULT NULL COMMENT '仓库标志',
  `productNum` varchar(100) DEFAULT NULL COMMENT '商品编号',
  `chinaUnit` varchar(255) DEFAULT NULL,
  `italyUnit` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_url`
--

DROP TABLE IF EXISTS `s_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_url` (
  `id` varchar(255) NOT NULL COMMENT '主键',
  `url` varchar(255) DEFAULT NULL COMMENT '店铺地址',
  `status` varchar(255) DEFAULT NULL COMMENT '店铺状态',
  `admin_id` varchar(255) DEFAULT NULL COMMENT '店长外键',
  `name1` varchar(100) DEFAULT NULL COMMENT '中文名字',
  `name2` varchar(100) DEFAULT NULL COMMENT '意大利名字',
  `recommend` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `s_user`
--

DROP TABLE IF EXISTS `s_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_user` (
  `id` varchar(255) NOT NULL COMMENT '主键',
  `username` varchar(255) NOT NULL COMMENT '用户名',
  `password` varchar(255) DEFAULT NULL COMMENT '用户密码',
  `phone` varchar(255) DEFAULT NULL COMMENT '电话号',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `super_query_field`
--

DROP TABLE IF EXISTS `super_query_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `super_query_field` (
  `id` varchar(36) NOT NULL COMMENT '主键',
  `create_name` varchar(50) DEFAULT NULL COMMENT '创建人名称',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人登录名称',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_name` varchar(50) DEFAULT NULL COMMENT '更新人名称',
  `update_by` varchar(50) DEFAULT NULL COMMENT '更新人登录名称',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `sys_org_code` varchar(50) DEFAULT NULL COMMENT '所属部门',
  `sys_company_code` varchar(50) DEFAULT NULL COMMENT '所属公司',
  `seq` varchar(32) DEFAULT NULL COMMENT '序号',
  `table_name` varchar(32) DEFAULT NULL COMMENT '表名',
  `name` varchar(32) DEFAULT NULL COMMENT '字段名',
  `txt` varchar(32) DEFAULT NULL COMMENT '字段文本',
  `ctype` varchar(32) DEFAULT NULL COMMENT '字段类型',
  `stype` varchar(32) DEFAULT NULL COMMENT '控件类型',
  `dict_table` varchar(32) DEFAULT NULL COMMENT '字典Table',
  `dict_code` varchar(32) DEFAULT NULL COMMENT '字典Code',
  `dict_text` varchar(32) DEFAULT NULL COMMENT '字典Text',
  `main_id` varchar(32) DEFAULT NULL COMMENT '外键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字段配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `super_query_history`
--

DROP TABLE IF EXISTS `super_query_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `super_query_history` (
  `id` varchar(36) NOT NULL,
  `create_name` varchar(50) DEFAULT NULL COMMENT '创建人名称',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人登录名称',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_name` varchar(50) DEFAULT NULL COMMENT '更新人名称',
  `update_by` varchar(50) DEFAULT NULL COMMENT '更新人登录名称',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `sys_org_code` varchar(50) DEFAULT NULL COMMENT '所属部门',
  `sys_company_code` varchar(50) DEFAULT NULL COMMENT '所属公司',
  `user_id` varchar(50) DEFAULT NULL COMMENT '用户id',
  `record` longtext COMMENT '记录',
  `query_type` varchar(255) DEFAULT NULL COMMENT '查询类型',
  `query_code` varchar(255) DEFAULT NULL COMMENT '查询编码',
  `history_name` varchar(255) DEFAULT NULL COMMENT '名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='高级查询历史记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `super_query_main`
--

DROP TABLE IF EXISTS `super_query_main`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `super_query_main` (
  `id` varchar(36) NOT NULL,
  `create_name` varchar(50) DEFAULT NULL COMMENT '创建人名称',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人登录名称',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_name` varchar(50) DEFAULT NULL COMMENT '更新人名称',
  `update_by` varchar(50) DEFAULT NULL COMMENT '更新人登录名称',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `sys_org_code` varchar(50) DEFAULT NULL COMMENT '所属部门',
  `sys_company_code` varchar(50) DEFAULT NULL COMMENT '所属公司',
  `query_name` varchar(50) DEFAULT NULL COMMENT '查询规则名称',
  `query_code` varchar(50) DEFAULT NULL COMMENT '查询规则编码',
  `query_type` varchar(50) DEFAULT NULL COMMENT '查询类型',
  `content` varchar(32) DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='高级查询';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `super_query_table`
--

DROP TABLE IF EXISTS `super_query_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `super_query_table` (
  `id` varchar(36) NOT NULL,
  `create_name` varchar(50) DEFAULT NULL COMMENT '创建人名称',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人登录名称',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_name` varchar(50) DEFAULT NULL COMMENT '更新人名称',
  `update_by` varchar(50) DEFAULT NULL COMMENT '更新人登录名称',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `sys_org_code` varchar(50) DEFAULT NULL COMMENT '所属部门',
  `sys_company_code` varchar(50) DEFAULT NULL COMMENT '所属公司',
  `seq` varchar(32) DEFAULT NULL COMMENT '序号',
  `table_name` varchar(32) DEFAULT NULL COMMENT '表名',
  `instruction` varchar(255) DEFAULT NULL COMMENT '说明',
  `is_main` varchar(32) DEFAULT NULL COMMENT '是否是主表',
  `fk_field` varchar(32) DEFAULT NULL COMMENT '外键字段',
  `main_id` varchar(32) DEFAULT NULL COMMENT '外键id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='表组合';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_s_attachment`
--

DROP TABLE IF EXISTS `t_s_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_s_attachment` (
  `ID` varchar(32) NOT NULL COMMENT 'ID',
  `attachmentcontent` longblob COMMENT '附件内容',
  `attachmenttitle` varchar(100) DEFAULT NULL COMMENT '附件名称',
  `businesskey` varchar(32) DEFAULT NULL COMMENT '业务类主键',
  `createdate` datetime DEFAULT NULL COMMENT '创建时间',
  `extend` varchar(32) DEFAULT NULL COMMENT '扩展名',
  `note` longtext COMMENT 'note',
  `realpath` varchar(100) DEFAULT NULL COMMENT '附件路径',
  `subclassname` longtext COMMENT '子类名称全路径',
  `swfpath` longtext COMMENT 'swf格式路径',
  `BUSENTITYNAME` varchar(100) DEFAULT NULL COMMENT 'BUSENTITYNAME',
  `INFOTYPEID` varchar(32) DEFAULT NULL COMMENT 'INFOTYPEID',
  `USERID` varchar(32) DEFAULT NULL COMMENT '用户ID',
  PRIMARY KEY (`ID`),
  KEY `FK_mnq23hlc835n4ufgjl7nkn3bd` (`USERID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_s_base_user`
--

DROP TABLE IF EXISTS `t_s_base_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_s_base_user` (
  `ID` varchar(32) NOT NULL COMMENT 'ID',
  `activitiSync` smallint(6) DEFAULT NULL COMMENT '同步流程',
  `browser` varchar(20) DEFAULT NULL COMMENT '浏览器',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `realname` varchar(50) DEFAULT NULL COMMENT '真实名字',
  `signature` blob COMMENT '签名',
  `status` smallint(6) DEFAULT NULL COMMENT '有效状态',
  `userkey` varchar(200) DEFAULT NULL COMMENT '用户KEY',
  `username` varchar(10) NOT NULL COMMENT '用户账号',
  `departid` varchar(32) DEFAULT NULL COMMENT '部门ID',
  `user_name_en` varchar(500) DEFAULT NULL COMMENT '英文名',
  `delete_flag` smallint(6) DEFAULT NULL COMMENT '删除状态',
  PRIMARY KEY (`ID`),
  KEY `FK_15jh1g4iem1857546ggor42et` (`departid`),
  KEY `index_login` (`password`,`username`),
  KEY `idx_deleteflg` (`delete_flag`),
  CONSTRAINT `FK_15jh1g4iem1857546ggor42et` FOREIGN KEY (`departid`) REFERENCES `t_s_depart` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_s_black_list`
--

DROP TABLE IF EXISTS `t_s_black_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_s_black_list` (
  `id` varchar(36) NOT NULL,
  `create_name` varchar(50) DEFAULT NULL COMMENT '创建人名称',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人登录名称',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_name` varchar(50) DEFAULT NULL COMMENT '更新人名称',
  `update_by` varchar(50) DEFAULT NULL COMMENT '更新人登录名称',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `sys_org_code` varchar(50) DEFAULT NULL COMMENT '所属部门',
  `sys_company_code` varchar(50) DEFAULT NULL COMMENT '所属公司',
  `bpm_status` varchar(32) DEFAULT '1' COMMENT '流程状态',
  `ip` varchar(32) DEFAULT NULL COMMENT 'ip地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_s_category`
--

DROP TABLE IF EXISTS `t_s_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_s_category` (
  `id` varchar(36) NOT NULL COMMENT 'ID',
  `icon_id` varchar(32) DEFAULT NULL COMMENT '图标ID',
  `code` varchar(32) NOT NULL COMMENT '类型编码',
  `name` varchar(32) NOT NULL COMMENT '类型名称',
  `create_name` varchar(50) NOT NULL COMMENT '创建人名称',
  `create_by` varchar(50) NOT NULL COMMENT '创建人登录名称',
  `create_date` datetime NOT NULL COMMENT '创建日期',
  `update_name` varchar(50) DEFAULT NULL COMMENT '更新人名称',
  `update_by` varchar(50) DEFAULT NULL COMMENT '更新人登录名称',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `parent_id` varchar(32) DEFAULT NULL COMMENT '上级ID',
  `sys_org_code` varchar(10) NOT NULL COMMENT '机构',
  `sys_company_code` varchar(10) NOT NULL COMMENT '公司',
  `PARENT_CODE` varchar(32) DEFAULT NULL COMMENT '父邮编',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_code` (`code`),
  KEY `index_parent_id` (`parent_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分类管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_s_company_position`
--

DROP TABLE IF EXISTS `t_s_company_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_s_company_position` (
  `id` varchar(32) NOT NULL COMMENT '序号',
  `company_id` varchar(36) DEFAULT NULL COMMENT '公司ID',
  `position_code` varchar(64) DEFAULT NULL COMMENT '岗位代码',
  `position_name` varchar(100) DEFAULT NULL COMMENT '岗位名称',
  `position_name_en` varchar(255) DEFAULT NULL COMMENT '岗位英文名',
  `position_name_abbr` varchar(255) DEFAULT NULL COMMENT '岗位缩写',
  `position_level` varchar(50) DEFAULT NULL COMMENT '岗位级别',
  `memo` varchar(500) DEFAULT NULL COMMENT '备注',
  `del_flag` int(11) DEFAULT NULL COMMENT '缩写',
  `create_name` varchar(50) DEFAULT NULL COMMENT '创建人名称',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人账号',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_name` varchar(50) DEFAULT NULL COMMENT '更新人名称',
  `update_by` varchar(50) DEFAULT NULL COMMENT '更新人账号',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `sys_company_code` varchar(50) DEFAULT NULL COMMENT '数据所属公司',
  `sys_org_code` varchar(50) DEFAULT NULL COMMENT '数据所属部门',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统岗位表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_s_data_log`
--

DROP TABLE IF EXISTS `t_s_data_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_s_data_log` (
  `id` varchar(36) NOT NULL COMMENT 'id',
  `create_name` varchar(50) DEFAULT NULL COMMENT '创建人名称',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人登录名称',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_name` varchar(50) DEFAULT NULL COMMENT '更新人名称',
  `update_by` varchar(50) DEFAULT NULL COMMENT '更新人登录名称',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `sys_org_code` varchar(50) DEFAULT NULL COMMENT '所属部门',
  `sys_company_code` varchar(50) DEFAULT NULL COMMENT '所属公司',
  `table_name` varchar(32) DEFAULT NULL COMMENT '表名',
  `data_id` varchar(32) DEFAULT NULL COMMENT '数据ID',
  `data_content` text COMMENT '数据内容',
  `version_number` int(11) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`id`),
  KEY `sindex` (`table_name`,`data_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_s_data_rule`
--

DROP TABLE IF EXISTS `t_s_data_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_s_data_rule` (
  `id` varchar(96) DEFAULT NULL COMMENT 'ID',
  `rule_name` varchar(96) DEFAULT NULL COMMENT '数据权限规则名称',
  `rule_column` varchar(300) DEFAULT NULL COMMENT '字段',
  `rule_conditions` varchar(300) DEFAULT NULL COMMENT '条件',
  `rule_value` varchar(300) DEFAULT NULL COMMENT '规则值',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(96) DEFAULT NULL,
  `create_name` varchar(96) DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `update_by` varchar(96) DEFAULT NULL COMMENT '修改人',
  `update_name` varchar(96) DEFAULT NULL COMMENT '修改人名字',
  `functionId` varchar(96) DEFAULT NULL COMMENT '菜单ID',
  KEY `index_fucntionid` (`functionId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_s_data_source`
--

DROP TABLE IF EXISTS `t_s_data_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_s_data_source` (
  `id` varchar(36) NOT NULL COMMENT 'ID',
  `db_key` varchar(50) NOT NULL COMMENT '多数据源KEY',
  `description` varchar(50) NOT NULL COMMENT '描述',
  `driver_class` varchar(50) NOT NULL COMMENT '驱动class',
  `url` varchar(200) NOT NULL COMMENT 'db链接',
  `db_user` varchar(50) NOT NULL COMMENT '用户名',
  `db_password` varchar(50) DEFAULT NULL COMMENT '密码',
  `db_type` varchar(50) DEFAULT NULL COMMENT '数据库类型',
  `db_name` varchar(50) DEFAULT NULL COMMENT '数据源名字',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_s_depart`
--

DROP TABLE IF EXISTS `t_s_depart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_s_depart` (
  `ID` varchar(32) NOT NULL COMMENT 'ID',
  `departname` varchar(100) NOT NULL COMMENT '部门名称',
  `description` longtext COMMENT '描述',
  `parentdepartid` varchar(32) DEFAULT NULL COMMENT '父部门ID',
  `org_code` varchar(64) DEFAULT NULL COMMENT '机构编码',
  `org_type` varchar(1) DEFAULT NULL COMMENT '机构类型',
  `mobile` varchar(32) DEFAULT NULL COMMENT '手机号',
  `fax` varchar(32) DEFAULT NULL COMMENT '传真',
  `address` varchar(100) DEFAULT NULL COMMENT '地址',
  `depart_order` varchar(5) DEFAULT '0' COMMENT '排序',
  `departname_en` varchar(500) DEFAULT NULL COMMENT '英文名',
  `departname_abbr` varchar(500) DEFAULT NULL COMMENT '缩写',
  `memo` varchar(500) DEFAULT NULL COMMENT '备注',
  `create_name` varchar(50) DEFAULT NULL COMMENT '创建人名称',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人账号',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_name` varchar(50) DEFAULT NULL COMMENT '更新人名称',
  `update_by` varchar(50) DEFAULT NULL COMMENT '更新人账号',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `sys_company_code` varchar(50) DEFAULT NULL COMMENT '数据所属公司',
  `sys_org_code` varchar(50) DEFAULT NULL COMMENT '数据所属部门',
  PRIMARY KEY (`ID`),
  KEY `FK_knnm3wb0bembwvm0il7tf6686` (`parentdepartid`),
  KEY `index_org_code` (`org_code`) USING BTREE,
  KEY `index_org_type` (`org_type`) USING BTREE,
  KEY `index_depart_order` (`depart_order`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_s_depart_auth_group`
--

DROP TABLE IF EXISTS `t_s_depart_auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_s_depart_auth_group` (
  `id` varchar(36) NOT NULL COMMENT 'ID',
  `group_name` varchar(100) DEFAULT NULL COMMENT '权限组名称',
  `dept_id` varchar(36) DEFAULT NULL COMMENT '部门ID',
  `dept_code` varchar(50) DEFAULT NULL COMMENT '部门编码',
  `dept_name` varchar(100) DEFAULT NULL COMMENT '部门名称',
  `depart_type` varchar(2) DEFAULT NULL COMMENT '类型1/公司2/部门4/供应商',
  `level` int(10) DEFAULT NULL COMMENT '级别',
  `create_name` varchar(50) DEFAULT NULL COMMENT '创建人',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人id',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_name` varchar(50) DEFAULT NULL COMMENT '修改人',
  `update_by` varchar(50) DEFAULT NULL COMMENT '修改人id',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `sys_org_code` varchar(50) DEFAULT NULL COMMENT '所属部门',
  `sys_company_code` varchar(50) DEFAULT NULL COMMENT '所属公司',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_s_depart_authg_function_rel`
--

DROP TABLE IF EXISTS `t_s_depart_authg_function_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_s_depart_authg_function_rel` (
  `id` varchar(36) NOT NULL COMMENT 'ID',
  `group_id` varchar(36) DEFAULT NULL COMMENT '权限组ID',
  `auth_id` varchar(36) DEFAULT NULL COMMENT '权限ID',
  `operation` varchar(2000) DEFAULT NULL COMMENT '页面操作权限',
  `datarule` varchar(1000) DEFAULT NULL COMMENT '数据权限',
  `create_name` varchar(50) DEFAULT NULL COMMENT '创建人',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人id',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_name` varchar(50) DEFAULT NULL COMMENT '修改人',
  `update_by` varchar(50) DEFAULT NULL COMMENT '修改人id',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `sys_org_code` varchar(50) DEFAULT NULL COMMENT '所属部门',
  `sys_company_code` varchar(50) DEFAULT NULL COMMENT '所属公司',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_s_depart_authg_manager`
--

DROP TABLE IF EXISTS `t_s_depart_authg_manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_s_depart_authg_manager` (
  `id` varchar(36) NOT NULL COMMENT 'ID',
  `group_id` varchar(36) DEFAULT NULL COMMENT '权限组ID',
  `user_id` varchar(36) DEFAULT NULL COMMENT '用户ID',
  `type` int(3) DEFAULT NULL COMMENT '权限组类型',
  `create_name` varchar(50) DEFAULT NULL COMMENT '创建人',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人id',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_name` varchar(50) DEFAULT NULL COMMENT '修改人',
  `update_by` varchar(50) DEFAULT NULL COMMENT '修改人id',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `sys_org_code` varchar(50) DEFAULT NULL COMMENT '所属部门',
  `sys_company_code` varchar(50) DEFAULT NULL COMMENT '所属公司',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_s_document`
--

DROP TABLE IF EXISTS `t_s_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_s_document` (
  `id` varchar(32) NOT NULL,
  `typeid` varchar(32) DEFAULT NULL,
  `documentstate` smallint(6) DEFAULT NULL,
  `documenttitle` varchar(100) DEFAULT NULL,
  `pictureindex` blob,
  `showhome` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_qr3qlmgkflj35m5ci1xv0vvg3` (`typeid`) USING BTREE,
  KEY `FK_f2mc12eu0umghp2i70apmtxjl` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_s_fill_rule`
--

DROP TABLE IF EXISTS `t_s_fill_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_s_fill_rule` (
  `id` varchar(36) NOT NULL,
  `create_name` varchar(50) DEFAULT NULL COMMENT '创建人名称',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人登录名称',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_name` varchar(50) DEFAULT NULL COMMENT '更新人名称',
  `update_by` varchar(50) DEFAULT NULL COMMENT '更新人登录名称',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `sys_org_code` varchar(50) DEFAULT NULL COMMENT '所属部门',
  `sys_company_code` varchar(50) DEFAULT NULL COMMENT '所属公司',
  `bpm_status` varchar(32) DEFAULT '1' COMMENT '流程状态',
  `rule_code` varchar(255) DEFAULT NULL COMMENT '规则code',
  `rule_name` varchar(255) DEFAULT NULL COMMENT '规则名称',
  `rule_class` longtext COMMENT '规则实现类',
  `rule_param` longtext COMMENT '规则参数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_s_function`
--

DROP TABLE IF EXISTS `t_s_function`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_s_function` (
  `ID` varchar(32) NOT NULL COMMENT 'ID',
  `functioniframe` smallint(6) DEFAULT NULL COMMENT '菜单地址打开方式',
  `functionlevel` smallint(6) DEFAULT NULL COMMENT '菜单等级',
  `functionname` varchar(50) NOT NULL COMMENT '菜单名字',
  `functionorder` varchar(255) DEFAULT NULL COMMENT '排序',
  `functionurl` varchar(500) DEFAULT NULL COMMENT 'URL',
  `parentfunctionid` varchar(32) DEFAULT NULL COMMENT '父菜单ID',
  `iconid` varchar(32) DEFAULT NULL COMMENT '图标ID',
  `desk_iconid` varchar(32) DEFAULT NULL COMMENT '桌面图标ID',
  `functiontype` smallint(6) DEFAULT NULL COMMENT '菜单类型',
  `function_icon_style` varchar(255) DEFAULT NULL COMMENT 'ace图标样式',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建人id',
  `create_name` varchar(32) DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(32) DEFAULT NULL COMMENT '修改人id',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_name` varchar(32) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`ID`),
  KEY `FK_brd7b3keorj8pmxcv8bpahnxp` (`parentfunctionid`),
  KEY `FK_q5tqo3v4ltsp1pehdxd59rccx` (`iconid`),
  KEY `FK_gbdacaoju6d5u53rp4jo4rbs9` (`desk_iconid`),
  KEY `index_url` (`functionurl`(255)),
  KEY `index_functiontype` (`functiontype`) USING BTREE,
  KEY `index_functionorder` (`functionorder`) USING BTREE,
  CONSTRAINT `FK_brd7b3keorj8pmxcv8bpahnxp` FOREIGN KEY (`parentfunctionid`) REFERENCES `t_s_function` (`ID`),
  CONSTRAINT `FK_gbdacaoju6d5u53rp4jo4rbs9` FOREIGN KEY (`desk_iconid`) REFERENCES `t_s_icon` (`ID`),
  CONSTRAINT `FK_q5tqo3v4ltsp1pehdxd59rccx` FOREIGN KEY (`iconid`) REFERENCES `t_s_icon` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_s_icon`
--

DROP TABLE IF EXISTS `t_s_icon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_s_icon` (
  `ID` varchar(32) NOT NULL COMMENT 'id',
  `extend` varchar(255) DEFAULT NULL COMMENT '图片后缀',
  `iconclas` varchar(200) DEFAULT NULL COMMENT '类型',
  `content` blob COMMENT '图片流内容',
  `name` varchar(100) NOT NULL COMMENT '名字',
  `path` longtext COMMENT '路径',
  `type` smallint(6) DEFAULT NULL COMMENT '类型 1系统图标/2菜单图标/3桌面图标',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_s_interface`
--

DROP TABLE IF EXISTS `t_s_interface`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_s_interface` (
  `id` varchar(36) NOT NULL,
  `create_name` varchar(50) DEFAULT NULL COMMENT '创建人名称',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人登录名称',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_name` varchar(50) DEFAULT NULL COMMENT '更新人名称',
  `update_by` varchar(50) DEFAULT NULL COMMENT '更新人登录名称',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `sys_org_code` varchar(50) DEFAULT NULL COMMENT '所属部门',
  `sys_company_code` varchar(50) DEFAULT NULL COMMENT '所属公司',
  `interface_name` varchar(50) NOT NULL COMMENT '权限名称',
  `interface_order` varchar(50) DEFAULT NULL COMMENT '排序',
  `interface_level` varchar(10) DEFAULT NULL COMMENT '接口等級',
  `interface_url` longtext COMMENT 'URL',
  `interface_code` varchar(64) NOT NULL COMMENT '接口编码',
  `interface_method` varchar(64) DEFAULT NULL COMMENT '请求方式',
  `parent_interface_id` varchar(32) DEFAULT NULL COMMENT '父菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_s_interface_datarule`
--

DROP TABLE IF EXISTS `t_s_interface_datarule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_s_interface_datarule` (
  `id` varchar(36) NOT NULL,
  `create_name` varchar(50) DEFAULT NULL COMMENT '创建人名称',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人登录名称',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_name` varchar(50) DEFAULT NULL COMMENT '更新人名称',
  `update_by` varchar(50) DEFAULT NULL COMMENT '更新人登录名称',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `sys_org_code` varchar(50) DEFAULT NULL COMMENT '所属部门',
  `sys_company_code` varchar(50) DEFAULT NULL COMMENT '所属公司',
  `rule_name` varchar(96) DEFAULT NULL COMMENT '接口权限规则名称',
  `rule_column` longtext COMMENT '字段',
  `rule_conditions` longtext COMMENT '条件',
  `rule_value` longtext COMMENT '规则值',
  `interface_id` varchar(32) DEFAULT NULL COMMENT '菜单id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_s_interrole`
--

DROP TABLE IF EXISTS `t_s_interrole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_s_interrole` (
  `id` varchar(32) NOT NULL COMMENT 'id',
  `role_code` varchar(10) DEFAULT NULL COMMENT '接口角色编码',
  `role_name` varchar(100) DEFAULT NULL COMMENT '接口角色名称',
  `update_name` varchar(32) DEFAULT NULL COMMENT '修改时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `update_by` varchar(32) DEFAULT NULL COMMENT '创建人id',
  `create_name` varchar(32) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建人id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='接口权限角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_s_interrole_interface`
--

DROP TABLE IF EXISTS `t_s_interrole_interface`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_s_interrole_interface` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `interface_id` varchar(32) DEFAULT NULL COMMENT '权限ID',
  `interrole_id` varchar(32) DEFAULT NULL COMMENT '接口角色ID',
  `data_rule` varchar(1000) DEFAULT NULL COMMENT '接口权限规则ID',
  UNIQUE KEY `uniq_interfaceid_interroleid` (`interface_id`,`interrole_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='接口权限角色关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_s_interrole_user`
--

DROP TABLE IF EXISTS `t_s_interrole_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_s_interrole_user` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `interrole_id` varchar(32) DEFAULT NULL COMMENT '接口角色ID',
  `user_id` varchar(32) DEFAULT NULL COMMENT '用户ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_interroleid_userid` (`interrole_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='接口角色和用户关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_s_log`
--

DROP TABLE IF EXISTS `t_s_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_s_log` (
  `ID` varchar(32) NOT NULL COMMENT 'id',
  `broswer` varchar(100) DEFAULT NULL COMMENT '浏览器',
  `logcontent` longtext NOT NULL COMMENT '日志内容',
  `loglevel` smallint(6) DEFAULT NULL COMMENT '日志级别',
  `note` longtext COMMENT 'IP',
  `operatetime` datetime NOT NULL COMMENT '操作时间',
  `operatetype` smallint(6) DEFAULT NULL COMMENT '操作类型',
  `userid` varchar(32) DEFAULT NULL COMMENT '用户ID',
  `username` varchar(10) DEFAULT NULL COMMENT '用户账号',
  `realname` varchar(50) DEFAULT NULL COMMENT '真实名字',
  PRIMARY KEY (`ID`),
  KEY `FK_oe64k4852uylhyc5a00rfwtay` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_s_muti_lang`
--

DROP TABLE IF EXISTS `t_s_muti_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_s_muti_lang` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `lang_key` varchar(50) DEFAULT NULL COMMENT '语言主键',
  `lang_context` varchar(500) DEFAULT NULL COMMENT '内容',
  `lang_code` varchar(50) DEFAULT NULL COMMENT '语言',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人编号',
  `create_name` varchar(50) DEFAULT NULL COMMENT '创建人姓名',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `update_by` varchar(50) DEFAULT NULL COMMENT '更新人编号',
  `update_name` varchar(50) DEFAULT NULL COMMENT '更新人姓名',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_langkey_langcode` (`lang_key`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_s_notice`
--

DROP TABLE IF EXISTS `t_s_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_s_notice` (
  `id` varchar(36) NOT NULL DEFAULT '' COMMENT 'ID',
  `notice_title` varchar(255) DEFAULT NULL COMMENT '通知标题',
  `notice_content` longtext COMMENT '通知公告内容',
  `notice_type` varchar(2) DEFAULT NULL COMMENT '通知公告类型（1：通知，2:公告）',
  `notice_level` varchar(2) DEFAULT NULL COMMENT '通告授权级别（1:全员，2：角色，3：用户）',
  `notice_term` datetime DEFAULT NULL COMMENT '阅读期限',
  `create_user` varchar(32) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='通知公告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_s_notice_authority_role`
--

DROP TABLE IF EXISTS `t_s_notice_authority_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_s_notice_authority_role` (
  `id` varchar(36) NOT NULL DEFAULT '' COMMENT 'ID',
  `notice_id` varchar(36) DEFAULT NULL COMMENT '通告ID',
  `role_id` varchar(32) DEFAULT NULL COMMENT '授权角色ID',
  PRIMARY KEY (`id`),
  KEY `index_noteid` (`notice_id`) USING BTREE,
  KEY `index_roleid` (`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='通告授权角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_s_notice_authority_user`
--

DROP TABLE IF EXISTS `t_s_notice_authority_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_s_notice_authority_user` (
  `id` varchar(36) NOT NULL DEFAULT '' COMMENT 'ID',
  `notice_id` varchar(36) DEFAULT NULL COMMENT '通告ID',
  `user_id` varchar(32) DEFAULT NULL COMMENT '授权用户ID',
  PRIMARY KEY (`id`),
  KEY `index_noticeid` (`notice_id`) USING BTREE,
  KEY `index_userid` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='通告授权用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_s_notice_read_user`
--

DROP TABLE IF EXISTS `t_s_notice_read_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_s_notice_read_user` (
  `id` varchar(36) NOT NULL DEFAULT '' COMMENT 'ID',
  `notice_id` varchar(36) DEFAULT NULL COMMENT '通告ID',
  `user_id` varchar(32) DEFAULT NULL COMMENT '用户ID',
  `is_read` smallint(2) NOT NULL DEFAULT '0' COMMENT '是否已阅读',
  `del_flag` smallint(2) NOT NULL DEFAULT '0' COMMENT '是否已删除',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `notice_id_index` (`notice_id`),
  KEY `user_id_index` (`user_id`),
  KEY `index_delflag` (`del_flag`),
  KEY `index_isread` (`is_read`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='通告已读用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_s_operation`
--

DROP TABLE IF EXISTS `t_s_operation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_s_operation` (
  `ID` varchar(32) NOT NULL COMMENT 'id',
  `operationcode` varchar(50) DEFAULT NULL COMMENT '页面控件code',
  `operationicon` varchar(100) DEFAULT NULL COMMENT '图标',
  `operationname` varchar(50) DEFAULT NULL COMMENT '页面名字',
  `status` smallint(6) DEFAULT NULL COMMENT '状态',
  `functionid` varchar(32) DEFAULT NULL COMMENT '菜单ID',
  `iconid` varchar(32) DEFAULT NULL COMMENT '图标ID',
  `operationtype` smallint(6) DEFAULT NULL COMMENT '规则类型：1/禁用 0/隐藏',
  PRIMARY KEY (`ID`),
  KEY `FK_pceuy41wr2fjbcilyc7mk3m1f` (`functionid`),
  KEY `FK_ny5de7922l39ta2pkhyspd5f` (`iconid`),
  CONSTRAINT `FK_ny5de7922l39ta2pkhyspd5f` FOREIGN KEY (`iconid`) REFERENCES `t_s_icon` (`ID`),
  CONSTRAINT `FK_pceuy41wr2fjbcilyc7mk3m1f` FOREIGN KEY (`functionid`) REFERENCES `t_s_function` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_s_password_resetkey`
--

DROP TABLE IF EXISTS `t_s_password_resetkey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_s_password_resetkey` (
  `id` varchar(36) NOT NULL,
  `create_name` varchar(50) DEFAULT NULL COMMENT '创建人名称',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人登录名称',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `username` varchar(100) DEFAULT NULL COMMENT '用户名',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱地址',
  `is_reset` int(11) DEFAULT NULL COMMENT '是否已重置',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_s_region`
--

DROP TABLE IF EXISTS `t_s_region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_s_region` (
  `ID` varchar(10) NOT NULL COMMENT 'ID',
  `NAME` varchar(50) NOT NULL COMMENT '城市名',
  `PID` varchar(10) NOT NULL COMMENT '父ID',
  `NAME_EN` varchar(100) NOT NULL COMMENT '英文名',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_s_role`
--

DROP TABLE IF EXISTS `t_s_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_s_role` (
  `ID` varchar(32) NOT NULL COMMENT 'ID',
  `rolecode` varchar(10) DEFAULT NULL COMMENT '角色编码',
  `rolename` varchar(100) NOT NULL COMMENT '角色名字',
  `depart_ag_id` varchar(32) DEFAULT NULL COMMENT '部门权限组ID',
  `role_type` varchar(2) DEFAULT NULL COMMENT '类型1部门角色/0系统角色',
  `update_name` varchar(32) DEFAULT NULL COMMENT '修改人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `update_by` varchar(32) DEFAULT NULL COMMENT '修改人id',
  `create_name` varchar(32) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建人id',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_s_role_function`
--

DROP TABLE IF EXISTS `t_s_role_function`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_s_role_function` (
  `ID` varchar(32) NOT NULL COMMENT 'ID',
  `operation` varchar(1000) DEFAULT NULL COMMENT '页面控件权限编码',
  `functionid` varchar(32) DEFAULT NULL COMMENT '菜单ID',
  `roleid` varchar(32) DEFAULT NULL COMMENT '角色ID',
  `datarule` varchar(1000) DEFAULT NULL COMMENT '数据权限规则ID',
  PRIMARY KEY (`ID`),
  KEY `FK_fvsillj2cxyk5thnuu625urab` (`functionid`),
  KEY `FK_9dww3p4w8jwvlrgwhpitsbfif` (`roleid`),
  CONSTRAINT `FK_9dww3p4w8jwvlrgwhpitsbfif` FOREIGN KEY (`roleid`) REFERENCES `t_s_role` (`ID`),
  CONSTRAINT `FK_fvsillj2cxyk5thnuu625urab` FOREIGN KEY (`functionid`) REFERENCES `t_s_function` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_s_role_org`
--

DROP TABLE IF EXISTS `t_s_role_org`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_s_role_org` (
  `ID` varchar(32) NOT NULL COMMENT 'id',
  `org_id` varchar(32) DEFAULT NULL COMMENT '机构ID',
  `role_id` varchar(32) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_s_role_user`
--

DROP TABLE IF EXISTS `t_s_role_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_s_role_user` (
  `ID` varchar(32) NOT NULL COMMENT 'ID',
  `roleid` varchar(32) DEFAULT NULL COMMENT '角色ID',
  `userid` varchar(32) DEFAULT NULL COMMENT '用户ID',
  PRIMARY KEY (`ID`),
  KEY `FK_n2ucxeorvpjy7qhnmuem01kbx` (`roleid`),
  KEY `FK_d4qb5xld2pfb0bkjx9iwtolda` (`userid`),
  CONSTRAINT `FK_d4qb5xld2pfb0bkjx9iwtolda` FOREIGN KEY (`userid`) REFERENCES `t_s_user` (`id`),
  CONSTRAINT `FK_n2ucxeorvpjy7qhnmuem01kbx` FOREIGN KEY (`roleid`) REFERENCES `t_s_role` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_s_sms`
--

DROP TABLE IF EXISTS `t_s_sms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_s_sms` (
  `id` varchar(36) NOT NULL COMMENT 'ID',
  `create_name` varchar(50) DEFAULT NULL COMMENT '创建人名称',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人登录名称',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_name` varchar(50) DEFAULT NULL COMMENT '更新人名称',
  `update_by` varchar(50) DEFAULT NULL COMMENT '更新人登录名称',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `es_title` varchar(32) DEFAULT NULL COMMENT '消息标题',
  `es_type` varchar(1) DEFAULT NULL COMMENT '消息类型',
  `es_sender` varchar(50) DEFAULT NULL COMMENT '发送人',
  `es_receiver` varchar(50) DEFAULT NULL COMMENT '接收人',
  `es_content` longtext COMMENT '内容',
  `es_sendtime` datetime DEFAULT NULL COMMENT '发送时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `es_status` varchar(1) DEFAULT NULL COMMENT '发送状态',
  PRIMARY KEY (`id`),
  KEY `index_type` (`es_type`),
  KEY `index_receiver` (`es_receiver`),
  KEY `index_sendtime` (`es_sendtime`),
  KEY `index_status` (`es_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_s_sms_sql`
--

DROP TABLE IF EXISTS `t_s_sms_sql`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_s_sms_sql` (
  `id` varchar(36) NOT NULL COMMENT '主键',
  `sql_name` varchar(32) DEFAULT NULL COMMENT 'SQL名称',
  `sql_content` varchar(1000) DEFAULT NULL COMMENT 'SQL内容',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人登录名称',
  `create_name` varchar(50) DEFAULT NULL COMMENT '创建人名称',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `update_by` varchar(50) DEFAULT NULL COMMENT '更新人登录名称',
  `update_name` varchar(50) DEFAULT NULL COMMENT '更新人名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_s_sms_template`
--

DROP TABLE IF EXISTS `t_s_sms_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_s_sms_template` (
  `id` varchar(36) NOT NULL COMMENT '主键',
  `template_type` varchar(1) DEFAULT NULL COMMENT '模板类型',
  `template_name` varchar(50) DEFAULT NULL COMMENT '模板名称',
  `template_content` varchar(1000) DEFAULT NULL COMMENT '模板内容',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人登录名称',
  `create_name` varchar(50) DEFAULT NULL COMMENT '创建人名称',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `update_by` varchar(50) DEFAULT NULL COMMENT '更新人登录名称',
  `update_name` varchar(50) DEFAULT NULL COMMENT '更新人名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_s_sms_template_sql`
--

DROP TABLE IF EXISTS `t_s_sms_template_sql`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_s_sms_template_sql` (
  `id` varchar(36) NOT NULL COMMENT '主键',
  `code` varchar(32) DEFAULT NULL COMMENT '配置CODE',
  `name` varchar(32) DEFAULT NULL COMMENT '配置名称',
  `sql_id` varchar(32) DEFAULT NULL COMMENT '业务SQLID',
  `template_id` varchar(32) DEFAULT NULL COMMENT '消息模本ID',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人登录名称',
  `create_name` varchar(50) DEFAULT NULL COMMENT '创建人名称',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `update_by` varchar(50) DEFAULT NULL COMMENT '更新人登录名称',
  `update_name` varchar(50) DEFAULT NULL COMMENT '更新人名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_s_timetask`
--

DROP TABLE IF EXISTS `t_s_timetask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_s_timetask` (
  `ID` varchar(32) NOT NULL COMMENT 'id',
  `CREATE_BY` varchar(32) DEFAULT NULL COMMENT '创建人',
  `CREATE_DATE` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATE_NAME` varchar(32) DEFAULT NULL COMMENT '创建人名字',
  `CRON_EXPRESSION` varchar(100) NOT NULL COMMENT 'cron表达式',
  `IS_EFFECT` varchar(1) NOT NULL COMMENT '是否生效 0/未生效,1/生效',
  `IS_START` varchar(1) NOT NULL COMMENT '是否运行0停止,1运行',
  `TASK_DESCRIBE` varchar(50) NOT NULL COMMENT '任务描述',
  `TASK_ID` varchar(100) NOT NULL COMMENT '任务ID',
  `CLASS_NAME` varchar(300) NOT NULL COMMENT '任务类名',
  `RUN_SERVER_IP` varchar(15) NOT NULL DEFAULT '本地' COMMENT '任务运行服务器IP',
  `RUN_SERVER` varchar(300) NOT NULL DEFAULT '本地' COMMENT '远程主机（域名/IP+项目路径）',
  `UPDATE_BY` varchar(32) DEFAULT NULL COMMENT '修改人',
  `UPDATE_DATE` datetime DEFAULT NULL COMMENT '修改时间',
  `UPDATE_NAME` varchar(32) DEFAULT NULL COMMENT '修改人名称',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_s_type`
--

DROP TABLE IF EXISTS `t_s_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_s_type` (
  `ID` varchar(32) NOT NULL COMMENT 'id',
  `typecode` varchar(50) DEFAULT NULL COMMENT '字典编码',
  `typename` varchar(50) DEFAULT NULL COMMENT '字典名称',
  `typepid` varchar(32) DEFAULT NULL COMMENT '无用字段',
  `typegroupid` varchar(32) DEFAULT NULL COMMENT '字典组ID',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `create_name` varchar(36) DEFAULT NULL COMMENT '创建用户',
  PRIMARY KEY (`ID`),
  KEY `FK_nw2b22gy7plh7pqows186odmq` (`typepid`),
  KEY `FK_3q40mr4ebtd0cvx79matl39x1` (`typegroupid`),
  CONSTRAINT `FK_3q40mr4ebtd0cvx79matl39x1` FOREIGN KEY (`typegroupid`) REFERENCES `t_s_typegroup` (`ID`),
  CONSTRAINT `FK_nw2b22gy7plh7pqows186odmq` FOREIGN KEY (`typepid`) REFERENCES `t_s_type` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_s_typegroup`
--

DROP TABLE IF EXISTS `t_s_typegroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_s_typegroup` (
  `ID` varchar(32) NOT NULL COMMENT 'id',
  `typegroupcode` varchar(50) DEFAULT NULL COMMENT '字典分组编码',
  `typegroupname` varchar(50) DEFAULT NULL COMMENT '字典分组名称',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `create_name` varchar(36) DEFAULT NULL COMMENT '创建用户',
  PRIMARY KEY (`ID`),
  KEY `index_typegroupcode` (`typegroupcode`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_s_user`
--

DROP TABLE IF EXISTS `t_s_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_s_user` (
  `id` varchar(32) NOT NULL COMMENT 'id',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `mobilePhone` varchar(30) DEFAULT NULL COMMENT '手机号',
  `officePhone` varchar(20) DEFAULT NULL COMMENT '办公座机',
  `signatureFile` varchar(100) DEFAULT NULL COMMENT '签名文件',
  `update_name` varchar(32) DEFAULT NULL COMMENT '修改人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `update_by` varchar(32) DEFAULT NULL COMMENT '修改人id',
  `create_name` varchar(32) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建人id',
  `portrait` varchar(100) DEFAULT NULL,
  `imsign` varchar(255) DEFAULT NULL,
  `dev_flag` varchar(2) NOT NULL DEFAULT '0' COMMENT '开发权限标志',
  `user_type` varchar(2) DEFAULT NULL COMMENT '用户类型',
  `person_type` varchar(2) DEFAULT NULL COMMENT '人员类型',
  `sex` varchar(2) DEFAULT NULL COMMENT '性别',
  `emp_no` varchar(36) DEFAULT NULL COMMENT '工号',
  `citizen_no` varchar(20) DEFAULT NULL COMMENT '身份证号',
  `fax` varchar(50) DEFAULT NULL COMMENT '传真',
  `address` varchar(1000) DEFAULT NULL COMMENT '联系地址',
  `post` varchar(10) DEFAULT NULL COMMENT '邮编',
  `memo` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `FK_2cuji5h6yorrxgsr8ojndlmal` (`id`),
  KEY `index_dev_flag` (`dev_flag`) USING BTREE,
  CONSTRAINT `FK_2cuji5h6yorrxgsr8ojndlmal` FOREIGN KEY (`id`) REFERENCES `t_s_base_user` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_s_user_org`
--

DROP TABLE IF EXISTS `t_s_user_org`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_s_user_org` (
  `ID` varchar(32) NOT NULL COMMENT 'id',
  `user_id` varchar(32) DEFAULT NULL COMMENT '用户id',
  `org_id` varchar(32) DEFAULT NULL COMMENT '部门id',
  PRIMARY KEY (`ID`),
  KEY `index_user_id` (`user_id`),
  KEY `index_org_id` (`org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_s_user_position_rel`
--

DROP TABLE IF EXISTS `t_s_user_position_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_s_user_position_rel` (
  `ID` varchar(32) NOT NULL COMMENT 'id',
  `user_id` varchar(32) DEFAULT NULL COMMENT '用户id',
  `position_id` varchar(32) DEFAULT NULL COMMENT '职务id',
  `company_id` varchar(32) DEFAULT NULL COMMENT '公司ID',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `uniq_userid_positionid_companyid` (`user_id`,`position_id`,`company_id`),
  KEY `idx_userid_companyid` (`user_id`,`company_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统用户-岗位-公司关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test_person`
--

DROP TABLE IF EXISTS `test_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_person` (
  `id` varchar(36) NOT NULL,
  `create_name` varchar(50) DEFAULT NULL COMMENT '创建人名称',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人登录名称',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_name` varchar(50) DEFAULT NULL COMMENT '更新人名称',
  `update_by` varchar(50) DEFAULT NULL COMMENT '更新人登录名称',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `sys_org_code` varchar(50) DEFAULT NULL COMMENT '所属部门',
  `sys_company_code` varchar(50) DEFAULT NULL COMMENT '所属公司',
  `bpm_status` varchar(32) DEFAULT '1' COMMENT '流程状态',
  `name` varchar(32) NOT NULL COMMENT '名字',
  `sex` varchar(32) DEFAULT NULL COMMENT '性别',
  `birthday` datetime DEFAULT NULL COMMENT '生日',
  `conets` varchar(32) DEFAULT NULL COMMENT '个人简介',
  `cexs` varchar(32) DEFAULT NULL COMMENT '测性别',
  `salary` double DEFAULT NULL COMMENT '工资',
  `fiel_jls` longtext COMMENT '简历附件',
  `tou_pic` longtext COMMENT '个人头像',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_tables`
--

DROP TABLE IF EXISTS `tmp_tables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmp_tables` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `wl_table_name` varchar(100) DEFAULT NULL,
  `xt_table_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-21  4:22:00
