package com.csu.mypetstoreorderservice.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.csu.mypetstoreorderservice.entity.LineItem;
import com.csu.mypetstoreorderservice.persistence.LineItemMapper;
import com.csu.mypetstoreorderservice.service.LineItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("lineItemService")
public class LineItemServiceImpl implements LineItemService {
    @Autowired
    private LineItemMapper lineItemMapper;

    @Override
    public List<LineItem> getLineItemsById(Integer orderId) {
        QueryWrapper<LineItem> wrapper = new QueryWrapper<>();
        wrapper.eq("orderid", orderId);
        List<LineItem> list = lineItemMapper.selectList(wrapper);
        return list;
    }
}