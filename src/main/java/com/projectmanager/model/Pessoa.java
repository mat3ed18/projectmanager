package com.projectmanager.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Pessoa {
    private long id;
    private String nome;
    private String cpf;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate dataNascimento;
    private boolean isFuncionario;
    
    public static Pessoa parse(ResultSet rs) throws SQLException {
        return new Pessoa(rs.getLong("id"), rs.getString("nome"), rs.getString("cpf"), LocalDate.parse(rs.getString("datanascimento"), DateTimeFormatter.ofPattern("yyyy'-'MM'-'dd")), rs.getBoolean("funcionario"));
    }
}