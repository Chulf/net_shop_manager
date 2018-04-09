package com.jeecg.vo;

import org.jeecgframework.poi.excel.annotation.Excel;

/**
 * Created by Administrator on 2018/4/4.
 */
public class ExcelOrder {


    private String id;

    @Excel(name="商品名字/productName",width = 100)
    private String productName;
    @Excel(name="购买数量/bugCount",width = 50)
    private Integer count;
    @Excel(name="是否仓库商品/isStore?",width = 50)
    private String flag;

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

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
}
