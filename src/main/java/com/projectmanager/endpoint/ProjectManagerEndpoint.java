package com.projectmanager.endpoint;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/api", produces = "application/json")
public class ProjectManagerEndpoint {
    
    @GetMapping("/pessoas")
    public ResponseEntity<?> getPessoas() {
        ResponseEntity.status(200);
        return ResponseEntity.ok("{\"teste\": \"ok\"}");
    }
    
}
