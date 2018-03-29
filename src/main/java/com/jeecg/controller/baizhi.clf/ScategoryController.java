package com.jeecg.controller.baizhi.clf;
import java.io.Serializable;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jeecg.entity.baizhi.clf.SadminCategoryEntity;
import com.jeecg.entity.baizhi.clf.SadminProductEntity;
import com.jeecg.entity.baizhi.clf.SproductEntity;
import com.jeecg.service.baizhi.clf.SadminCategoryServiceI;
import com.jeecg.service.baizhi.clf.SadminProductServiceI;
import com.jeecg.service.baizhi.clf.SproductServiceI;
import org.apache.log4j.Logger;
import org.jeecgframework.core.util.ResourceUtil;
import org.jeecgframework.p3.core.utils.common.StringUtils;
import org.jeecgframework.web.system.pojo.base.TSCategoryEntity;
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

import com.jeecg.entity.baizhi.clf.ScategoryEntity;
import com.jeecg.service.baizhi.clf.ScategoryServiceI;

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

import static oracle.net.aso.C11.t;

/**   
 * @Title: Controller
 * @Description: 类别表
 * @author zhangdaihao
 * @date 2018-03-14 14:59:17
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/scategoryController")
public class ScategoryController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(ScategoryController.class);

	@Autowired
	private ScategoryServiceI scategoryService;
	@Autowired
	private SystemService systemService;
	@Autowired
	private Validator validator;
	@Autowired
	private SadminCategoryServiceI sadminCategoryServiceI;
	@Autowired
	private SproductServiceI sproductServiceI;
	@Autowired
	private SadminProductServiceI sadminProductServiceI;
	


	/**
	 * 类别表列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "list")
	public ModelAndView list(HttpServletRequest request) {
		return new ModelAndView("com/jeecg/baizhi.clf/scategoryList");
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
	public void datagrid(ScategoryEntity scategory,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(ScategoryEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, scategory, request.getParameterMap());
		this.scategoryService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除类别表
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(ScategoryEntity scategory, HttpServletRequest request) {
		String message = null;
		AjaxJson j = new AjaxJson();

		TSUser user = ResourceUtil.getSessionUser();

		//通过管理员的id 获得用户的所有商品
		List<SadminProductEntity> sadminProductEntitys = sadminProductServiceI.findByProperty(SadminProductEntity.class, "adminId", user.getId());

		if(user.getUserName().equals("SuperAdmin")){
			//如果是超级管理员获得所有仓库商品
			List<SproductEntity> byProperty = sproductServiceI.findByProperty(SproductEntity.class, "flag", "Y");
			for (SproductEntity sproductEntity : byProperty) {
				if(sproductEntity.getCategoryId().equals(scategory.getId())){
					//代表该类别下有商品
					message = "请先删除该类别下所有商品";
					systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
					j.setMsg(message);
					return j;
				}
			}
		}

		//判断该类别下还有没有商品存在
		for (SadminProductEntity sadminProductEntity : sadminProductEntitys) {

			 SproductEntity ent1= sproductServiceI.getEntity(SproductEntity.class, sadminProductEntity.getProductId());
			if(ent1.getCategoryId().equals(scategory.getId())){
				//如果进入该条件 证明该类别下还有商品存在
				message = "请先删除该类别下所有商品";
				systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
				j.setMsg(message);
				return j;
			}

		}

		scategory = systemService.getEntity(ScategoryEntity.class, scategory.getId());
		message = "类别表删除成功";
		sadminCategoryServiceI.updateBySqlString("update s_admin_category set admin_id='null',category_id='null' where admin_id='" + user.getId() + "' and category_id='" + scategory.getId() + "'");
		//scategoryService.delete(scategory);
		systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加类别表
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(ScategoryEntity scategory, HttpServletRequest request) {
		String message = null;
		AjaxJson j = new AjaxJson();
		if (StringUtil.isNotEmpty(scategory.getId())) {
			message = "类别表更新成功";
			ScategoryEntity t = scategoryService.get(ScategoryEntity.class, scategory.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(scategory, t);
				Serializable id = scategoryService.save(t);
				//scategoryService.saveOrUpdate(t);

				SadminCategoryEntity sadminCategoryEntity = new SadminCategoryEntity();

				sadminCategoryEntity.setCategoryId(id.toString());

				String adminId = ResourceUtil.getSessionUser().getId();
				sadminCategoryEntity.setAdminId(adminId);

				sadminCategoryServiceI.save(sadminCategoryEntity);

				systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
			} catch (Exception e) {
				e.printStackTrace();
				message = "类别表更新失败";
			}
		} else {
			message = "类别表添加成功";
			Serializable id = scategoryService.save(scategory);

			//scategoryService.saveOrUpdate(t);

			SadminCategoryEntity sadminCategoryEntity = new SadminCategoryEntity();

			sadminCategoryEntity.setCategoryId(id.toString());

			String adminId = ResourceUtil.getSessionUser().getId();
			sadminCategoryEntity.setAdminId(adminId);
			sadminCategoryServiceI.save(sadminCategoryEntity);

			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}
		j.setMsg(message);
		return j;
	}

	/**
	 * 类别表列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(ScategoryEntity scategory, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(scategory.getId())) {
			scategory = scategoryService.getEntity(ScategoryEntity.class, scategory.getId());
			req.setAttribute("scategoryPage", scategory);
		}
		return new ModelAndView("com/jeecg/baizhi.clf/scategory");
	}
	
	@RequestMapping(method = RequestMethod.GET)
	@ResponseBody
	public List<ScategoryEntity> list() {
		List<ScategoryEntity> listScategorys=scategoryService.getList(ScategoryEntity.class);
		return listScategorys;
	}
	
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<?> get(@PathVariable("id") String id) {
		ScategoryEntity task = scategoryService.get(ScategoryEntity.class, id);
		if (task == null) {
			return new ResponseEntity(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity(task, HttpStatus.OK);
	}

	@RequestMapping(method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<?> create(@RequestBody ScategoryEntity scategory, UriComponentsBuilder uriBuilder) {
		//调用JSR303 Bean Validator进行校验，如果出错返回含400错误码及json格式的错误信息.
		Set<ConstraintViolation<ScategoryEntity>> failures = validator.validate(scategory);
		if (!failures.isEmpty()) {
			return new ResponseEntity(BeanValidators.extractPropertyAndMessage(failures), HttpStatus.BAD_REQUEST);
		}

		//保存
		scategoryService.save(scategory);

		//按照Restful风格约定，创建指向新任务的url, 也可以直接返回id或对象.
		String id = scategory.getId();
		URI uri = uriBuilder.path("/rest/scategoryController/" + id).build().toUri();
		HttpHeaders headers = new HttpHeaders();
		headers.setLocation(uri);

		return new ResponseEntity(headers, HttpStatus.CREATED);
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.PUT, consumes = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<?> update(@RequestBody ScategoryEntity scategory) {
		//调用JSR303 Bean Validator进行校验，如果出错返回含400错误码及json格式的错误信息.
		Set<ConstraintViolation<ScategoryEntity>> failures = validator.validate(scategory);
		if (!failures.isEmpty()) {
			return new ResponseEntity(BeanValidators.extractPropertyAndMessage(failures), HttpStatus.BAD_REQUEST);
		}

		//保存
		scategoryService.saveOrUpdate(scategory);

		//按Restful约定，返回204状态码, 无内容. 也可以返回200状态码.
		return new ResponseEntity(HttpStatus.NO_CONTENT);
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public void delete(@PathVariable("id") String id) {
		scategoryService.deleteEntityById(ScategoryEntity.class, id);
	}

	@RequestMapping(params = "getCategoryInfo")
	@ResponseBody
	public AjaxJson getCategoryInfo(HttpServletRequest request, HttpServletResponse response) {
		AjaxJson j = new AjaxJson();

		List<ScategoryEntity> tSDeparts = scategoryService.getList(ScategoryEntity.class);

		//拼装树形结构既设置节点checked属性
		List<Map<String,Object>> dateList = null;
		dateList = new ArrayList<Map<String,Object>>();
		if(tSDeparts.size()>0){
			Map<String,Object> map = null;
			String sql = null;
			Object[] params = null;
			for(ScategoryEntity depart:tSDeparts){
				map = new HashMap<String,Object>();
				map.put("id", depart.getId());
				map.put("name", depart.getName());

				map.put("icon", "plug-in/ztree/css/img/diy/gysroot.png");

				dateList.add(map);
			}
		}
		net.sf.json.JSONArray jsonArray = net.sf.json.JSONArray.fromObject(dateList);
		j.setMsg(jsonArray.toString());
		return j;
	}
	@RequestMapping(params = "findCategoryByAdminId")
	public void findCategoryByAdminId(HttpServletResponse response,DataGrid dataGrid){
		TSUser tsUser = ResourceUtil.getSessionUser();

		//通过管理员Id获得用户关联的所有类别的Id
		List<SadminCategoryEntity> sadminCategory = sadminCategoryServiceI.findByProperty(SadminCategoryEntity.class, "adminId", tsUser.getId());

		ArrayList<ScategoryEntity> results = new ArrayList<>();

		for (SadminCategoryEntity sadminCategoryEntity : sadminCategory) {

			ScategoryEntity ent1  = scategoryService.getEntity(ScategoryEntity.class, sadminCategoryEntity.getCategoryId());

			results.add(ent1);

		}

		dataGrid.setResults(results);
		TagUtil.datagrid(response,dataGrid);

	}
}
