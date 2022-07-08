package com.projectmanager.database.postgresql.dao;

import com.projectmanager.database.postgresql.Connection;
import com.projectmanager.model.Pessoa;
import com.projectmanager.model.Projeto;
import com.projectmanager.util.Util;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import lombok.Cleanup;

public class ProjetoDAO {
    private static final String COLUNAS_TABELA = "nome, data_inicio, data_previsao_fim, data_fim, descricao, orcamento, idgerente"; // 9
    private static final String COLUNAS_UPDATE = "p.nome = ?, p.data_inicio = ?, p.data_previsao_fim = ?, p.data_fim = ?, p.descricao = ?, p.status = ?, p.orcamento = ?, p.risco = ?, p.idgerente = ?"; // 9
    
    public static long insert(Projeto projeto) throws SQLException {
        try (
            java.sql.Connection conn = Connection.getConnection();
            PreparedStatement stmt = conn.prepareStatement("INSERT INTO projeto (" + COLUNAS_TABELA + ") VALUES (?, ?, ?, ?)", Statement.RETURN_GENERATED_KEYS);
        ) {
            stmt.setString(1, projeto.getNome());
            stmt.setDate(2, Date.valueOf(projeto.getDataInicio().toString()));
            stmt.setDate(3, Date.valueOf(projeto.getDataPrevisaoFim().toString()));
            stmt.setDate(4, Date.valueOf(projeto.getDataFim().toString()));
            stmt.setString(5, projeto.getDescricao());
            stmt.setFloat(6, projeto.getOrcamento());
            stmt.setLong(7, projeto.getGerente().getId());
            
            stmt.executeUpdate();
            
            try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
                if (generatedKeys.next()) return generatedKeys.getLong(1);
            }
        }
        return 0;
    }
    
    public static int update(Projeto projeto) throws SQLException {
        try (
            java.sql.Connection conn = Connection.getConnection();
            PreparedStatement stmt = conn.prepareStatement("UPDATE projeto p SET " + COLUNAS_UPDATE + " WHERE p.id = ?");
        ) {
            stmt.setString(1, projeto.getNome());
            stmt.setDate(2, Date.valueOf(projeto.getDataInicio().toString()));
            stmt.setDate(3, Date.valueOf(projeto.getDataPrevisaoFim().toString()));
            stmt.setDate(4, Date.valueOf(projeto.getDataFim().toString()));
            stmt.setString(5, projeto.getDescricao());
            stmt.setString(6, projeto.getStatus());
            stmt.setFloat(7, projeto.getOrcamento());
            stmt.setString(8, projeto.getRisco());
            stmt.setLong(9, projeto.getGerente().getId());
            stmt.setLong(10, projeto.getId());
            return stmt.executeUpdate();
        }
    }
    
    public static int delete(Projeto projeto) throws SQLException {
        try (
            java.sql.Connection conn = Connection.getConnection();
            PreparedStatement stmt = conn.prepareStatement("DELETE FROM projeto WHERE id = ?");
        ) {
            stmt.setLong(1, projeto.getId());
            return stmt.executeUpdate();
        }
    }
    
    public static Projeto get(long id) throws SQLException {
        try (
            java.sql.Connection conn = Connection.getConnection();
            PreparedStatement stmt = conn.prepareStatement("SELECT p.id, " + Util.formatarColunas(COLUNAS_TABELA, "p") + " FROM projeto p WHERE p.id = ?");
        ) {
            stmt.setLong(1, id);
            return getProjeto(stmt);
        }
    }
    
    public static List<Projeto> list(String coluna, String ordem, long limit, long offset) throws SQLException {
        try (
            java.sql.Connection conn = Connection.getConnection();
            PreparedStatement stmt = conn.prepareStatement(String.format("SELECT p.id, %s FROM projeto p ORDER BY %s %s LIMIT ?, ?", Util.formatarColunas(COLUNAS_TABELA, "p"), "p" + coluna, ordem));
        ) {
            stmt.setLong(1, offset);
            stmt.setLong(2, limit);
            return getProjetos(stmt);
        }
    }
    
    public static List<Projeto> list(long limit, long offset) throws SQLException {
        try (
            java.sql.Connection conn = Connection.getConnection();
            PreparedStatement stmt = conn.prepareStatement("SELECT p.id, " + Util.formatarColunas(COLUNAS_TABELA, "p") + " FROM projeto p LIMIT ?, ?");
        ) {
            stmt.setLong(1, offset);
            stmt.setLong(2, limit);
            return getProjetos(stmt);
        }
    }
    
    public static List<Projeto> find(String q, long limit, long offset) throws SQLException {
        try (
            java.sql.Connection conn = Connection.getConnection();
            PreparedStatement stmt = conn.prepareStatement("SELECT p.id, " + Util.formatarColunas(COLUNAS_TABELA, "p") + " FROM projeto p WHERE " + Util.buildQuery(q, "projeto", new String[]{"nome", "descricao", "orcamento", "data_inicio", "data_previsao_fim", "data_fim"}) + " LIMIT ?, ?");
        ) {
            int index = 1;
            stmt.setString(index, "%" + q + "%");
            index++;
            stmt.setString(index, "%" + q + "%");
            index++;
            stmt.setString(index, "%" + q + "%");
            
            if (Util.isDate(q)) { // para as datas
                index++;
                stmt.setString(index, "%" + q + "%");
                index++;
                stmt.setString(index, "%" + q + "%");
                index++;
                stmt.setString(index, "%" + q + "%");
            }
            
            index++;
            stmt.setLong(index, offset);
            index++;
            stmt.setLong(index, limit);
            
            return getProjetos(stmt);
        }
    }
    
    public static int adicionarMembro(Projeto projeto, Pessoa pessoa) {
        return 0;
    }
    
    public static int removerMembro(Projeto projeto, Pessoa pessoa) {
        return 0;
    }
    
    public static List<Pessoa> listarMembros(long limit, long offset) {
        return new ArrayList();
    }
    
    public static List<Projeto> findMembros(String q, long limit, long offset) {
        return new ArrayList();
    }
    
    private static Projeto getProjeto(PreparedStatement stmt) throws SQLException {
        @Cleanup ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            return Projeto.parse(rs);
        }
        return null;
    }
    
    private static List<Projeto> getProjetos(PreparedStatement stmt) throws SQLException {
        @Cleanup ResultSet rs = stmt.executeQuery();
        List<Projeto> projetos = new ArrayList<>();
        while (rs.next()) {
            projetos.add(Projeto.parse(rs));
        }
        return projetos;
    }
}