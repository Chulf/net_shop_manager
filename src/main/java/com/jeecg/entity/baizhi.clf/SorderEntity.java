package com.jeecg.entity.baizhi.clf;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import javax.persistence.*;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.GenericGenerator;
import org.jeecgframework.poi.excel.annotation.Excel;
import org.jeecgframework.poi.excel.annotation.ExcelCollection;

/**   
 * @Title: Entity
 * @Description: 订单表
 * @author zhangdaihao
 * @date 2018-03-14 14:59:51
 * @version V1.0   
 *
 */
@Entity
@Table(name = "s_order", schema = "")
@DynamicUpdate(true)
@DynamicInsert(true)
@SuppressWarnings("serial")
public class SorderEntity implements java.io.Serializable {
	/**主键*/
	@Excel(name="主键",width = 100)
	private java.lang.String id;
	/**订单编号*/
	@Excel(name="订单编号",width = 100)
	private java.lang.String orderNum;
	/**订单状态*/
	@Excel(name="订单状态",width = 50)
	private java.lang.String orderStatus;
	/**订单总价*/
	@Excel(name="订单总价",width = 50)
	private java.lang.Double orderSalary;
	/**用户外键*/
	@Excel(name="用户名",dictTable = "s_user",dicCode = "id",dicText="username",width = 50)
    private java.lang.String userId;
	/**下单时间*/
	@Excel(name="下单时间",width = 100)
	private java.util.Date time;

	private java.lang.String adminId;

	@Excel(name="店主名",dictTable = "t_s_base_user",dicCode = "id",dicText="username",width = 50)
	private java.lang.String shopId;

	//@ExcelCollection(name="订单详情")
	private List<SproductEntity> products;



	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  主键
	 */
	
	@Id
	@GeneratedValue(generator = "paymentableGenerator")
	@GenericGenerator(name = "paymentableGenerator", strategy = "uuid")
	@Column(name ="ID",nullable=false,length=255)
	public java.lang.String getId(){
		return this.id;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  主键
	 */
	public void setId(java.lang.String id){
		this.id = id;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  订单编号
	 */
	@Column(name ="ORDER_NUM",nullable=true,length=255)
	public java.lang.String getOrderNum(){
		return this.orderNum;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  订单编号
	 */
	public void setOrderNum(java.lang.String orderNum){
		this.orderNum = orderNum;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  订单状态
	 */
	@Column(name ="ORDER_STATUS",nullable=true,length=255)
	public java.lang.String getOrderStatus(){
		return this.orderStatus;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  订单状态
	 */
	public void setOrderStatus(java.lang.String orderStatus){
		this.orderStatus = orderStatus;
	}
	/**
	 *方法: 取得java.lang.Double
	 *@return: java.lang.Double  订单总价
	 */
	@Column(name ="ORDER_SALARY",nullable=true,precision=22)
	public java.lang.Double getOrderSalary(){
		return this.orderSalary;
	}

	/**
	 *方法: 设置java.lang.Double
	 *@param: java.lang.Double  订单总价
	 */
	public void setOrderSalary(java.lang.Double orderSalary){
		this.orderSalary = orderSalary;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  用户外键
	 */
	@Column(name ="USER_ID",nullable=true,length=255)
	public java.lang.String getUserId(){
		return this.userId;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  用户外键
	 */
	public void setUserId(java.lang.String userId){
		this.userId = userId;
	}

	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  下单时间
	 */
	@Column(name ="TIME",nullable=true)
	public java.util.Date getTime(){
		return this.time;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  下单时间
	 */
	public void setTime(java.util.Date time){
		this.time = time;
	}


	@Column(name ="ADMIN_ID",nullable=true,length=255)
	public java.lang.String getAdminId(){
		return this.adminId;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  店长外键
	 */
	public void setAdminId(java.lang.String adminId){
		this.adminId = adminId;
	}

	@Column(name ="SHOP_ID",nullable=true,length=255)
	public java.lang.String getShopId(){
		return this.shopId;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  店长外键
	 */
	public void setShopId(java.lang.String shopId){
		this.shopId = shopId;
	}

	@Transient
	public List<SproductEntity> getProducts() {
		return products;
	}

	public void setProducts(List<SproductEntity> products) {
		this.products = products;
	}
}
