package com.projectmanager;

import com.projectmanager.database.postgresql.dao.ProjetoDAO;
import jakarta.servlet.http.HttpServletRequest;
import java.sql.SQLException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
@Slf4j
public class ViewResolver {
    
    public static void main(String[] args) throws SQLException {
        System.out.println(ProjetoDAO.totalMembrosProjeto(2));
//        Map<String, String> data = new HashMap();
//        data.put("id", "1");
//        ProjectManagerController control = new ProjectManagerController();
//        System.out.println(control.projetos(data).getBody().toString());
//        
//        System.out.println(control.listarProjetos(new HashMap()));
    }

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
        modelMap.put("editar", "true");
        return "/project.jsp";
    }
    
    @RequestMapping("/project/{id}/edit")
    public String edit(@PathVariable String id, ModelMap modelMap, HttpServletRequest request) {
        modelMap.put("id", id);
        modelMap.put("editar", "false");
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
}
