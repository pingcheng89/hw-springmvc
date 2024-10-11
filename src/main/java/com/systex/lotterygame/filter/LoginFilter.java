package com.systex.lotterygame.filter;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.systex.lotterygame.service.UserService;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Component
public class LoginFilter extends OncePerRequestFilter {
	
	@Autowired
	private UserService userservice;

	@Override
	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
		
		String uri = request.getRequestURI();
        HttpSession session = request.getSession(false);
        boolean loggedIn = (session != null && session.getAttribute("loggedInUser") != null);
       
        // 如果URI是以"/login"結尾，且請求方法是POST時的處理
        if (uri.endsWith("/login") && request.getMethod().equalsIgnoreCase("POST")) {
        	
        	// 取得用戶的資料
        	String username = request.getParameter("username");
            String password = request.getParameter("password");
            // 呼叫userservice的方法去驗證
        	userservice.validateUser(username, password, session);
        }
        
        // 處理URI是以"/loginajax"結尾，且請求方法是POST時的處理
        if (uri.endsWith("/loginajax") && request.getMethod().equalsIgnoreCase("POST")) {
            // StringBuilder用來拼接讀取的request body資料
        	StringBuilder sb = new StringBuilder();
            // 用於讀取request body内容
        	BufferedReader reader = request.getReader();
            String line;
            while ((line = reader.readLine()) != null) {
                sb.append(line);
            }
            
            ObjectMapper mapper = new ObjectMapper();
            Map<String, String> loginData = mapper.readValue(sb.toString(), Map.class);

            String username = loginData.get("username");
            String password = loginData.get("password");

            // 用userservice裡面的方法去驗證用戶
            if (userservice.validateUserajax(username, password, session)) {
                // 登入成功的處理
                response.setStatus(HttpServletResponse.SC_OK);
                response.setContentType("application/json; charset=UTF-8");
                response.getWriter().write("{\"success\": true, \"message\": \"登入成功！\"}");
                
            } else {
                // 登入失敗的處理
                response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
                response.setContentType("application/json; charset=UTF-8");
                response.getWriter().write("{\"success\": false, \"message\": \"帳號或密碼輸入錯誤！\"}");
            }
            return;
        }
        
        // 遇到的是h2-console放行
        if (uri.contains("/h2-console")) {
        	filterChain.doFilter(request, response);
            return;
        }
        
        if (uri.contains("/loginajax")) {
        	filterChain.doFilter(request, response);
            return;
        }
        
        
        
        // 遇到的是register放行
        if (uri.contains("/register")) {
        	filterChain.doFilter(request, response);
            return;
        }
        
        // 當用戶為未登入且請求的URI不是login，自動導到index.jsp
        if (!loggedIn && !uri.endsWith("/login")) {  
            response.sendRedirect("/lotterygame/login");
            return;
        }
        
        // 繼續傳遞
        filterChain.doFilter(request, response);
    }

}