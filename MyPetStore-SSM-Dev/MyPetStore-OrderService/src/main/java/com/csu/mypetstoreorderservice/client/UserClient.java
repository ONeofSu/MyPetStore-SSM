package com.csu.mypetstoreorderservice.client;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@FeignClient(name = "user-service")
public interface UserClient {
    
    // 示例方法，根据实际需要调整
    @GetMapping("/api/user/{userId}")
    public Object getUserById(@PathVariable("userId") String userId);
}