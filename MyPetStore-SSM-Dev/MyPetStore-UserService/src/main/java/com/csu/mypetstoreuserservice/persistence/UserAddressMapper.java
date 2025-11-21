package com.csu.mypetstoreuserservice.persistence;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.csu.mypetstoreuserservice.entity.UserAddress;
import org.springframework.stereotype.Repository;

@Repository
public interface UserAddressMapper extends BaseMapper<UserAddress> {
}
