package com.csu.mypetstoreorderservice.service;

import com.csu.mypetstoreorderservice.vo.OrderVo;

import java.util.List;

public interface OrderService {
    public List<OrderVo> getAllOrders();    //获得全部订单
    public List<OrderVo> getCancelingOrders();  //获得全部待取消订单
    public List<OrderVo> getCanceledOrders();   //获得全部已取消的订单
    public List<OrderVo> getDoingOrders();  //获得进行中的订单
    public List<OrderVo> getDoneOrders();   //获得已完成的订单
    public List<OrderVo> getUserOrders(String userId);  //获得用户的所有订单
    public List<OrderVo> getUserDoingOrders(String userId); //获得用户进行中的订单
    public List<OrderVo> getUserDoneOrders(String userId);  //获得用户已完成的订单
    public List<OrderVo> getUserCancelingOrders(String userId); //获得用户待取消的订单
    public List<OrderVo> getUserCanceledOrders(String userId);  //获得用户已取消的订单
    public OrderVo getOrderById(String orderId);
}