package com.csu.mypetstoreproductservice.controller;

import com.csu.mypetstoreproductservice.entity.Item;
import com.csu.mypetstoreproductservice.entity.Product;
import com.csu.mypetstoreproductservice.service.ProductService;
import com.csu.mypetstoreproductservice.vo.CategoryVO;
import com.csu.mypetstoreproductservice.vo.ItemVO;
import com.csu.mypetstoreproductservice.vo.ProductVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1/products")
public class ProductController {

    @Autowired
    private ProductService productService;

    // GET - 获取所有分类
    @GetMapping("/categories")
    public ResponseEntity<List<String>> getCategories() {
        return ResponseEntity.ok(productService.getCategories());
    }

    // GET - 获取所有语言
    @GetMapping("/languages")
    public ResponseEntity<List<String>> getLanguages() {
        return ResponseEntity.ok(productService.getLanguages());
    }

    // GET - 根据分类ID获取分类信息
    @GetMapping("/categories/{categoryId}")
    public ResponseEntity<CategoryVO> getCategory(@PathVariable String categoryId) {
        CategoryVO category = productService.getCategory(categoryId);
        return ResponseEntity.ok(category);
    }

    // GET - 根据商品ID获取商品信息
    @GetMapping("/{productId}")
    public ResponseEntity<ProductVO> getProduct(@PathVariable String productId) {
        ProductVO product = productService.getProduct(productId);
        return ResponseEntity.ok(product);
    }

    // GET - 根据商品ID获取商品下的所有Item
    @GetMapping("/{productId}/items")
    public ResponseEntity<List<Item>> getItemsByProduct(@PathVariable String productId) {
        List<Item> items = productService.getItemListByProduct(productId);
        return ResponseEntity.ok(items);
    }

    // GET - 根据Item ID获取Item详情
    @GetMapping("/items/{itemId}")
    public ResponseEntity<ItemVO> getItem(@PathVariable String itemId) {
        ItemVO item = productService.getItem(itemId);
        if (item != null) {
            return ResponseEntity.ok(item);
        }
        return ResponseEntity.notFound().build();
    }

    // GET - 根据关键词搜索商品
    @GetMapping("/search")
    public ResponseEntity<List<Product>> searchProducts(@RequestParam String keyword) {
        List<Product> products = productService.getProductList(keyword);
        return ResponseEntity.ok(products);
    }

    // GET - 根据分类ID获取该分类下的所有商品
    @GetMapping("/categories/{categoryId}/products")
    public ResponseEntity<List<Product>> getProductsByCategory(@PathVariable String categoryId) {
        List<Product> products = productService.getProductListByCategory(categoryId);
        return ResponseEntity.ok(products);
    }

    // GET - 检查Item是否有库存
    @GetMapping("/items/{itemId}/stock")
    public ResponseEntity<Boolean> checkItemStock(@PathVariable String itemId) {
        boolean inStock = productService.isItemInStock(itemId);
        return ResponseEntity.ok(inStock);
    }

    // GET - 检查Item数量是否足够
    @GetMapping("/items/{itemId}/quantity")
    public ResponseEntity<Boolean> checkItemQuantity(
            @PathVariable String itemId,
            @RequestParam int quantity) {
        boolean enough = productService.checkItemQuantity(itemId, quantity);
        return ResponseEntity.ok(enough);
    }

    // POST - 创建新商品（示例，可根据实际需求实现）
    @PostMapping
    public ResponseEntity<Product> createProduct(@RequestBody Product product) {
        // 这里需要实现创建逻辑，暂时返回示例
        return ResponseEntity.ok(product);
    }

    // PUT - 更新商品信息（示例，可根据实际需求实现）
    @PutMapping("/{productId}")
    public ResponseEntity<Product> updateProduct(
            @PathVariable String productId,
            @RequestBody Product product) {
        // 这里需要实现更新逻辑，暂时返回示例
        return ResponseEntity.ok(product);
    }

    // DELETE - 删除商品（示例，可根据实际需求实现）
    @DeleteMapping("/{productId}")
    public ResponseEntity<Void> deleteProduct(@PathVariable String productId) {
        // 这里需要实现删除逻辑
        return ResponseEntity.noContent().build();
    }
}

