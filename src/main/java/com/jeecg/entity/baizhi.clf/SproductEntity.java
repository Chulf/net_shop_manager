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
 * @Description: 商品表
 * @author zhangdaihao
 * @date 2018-03-14 14:58:47
 * @version V1.0   
 *
 */
@Entity
@Table(name = "s_product", schema = "")
@DynamicUpdate(true)
@DynamicInsert(true)
@SuppressWarnings("serial")
public class SproductEntity implements java.io.Serializable {
	/**主键*/
	private java.lang.String id;
	/**商品标题*/
	private java.lang.String name;
	/**商品描述*/
	private java.lang.String description;
	/**商品价格*/
	private java.lang.Double price;
	/**商品主图*/
	private java.lang.String imgsrc;
	/**类别外键*/
	private java.lang.String categoryId;
	/**商品内容*/
	private java.lang.String content;
	/**仓库商品标志*/
	private java.lang.String flag;
	/**商品编号*/
	private String productNum;
	
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
	 *@return: java.lang.String  商品标题
	 */
	@Column(name ="NAME",nullable=true,length=255)
	public java.lang.String getName(){
		return this.name;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  商品标题
	 */
	public void setName(java.lang.String name){
		this.name = name;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  商品描述
	 */
	@Column(name ="DESCRIPTION",nullable=true,length=255)
	public java.lang.String getDescription(){
		return this.description;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  商品描述
	 */
	public void setDescription(java.lang.String description){
		this.description = description;
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
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  商品主图
	 */
	@Column(name ="IMGSRC",nullable=true,length=255)
	public java.lang.String getImgsrc(){
		return this.imgsrc;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  商品主图
	 */
	public void setImgsrc(java.lang.String imgsrc){
		this.imgsrc = imgsrc;
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
	 *方法: 取得java.lang.Object
	 *@return: java.lang.Object  商品内容
	 */
	@Column(name ="CONTENT",nullable=true,length=16777215)
	public java.lang.String getContent(){
		return this.content;
	}

	/**
	 *方法: 设置java.lang.Object
	 *@param: java.lang.Object  商品内容
	 */
	public void setContent(java.lang.String content){
		this.content = content;
	}

	/**
	 *方法: 取得java.lang.Object
	 *@return: java.lang.Object  仓库商品标志
	 */
	@Column(name ="FLAG",nullable=true,length=16777215)
	public java.lang.String getFlag(){
		return this.flag;
	}

	/**
	 *方法: 设置java.lang.Object
	 *@param: java.lang.Object  商品内容
	 */
	public void setFlag(java.lang.String flag){
		this.flag = flag;
	}

	@Column(name ="PRODUCTNUM",nullable=true,length=16777215)
	public java.lang.String getProductNum(){
		return this.productNum;
	}

	/**
	 *方法: 设置java.lang.Object
	 *@param: java.lang.Object  商品编号
	 */
	public void setProductNum(java.lang.String productNum){
		this.productNum = productNum;
	}

}
