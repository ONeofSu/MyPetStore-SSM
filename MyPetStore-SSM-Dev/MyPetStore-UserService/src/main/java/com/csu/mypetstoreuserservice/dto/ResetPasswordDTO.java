package com.csu.mypetstoreuserservice.dto;

import lombok.Data;

@Data
public class ResetPasswordDTO {
    private String oldPassword;
    private String newPassword;
}
