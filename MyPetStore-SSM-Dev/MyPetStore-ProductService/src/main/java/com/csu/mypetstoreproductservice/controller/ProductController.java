package com.csu.mypetstoreproductservice.controller;

import com.csu.mypetstoreproductservice.common.CommonResponse;
import com.csu.mypetstoreproductservice.entity.Item;
import com.csu.mypetstoreproductservice.entity.Product;
import com.csu.mypetstoreproductservice.service.ProductService;
import com.csu.mypetstoreproductservice.vo.CategoryVO;
import com.csu.mypetstoreproductservice.vo.ItemVO;
import com.csu.mypetstoreproductservice.vo.ProductVO;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 商品服务控制器
 * 对外提供的商品服务接口（供前端、网关调用）
 */
@RestController
@RequestMapping("/api/v1/products")
@Tag(name = "商品服务", description = "对外提供的商品服务接口")
public class ProductController {

    @Autowired
    private ProductService productService;

    @GetMapping("/categories")
    @Operation(summary = "获取所有分类")
    public ResponseEntity<CommonResponse<List<String>>> getCategories() {
        return ResponseEntity.ok(CommonResponse.createForSuccess(productService.getCategories()));
    }

    @GetMapping("/languages")
    @Operation(summary = "获取所有语言")
    public ResponseEntity<CommonResponse<List<String>>> getLanguages() {
        return ResponseEntity.ok(CommonResponse.createForSuccess(productService.getLanguages()));
    }

    @GetMapping("/categories/{categoryId}")
    @Operation(summary = "根据分类ID获取分类信息")
    public ResponseEntity<CommonResponse<CategoryVO>> getCategory(@PathVariable String categoryId) {
        CategoryVO category = productService.getCategory(categoryId);
        return ResponseEntity.ok(CommonResponse.createForSuccess(category));
    }

    @GetMapping("/{productId}")
    @Operation(summary = "根据商品ID获取商品信息")
    public ResponseEntity<CommonResponse<ProductVO>> getProduct(@PathVariable String productId) {
        ProductVO product = productService.getProduct(productId);
        return ResponseEntity.ok(CommonResponse.createForSuccess(product));
    }

    @GetMapping("/{productId}/items")
    @Operation(summary = "根据商品ID获取商品下的所有Item")
    public ResponseEntity<CommonResponse<List<Item>>> getItemsByProduct(@PathVariable String productId) {
        List<Item> items = productService.getItemListByProduct(productId);
        return ResponseEntity.ok(CommonResponse.createForSuccess(items));
    }

    @GetMapping("/items/{itemId}")
    @Operation(summary = "根据Item ID获取Item详情")
    public ResponseEntity<CommonResponse<ItemVO>> getItem(@PathVariable String itemId) {
        ItemVO item = productService.getItem(itemId);
        if (item != null) {
            return ResponseEntity.ok(CommonResponse.createForSuccess(item));
        }
        return ResponseEntity.ok(CommonResponse.createForError("Item not found"));
    }

    @GetMapping("/search")
    @Operation(summary = "根据关键词搜索商品")
    public ResponseEntity<CommonResponse<List<Product>>> searchProducts(@RequestParam String keyword) {
        List<Product> products = productService.getProductList(keyword);
        return ResponseEntity.ok(CommonResponse.createForSuccess(products));
    }

    @GetMapping("/categories/{categoryId}/products")
    @Operation(summary = "根据分类ID获取该分类下的所有商品")
    public ResponseEntity<CommonResponse<List<Product>>> getProductsByCategory(@PathVariable String categoryId) {
        List<Product> products = productService.getProductListByCategory(categoryId);
        return ResponseEntity.ok(CommonResponse.createForSuccess(products));
    }

    @GetMapping("/items/{itemId}/stock")
    @Operation(summary = "检查Item是否有库存")
    public ResponseEntity<CommonResponse<Boolean>> checkItemStock(@PathVariable String itemId) {
        boolean inStock = productService.isItemInStock(itemId);
        return ResponseEntity.ok(CommonResponse.createForSuccess(inStock));
    }

    @GetMapping("/items/{itemId}/quantity")
    @Operation(summary = "检查Item数量是否足够")
    public ResponseEntity<CommonResponse<Boolean>> checkItemQuantity(
            @PathVariable String itemId,
            @RequestParam int quantity) {
        boolean enough = productService.checkItemQuantity(itemId, quantity);
        return ResponseEntity.ok(CommonResponse.createForSuccess(enough));
    }

    @PostMapping
    @Operation(summary = "创建新商品")
    public ResponseEntity<CommonResponse<Product>> createProduct(@RequestBody Product product) {
        try {
            // 参数校验
            if (product.getProductId() == null || product.getProductId().trim().isEmpty()) {
                return ResponseEntity.ok(CommonResponse.createForError("商品ID不能为空"));
            }
            if (product.getName() == null || product.getName().trim().isEmpty()) {
                return ResponseEntity.ok(CommonResponse.createForError("商品名称不能为空"));
            }
            if (product.getCategoryId() == null || product.getCategoryId().trim().isEmpty()) {
                return ResponseEntity.ok(CommonResponse.createForError("分类ID不能为空"));
            }
            
            Product createdProduct = productService.createProduct(product);
            return ResponseEntity.ok(CommonResponse.createForSuccess(createdProduct));
        } catch (RuntimeException e) {
            return ResponseEntity.ok(CommonResponse.createForError(e.getMessage()));
        } catch (Exception e) {
            return ResponseEntity.ok(CommonResponse.createForError("创建商品时发生错误: " + e.getMessage()));
        }
    }

    @PutMapping("/{productId}")
    @Operation(summary = "更新商品信息")
    public ResponseEntity<CommonResponse<Product>> updateProduct(
            @PathVariable String productId,
            @RequestBody Product product) {
        try {
            // 参数校验
            if (productId == null || productId.trim().isEmpty()) {
                return ResponseEntity.ok(CommonResponse.createForError("商品ID不能为空"));
            }
            if (product.getName() == null || product.getName().trim().isEmpty()) {
                return ResponseEntity.ok(CommonResponse.createForError("商品名称不能为空"));
            }
            
            Product updatedProduct = productService.updateProduct(productId, product);
            return ResponseEntity.ok(CommonResponse.createForSuccess(updatedProduct));
        } catch (RuntimeException e) {
            return ResponseEntity.ok(CommonResponse.createForError(e.getMessage()));
        } catch (Exception e) {
            return ResponseEntity.ok(CommonResponse.createForError("更新商品时发生错误: " + e.getMessage()));
        }
    }

    @DeleteMapping("/{productId}")
    @Operation(summary = "删除商品")
    public ResponseEntity<CommonResponse<String>> deleteProduct(@PathVariable String productId) {
        try {
            // 参数校验
            if (productId == null || productId.trim().isEmpty()) {
                return ResponseEntity.ok(CommonResponse.createForError("商品ID不能为空"));
            }
            
            boolean deleted = productService.deleteProduct(productId);
            if (deleted) {
                return ResponseEntity.ok(CommonResponse.createForSuccess("删除成功"));
            } else {
                return ResponseEntity.ok(CommonResponse.createForError("删除商品失败"));
            }
        } catch (RuntimeException e) {
            return ResponseEntity.ok(CommonResponse.createForError(e.getMessage()));
        } catch (Exception e) {
            return ResponseEntity.ok(CommonResponse.createForError("删除商品时发生错误: " + e.getMessage()));
        }
    }
}

