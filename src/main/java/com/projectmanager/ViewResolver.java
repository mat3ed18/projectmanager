package com.projectmanager;

import jakarta.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
@Slf4j
public class ViewResolver {
    
    @RequestMapping("/")
    public String index() {
        return "/login.jsp";
    }
    
    @RequestMapping("/register")
    public String register() {
        return "/register.jsp";
    }
    
    @RequestMapping("/home")
    public String home() {
        return "/index.jsp";
    }
    
    @RequestMapping("/404")
    public String error404() {
        return "/404.jsp";
    }
    
    @RequestMapping("/project/add")
    public String add() {
        return "/add.jsp";
    }
    
    @RequestMapping("/projects")
    public String projects() {
        return "/projects.jsp";
    }
    
    @RequestMapping("/kanban")
    public String kanban() {
        return "/kanban.jsp";
    }
    
    @RequestMapping("/project/{id}")
    public String project(@PathVariable String id, ModelMap modelMap) {
        modelMap.put("id", id);
        return "/project.jsp";
    }
    
    @RequestMapping("/project/{id}/edit")
    public String edit(@PathVariable String id, ModelMap modelMap, HttpServletRequest request) {
        modelMap.put("id", id);
        modelMap.put("editar", true);
        return "/add.jsp";
    }
    
    @RequestMapping("/user/{id}")
    public String user(@PathVariable String id, ModelMap modelMap) {
        modelMap.put("id", id);
        return "/user.jsp";
    }
    
    @RequestMapping("/settings")
    public String settings() {
        return "/settings.jsp";
    }
    
    @RequestMapping("/logout")
    public String logout(HttpServletRequest request) {
        request.getSession().invalidate();
        return "/login.jsp";
    }
    
    @RequestMapping({"/project", "/user", "/project/edit"})
    public String redirect() {
        return "redirect:/home";
    }
    
    @RequestMapping({"/app", "/app/public", "/app/public/files", "/css", "/css/pages", "/fonts", "/img", "/img/avatars", "/js", "/js/scripts", "/js/scripts/pages", "/structure"})
    public String notFound() {
        return "redirect:/404";
    }
    
    
}
