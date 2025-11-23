package com.csu.mypetstoreproductservice.persistence;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.csu.mypetstoreproductservice.entity.Inventory;
import org.springframework.stereotype.Repository;

@Repository
public interface InventoryMapper extends BaseMapper<Inventory> {
}

