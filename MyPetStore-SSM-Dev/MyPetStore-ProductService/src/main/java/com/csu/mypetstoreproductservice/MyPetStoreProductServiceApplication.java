package com.csu.mypetstoreproductservice;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.csu.mypetstoreproductservice.persistence")
public class MyPetStoreProductServiceApplication {

    public static void main(String[] args) {
        SpringApplication.run(MyPetStoreProductServiceApplication.class, args);
    }

}

