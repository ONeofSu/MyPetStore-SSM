package org.csu.petstore;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

// exclude 参数配置该模块不需要数据库
@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class})
public class PetStoreGateWayApplication {
    public static void main(String[] args) {
        SpringApplication.run(PetStoreGateWayApplication.class, args);
    }
}