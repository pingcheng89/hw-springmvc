package com.systex.lotterygame.filter;

import java.io.IOException;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.systex.lotterygame.model.UserRepository;
import com.systex.lotterygame.model.Users;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Component
public class LoginFilter implements Filter{
	
	@Autowired
	private UserRepository userRepository;  // 确保在这里注入您的 UserRepository
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
	    }

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		
		
		
		HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        
        String uri = httpRequest.getRequestURI();
        if (uri.startsWith("/lotterygame/h2-console") || uri.startsWith("/lotterygame/login") || uri.startsWith("/lotterygame/register")) {
            chain.doFilter(request, response); // 放行請求，不進行攔截
            return;
        }

        HttpSession session = httpRequest.getSession(false);
        boolean loggedIn = (session != null && session.getAttribute("loggedInUser") != null);
        
        if (!loggedIn) {
            String username = httpRequest.getParameter("username");
            String password = httpRequest.getParameter("password");
        }
    }
	@Override
    public void destroy() {
    }

}
