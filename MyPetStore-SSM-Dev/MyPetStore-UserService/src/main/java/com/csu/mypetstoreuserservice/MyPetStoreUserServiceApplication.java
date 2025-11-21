package com.csu.mypetstoreuserservice;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.csu.mypetstoreuserservice.persistence")
public class MyPetStoreUserServiceApplication {

    public static void main(String[] args) {
        SpringApplication.run(MyPetStoreUserServiceApplication.class, args);
    }

}
