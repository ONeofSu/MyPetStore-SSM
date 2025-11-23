package com.csu.mypetstoreorderservice.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.util.Date;

@Data
@TableName("orderstatus")
public class OrderStatus {
    @TableId(value = "orderid")
    private int orderId;
    @TableField("linenum")
    private int lineNum;
    @TableField("timestamp")
    private Date timeStamp;
    @TableField("status")
    private String status;

    public OrderStatus(){

    }

    public OrderStatus(int orderId, int lineNum, Date timeStamp, String status) {
        this.orderId = orderId;
        this.lineNum = lineNum;
        this.timeStamp = timeStamp;
        this.status = status;
    }
}