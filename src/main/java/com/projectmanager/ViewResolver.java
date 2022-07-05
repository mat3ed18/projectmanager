package com.projectmanager;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
@Slf4j
public class ViewResolver {

    @RequestMapping({"/home"})
    public String home() {
        return "/inicio.jsp";
    }
    
}
