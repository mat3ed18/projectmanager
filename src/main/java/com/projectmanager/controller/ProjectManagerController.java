package com.projectmanager.controller;

import com.projectmanager.model.Pessoa;
import com.projectmanager.model.Projeto;
import com.projectmanager.service.ProjectManagerService;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value = "/projectmanager", produces = "application/json")
public class ProjectManagerController {
    private final ProjectManagerService service;

    public ProjectManagerController(ProjectManagerService service) {
        this.service = service;
    }
    
    @PostMapping("/pessoa/salvar")
    public ResponseEntity<?> create(@ModelAttribute("pessoa") Pessoa pessoa) {
        ResponseEntity.status(201);
        return ResponseEntity.ok("{\"teste\": \"salvando\"}");
    }
    
    @PutMapping("/pessoa/atualizar")
    public ResponseEntity<?> update(@ModelAttribute("pessoa") Pessoa pessoa) {
        ResponseEntity.status(200);
        return ResponseEntity.ok("{\"teste\": \"atualizando\"}");
    }
    
    @DeleteMapping("/pessoa/excluir")
    public ResponseEntity<?> deletePessoa(@RequestParam("id") long id) {
        ResponseEntity.status(204);
        return ResponseEntity.ok("{\"teste\": \"excluindo\"}");
    }
    
    @PostMapping("/projeto/salvar")
    public ResponseEntity<?> create(@ModelAttribute("projeto") Projeto projeto) {
        ResponseEntity.status(201);
        return ResponseEntity.ok("{\"teste\": \"salvando\"}");
    }
    
    @PutMapping("/projeto/atualizar")
    public ResponseEntity<?> update(@ModelAttribute("projeto") Projeto projeto) {
        ResponseEntity.status(200);
        return ResponseEntity.ok("{\"teste\": \"atualizando\"}");
    }
    
    @DeleteMapping("/projeto/excluir")
    public ResponseEntity<?> deleteProjeto(@RequestParam("id") long id) {
        ResponseEntity.status(204);
        return ResponseEntity.ok("{\"teste\": \"excluindo\"}");
    }
    
    
    
    
    
    
    
}
