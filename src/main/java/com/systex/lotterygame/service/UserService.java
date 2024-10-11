package com.systex.lotterygame.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.systex.lotterygame.model.UserRepository;
import com.systex.lotterygame.model.Users;

import jakarta.servlet.http.HttpSession;

@Service
public class UserService {
	
	// 處理登入驗證邏輯的service，會被filter去調用
	
	@Autowired
	UserRepository userrepository;
	
	public void validateUser(String username, String password, HttpSession session) {
		
        Optional<Users> user = userrepository.findByUsername(username);
        
        if (user.isPresent() && user.get().getPassword().equals(password)) {
            
            session.setAttribute("loggedInUser", user.get());
            return; // 登入成功
        }
        else {
	        return ; // 登入失敗
        }
    }
	
	public boolean validateUserajax(String username, String password, HttpSession session) {
        Optional<Users> user = userrepository.findByUsername(username);

        if (user.isPresent() && user.get().getPassword().equals(password)) {
            session.setAttribute("loggedInUser", user.get());
            return true; // 登入成功
        } else {
            return false; // 登入失敗
        }
    }
	
	
	public String registerUser(Users user) {
        Optional<Users> existingUser = userrepository.findByUsername(user.getUsername());
        if (existingUser.isPresent()) {
            return "帳號已被使用，請選擇其他帳號";
        }
        userrepository.save(user);
        return null;
    }
}
