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
 * @author zhangdaihao
 * @version V1.0
 * @Title: Entity
 * @Description: 订单项表
 * @date 2018-03-14 15:00:42
 */
@Entity
@Table(name = "s_order_item", schema = "")
@DynamicUpdate(true)
@DynamicInsert(true)
@SuppressWarnings("serial")
public class SorderItemEntity implements java.io.Serializable {
    /**
     * 主键
     */
    private java.lang.String id;
    /**
     * 订单主键
     */
    private java.lang.String orderId;
    /**
     * 商品主键
     */
    private java.lang.String productId;
    /**
     * 商品标题
     */
    private java.lang.String name;
    /**
     * 商品描述
     */
    private java.lang.String description;
    /**
     * 商品价格
     */
    private java.lang.Double price;
    /**
     * 商品主图
     */
    private java.lang.String imgsrc;
    /**
     * 数量
     */
    private java.lang.Integer count;

    /**
     * 方法: 取得java.lang.String
     *
     * @return: java.lang.String  主键
     */
    /**商品编号*/
    private String productNum;

    @Id
    @GeneratedValue(generator = "paymentableGenerator")
    @GenericGenerator(name = "paymentableGenerator", strategy = "uuid")
    @Column(name = "ID", nullable = false, length = 255)
    public java.lang.String getId() {
        return this.id;
    }

    /**
     * 方法: 设置java.lang.String
     *
     * @param: java.lang.String  主键
     */
    public void setId(java.lang.String id) {
        this.id = id;
    }

    /**
     * 方法: 取得java.lang.String
     *
     * @return: java.lang.String  订单主键
     */
    @Column(name = "ORDER_ID", nullable = true, length = 255)
    public java.lang.String getOrderId() {
        return this.orderId;
    }

    /**
     * 方法: 设置java.lang.String
     *
     * @param: java.lang.String  订单主键
     */
    public void setOrderId(java.lang.String orderId) {
        this.orderId = orderId;
    }

    /**
     * 方法: 取得java.lang.String
     *
     * @return: java.lang.String  商品主键
     */
    @Column(name = "PRODUCT_ID", nullable = true, length = 255)
    public java.lang.String getProductId() {
        return this.productId;
    }

    /**
     * 方法: 设置java.lang.String
     *
     * @param: java.lang.String  商品主键
     */
    public void setProductId(java.lang.String productId) {
        this.productId = productId;
    }

    /**
     * 方法: 取得java.lang.String
     *
     * @return: java.lang.String  商品标题
     */
    @Column(name = "NAME", nullable = true, length = 255)
    public java.lang.String getName() {
        return this.name;
    }

    /**
     * 方法: 设置java.lang.String
     *
     * @param: java.lang.String  商品标题
     */
    public void setName(java.lang.String name) {
        this.name = name;
    }

    /**
     * 方法: 取得java.lang.String
     *
     * @return: java.lang.String  商品描述
     */
    @Column(name = "DESCRIPTION", nullable = true, length = 255)
    public java.lang.String getDescription() {
        return this.description;
    }

    /**
     * 方法: 设置java.lang.String
     *
     * @param: java.lang.String  商品描述
     */
    public void setDescription(java.lang.String description) {
        this.description = description;
    }

    /**
     * 方法: 取得java.lang.Double
     *
     * @return: java.lang.Double  商品价格
     */
    @Column(name = "PRICE", nullable = true, precision = 22)
    public java.lang.Double getPrice() {
        return this.price;
    }

    /**
     * 方法: 设置java.lang.Double
     *
     * @param: java.lang.Double  商品价格
     */
    public void setPrice(java.lang.Double price) {
        this.price = price;
    }

    /**
     * 方法: 取得java.lang.String
     *
     * @return: java.lang.String  商品主图
     */
    @Column(name = "IMGSRC", nullable = true, length = 255)
    public java.lang.String getImgsrc() {
        return this.imgsrc;
    }

    /**
     * 方法: 设置java.lang.String
     *
     * @param: java.lang.String  商品主图
     */
    public void setImgsrc(java.lang.String imgsrc) {
        this.imgsrc = imgsrc;
    }

    /**
     * 方法: 取得java.lang.Integer
     *
     * @return: java.lang.Integer  数量
     */
    @Column(name = "COUNT", nullable = true, precision = 10, scale = 0)
    public java.lang.Integer getCount() {
        return this.count;
    }

    /**
     * 方法: 设置java.lang.Integer
     *
     * @param: java.lang.Integer  数量
     */
    public void setCount(java.lang.Integer count) {
        this.count = count;
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
