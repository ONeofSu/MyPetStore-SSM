package com.csu.mypetstoreproductservice.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.csu.mypetstoreproductservice.entity.Category;
import com.csu.mypetstoreproductservice.entity.Item;
import com.csu.mypetstoreproductservice.entity.ItemQuantity;
import com.csu.mypetstoreproductservice.entity.Product;
import com.csu.mypetstoreproductservice.persistence.*;
import com.csu.mypetstoreproductservice.service.ProductService;
import com.csu.mypetstoreproductservice.vo.CategoryVO;
import com.csu.mypetstoreproductservice.vo.ItemVO;
import com.csu.mypetstoreproductservice.vo.ProductVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {
    private static final List<String> LANGUAGE_LIST;
    private static final List<String> CATEGORY_LIST;
    
    @Autowired
    private CategoryMapper categoryMapper;
    @Autowired
    private ProductMapper productMapper;
    @Autowired
    private ItemMapper itemMapper;
    @Autowired
    private ItemQuantityMapper itemQuantityMapper;
    @Autowired
    private InventoryMapper inventoryMapper;

    static {
        LANGUAGE_LIST = Arrays.asList("english", "japanese");
        CATEGORY_LIST = Arrays.asList("FISH", "DOGS", "REPTILES", "CATS", "BIRDS");
    }

    @Override
    public List<String> getLanguages() {
        return LANGUAGE_LIST;
    }

    @Override
    public List<String> getCategories() {
        return CATEGORY_LIST;
    }

    @Override
    public CategoryVO getCategory(String categoryId) {
        CategoryVO categoryVO = new CategoryVO();
        Category category = categoryMapper.selectById(categoryId);
        QueryWrapper<Product> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("category", categoryId);
        List<Product> productList = productMapper.selectList(queryWrapper);
        categoryVO.setCategoryId(categoryId);
        categoryVO.setCategoryName(category.getName());
        categoryVO.setProductList(productList);
        return categoryVO;
    }

    @Override
    public ProductVO getProduct(String productId) {
        ProductVO productVO = new ProductVO();
        Product product = productMapper.selectById(productId);
        QueryWrapper<Item> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("productid", productId);
        List<Item> itemList = itemMapper.selectList(queryWrapper);
        productVO.setProductId(productId);
        productVO.setCategoryId(product.getCategoryId());
        productVO.setProductName(product.getName());
        productVO.setItemList(itemList);
        productVO.setDescription(product.getDescription());
        return productVO;
    }

    @Override
    public ItemVO getItem(String itemId) {
        ItemVO itemVO = new ItemVO();
        Item item = itemMapper.selectById(itemId);
        Product product = productMapper.selectById(item.getProductId());
        ItemQuantity itemQuantity = itemQuantityMapper.selectById(itemId);
        itemVO.setItemId(itemId);
        itemVO.setProductId(product.getProductId());
        itemVO.setProductName(product.getName());
        itemVO.setListPrice(item.getListPrice());
        itemVO.setAttribute1(item.getAttribute1());
        itemVO.setAttribute2(item.getAttribute2());
        itemVO.setAttribute3(item.getAttribute3());
        itemVO.setAttribute4(item.getAttribute4());
        itemVO.setAttribute5(item.getAttribute5());
        itemVO.setQuantity(itemQuantity.getQuantity());
        return itemVO;
    }

    @Override
    public List<Product> getProductList(String keyword) {
        QueryWrapper<Product> queryWrapper = new QueryWrapper<>();
        queryWrapper.like("name", keyword);
        return productMapper.selectList(queryWrapper);
    }

    @Override
    public boolean isItemInStock(String itemId) {
        int quantity = inventoryMapper.selectById(itemId).getQuantity();
        return quantity > 0;
    }

    @Override
    public List<Product> getProductListByCategory(String categoryId) {
        QueryWrapper<Product> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("category", categoryId);
        return productMapper.selectList(queryWrapper);
    }

    @Override
    public List<Item> getItemListByProduct(String productId) {
        QueryWrapper<Item> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("productid", productId);
        return itemMapper.selectList(queryWrapper);
    }

    @Override
    public List<ItemVO> getItemVOListByProduct(String productId) {
        List<Item> itemList = getItemListByProduct(productId);
        List<ItemVO> itemVOList = new ArrayList<>();
        for (Item item : itemList) {
            ItemVO itemVO = getItem(item.getItemId());
            itemVOList.add(itemVO);
        }
        return itemVOList;
    }

    @Override
    public boolean checkItemQuantity(String itemId, int quantity) {
        int itemQuantity = inventoryMapper.selectById(itemId).getQuantity();
        return quantity <= itemQuantity;
    }

    @Override
    public Product createProduct(Product product) {
        // 检查商品ID是否已存在
        Product existingProduct = productMapper.selectById(product.getProductId());
        if (existingProduct != null) {
            throw new RuntimeException("商品ID已存在: " + product.getProductId());
        }
        
        // 验证分类是否存在
        if (product.getCategoryId() != null && !CATEGORY_LIST.contains(product.getCategoryId())) {
            throw new RuntimeException("无效的分类ID: " + product.getCategoryId());
        }
        
        // 插入商品
        int result = productMapper.insert(product);
        if (result > 0) {
            return productMapper.selectById(product.getProductId());
        } else {
            throw new RuntimeException("创建商品失败");
        }
    }

    @Override
    public Product updateProduct(String productId, Product product) {
        // 检查商品是否存在
        Product existingProduct = productMapper.selectById(productId);
        if (existingProduct == null) {
            throw new RuntimeException("商品不存在: " + productId);
        }
        
        // 验证分类是否存在（如果提供了分类ID）
        if (product.getCategoryId() != null && !CATEGORY_LIST.contains(product.getCategoryId())) {
            throw new RuntimeException("无效的分类ID: " + product.getCategoryId());
        }
        
        // 设置商品ID（确保使用路径参数中的ID）
        product.setProductId(productId);
        
        // 更新商品
        int result = productMapper.updateById(product);
        if (result > 0) {
            return productMapper.selectById(productId);
        } else {
            throw new RuntimeException("更新商品失败");
        }
    }

    @Override
    public boolean deleteProduct(String productId) {
        // 检查商品是否存在
        Product existingProduct = productMapper.selectById(productId);
        if (existingProduct == null) {
            throw new RuntimeException("商品不存在: " + productId);
        }
        
        // 检查是否有关联的Item（可选：根据业务需求决定是否允许删除有关联Item的商品）
        QueryWrapper<Item> itemQueryWrapper = new QueryWrapper<>();
        itemQueryWrapper.eq("productid", productId);
        List<Item> items = itemMapper.selectList(itemQueryWrapper);
        if (!items.isEmpty()) {
            // 如果业务要求删除商品时同时删除关联的Item，可以在这里实现
            // 目前我们只删除商品，保留Item（或者抛出异常）
            // 这里选择抛出异常，提示先删除关联的Item
            throw new RuntimeException("无法删除商品，该商品下还有 " + items.size() + " 个Item。请先删除关联的Item。");
        }
        
        // 删除商品
        int result = productMapper.deleteById(productId);
        return result > 0;
    }
}

