package com.systex.lotterygame.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.systex.lotterygame.model.Users;

import jakarta.servlet.http.HttpServletRequest;

import com.systex.lotterygame.model.UserRepository;

@Controller
public class UserController {
	
	@Autowired
	UserRepository userrepository;
	
	@GetMapping("/register")
	public ModelAndView user() {
		return new ModelAndView("register" , "user" , new Users());
	}
	
	@GetMapping("/login")
	public ModelAndView user2() {
		return new ModelAndView("login" , "login" , new Users());
	}
	
	@PostMapping("/login2")
	public String handlelogin(@RequestParam("username") String username,
							  @RequestParam("password") String password,
							  HttpServletRequest request,
							  RedirectAttributes redirectAttributes) {
		
	    Optional<Users> user = userrepository.findByUsername(username);
	    
	    if (user.isPresent() && user.get().getPassword().equals(password)) {
	        // 登入成功，將用戶存入session
	        request.getSession().setAttribute("loggedInUser", user.get());
	        return "redirect:/lottery";  // 登入成功 轉到lottery頁面
	    } else {
	        // 登入失敗，顯示錯誤提示
	    	redirectAttributes.addFlashAttribute("error", "帳號或密碼錯誤");
	        return "redirect:/login";  // 返回登入頁面
	    }
	}
	
	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {
	    request.getSession().invalidate();  // 清除session
	    return "redirect:/login";  // 重新回到登入頁
	}
	
	@PostMapping("/registerdone")
    public ModelAndView registerUser(@ModelAttribute Users user) {
        ModelAndView modelAndView = new ModelAndView();

        Optional<Users> existingUser = userrepository.findByUsername(user.getUsername());
        if (existingUser.isPresent()) {
            modelAndView.addObject("error", "帳號已被使用，請選擇其他帳號");
            modelAndView.setViewName("register");
            modelAndView.addObject("user", user);
            return modelAndView;
        }
        
        this.userrepository.save(user);
        modelAndView.addObject("user", user);
        modelAndView.setViewName("result");
        
        return modelAndView;
    }
}