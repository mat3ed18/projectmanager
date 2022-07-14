package com.projectmanager.model;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.projectmanager.database.postgresql.dao.PessoaDAO;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Projeto {
    private long id;
    private String nome;
    @JsonProperty("inicio")
    private LocalDate dataInicio;
    @JsonProperty("previsaoFim")
    private LocalDate dataPrevisaoFim;
    @JsonProperty("fim")
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
            rs.getString("risco"), 
            PessoaDAO.get(Long.parseLong(rs.getString("idgerente")))
        );
    }
}
