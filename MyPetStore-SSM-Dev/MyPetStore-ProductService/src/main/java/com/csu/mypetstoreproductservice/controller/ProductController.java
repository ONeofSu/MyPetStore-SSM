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

    // POST - 创建新商品
    @PostMapping
    public ResponseEntity<?> createProduct(@RequestBody Product product) {
        try {
            // 参数校验
            if (product.getProductId() == null || product.getProductId().trim().isEmpty()) {
                return ResponseEntity.badRequest().body("商品ID不能为空");
            }
            if (product.getName() == null || product.getName().trim().isEmpty()) {
                return ResponseEntity.badRequest().body("商品名称不能为空");
            }
            if (product.getCategoryId() == null || product.getCategoryId().trim().isEmpty()) {
                return ResponseEntity.badRequest().body("分类ID不能为空");
            }
            
            Product createdProduct = productService.createProduct(product);
            return ResponseEntity.status(201).body(createdProduct);
        } catch (RuntimeException e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        } catch (Exception e) {
            return ResponseEntity.status(500).body("创建商品时发生错误: " + e.getMessage());
        }
    }

    // PUT - 更新商品信息
    @PutMapping("/{productId}")
    public ResponseEntity<?> updateProduct(
            @PathVariable String productId,
            @RequestBody Product product) {
        try {
            // 参数校验
            if (productId == null || productId.trim().isEmpty()) {
                return ResponseEntity.badRequest().body("商品ID不能为空");
            }
            if (product.getName() == null || product.getName().trim().isEmpty()) {
                return ResponseEntity.badRequest().body("商品名称不能为空");
            }
            
            Product updatedProduct = productService.updateProduct(productId, product);
            return ResponseEntity.ok(updatedProduct);
        } catch (RuntimeException e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        } catch (Exception e) {
            return ResponseEntity.status(500).body("更新商品时发生错误: " + e.getMessage());
        }
    }

    // DELETE - 删除商品
    @DeleteMapping("/{productId}")
    public ResponseEntity<?> deleteProduct(@PathVariable String productId) {
        try {
            // 参数校验
            if (productId == null || productId.trim().isEmpty()) {
                return ResponseEntity.badRequest().body("商品ID不能为空");
            }
            
            boolean deleted = productService.deleteProduct(productId);
            if (deleted) {
                return ResponseEntity.noContent().build();
            } else {
                return ResponseEntity.status(500).body("删除商品失败");
            }
        } catch (RuntimeException e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        } catch (Exception e) {
            return ResponseEntity.status(500).body("删除商品时发生错误: " + e.getMessage());
        }
    }
}

