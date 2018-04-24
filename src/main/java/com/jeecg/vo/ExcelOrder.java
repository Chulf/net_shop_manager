package com.jeecg.vo;

import org.jeecgframework.poi.excel.annotation.Excel;

/**
 * Created by Administrator on 2018/4/4.
 */
public class ExcelOrder {


    private String id;

    @Excel(name="商品名字/productName",width = 30)
    private String productName;
    @Excel(name="购买数量/bugCount",width = 30)
    private Integer count;
    @Excel(name="商品单价/prezzo unitario",width = 30)
    private Double price;
    //下单人
    @Excel(name="用户名/IL nome utente",dictTable = "s_user",dicCode = "id",dicText="username",width = 30)
    private String username;
    //联系方式
    @Excel(name="联系方式/IL MoDo di contattare",dictTable = "s_user",dicCode = "id",dicText="phone",width = 30)
    private String phone;


    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
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
}
