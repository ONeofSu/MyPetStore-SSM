package com.csu.mypetstoreorderservice.client;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@FeignClient(name = "product-service")
public interface ProductClient {
    
    // 示例方法，根据实际需要调整
    @GetMapping("/api/product/{productId}")
    public Object getProductById(@PathVariable("productId") String productId);
}