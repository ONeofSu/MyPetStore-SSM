package com.csu.mypetstoreorderservice.persistence;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.csu.mypetstoreorderservice.entity.LineItem;
import org.springframework.stereotype.Repository;

@Repository
public interface LineItemMapper extends BaseMapper<LineItem>{
}