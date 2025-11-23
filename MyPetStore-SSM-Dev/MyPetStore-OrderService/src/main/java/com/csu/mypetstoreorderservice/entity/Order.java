package com.csu.mypetstoreorderservice.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

@Data
@TableName("orders")
public class Order {
    @TableId(value = "orderid")
    private int orderId;
    @TableField("userid")
    private String userId;
    @TableField("orderdate")
    private Date orderDate;
    @TableField("shipaddr1")
    private String shipAddr1;
    @TableField("shipaddr2")
    private String shipAddr2;
    @TableField("shipcity")
    private String shipCity;
    @TableField("shipstate")
    private String shipState;
    @TableField("shipzip")
    private String shipZip;
    @TableField("shipcountry")
    private String shipCountry;
    @TableField("billaddr1")
    private String billAddr1;
    @TableField("billaddr2")
    private String billAddr2;
    @TableField("billcity")
    private String billCity;
    @TableField("billstate")
    private String billState;
    @TableField("billzip")
    private String billZip;
    @TableField("billcountry")
    private String billCountry;
    private String courier;
    @TableField("totalprice")
    private BigDecimal totalPrice;
    @TableField("shiptofirstname")
    private String shipToFirstName;
    @TableField("shiptolastname")
    private String shipToLastName;
    @TableField("billtofirstname")
    private String billToFirstName;
    @TableField("billtolastname")
    private String billToLastName;
    @TableField("creditcard")
    private String creditCard;
    @TableField("exprdate")
    private String exprDate;
    @TableField("cardtype")
    private String cardType;
    private String locale;
}