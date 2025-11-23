package com.csu.mypetstoreproductservice.persistence;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.csu.mypetstoreproductservice.entity.Item;
import org.springframework.stereotype.Repository;

@Repository
public interface ItemMapper extends BaseMapper<Item> {
}

