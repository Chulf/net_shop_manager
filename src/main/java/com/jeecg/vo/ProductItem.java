package com.jeecg.vo;

import org.jeecgframework.poi.excel.annotation.Excel;

/**
 * Created by Administrator on 2018/4/18.
 */
//导出excel 信息
public class ProductItem {

    //商品名字
    @Excel(name = "商品名字/IL nome di Merci",width = 20)
    private String productName;
    //商品数量
    @Excel(name = "商品数量/IL Numero di",width = 20)
    private Integer count;
    //商品编号
    @Excel(name = "商品编号/La numerazione",width = 20)
    private String productNum;

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

    public String getProductNum() {
        return productNum;
    }

    public void setProductNum(String productNum) {
        this.productNum = productNum;
    }
}
