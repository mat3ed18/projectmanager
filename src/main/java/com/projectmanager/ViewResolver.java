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
    public String index(HttpServletRequest request) {
        if (request.getSession(false) != null && request.getSession(false).getAttribute("user_id") != "") {
            return "redirect:/home";
        } else {
            return "/login.jsp";
        }
    }
    
    @RequestMapping("/register")
    public String register(HttpServletRequest request) {
        if (request.getSession(false).getAttribute("user_id") != null) {
            return "redirect:/home";
        } else {
            return "/register.jsp";
        }
    }
    
    @RequestMapping("/home")
    public String home(HttpServletRequest request) {
        if (request.getSession(false) != null && request.getSession(false).getAttribute("user_id") != null) {
            return "/index.jsp";
        } else {
            return "redirect:/";
        }
    }
    
    @RequestMapping("/404")
    public String error404() {
        return "/404.jsp";
    }
    
    @RequestMapping("/project/add")
    public String add(HttpServletRequest request) {
        if (request.getSession(false).getAttribute("user_id") != null) {
            return "/add.jsp";
        } else {
            return "redirect:/";
        }
    }
    
    @RequestMapping("/projects")
    public String projects(HttpServletRequest request) {
        if (request.getSession(false).getAttribute("user_id") != null) {
            return "/projects.jsp";
        } else {
            return "redirect:/";
        }
    }
    
    @RequestMapping("/kanban")
    public String kanban(HttpServletRequest request) {
        if (request.getSession(false).getAttribute("user_id") != null) {
            return "/kanban.jsp";
        } else {
            return "redirect:/";
        }
    }
    
    @RequestMapping("/project/{id}")
    public String project(@PathVariable String id, HttpServletRequest request, ModelMap modelMap) {
        if (request.getSession(false).getAttribute("user_id") != null) {
            modelMap.put("id", id);
            return "/project.jsp";
        } else {
            return "redirect:/";
        }
    }
    
    @RequestMapping("/project/{id}/edit")
    public String edit(@PathVariable String id, ModelMap modelMap, HttpServletRequest request) {
        if (request.getSession(false).getAttribute("user_id") != null) {
            modelMap.put("id", id);
            modelMap.put("editar", true);
            return "/add.jsp";
        } else {
            return "redirect:/";
        }
    }
    
    @RequestMapping("/user/{id}")
    public String user(@PathVariable String id, HttpServletRequest request, ModelMap modelMap) {
        if (request.getSession(false).getAttribute("user_id") != null) {
            modelMap.put("id", id);
            return "/user.jsp";
        } else {
            return "redirect:/";
        }
    }
    
    @RequestMapping("/settings")
    public String settings(HttpServletRequest request) {
        if (request.getSession(false).getAttribute("user_id") != null) {
            return "/settings.jsp";
        } else {
            return "redirect:/";
        }
    }
    
    @RequestMapping("/logout")
    public String logout(HttpServletRequest request) {
        request.getSession().invalidate();
        return "redirect:/";
    }
    
    @RequestMapping({"/project", "/user", "/project/edit"})
    public String redirect(HttpServletRequest request) {
        if (request.getSession(false).getAttribute("user_id") != null) {
            return "redirect:/home";
        } else {
            return "redirect:/";
        }
    }
    
    @RequestMapping({"/app", "/app/public", "/app/public/files", "/css", "/css/pages", "/fonts", "/img", "/img/avatars", "/js", "/js/scripts", "/js/scripts/pages", "/structure", "/projectmanager/pessoa/salvar", "/projectmanager/pessoa/atualizar", "/projectmanager/pessoa/excluir", "/projectmanager/projeto/salvar", "/projectmanager/projeto/atualizar", "/projectmanager/projeto/atualizar/status", "/projectmanager/projeto/excluir", "/projectmanager/projeto/add", "/projectmanager/projeto/remove", "/projectmanager/login", "/projectmanager/speech"})
    public String notFound() {
        return "redirect:/404";
    }
    
    
}
