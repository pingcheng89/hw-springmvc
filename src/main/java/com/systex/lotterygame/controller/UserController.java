package com.systex.lotterygame.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.systex.lotterygame.model.Users;
import com.systex.lotterygame.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import com.systex.lotterygame.model.UserRepository;

@Controller
public class UserController {
	
	@Autowired
	UserRepository userrepository;
	
	@Autowired
    private UserService userService;

	// 處理login的GET請求
	@GetMapping("/login")
	public ModelAndView user2() {
		// 創建一個新的用戶給view
		return new ModelAndView("login" , "login" , new Users());
	}
	
	// 處理login的POST請求
	@PostMapping("/login")
	public ModelAndView handlelogin(@RequestParam("username") String username,
	                          @RequestParam("password") String password,
	                          HttpSession session,
	                          RedirectAttributes redirectAttributes) {
		
		if (session.getAttribute("loggedInUser") != null) {
            return new ModelAndView("redirect:/index.jsp");
        }
		else {
			ModelAndView modelAndView = new ModelAndView();
			modelAndView.setViewName("redirect:/login");
			redirectAttributes.addFlashAttribute("error", "帳號或密碼錯誤");
	        return modelAndView;
		}
		
	}
	// 處理register的GET請求
	@GetMapping("/register")
	public ModelAndView user() {
		return new ModelAndView("register" , "user" , new Users());
	}
	
	@PostMapping("/registerdone")
    public ModelAndView registerUser(@ModelAttribute Users user) {
		
		ModelAndView modelAndView = new ModelAndView();
        
        String error = userService.registerUser(user);
        if (error != null) {
            modelAndView.addObject("error", error);
            modelAndView.setViewName("register");
            modelAndView.addObject("user", user);
            return modelAndView;
        }

        modelAndView.addObject("user", user);
        modelAndView.setViewName("result");
        return modelAndView;
    }
	
	// 處理logout的GET請求
	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {
	    request.getSession().invalidate(); 
	    return "redirect:/login";
	}
	
	// 處理loginajax的GET請求
	@GetMapping("/loginajax")
    public ModelAndView userLogin() {
        return new ModelAndView("loginajax");
    }
	
}