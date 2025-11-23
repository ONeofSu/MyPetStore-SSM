package com.csu.mypetstoreorderservice.service.impl;

import com.csu.mypetstoreorderservice.entity.OrderStatus;
import com.csu.mypetstoreorderservice.persistence.OrderStatusMapper;
import com.csu.mypetstoreorderservice.service.OrderStatusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("orderStatusService")
public class OrderStatusServiceImpl implements OrderStatusService {
    @Autowired
    OrderStatusMapper orderStatusMapper;

    @Override
    public boolean finishOrder(int orderId) {
        boolean flag = false;
        OrderStatus orderStatus = orderStatusMapper.selectById(orderId);
        if(orderStatus.getStatus().equals("P")){
            orderStatus.setStatus("F");
            flag = true;
            orderStatusMapper.updateById(orderStatus);
        }
        return flag;
    }

    @Override
    public boolean cancelOrder(int orderId) {
        boolean flag = false;
        OrderStatus orderStatus = orderStatusMapper.selectById(orderId);
        if(orderStatus.getStatus().equals("W")){
            orderStatus.setStatus("N");
            flag = true;
            orderStatusMapper.updateById(orderStatus);
        }
        return flag;
    }
}