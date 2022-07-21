package com.projectmanager.endpoint;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.projectmanager.service.ProjectManagerService;
import com.projectmanager.util.Util;
import java.sql.SQLException;
import java.util.Map;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/api", produces = "application/json")
public class ProjectManagerEndpoint {
    
    private final ProjectManagerService service;

    public ProjectManagerEndpoint() {
        this.service = new ProjectManagerService();
    }
    
    @GetMapping("/pessoa")
    public ResponseEntity<?> getPessoa(@RequestParam Map<String, String> data) {
        try {
            return ResponseEntity.status(HttpStatus.OK).body((data.get("id") != null) ? service.getPessoa(data.get("id")) : "{}");
        } catch (SQLException ex) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Util.formatException(ex));
        }
    }
    
    @GetMapping("/pessoas")
    public ResponseEntity<?> listarPessoas(@RequestParam Map<String, String> data) {
        try {
            return ResponseEntity.status(HttpStatus.OK).body(Util.formatResponse(HttpStatus.OK, data, service.getPessoas(data.get("coluna"), data.get("ordem"), data.get("pagina"), data.get("qtd"))));
        } catch (SQLException | JsonProcessingException ex) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Util.formatException(ex));
        }
    }
    
    @GetMapping("/funcionarios")
    public ResponseEntity<?> listarFuncionarios(@RequestParam Map<String, String> data) {
        try {
            return ResponseEntity.status(HttpStatus.OK).body(Util.formatResponse(HttpStatus.OK, data, service.getFuncionarios(data.get("coluna"), data.get("ordem"), data.get("pagina"), data.get("qtd"))));
        } catch (SQLException | JsonProcessingException ex) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Util.formatException(ex));
        }
    }
    
    @GetMapping("/pessoas/buscar")
    public ResponseEntity<?> buscarPessoas(@RequestParam Map<String, String> data) {
        try {
            return ResponseEntity.status(HttpStatus.OK).body((data.get("q") != null) ? Util.formatResponse(HttpStatus.OK, data, service.buscarPessoas(data.get("q"), data.get("coluna"), data.get("ordem"), data.get("pagina"), data.get("qtd"))) : "{}");
        } catch (SQLException | JsonProcessingException ex) {
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
    
    @GetMapping("/projetos")
    public ResponseEntity<?> listarProjetos(@RequestParam Map<String, String> data) {
        try {
            return ResponseEntity.status(HttpStatus.OK).body(Util.formatResponse(HttpStatus.OK, data, service.getProjetos(data.get("coluna"), data.get("ordem"), data.get("pagina"), data.get("qtd"))));
        } catch (SQLException | JsonProcessingException ex) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Util.formatException(ex));
        }
    }
    
    @GetMapping("/projetos/buscar")
    public ResponseEntity<?> buscarProjetos(@RequestParam Map<String, String> data) {
        try {
            return ResponseEntity.status(HttpStatus.OK).body((data.get("q") != null) ? Util.formatResponse(HttpStatus.OK, data, service.buscarProjetos(data.get("q"), data.get("coluna"), data.get("ordem"), data.get("pagina"), data.get("qtd"))) : "{}");
        } catch (SQLException | JsonProcessingException ex) {
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
