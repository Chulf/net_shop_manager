package com.jeecg.controller.baizhi.clf;

import java.io.Serializable;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jeecg.entity.baizhi.clf.SadminCategoryEntity;
import com.jeecg.entity.baizhi.clf.SadminProductEntity;
import com.jeecg.entity.baizhi.clf.ScategoryEntity;
import com.jeecg.service.baizhi.clf.SadminCategoryServiceI;
import com.jeecg.service.baizhi.clf.SadminProductServiceI;
import com.jeecg.service.baizhi.clf.ScategoryServiceI;
import org.apache.log4j.Logger;
import org.hibernate.criterion.Restrictions;
import org.jeecgframework.core.util.ResourceUtil;
import org.jeecgframework.core.util.RoletoJson;
import org.jeecgframework.web.system.pojo.base.TSUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import org.jeecgframework.core.common.controller.BaseController;
import org.jeecgframework.core.common.hibernate.qbc.CriteriaQuery;
import org.jeecgframework.core.common.model.json.AjaxJson;
import org.jeecgframework.core.common.model.json.DataGrid;
import org.jeecgframework.core.constant.Globals;
import org.jeecgframework.core.util.StringUtil;
import org.jeecgframework.tag.core.easyui.TagUtil;
import org.jeecgframework.web.system.pojo.base.TSDepart;
import org.jeecgframework.web.system.service.SystemService;
import org.jeecgframework.core.util.MyBeanUtils;

import com.jeecg.entity.baizhi.clf.SproductEntity;
import com.jeecg.service.baizhi.clf.SproductServiceI;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.jeecgframework.core.beanvalidator.BeanValidators;

import javax.validation.ConstraintViolation;
import javax.validation.Validator;
import java.net.URI;

import org.springframework.http.MediaType;
import org.springframework.web.util.UriComponentsBuilder;

/**
 * @author zhangdaihao
 * @version V1.0
 * @Title: Controller
 * @Description: 商品表
 * @date 2018-03-14 14:58:47
 */
@Controller
@RequestMapping("/sproductController")
public class SproductController extends BaseController {
    /**
     * Logger for this class
     */
    private static final Logger logger = Logger.getLogger(SproductController.class);

    @Autowired
    private SproductServiceI sproductService;
    @Autowired
    private SystemService systemService;
    @Autowired
    private Validator validator;
    @Autowired
    private ScategoryServiceI scategoryService;
    @Autowired
    private SadminProductServiceI sadminProductServiceI;
    @Autowired
    private SadminCategoryServiceI sadminCategoryServiceI;


    /**
     * 商品表列表 页面跳转
     *
     * @return
     */
    @RequestMapping(params = "list")
    public ModelAndView list(HttpServletRequest request) {
        return new ModelAndView("com/jeecg/baizhi.clf/sproductList");
    }

    /**
     * easyui AJAX请求数据
     *
     * @param request
     * @param response
     * @param dataGrid
     * @param user
     */

    @RequestMapping(params = "datagrid")
    public void datagrid(SproductEntity sproduct, HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
        CriteriaQuery cq = new CriteriaQuery(SproductEntity.class, dataGrid);
        //查询条件组装器
        org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, sproduct, request.getParameterMap());
        this.sproductService.getDataGridReturn(cq, true);
        TagUtil.datagrid(response, dataGrid);
    }

    /**
     * 删除商品表
     *
     * @return
     */
    @RequestMapping(params = "del")
    @ResponseBody
    public AjaxJson del(SproductEntity sproduct, HttpServletRequest request) {
        String message = null;
        AjaxJson j = new AjaxJson();
        sproduct = systemService.getEntity(SproductEntity.class, sproduct.getId());

        message = "商品表删除成功";
        TSUser tsUser = ResourceUtil.getSessionUser();

        if (tsUser.getUserName().equals("SuperAdmin")) {
            //如果是仓库管理员可以删除商品
            sproductService.delete(sproduct);
            //并且把所有店铺该商品进行下架
            sadminProductServiceI.updateBySqlString(" update s_admin_product set admin_id='null',product_id='null' where product_id='" + sproduct.getId() + "'");
        } else if (sproduct.getFlag() != null && sproduct.getFlag().equals("Y")) {
            //只删除关系 由于jeecg没有相关api 先把关系设置为null
            sadminProductServiceI.updateBySqlString(" update s_admin_product set admin_id='null',product_id='null' where admin_id='" + tsUser.getId() + "' and product_id='" + sproduct.getId() + "'");
        } else {
            //即删除关系 也删除商品
            sproductService.delete(sproduct);
            //删除关系 由于jeecg没有相关api 先把关系设置为null
            sadminProductServiceI.updateBySqlString(" update s_admin_product set admin_id='null',product_id='null' where admin_id='" + tsUser.getId() + "' and product_id='" + sproduct.getId() + "'");
        }

        systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);

        j.setMsg(message);
        return j;
    }


    /**
     * 添加商品表
     *
     * @param ids
     * @return
     */
    @RequestMapping(params = "save")
    @ResponseBody
    public AjaxJson save(SproductEntity sproduct, HttpServletRequest request) {
        String message = null;
        TSUser tsUser = ResourceUtil.getSessionUser();
        AjaxJson j = new AjaxJson();
        if (StringUtil.isNotEmpty(sproduct.getId())) {

            message = "商品表更新成功";
            SproductEntity t = sproductService.get(SproductEntity.class, sproduct.getId());
            try {
                if (tsUser.getUserName().equals("SuperAdmin")) {
                    //如果是超级管理员  允许更改商品
                    MyBeanUtils.copyBeanNotNull2Bean(sproduct, t);
                    sproductService.saveOrUpdate(t);
                } else if (t.getFlag() != null && t.getFlag().equals("Y")) {
                    //否则只能更改仓库商品价格   --- 仓库商品
                    sadminProductServiceI.updateBySqlString("update s_admin_product set price='" + sproduct.getPrice() + "',description='" + sproduct.getDescription() + "' where product_id='" + sproduct.getId() + "'");
                } else {
                    //在否则可以更改商品并且维护关系价格   --- 非仓库商品
                    sadminProductServiceI.updateBySqlString("update s_admin_product set price='" + sproduct.getPrice() + "',description='" + sproduct.getDescription() + "' where product_id='" + sproduct.getId() + "'");
                    MyBeanUtils.copyBeanNotNull2Bean(sproduct, t);
                    sproductService.saveOrUpdate(t);
                }
                systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
            } catch (Exception e) {
                e.printStackTrace();
                message = "商品表更新失败";
            }
        } else {
            if (tsUser.getUserName().equals("SuperAdmin")) {
                //如果是超级管理员添加商品
                sproduct.setFlag("Y");
                sproductService.save(sproduct);
            } else {

                //添加商品
                Serializable productId = sproductService.save(sproduct);
                //如果是普通管理员 添加关系
                SadminProductEntity productEntity = new SadminProductEntity();
                productEntity.setPrice(sproduct.getPrice());
                productEntity.setDescription(sproduct.getDescription());
                productEntity.setAdminId(tsUser.getId());
                productEntity.setProductId(productId.toString());

                //添加关系
                sadminProductServiceI.save(productEntity);

            }
            message = "商品表添加成功";
            systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
        }
        j.setMsg(message);
        return j;
    }

    /**
     * 商品表列表页面跳转
     *
     * @return
     */
    @RequestMapping(params = "addorupdate")
    public ModelAndView addorupdate(SproductEntity sproduct, HttpServletRequest req) {
        if (StringUtil.isNotEmpty(sproduct.getId())) {
            sproduct = sproductService.getEntity(SproductEntity.class, sproduct.getId());
            req.setAttribute("sproductPage", sproduct);
        }
        return new ModelAndView("com/jeecg/baizhi.clf/sproduct");
    }

    @RequestMapping(method = RequestMethod.GET)
    @ResponseBody
    public List<SproductEntity> list() {
        List<SproductEntity> listSproducts = sproductService.getList(SproductEntity.class);
        return listSproducts;
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    @ResponseBody
    public ResponseEntity<?> get(@PathVariable("id") String id) {
        SproductEntity task = sproductService.get(SproductEntity.class, id);
        if (task == null) {
            return new ResponseEntity(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity(task, HttpStatus.OK);
    }

    @RequestMapping(method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity<?> create(@RequestBody SproductEntity sproduct, UriComponentsBuilder uriBuilder) {
        //调用JSR303 Bean Validator进行校验，如果出错返回含400错误码及json格式的错误信息.
        Set<ConstraintViolation<SproductEntity>> failures = validator.validate(sproduct);
        if (!failures.isEmpty()) {
            return new ResponseEntity(BeanValidators.extractPropertyAndMessage(failures), HttpStatus.BAD_REQUEST);
        }

        //保存
        sproductService.save(sproduct);

        //按照Restful风格约定，创建指向新任务的url, 也可以直接返回id或对象.
        String id = sproduct.getId();
        URI uri = uriBuilder.path("/rest/sproductController/" + id).build().toUri();
        HttpHeaders headers = new HttpHeaders();
        headers.setLocation(uri);

        return new ResponseEntity(headers, HttpStatus.CREATED);
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.PUT, consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<?> update(@RequestBody SproductEntity sproduct) {
        //调用JSR303 Bean Validator进行校验，如果出错返回含400错误码及json格式的错误信息.
        Set<ConstraintViolation<SproductEntity>> failures = validator.validate(sproduct);
        if (!failures.isEmpty()) {
            return new ResponseEntity(BeanValidators.extractPropertyAndMessage(failures), HttpStatus.BAD_REQUEST);
        }

        //保存
        sproductService.saveOrUpdate(sproduct);

        //按Restful约定，返回204状态码, 无内容. 也可以返回200状态码.
        return new ResponseEntity(HttpStatus.NO_CONTENT);
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable("id") String id) {
        sproductService.deleteEntityById(SproductEntity.class, id);
    }

    @RequestMapping(params = "sproductSelect")
    public String sproductSelect(HttpServletRequest request) {
        List<ScategoryEntity> departList = scategoryService.getList(ScategoryEntity.class);

        request.setAttribute("departsReplace", RoletoJson.listToReplaceStr(departList, "name", "id"));
        departList.clear();

        return "com/jeecg/baizhi.clf/sproductSelect";
    }

    /**
     * @param request
     * @param response
     * @param dataGrid 查看管理员店铺商品
     */
    @RequestMapping(params = "findProductByAdmin")
    public void findProductByAdmin(HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid, SproductEntity sproduct1) {
        //判断当前登录的管理员 是普通管理员 还是超级管理员
        TSUser tsUser = ResourceUtil.getSessionUser();
        //商品数据列表
        List<SproductEntity> results = new ArrayList<SproductEntity>();

        HashMap<String, Map<String, Object>> extMap = new HashMap<String, Map<String, Object>>();

        if (tsUser.getUserName().equals("SuperAdmin")) {
            //如果是仓库管理员 查询所有仓库商品
            CriteriaQuery cq = new CriteriaQuery(SproductEntity.class, dataGrid);
            //查询条件组装器
            cq.eq("flag", "Y");
            org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, sproduct1, request.getParameterMap());
            this.sproductService.getDataGridReturn(cq, true);
            List<SproductEntity> sproducts = dataGrid.getResults();

            //List<SproductEntity> sproducts = sproductService.findByProperty(SproductEntity.class, "flag", "Y");
            for (SproductEntity sproduct : sproducts) {

                HashMap<String, Object> map = new HashMap<String, Object>();

                ScategoryEntity scategoryEntity = scategoryService.getEntity(ScategoryEntity.class, sproduct.getCategoryId());

                //扩展类别字段
                map.put("categoryName", scategoryEntity.getName());
                if (sproduct.getFlag() != null && sproduct.getFlag().equals("Y")) {

                    //代表来源为仓库商品
                    map.put("source", "仓库商品");

                } else {
                    //代表来源为用户添加
                    map.put("source", "店家自己添加");

                }
                extMap.put(sproduct.getId(), map);
                results.add(sproduct);
            }
        } else {
            //获取当前登录的管理员 绑定的所有商品
            List<SadminProductEntity> adminProducts = sadminProductServiceI.findByProperty(SadminProductEntity.class, "adminId", tsUser.getId());

            String[] ids = new String[adminProducts.size()];
            //获得该管理员的商品id列表
            for (int i = 0; i < adminProducts.size(); i++) {
                SadminProductEntity sadminProductEntity = adminProducts.get(i);
                ids[i] = sadminProductEntity.getProductId();
            }

            // SproductEntity product = sproductService.getEntity(SproductEntity.class, adminProduct.getProductId());

            if(ids.length == 0) {
                //如果关联商品为0 则没有商品直接结束程序
                dataGrid.setTotal(0);
                dataGrid.setResults(null);
                TagUtil.datagrid(response, dataGrid, extMap);
                return;
            }
            CriteriaQuery cq = new CriteriaQuery(SproductEntity.class, dataGrid);
            //查询条件组装器 获的所有关联商品
            cq.in("id", ids);
            org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, sproduct1, request.getParameterMap());
            this.sproductService.getDataGridReturn(cq, true);
            List<SproductEntity> sproducts = dataGrid.getResults();
            for (SproductEntity product : sproducts) {
                //获的商品对应的关系对象
                SadminProductEntity sadminProductEntity = null;
                for (SadminProductEntity adminProduct : adminProducts) {
                    if (adminProduct.getProductId().equals(product.getId())) {
                        sadminProductEntity = adminProduct;
                    }
                }
                //覆盖原有的商品价格
                product.setPrice(sadminProductEntity.getPrice());
                //覆盖原有商品描述
                product.setDescription(sadminProductEntity.getDescription());
                HashMap<String, Object> map = new HashMap<String, Object>();
                ScategoryEntity scategoryEntity = scategoryService.getEntity(ScategoryEntity.class, product.getCategoryId());
                //扩展类别字段
                map.put("categoryName", scategoryEntity.getName());
                if (product.getFlag() != null && product.getFlag().equals("Y")) {
                    //代表来源为仓库商品
                    map.put("source", "仓库商品");
                } else {
                    //代表来源为用户添加
                    map.put("source", "店家自己添加");
                }
                extMap.put(product.getId(), map);
                results.add(product);
            }
        }
        dataGrid.setResults(results);
        TagUtil.datagrid(response, dataGrid, extMap);
    }

    /**
     * @param request
     * @param response
     * @param dataGrid 查看仓库未被选择商品
     */
    @RequestMapping(params = "findStoreProduct")
    public void findStoreProduct(SproductEntity sproduct, HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {

        TSUser tsUser = ResourceUtil.getSessionUser();
        CriteriaQuery cq = new CriteriaQuery(SproductEntity.class, dataGrid);
        //查询条件组装器
        org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, sproduct, request.getParameterMap());
        cq.eq("flag", "Y");
        //获取用户已选择的商品
        List<SadminProductEntity> productEntityList = sadminProductServiceI.findByProperty(SadminProductEntity.class, "adminId", tsUser.getId());
        //把所有已选择商品的id添加到set
        Set<String> set = new HashSet<String>();
        for (SadminProductEntity productEntity : productEntityList) {
            set.add(productEntity.getProductId());
        }
        //把对象数组转换为string 数组
        Object[] objects = set.toArray();
        String[] aa = new String[objects.length];
        for (int i = 0; i < objects.length; i++) {
            aa[i] = objects[i].toString();
        }
        String str4SQLINParam = getStr4SQLINParam(aa);
        if(aa.length != 0 ) {
            //不等于0 有添加过仓库商品 排除这些商品
            cq.add(Restrictions.sqlRestriction("id not in (" + str4SQLINParam + ")"));
        }
        this.sproductService.getDataGridReturn(cq, true);
        //获取所有仓库商品
        List<SproductEntity> storeProducts = (List<SproductEntity>) dataGrid.getResults();

        Map<String, Map<String, Object>> extMap = new HashMap<String, Map<String, Object>>();
        for (SproductEntity storeProduct : storeProducts) {
            HashMap<String, Object> map = new HashMap<String, Object>();
            ScategoryEntity scategoryEntity = scategoryService.getEntity(ScategoryEntity.class, storeProduct.getCategoryId());
            //扩展类别字段
            map.put("categoryName", scategoryEntity.getName());
            extMap.put(storeProduct.getId(), map);
        }
        TagUtil.datagrid(response, dataGrid, extMap);
    }

    //数组转换sql 方法
    public String getStr4SQLINParam(String[] values) {
        String str = "";
        for (int i = 0; i < values.length; i++) {
            str += (i != 0) ? ", " : "";
            str += "'" + values[i] + "'";
        }
        return str;
    }

    @RequestMapping(params = "addStoreProduct")
    @ResponseBody
    public void addStoreProduct(String ids) {
        TSUser tsUser = ResourceUtil.getSessionUser();
        String[] idss = ids.split(",");

        for (String id : idss) {
            SadminProductEntity productEntity = new SadminProductEntity();

            productEntity.setProductId(id.toString());
            productEntity.setAdminId(tsUser.getId());

            SproductEntity product = sproductService.getEntity(SproductEntity.class, id);
            //设置价格默认为仓库价格
            productEntity.setPrice(product.getPrice());
            //设置描述为仓库描述
            productEntity.setDescription(product.getDescription());

            sadminProductServiceI.save(productEntity);

            //添加完商品之后  判断当前店铺是否有当前商品类别 没有则添加
            List<Object> listbySql = sadminCategoryServiceI.findListbySql("select * from s_admin_category where category_id='" + product.getCategoryId() + "'and admin_id='" + tsUser.getId() + "'");

            if (listbySql.size() == 0) {
                //添加类别到该管理员
                SadminCategoryEntity category = new SadminCategoryEntity();
                category.setAdminId(tsUser.getId());
                category.setCategoryId(product.getCategoryId());
                sadminCategoryServiceI.save(category);
            }
        }

    }

}
