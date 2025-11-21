package com.csu.mypetstoreuserservice.persistence;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.csu.mypetstoreuserservice.entity.Journal;
import org.springframework.stereotype.Repository;

@Repository
public interface JournalMapper extends BaseMapper<Journal> {
}
