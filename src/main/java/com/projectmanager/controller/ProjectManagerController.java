package com.projectmanager.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/projectmanager", produces = "application/json")
public class ProjectManagerController {
    
    @GetMapping("/pessoa/salvar")
    public ResponseEntity<?> getPessoas() {
        ResponseEntity.status(200);
        return ResponseEntity.ok("{\"teste\": \"salvando\"}");
    }
}
