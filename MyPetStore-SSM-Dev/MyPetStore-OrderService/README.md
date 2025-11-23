# MyPetStore Order Service

订单服务是MyPetStore微服务架构的一部分，负责处理订单相关的业务逻辑。

## 功能特性

- 订单创建和管理
- 订单状态跟踪（待处理、已完成、待取消、已取消）
- 用户订单查询
- 订单详情查看
- 订单状态更新（完成订单、取消订单）

## 技术栈

- Spring Boot
- Spring Cloud OpenFeign
- MyBatis-Plus
- MySQL
- Nacos 服务发现

## API 接口

### 获取所有订单
```
GET /api/order/all
```

### 获取待取消订单
```
GET /api/order/cancelling
```

### 获取已取消订单
```
GET /api/order/cancelled
```

### 获取待处理订单
```
GET /api/order/pending
```

### 获取已完成订单
```
GET /api/order/done
```

### 获取用户所有订单
```
GET /api/order/user/{userId}
```

### 获取用户待处理订单
```
GET /api/order/user/{userId}/pending
```

### 获取用户已完成订单
```
GET /api/order/user/{userId}/done
```

### 获取用户待取消订单
```
GET /api/order/user/{userId}/cancelling
```

### 获取用户已取消订单
```
GET /api/order/user/{userId}/cancelled
```

### 获取订单详情
```
GET /api/order/{orderId}
```

### 完成订单
```
POST /api/order/handle/finish/{orderId}
```

### 取消订单
```
POST /api/order/handle/cancel/{orderId}
```

## 数据库设计

订单服务使用三个主要表：

1. `orders` - 存储订单基本信息
2. `lineitem` - 存储订单项信息
3. `orderstatus` - 存储订单状态信息

## 服务依赖

订单服务通过OpenFeign调用以下服务：

- Product Service - 获取商品信息
- User Service - 获取用户信息   

## 配置

服务配置在 `application.yml` 文件中，主要包括：

- 服务端口 (8083)
- 服务名称 (order-service)
- Nacos 服务发现地址
- 数据库连接信息