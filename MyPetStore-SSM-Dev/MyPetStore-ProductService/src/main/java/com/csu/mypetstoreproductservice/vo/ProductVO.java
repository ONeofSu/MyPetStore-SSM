package com.csu.mypetstoreproductservice.vo;

import lombok.Data;
import com.csu.mypetstoreproductservice.entity.Item;

import java.util.List;

@Data
public class ProductVO {
    private String productId;
    private String categoryId;
    private String productName;
    public String description;
    private List<Item> itemList;
}

