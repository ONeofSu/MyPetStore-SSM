package com.csu.mypetstoreproductservice.vo;

import lombok.Data;
import com.csu.mypetstoreproductservice.entity.Product;

import java.util.List;

@Data
public class CategoryVO {
    private String categoryId;
    private String categoryName;
    private List<Product> productList;
}

