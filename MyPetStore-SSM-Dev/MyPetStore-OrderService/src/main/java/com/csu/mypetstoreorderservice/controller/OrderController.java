package com.csu.mypetstoreorderservice.controller;

import com.csu.mypetstoreorderservice.service.OrderService;
import com.csu.mypetstoreorderservice.service.OrderStatusService;
import com.csu.mypetstoreorderservice.vo.OrderVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/order")
public class OrderController {
    @Autowired
    OrderService orderService;

    @Autowired
    OrderStatusService orderStatusService;

    @GetMapping("/all")
    public List<OrderVo> getAllOrders() {
        return orderService.getAllOrders();
    }

    @GetMapping("/cancelling")
    public List<OrderVo> getCancellingOrders() {
        return orderService.getCancelingOrders();
    }

    @GetMapping("/cancelled")
    public List<OrderVo> getCancelledOrders() {
        return orderService.getCanceledOrders();
    }

    @GetMapping("/pending")
    public List<OrderVo> getPendingOrders() {
        return orderService.getDoingOrders();
    }

    @GetMapping("/done")
    public List<OrderVo> getDoneOrders() {
        return orderService.getDoneOrders();
    }

    @GetMapping("/user/{userId}")
    public List<OrderVo> getUserOrders(@PathVariable String userId) {
        System.out.println("[request] /api/order/user/" + userId);
        return orderService.getUserOrders(userId);
    }

    @GetMapping("/user/{userId}/pending")
    public List<OrderVo> getUserPendingOrders(@PathVariable String userId) {
        return orderService.getUserDoingOrders(userId);
    }

    @GetMapping("/user/{userId}/done")
    public List<OrderVo> getUserDoneOrders(@PathVariable String userId) {
        return orderService.getUserDoneOrders(userId);
    }

    @GetMapping("/user/{userId}/cancelling")
    public List<OrderVo> getUserCancellingOrders(@PathVariable String userId) {
        return orderService.getUserCancelingOrders(userId);
    }

    @GetMapping("/user/{userId}/cancelled")
    public List<OrderVo> getUserCancelledOrders(@PathVariable String userId) {
        return orderService.getUserCanceledOrders(userId);
    }

    @GetMapping("/{orderId}")
    public OrderVo getOrderById(@PathVariable String orderId) {
        return orderService.getOrderById(orderId);
    }

    @PostMapping("/handle/finish/{orderId}")
    public boolean handleFinishOrder(@PathVariable(name="orderId") int orderId) {
        return orderStatusService.finishOrder(orderId);
    }

    @PostMapping("/handle/cancel/{orderId}")
    public boolean handleCancelOrder(@PathVariable(name="orderId") int orderId) {
        return orderStatusService.cancelOrder(orderId);
    }
}