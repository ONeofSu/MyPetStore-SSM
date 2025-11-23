package com.csu.mypetstoreorderservice.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@TableName("lineitem")
public class LineItem {
    @TableId(value = "orderid")
    private int orderId;
    @TableField("linenum")
    private int lineNumber;
    @TableField("itemid")
    private String itemId;
    private int quantity;
    @TableField("unitprice")
    private int unitPrice;
}