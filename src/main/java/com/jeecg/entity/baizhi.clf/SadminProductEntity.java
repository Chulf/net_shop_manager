package com.jeecg.entity.baizhi.clf;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.GenericGenerator;
import javax.persistence.SequenceGenerator;

/**   
 * @Title: Entity
 * @Description: 商品管理员表
 * @author zhangdaihao
 * @date 2018-03-14 15:02:25
 * @version V1.0   
 *
 */
@Entity
@Table(name = "s_admin_product", schema = "")
@DynamicUpdate(true)
@DynamicInsert(true)
@SuppressWarnings("serial")
public class SadminProductEntity implements java.io.Serializable {
	/**主键 */
	private java.lang.String id;
	/**商品外键*/
	private java.lang.String productId;
	/**管理员外键*/
	private java.lang.String adminId;
	/**商品价格*/
	private java.lang.Double price;
	
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
	 *@return: java.lang.String  商品外键
	 */
	@Column(name ="PRODUCT_ID",nullable=true,length=255)
	public java.lang.String getProductId(){
		return this.productId;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  商品外键
	 */
	public void setProductId(java.lang.String productId){
		this.productId = productId;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  管理员外键
	 */
	@Column(name ="ADMIN_ID",nullable=true,length=255)
	public java.lang.String getAdminId(){
		return this.adminId;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  管理员外键
	 */
	public void setAdminId(java.lang.String adminId){
		this.adminId = adminId;
	}
	/**
	 *方法: 取得java.lang.Double
	 *@return: java.lang.Double  商品价格
	 */
	@Column(name ="PRICE",nullable=true,precision=22)
	public java.lang.Double getPrice(){
		return this.price;
	}

	/**
	 *方法: 设置java.lang.Double
	 *@param: java.lang.Double  商品价格
	 */
	public void setPrice(java.lang.Double price){
		this.price = price;
	}
}
