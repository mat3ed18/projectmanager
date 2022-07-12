package com.projectmanager.controller;

import com.fasterxml.jackson.databind.node.ObjectNode;
import com.projectmanager.database.postgresql.dao.PessoaDAO;
import com.projectmanager.database.postgresql.dao.ProjetoDAO;
import com.projectmanager.model.Pessoa;
import com.projectmanager.model.Projeto;
import com.projectmanager.service.ProjectManagerService;
import com.projectmanager.util.Util;
import java.sql.SQLException;
import java.util.Map;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value = "/projectmanager", produces = "application/json")
public class ProjectManagerController {
    private ProjectManagerService service;

    public ProjectManagerController() {
        this.service = new ProjectManagerService();
    }
    
    @PostMapping("/pessoa/salvar")
    public ResponseEntity<?> create(@ModelAttribute("pessoa") Pessoa pessoa) {
        try {
            long id = service.create(pessoa);
            return ResponseEntity.status(HttpStatus.CREATED).body(PessoaDAO.get(id));
        } catch (SQLException ex) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Util.formatSQLException(ex));
        }
    }
    
    @PutMapping("/pessoa/atualizar")
    public ResponseEntity<?> update(@ModelAttribute("pessoa") Pessoa pessoa) {
        try {
            service.update(pessoa);
            return ResponseEntity.status(HttpStatus.OK).body("{\"mensagem\": \"O usuário foi atualizado com sucesso\"}");
        } catch (SQLException ex) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Util.formatSQLException(ex));
        }
    }
    
    @DeleteMapping("/pessoa/excluir")
    public ResponseEntity<?> deletePessoa(@RequestBody ObjectNode data) {
        try {
            return ResponseEntity.status(HttpStatus.NO_CONTENT).body(PessoaDAO.get(data.get("id").asLong()));
        } catch (SQLException ex) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Util.formatSQLException(ex));
        }
    }
    
    @GetMapping("/pessoa")
    public ResponseEntity<?> getPessoa(@RequestParam Map<String, String> data) {
        try {
            Pessoa pessoa = service.getPessoa(data.get("id"));
            if (pessoa != null) return ResponseEntity.status(HttpStatus.OK).body(pessoa);
            else return ResponseEntity.status(HttpStatus.NOT_FOUND).body("{\"mensagem\": \"Oops! O usuário não foi encontrado ... \"}");
        } catch (SQLException ex) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Util.formatSQLException(ex));
        }
    }
    
    @GetMapping("/pessoa/listar")
    public ResponseEntity<?> listarPessoas(@PathVariable Map<String, Object> data) {
        return ResponseEntity.status(HttpStatus.OK).body("{\"teste\": \"excluindo\"}");
    }
    
    @GetMapping("/pessoa/buscar")
    public ResponseEntity<?> buscarPessoas(@RequestBody ObjectNode data) {
        return ResponseEntity.status(HttpStatus.OK).body("{\"teste\": \"excluindo\"}");
    }
    
    @PostMapping("/projeto/salvar")
    public ResponseEntity<?> create(@ModelAttribute("projeto") Projeto projeto) {
        try {
            long id = service.create(projeto);
            return ResponseEntity.status(HttpStatus.CREATED).body(PessoaDAO.get(id));
        } catch (SQLException ex) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Util.formatSQLException(ex));
        }
    }
    
    @PutMapping("/projeto/atualizar")
    public ResponseEntity<?> update(@ModelAttribute("projeto") Projeto projeto) {
        try {
            service.update(projeto);
            return ResponseEntity.status(HttpStatus.OK).body("{\"mensagem\": O usuário foi atualizado com sucesso}");
        } catch (SQLException ex) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Util.formatSQLException(ex));
        }
    }
    
    @DeleteMapping("/projeto/excluir")
    public ResponseEntity<?> deleteProjeto(@RequestBody ObjectNode data) {
        try {
            return ResponseEntity.status(HttpStatus.NO_CONTENT).body(ProjetoDAO.get(data.get("id").asLong()));
        } catch (SQLException ex) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Util.formatSQLException(ex));
        }
    }
    
    @GetMapping("/projeto")
    public ResponseEntity<?> getProjeto(@RequestBody ObjectNode data) {
        try {
            return ResponseEntity.status(HttpStatus.OK).body(service.getProjeto(data.get("id").asText()));
        } catch (SQLException ex) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Util.formatSQLException(ex));
        }
    }
    
    @GetMapping("/projeto/listar")
    public ResponseEntity<?> listarProjetos(@RequestBody ObjectNode data) {
        return ResponseEntity.status(HttpStatus.OK).body("{\"teste\": \"excluindo\"}");
    }
    
    @GetMapping("/projeto/buscar")
    public ResponseEntity<?> buscarProjetos(@RequestBody ObjectNode data) {
        return ResponseEntity.status(HttpStatus.OK).body("{\"teste\": \"excluindo\"}");
    }
    
    @GetMapping("/projeto/add")
    public ResponseEntity<?> add(@RequestBody ObjectNode data) {
        try {
            long id = service.associate(data.get("projetoId").asLong(), data.get("pessoaId").asLong());
            return ResponseEntity.status(HttpStatus.CREATED).body(PessoaDAO.get(id));
        } catch (SQLException ex) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Util.formatSQLException(ex));
        }
    }
    
    @GetMapping("/projeto/remove")
    public ResponseEntity<?> remove(@RequestBody ObjectNode data) {
        try {
            return ResponseEntity.status(HttpStatus.NO_CONTENT).body(service.disassociate(data.get("projetoId").asLong(), data.get("pessoaId").asLong()));
        } catch (SQLException ex) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Util.formatSQLException(ex));
        }
    }
    
    @GetMapping("/projeto/membros")
    public ResponseEntity<?> membros(@RequestBody ObjectNode data) {
        return ResponseEntity.status(HttpStatus.OK).body("{\"teste\": \"excluindo\"}");
    }
    
    @GetMapping("/pessoa/projetos")
    public ResponseEntity<?> projetos(@RequestBody ObjectNode data) {
        return ResponseEntity.status(HttpStatus.OK).body("{\"teste\": \"excluindo\"}");
    }
    
    @GetMapping("/projeto/membros/buscar")
    public ResponseEntity<?> buscarMembros(@RequestBody ObjectNode data) {
        return ResponseEntity.status(HttpStatus.OK).body("{\"teste\": \"excluindo\"}");
    }
    
    @GetMapping("/pessoa/projetos/buscar")
    public ResponseEntity<?> buscarProjetosPessoa(@RequestBody ObjectNode data) {
        return ResponseEntity.status(HttpStatus.OK).body("{\"teste\": \"excluindo\"}");
    }
}
