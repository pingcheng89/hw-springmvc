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

import com.systex.lotterygame.model.Users;
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
            @RequestParam("password") String password) {
		
		Optional<Users> user = this.userrepository.findByUsername(username);
		
		if (user.isPresent()) {
			Users u = user.get();
			if (u.getPassword().equals(password)) {
				return "main";
			}else {
				return "redirect:/login";
			}
		}else {
			return "redirect:/register";
		}
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