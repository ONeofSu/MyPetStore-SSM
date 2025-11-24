package com.csu.mypetstoreorderservice.vo;

import lombok.Data;
import com.csu.mypetstoreorderservice.entity.LineItem;
import com.csu.mypetstoreorderservice.entity.Order;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Data
public class OrderVo {
    private int orderId;
    private String userId;
    private Date orderDate;
    private String shipAddress1;
    private String shipAddress2;
    private String shipCity;
    private String shipState;
    private String shipZip;
    private String shipCountry;
    private String billAddress1;
    private String billAddress2;
    private String billCity;
    private String billState;
    private String billZip;
    private String billCountry;
    private String courier;
    private BigDecimal totalPrice;
    private String billToFirstName;
    private String billToLastName;
    private String shipToFirstName;
    private String shipToLastName;
    private String creditCard;
    private String expiryDate;
    private String cardType;
    private String locale;
    private String status;
    private List<LineItem> lineItems = new ArrayList<LineItem>();
    private UserAccountVO userInfo;

    public OrderVo() {

    }
    public OrderVo(Order order) {
        this.orderId = order.getOrderId();
        this.userId = order.getUserId();
        this.orderDate = order.getOrderDate();
        this.shipAddress1 = order.getShipAddr1();
        this.shipAddress2 = order.getShipAddr2();
        this.shipCity = order.getShipCity();
        this.shipState = order.getShipState();
        this.shipZip = order.getShipZip();
        this.shipCountry = order.getShipCountry();
        this.billAddress1 = order.getBillAddr1();
        this.billAddress2 = order.getBillAddr2();
        this.billCity = order.getBillCity();
        this.billState = order.getBillState();
        this.billZip = order.getBillZip();
        this.billCountry = order.getBillCountry();
        this.courier = order.getCourier();
        this.totalPrice = order.getTotalPrice();
        this.billToFirstName = order.getBillToFirstName();
        this.billToLastName = order.getBillToLastName();
        this.shipToFirstName = order.getShipToFirstName();
        this.shipToLastName = order.getShipToLastName();
        this.creditCard = order.getCreditCard();
        this.expiryDate = order.getExprDate();
        this.cardType = order.getCardType();
        this.locale = order.getLocale();
        this.status = null;
    }
}
