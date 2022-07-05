package com.projectmanager.endpoint;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class ProjectManagerEndpoint {
    @GetMapping(value = "/pessoas", produces = {"application/json"})
    public ResponseEntity<?> listarPessoas() {
        return ResponseEntity.ok("{\"teste\": \"ok\"}");
    }
}
