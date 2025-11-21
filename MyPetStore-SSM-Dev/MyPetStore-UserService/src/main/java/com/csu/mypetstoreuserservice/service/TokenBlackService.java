package com.csu.mypetstoreuserservice.service;

import org.springframework.stereotype.Service;

@Service
public interface TokenBlackService {
    public boolean addToBlackList(String token);
    public boolean isInBlackList(String token);
}
