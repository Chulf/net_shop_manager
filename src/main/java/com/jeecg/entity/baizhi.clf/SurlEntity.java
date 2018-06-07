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
 * @Description: 店铺表
 * @author zhangdaihao
 * @date 2018-03-14 14:58:03
 * @version V1.0   
 *
 */
@Entity
@Table(name = "s_url", schema = "")
@DynamicUpdate(true)
@DynamicInsert(true)
@SuppressWarnings("serial")
public class SurlEntity implements java.io.Serializable {
	/**主键*/
	private java.lang.String id;
	/**店铺地址*/
	private java.lang.String url;
	/**店铺状态*/
	private java.lang.String status;
	/**店长外键*/
	private java.lang.String adminId;

	private String name1;
	private String name2;

	//是否推荐该店铺 如果推荐 Y
	private String recommend;

	//店铺联系人电话
	private String tel;
	//店铺联系人微信
	private String wx;
	
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
	 *@return: java.lang.String  店铺地址
	 */
	@Column(name ="URL",nullable=true,length=255)
	public java.lang.String getUrl(){
		return this.url;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  店铺地址
	 */
	public void setUrl(java.lang.String url){
		this.url = url;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  店铺状态
	 */
	@Column(name ="STATUS",nullable=true,length=255)
	public java.lang.String getStatus(){
		return this.status;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  店铺状态
	 */
	public void setStatus(java.lang.String status){
		this.status = status;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  店长外键
	 */
	@Column(name ="ADMIN_ID",nullable=true,length=255)
	public java.lang.String getAdminId(){
		return this.adminId;
	}

	public void setAdminId(java.lang.String adminId){
		this.adminId = adminId;
	}
	@Column(name ="NAME1",nullable=true,length=255)
	public java.lang.String getName1(){
		return this.name1;
	}


	public void setName1(java.lang.String name1){
		this.name1 = name1;
	}

	@Column(name ="NAME2",nullable=true,length=255)
	public java.lang.String getName2(){
		return this.name2;
	}


	public void setName2(java.lang.String name2){
		this.name2 = name2;
	}

	@Column(name ="RECOMMEND",nullable=true,length=255)
	public java.lang.String getRecommend(){
		return this.recommend;
	}


	public void setRecommend(java.lang.String recommend){
		this.recommend = recommend;
	}

	@Column(name="TEL",nullable=true,length = 255)
	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	@Column(name="WX",nullable=true,length = 255)
	public String getWx() {
		return wx;
	}

	public void setWx(String wx) {
		this.wx = wx;
	}
}
