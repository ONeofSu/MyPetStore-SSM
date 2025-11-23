package com.csu.mypetstoreorderservice.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.csu.mypetstoreorderservice.entity.Order;
import com.csu.mypetstoreorderservice.entity.OrderStatus;
import com.csu.mypetstoreorderservice.persistence.OrderMapper;
import com.csu.mypetstoreorderservice.persistence.OrderStatusMapper;
import com.csu.mypetstoreorderservice.service.LineItemService;
import com.csu.mypetstoreorderservice.service.OrderService;
import com.csu.mypetstoreorderservice.vo.OrderVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service("orderService")
public class OrderServiceImpl implements OrderService {
    @Autowired
    OrderStatusMapper orderStatusMapper;

    @Autowired
    OrderMapper orderMapper;

    @Autowired
    LineItemService lineItemService;

    @Override
    public List<OrderVo> getAllOrders() {
        //init
        List<Order> orders = orderMapper.selectList(new QueryWrapper<>());
        List<OrderVo> orderVos = new ArrayList<>();

        for(int i=0;i<orders.size();i++){
            Order order = orders.get(i);
            OrderVo orderVo = new OrderVo(order);

            //get Status
            OrderStatus orderStatus = orderStatusMapper.selectById(order.getOrderId());
            if (orderStatus == null) {
                orderStatus = new OrderStatus();
                orderStatus.setOrderId(order.getOrderId());
                orderStatus.setStatus("Error"); // 设置默认状态
            }

            orderVo.setStatus(orderStatus.getStatus());

            //get order line items
            orderVo.setLineItems(lineItemService.getLineItemsById(order.getOrderId()));

            orderVos.add(orderVo);
        }

        return orderVos;
    }

    @Override
    public List<OrderVo> getCancelingOrders() {
        //init
        List<OrderVo> orderVos = getAllOrders();
        List<OrderVo> result = new ArrayList<>();

        //choose status = W
        for(int i=0;i<orderVos.size();i++){
            OrderVo orderVo = orderVos.get(i);
            String status = orderVo.getStatus();
            if(status.equals("W")){
                result.add(orderVo);
            }
        }

        return result;
    }

    @Override
    public List<OrderVo> getCanceledOrders() {
        //init
        List<OrderVo> orderVos = getAllOrders();
        List<OrderVo> result = new ArrayList<>();

        //choose status = N
        for(int i=0;i<orderVos.size();i++){
            OrderVo orderVo = orderVos.get(i);
            String status = orderVo.getStatus();
            if(status.equals("N")){
                result.add(orderVo);
            }
        }

        return result;
    }

    @Override
    public List<OrderVo> getDoingOrders() {
        //init
        List<OrderVo> orderVos = getAllOrders();
        List<OrderVo> result = new ArrayList<>();

        //choose status = P
        for(int i=0;i<orderVos.size();i++){
            OrderVo orderVo = orderVos.get(i);
            String status = orderVo.getStatus();
            if(status.equals("P")){
                result.add(orderVo);
            }
        }

        return result;
    }

    @Override
    public List<OrderVo> getDoneOrders() {
        //init
        List<OrderVo> orderVos = getAllOrders();
        List<OrderVo> result = new ArrayList<>();

        //choose status = F
        for(int i=0;i<orderVos.size();i++){
            OrderVo orderVo = orderVos.get(i);
            String status = orderVo.getStatus();
            if(status.equals("F")){
                result.add(orderVo);
            }
        }

        return result;
    }

    private static ArrayList<OrderVo> getResult() {
        return new ArrayList<>();
    }

    @Override
    public List<OrderVo> getUserOrders(String userId) {
        //init
        List<OrderVo> orderVos = new ArrayList<OrderVo>();

        //get orders
        QueryWrapper<Order> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("userid", userId);
        List<Order> orders = orderMapper.selectList(queryWrapper);

        for(int i=0;i<orders.size();i++){
            Order order = orders.get(i);
            OrderVo orderVo = new OrderVo(order);

            //get Status
            OrderStatus orderStatus = orderStatusMapper.selectById(order.getOrderId());
            if (orderStatus == null) {
                orderStatus = new OrderStatus();
                orderStatus.setOrderId(order.getOrderId());
                orderStatus.setStatus("Error"); // 设置默认状态
            }

            orderVo.setStatus(orderStatus.getStatus());

            //get order line items
            orderVo.setLineItems(lineItemService.getLineItemsById(order.getOrderId()));

            orderVos.add(orderVo);
        }
        return orderVos;
    }

    @Override
    public List<OrderVo> getUserDoingOrders(String userId) {
        //init
        List<OrderVo> orderVos = getUserOrders(userId);
        List<OrderVo> result = new ArrayList<>();

        //choose status = P
        for(int i=0;i<orderVos.size();i++){
            OrderVo orderVo = orderVos.get(i);
            String status = orderVo.getStatus();
            if(status.equals("P")){
                result.add(orderVo);
            }
        }

        return result;
    }

    @Override
    public List<OrderVo> getUserDoneOrders(String userId) {
        //init
        List<OrderVo> orderVos = getUserOrders(userId);
        List<OrderVo> result = new ArrayList<>();

        //choose status = F
        for(int i=0;i<orderVos.size();i++){
            OrderVo orderVo = orderVos.get(i);
            String status = orderVo.getStatus();
            if(status.equals("F")){
                result.add(orderVo);
            }
        }

        return result;
    }

    @Override
    public List<OrderVo> getUserCancelingOrders(String userId) {
        //init
        List<OrderVo> orderVos = getUserOrders(userId);
        List<OrderVo> result = new ArrayList<>();

        //choose status = W
        for(int i=0;i<orderVos.size();i++){
            OrderVo orderVo = orderVos.get(i);
            String status = orderVo.getStatus();
            if(status.equals("W")){
                result.add(orderVo);
            }
        }

        return result;
    }

    @Override
    public List<OrderVo> getUserCanceledOrders(String userId) {
        //init
        List<OrderVo> orderVos = getUserOrders(userId);
        List<OrderVo> result = new ArrayList<>();

        //choose status = N
        for(int i=0;i<orderVos.size();i++){
            OrderVo orderVo = orderVos.get(i);
            String status = orderVo.getStatus();
            if(status.equals("N")){
                result.add(orderVo);
            }
        }

        return result;
    }

    @Override
    public OrderVo getOrderById(String orderId)
    {
        Order order = orderMapper.selectById(orderId);
        OrderVo orderVo = new OrderVo(order);
        OrderStatus orderStatus = orderStatusMapper.selectById(order.getOrderId());
        if (orderStatus == null) {
            orderStatus = new OrderStatus();
            orderStatus.setOrderId(order.getOrderId());
            orderStatus.setStatus("Error"); // 设置默认状态
        }

        orderVo.setStatus(orderStatus.getStatus());

        //get order line items
        orderVo.setLineItems(lineItemService.getLineItemsById(order.getOrderId()));

        return orderVo;
    }
}