package com.csu.mypetstoreproductservice.service;

import com.csu.mypetstoreproductservice.entity.Item;
import com.csu.mypetstoreproductservice.entity.Product;
import com.csu.mypetstoreproductservice.vo.CategoryVO;
import com.csu.mypetstoreproductservice.vo.ItemVO;
import com.csu.mypetstoreproductservice.vo.ProductVO;

import java.util.List;

public interface ProductService {
    List<String> getLanguages();
    List<String> getCategories();
    CategoryVO getCategory(String categoryId);
    ProductVO getProduct(String productId);
    ItemVO getItem(String itemId);
    List<Product> getProductList(String keyword);
    boolean isItemInStock(String itemId);
    List<Product> getProductListByCategory(String categoryId);
    List<Item> getItemListByProduct(String productId);
    List<ItemVO> getItemVOListByProduct(String productId);
    boolean checkItemQuantity(String itemId, int quantity);
}

