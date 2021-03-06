package com.projectmanager.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.projectmanager.database.postgresql.dao.PessoaDAO;
import com.projectmanager.util.Util;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.Value;
import org.springframework.format.annotation.DateTimeFormat;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Projeto {
    private long id;
    private String nome;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate dataInicio;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate dataPrevisaoFim;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate dataFim;
    private String descricao;
    private String status;
    private float orcamento;
    private String risco;
    private Pessoa gerente;
    
    public static Projeto parse(ResultSet rs) throws SQLException {
        return new Projeto(
            rs.getLong("id"),
            rs.getString("nome"),
            LocalDate.parse(rs.getString("data_inicio"), DateTimeFormatter.ofPattern("yyyy'-'MM'-'dd")),
            LocalDate.parse(rs.getString("data_previsao_fim"), DateTimeFormatter.ofPattern("yyyy'-'MM'-'dd")),
            LocalDate.parse(rs.getString("data_fim"), DateTimeFormatter.ofPattern("yyyy'-'MM'-'dd")),
            rs.getString("descricao"),
            rs.getString("status"),
            rs.getFloat("orcamento"), 
            Util.calcularRisco(LocalDate.parse(rs.getString("data_fim"), DateTimeFormatter.ofPattern("yyyy'-'MM'-'dd"))), 
            PessoaDAO.get(Long.parseLong(rs.getString("idgerente")))
        );
    }
}
