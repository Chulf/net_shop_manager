package com.jeecg.vo;

import org.jeecgframework.poi.excel.annotation.Excel;
import org.jeecgframework.poi.excel.annotation.ExcelCollection;

import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2018/4/18.
 */
public class ExcelOrderItem {

    @Excel(name = "订单编号/Il numero d'Ordine",width = 30)
    //订单编号
    private String orderNum;

    @Excel(name="订单总价/In totale",width=20)
    //订单总价
    private Double orderSalary;

    //下单时间
    @Excel(name = "下单时间/Tempo singolo",width = 30)
    private Date createTime;
    //下单人
    @Excel(name="用户名/IL nome utente",dictTable = "s_user",dicCode = "id",dicText="username",width = 20)
    private String username;
    //联系方式
    @Excel(name="联系方式/IL MoDo di contattare",dictTable = "s_user",dicCode = "id",dicText="phone",width = 20)
    private String phone;
    //订单项
    @ExcelCollection(name = "订单详情/L'Ordine di dettagli")
    private List<ProductItem> productItemList;


    public String getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(String orderNum) {
        this.orderNum = orderNum;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public List<ProductItem> getProductItemList() {
        return productItemList;
    }

    public void setProductItemList(List<ProductItem> productItemList) {
        this.productItemList = productItemList;
    }

    public Double getOrderSalary() {
        return orderSalary;
    }

    public void setOrderSalary(Double orderSalary) {
        this.orderSalary = orderSalary;
    }
}
