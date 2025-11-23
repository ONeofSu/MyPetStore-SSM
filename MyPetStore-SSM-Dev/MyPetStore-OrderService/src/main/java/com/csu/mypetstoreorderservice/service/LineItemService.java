package com.csu.mypetstoreorderservice.service;

import com.csu.mypetstoreorderservice.entity.LineItem;

import java.util.List;

public interface LineItemService {
    public List<LineItem> getLineItemsById(Integer orderId);
}