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
 * @Description: 类别管理员表
 * @author zhangdaihao
 * @date 2018-03-14 15:03:11
 * @version V1.0   
 *
 */
@Entity
@Table(name = "s_admin_category", schema = "")
@DynamicUpdate(true)
@DynamicInsert(true)
@SuppressWarnings("serial")
public class SadminCategoryEntity implements java.io.Serializable {
	/**主键*/
	private java.lang.String id;
	/**类别外键*/
	private java.lang.String categoryId;
	/**管理员外键*/
	private java.lang.String adminId;
	
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
	 *@return: java.lang.String  类别外键
	 */
	@Column(name ="CATEGORY_ID",nullable=true,length=255)
	public java.lang.String getCategoryId(){
		return this.categoryId;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  类别外键
	 */
	public void setCategoryId(java.lang.String categoryId){
		this.categoryId = categoryId;
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
}
