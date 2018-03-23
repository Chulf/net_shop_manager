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
                    //否则只能更改仓库商品价格
                    sadminProductServiceI.updateBySqlString("update s_admin_product set price='" + sproduct.getPrice() + "' where product_id='" + sproduct.getId() + "'");
                } else {
                    //在否则可以添加商品 并且维护关系价格
                    sadminProductServiceI.updateBySqlString("update s_admin_product set price='" + sproduct.getPrice() + "' where product_id='" + sproduct.getId() + "'");
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
    public void findProductByAdmin(HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
        //判断当前登录的管理员 是普通管理员 还是超级管理员
        TSUser tsUser = ResourceUtil.getSessionUser();
        //商品数据列表
        List<SproductEntity> results = new ArrayList<SproductEntity>();

        HashMap<String, Map<String, Object>> extMap = new HashMap<>();

        if (tsUser.getUserName().equals("SuperAdmin")) {
            //如果是仓库管理员 查询所有仓库商品
            List<SproductEntity> sproducts = sproductService.findByProperty(SproductEntity.class, "flag", "Y");
            for (SproductEntity sproduct : sproducts) {

                HashMap<String, Object> map = new HashMap<>();

                ScategoryEntity scategoryEntity = scategoryService.getEntity(ScategoryEntity.class, sproduct.getCategoryId());

                //扩展类别字段
                map.put("categoryName", scategoryEntity.getName());

                extMap.put(sproduct.getId(), map);
                results.add(sproduct);
            }
        } else {
            //获取当前登录的管理员 绑定的所有商品
            List<SadminProductEntity> adminProducts = sadminProductServiceI.findByProperty(SadminProductEntity.class, "adminId", tsUser.getId());

            //通过商品的id获得所有商品的信息
            for (SadminProductEntity adminProduct : adminProducts) {

                SproductEntity product = sproductService.getEntity(SproductEntity.class, adminProduct.getProductId());
                systemService.getSession().clear();
                if (product == null) break;
                //覆盖原有的商品价格
                product.setPrice(adminProduct.getPrice());
                HashMap<String, Object> map = new HashMap<>();
                ScategoryEntity scategoryEntity = scategoryService.getEntity(ScategoryEntity.class, product.getCategoryId());
                //扩展类别字段
                map.put("categoryName", scategoryEntity.getName());
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
    public void findStoreProduct(String categoryId, HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {

        TSUser tsUser = ResourceUtil.getSessionUser();

        //获取所有仓库商品

        List<SproductEntity> storeProducts = sproductService.findByProperty(SproductEntity.class, "flag", "Y");

        //获取用户已选择的商品
        List<SadminProductEntity> productEntityList = sadminProductServiceI.findByProperty(SadminProductEntity.class, "adminId", tsUser.getId());

        //把所有已选择商品的id添加到set
        Set<String> set = new HashSet<String>();
        for (SadminProductEntity productEntity : productEntityList) {
            set.add(productEntity.getProductId());
        }

        ArrayList<SproductEntity> results = new ArrayList<>();
        //把没有添加过的商品添加的results中
        Map<String, Map<String,Object>> extMap = new HashMap<String,Map<String,Object>>();
        for (SproductEntity storeProduct : storeProducts) {

            if (!set.contains(storeProduct.getId())) {
                HashMap<String, Object> map = new HashMap<>();
                ScategoryEntity scategoryEntity = scategoryService.getEntity(ScategoryEntity.class, storeProduct.getCategoryId());
                //扩展类别字段
                map.put("categoryName", scategoryEntity.getName());
                extMap.put(storeProduct.getId(), map);
                results.add(storeProduct);
            }
        }

        dataGrid.setResults(results);
        TagUtil.datagrid(response, dataGrid,extMap);
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

            sadminProductServiceI.save(productEntity);

            //添加完商品之后默认添加商品的类别关系
            SadminCategoryEntity category = new SadminCategoryEntity();
            category.setAdminId(tsUser.getId());
            category.setCategoryId(product.getCategoryId());
            sadminCategoryServiceI.save(category);
        }

    }

}
