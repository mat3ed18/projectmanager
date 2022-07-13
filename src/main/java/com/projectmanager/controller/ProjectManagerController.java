package com.projectmanager.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.projectmanager.database.postgresql.dao.PessoaDAO;
import com.projectmanager.database.postgresql.dao.ProjetoDAO;
import com.projectmanager.model.Pessoa;
import com.projectmanager.model.Projeto;
import com.projectmanager.service.ProjectManagerService;
import com.projectmanager.util.Util;
import java.sql.SQLException;
import java.util.Map;

@Controller
@RequestMapping(value = "/projectmanager", produces = "application/json")
public class ProjectManagerController {
    private final ProjectManagerService service;

    public ProjectManagerController() {
        this.service = new ProjectManagerService();
    }
    
    @PostMapping("/pessoa/salvar")
    public ResponseEntity<?> create(@ModelAttribute("pessoa") Pessoa pessoa) {
        try {
            long id = service.create(pessoa);
            return ResponseEntity.status(HttpStatus.CREATED).body(PessoaDAO.get(id));
        } catch (SQLException ex) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Util.formatException(ex));
        }
    }
    
    @PutMapping("/pessoa/atualizar")
    public ResponseEntity<?> update(@ModelAttribute("pessoa") Pessoa pessoa) {
        try {
            service.update(pessoa);
            return ResponseEntity.status(HttpStatus.OK).body("{\"mensagem\": \"O usuário foi atualizado com sucesso\"}");
        } catch (SQLException ex) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Util.formatException(ex));
        }
    }
    
    @DeleteMapping("/pessoa/excluir")
    public ResponseEntity<?> deletePessoa(@RequestBody ObjectNode data) {
        try {
            return ResponseEntity.status(HttpStatus.NO_CONTENT).body(PessoaDAO.get(data.get("id").asLong()));
        } catch (SQLException ex) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Util.formatException(ex));
        }
    }
    
    @GetMapping("/pessoa")
    public ResponseEntity<?> getPessoa(@RequestParam Map<String, String> data) {
        try {
            return ResponseEntity.status(HttpStatus.OK).body((data.get("id") != null) ? service.getPessoa(data.get("id")) : "{}");
        } catch (SQLException ex) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Util.formatException(ex));
        }
    }
    
    @GetMapping("/pessoa/listar")
    public ResponseEntity<?> listarPessoas(@RequestParam Map<String, String> data) {
        try {
            return ResponseEntity.status(HttpStatus.OK).body(Util.formatResponse(HttpStatus.OK, data, service.getPessoas(data.get("coluna"), data.get("ordem"), data.get("pagina"), data.get("qtd"))));
        } catch (SQLException | JsonProcessingException ex) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Util.formatException(ex));
        }
    }
    
    @GetMapping("/pessoa/buscar")
    public ResponseEntity<?> buscarPessoas(@RequestParam Map<String, String> data) {
        try {
            return ResponseEntity.status(HttpStatus.OK).body((data.get("q") != null) ? Util.formatResponse(HttpStatus.OK, data, service.buscarPessoas(data.get("q"), data.get("coluna"), data.get("ordem"), data.get("pagina"), data.get("qtd"))) : "{}");
        } catch (SQLException | JsonProcessingException ex) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Util.formatException(ex));
        }
    }
    
    @PostMapping("/projeto/salvar")
    public ResponseEntity<?> create(@ModelAttribute("projeto") Projeto projeto) {
        try {
            long id = service.create(projeto);
            return ResponseEntity.status(HttpStatus.CREATED).body(PessoaDAO.get(id));
        } catch (SQLException ex) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Util.formatException(ex));
        }
    }
    
    @PutMapping("/projeto/atualizar")
    public ResponseEntity<?> update(@ModelAttribute("projeto") Projeto projeto) {
        try {
            service.update(projeto);
            return ResponseEntity.status(HttpStatus.OK).body("{\"mensagem\": O usuário foi atualizado com sucesso}");
        } catch (SQLException ex) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Util.formatException(ex));
        }
    }
    
    @DeleteMapping("/projeto/excluir")
    public ResponseEntity<?> deleteProjeto(@RequestBody ObjectNode data) {
        try {
            return ResponseEntity.status(HttpStatus.NO_CONTENT).body(ProjetoDAO.get(data.get("id").asLong()));
        } catch (SQLException ex) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Util.formatException(ex));
        }
    }
    
    @GetMapping("/projeto")
    public ResponseEntity<?> getProjeto(@RequestParam Map<String, String> data) {
        try {
            return ResponseEntity.status(HttpStatus.OK).body((data.get("id") != null) ? service.getProjeto(data.get("id")) : "{}");
        } catch (SQLException ex) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Util.formatException(ex));
        }
    }
    
    @GetMapping("/projeto/listar")
    public ResponseEntity<?> listarProjetos(@RequestParam Map<String, String> data) {
        try {
            return ResponseEntity.status(HttpStatus.OK).body(Util.formatResponse(HttpStatus.OK, data, service.getProjetos(data.get("coluna"), data.get("ordem"), data.get("pagina"), data.get("qtd"))));
        } catch (SQLException | JsonProcessingException ex) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Util.formatException(ex));
        }
    }
    
    @GetMapping("/projeto/buscar")
    public ResponseEntity<?> buscarProjetos(@RequestParam Map<String, String> data) {
        try {
            return ResponseEntity.status(HttpStatus.OK).body((data.get("q") != null) ? Util.formatResponse(HttpStatus.OK, data, service.buscarProjetos(data.get("q"), data.get("coluna"), data.get("ordem"), data.get("pagina"), data.get("qtd"))) : "{}");
        } catch (SQLException | JsonProcessingException ex) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Util.formatException(ex));
        }
    }
    
    @PostMapping("/projeto/add")
    public ResponseEntity<?> add(@RequestBody ObjectNode data) {
        try {
            return ResponseEntity.status(HttpStatus.CREATED).body(service.associate(data.get("projetoId").asLong(), data.get("pessoaId").asLong()));
        } catch (SQLException ex) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Util.formatException(ex));
        }
    }
    
    @DeleteMapping("/projeto/remove")
    public ResponseEntity<?> remove(@RequestBody ObjectNode data) {
        try {
            return ResponseEntity.status(HttpStatus.NO_CONTENT).body(service.disassociate(data.get("projetoId").asLong(), data.get("pessoaId").asLong()));
        } catch (SQLException ex) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Util.formatException(ex));
        }
    }
    
    @GetMapping("/projeto/membros")
    public ResponseEntity<?> membros(@RequestParam Map<String, String> data) {
        try {            
            return ResponseEntity.status(HttpStatus.OK).body((data.get("projetoId") != null) ? Util.formatResponse(HttpStatus.OK, data, service.getMembers(data.get("projetoId"), data.get("coluna"), data.get("ordem"), data.get("pagina"), data.get("qtd"))) : "{}");
        } catch (SQLException | JsonProcessingException | NullPointerException ex) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Util.formatException(ex));
        }
    }
    
    @GetMapping("/pessoa/projetos")
    public ResponseEntity<?> projetos(@RequestParam Map<String, String> data) {
        try {
            return ResponseEntity.status(HttpStatus.OK).body((data.get("pessoaId") != null) ? Util.formatResponse(HttpStatus.OK, data, service.getProjects(data.get("pessoaId"), data.get("coluna"), data.get("ordem"), data.get("pagina"), data.get("qtd"))) : "{}");
        } catch (SQLException | JsonProcessingException | NullPointerException ex) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Util.formatException(ex));
        }
    }
    
    @GetMapping("/projeto/membros/buscar")
    public ResponseEntity<?> buscarMembros(@RequestParam Map<String, String> data) {
        try {
            return ResponseEntity.status(HttpStatus.OK).body((data.get("q") != null && data.get("projetoId") != null) ? Util.formatResponse(HttpStatus.OK, data, service.findMembers(data.get("q"), data.get("projetoId"), data.get("coluna"), data.get("ordem"), data.get("pagina"), data.get("qtd"))) : "{}");
        } catch (SQLException | JsonProcessingException | NullPointerException ex) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Util.formatException(ex));
        }
    }
    
    @GetMapping("/pessoa/projetos/buscar")
    public ResponseEntity<?> buscarProjetosPessoa(@RequestParam Map<String, String> data) {
        try {
            return ResponseEntity.status(HttpStatus.OK).body((data.get("q") != null && data.get("pessoaId") != null) ? Util.formatResponse(HttpStatus.OK, data, service.findProjects(data.get("q"), data.get("pessoaId"), data.get("coluna"), data.get("ordem"), data.get("pagina"), data.get("qtd"))) : "{}");
        } catch (SQLException | JsonProcessingException | NullPointerException ex) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Util.formatException(ex));
        }
    }
}
