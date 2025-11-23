package com.csu.mypetstoreorderservice;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;

@SpringBootApplication
@MapperScan("com.csu.mypetstoreorderservice.persistence")
@EnableFeignClients(basePackages = "com.csu.mypetstoreorderservice.client")
public class MyPetStoreOrderServiceApplication {

    public static void main(String[] args) {
        SpringApplication.run(MyPetStoreOrderServiceApplication.class, args);
    }

}