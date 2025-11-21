package com.csu.mypetstoreuserservice.controller.inner;

import com.csu.mypetstoreuserservice.dto.JournalDTO;
import com.csu.mypetstoreuserservice.service.UserService;
import com.csu.mypetstoreuserservice.vo.AccountVO;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Date;

@RestController
@RequestMapping("/api/v1/inner")
@Tag(name = "用户内部服务" ,description = "对其他微服务提供的用户服务")
public class InnerUserController {
    @Autowired
    private UserService userService;

    @GetMapping("/user/{username}")
    @Operation(summary = "获得用户信息,返回AccountVO")
    public AccountVO getUserByUsername(@PathVariable String username) {
        return userService.getAccountVOByUsername(username);
    }

    @PostMapping("/journal/user/{username}")
    @Operation(summary = "更新日志,传入用户名和日志内容")
    public boolean updateJournal(@PathVariable String username, @RequestBody JournalDTO journal) {
        if(userService.getSignonByUsername(username) == null || journal == null) {
            return false;
        }

        if(journal.getDescription() == null){
            journal.setDescription("");
        }
        if(journal.getDate() == null || journal.getDate().isEmpty()){
            journal.setDate(new Date().toString());
        }
        if(journal.getRGBColor() == null || journal.getRGBColor().length() != 7){
            journal.setRGBColor("#70AD47");
        }
        userService.updateJournal(username, journal.getDescription(), journal.getDate(), journal.getRGBColor());
        return true;
    }
}
