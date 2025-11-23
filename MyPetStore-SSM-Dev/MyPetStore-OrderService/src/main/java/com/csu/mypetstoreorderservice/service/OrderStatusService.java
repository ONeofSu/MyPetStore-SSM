package com.csu.mypetstoreorderservice.service;

public interface OrderStatusService {
    public boolean finishOrder(int orderId);    //完成订单
    public boolean cancelOrder(int orderId);    //取消订单
}