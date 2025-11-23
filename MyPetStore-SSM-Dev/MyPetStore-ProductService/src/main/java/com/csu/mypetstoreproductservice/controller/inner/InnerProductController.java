package com.csu.mypetstoreproductservice.controller.inner;

import com.csu.mypetstoreproductservice.entity.Item;
import com.csu.mypetstoreproductservice.service.ProductService;
import com.csu.mypetstoreproductservice.vo.ItemVO;
import com.csu.mypetstoreproductservice.vo.ProductVO;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 商品内部服务控制器
 * 为其他微服务（订单服务、购物车服务等）提供的商品服务接口
 */
@RestController
@RequestMapping("/api/v1/inner/products")
@Tag(name = "商品内部服务", description = "对其他微服务提供的商品服务")
public class InnerProductController {
    
    @Autowired
    private ProductService productService;

    /**
     * 根据商品ID获取商品信息
     * 供订单服务、购物车服务等调用
     */
    @GetMapping("/{productId}")
    @Operation(summary = "获得商品信息,返回ProductVO")
    public ProductVO getProduct(@PathVariable String productId) {
        return productService.getProduct(productId);
    }

    /**
     * 根据Item ID获取Item详情
     * 供订单服务、购物车服务等调用
     */
    @GetMapping("/items/{itemId}")
    @Operation(summary = "获得Item信息,返回ItemVO")
    public ItemVO getItem(@PathVariable String itemId) {
        return productService.getItem(itemId);
    }

    /**
     * 检查Item是否有库存
     * 供购物车服务、订单服务调用
     */
    @GetMapping("/items/{itemId}/stock")
    @Operation(summary = "检查Item是否有库存,返回boolean")
    public boolean checkItemStock(@PathVariable String itemId) {
        return productService.isItemInStock(itemId);
    }

    /**
     * 检查Item数量是否足够
     * 供购物车服务、订单服务调用
     */
    @GetMapping("/items/{itemId}/quantity")
    @Operation(summary = "检查Item数量是否足够,返回boolean")
    public boolean checkItemQuantity(
            @PathVariable String itemId,
            @RequestParam int quantity) {
        return productService.checkItemQuantity(itemId, quantity);
    }

    /**
     * 根据商品ID获取商品下的所有Item
     * 供订单服务等调用
     */
    @GetMapping("/{productId}/items")
    @Operation(summary = "根据商品ID获取所有Item,返回List<Item>")
    public List<Item> getItemsByProduct(@PathVariable String productId) {
        return productService.getItemListByProduct(productId);
    }
}

