package com.csu.mypetstoreorderservice.client;

import com.csu.mypetstoreorderservice.vo.UserAccountVO;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@FeignClient(name = "MyPetStore-UserService", contextId = "userClient", path = "/api/v1/inner")
public interface UserClient {

    @GetMapping("/user/{username}")
    UserAccountVO getUserByUsername(@PathVariable("username") String username);
}
