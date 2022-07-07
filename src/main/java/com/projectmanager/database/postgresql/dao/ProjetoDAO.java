package com.projectmanager.database.postgresql.dao;

import com.projectmanager.model.Projeto;
import java.math.BigInteger;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import lombok.Cleanup;

public class ProjetoDAO {
    private static final String colunasTabela = "id, nome, data_inicio, data_previsao_fim, data_fim, descricao, status, orcamento, risco, idgerente";
    private static final String colunasUpdate = "p.id = ?, p.nome = ?, p.data_inicio = ?, p.data_previsao_fim = ?, p.data_fim = ?, p.descricao = ?, p.status = ?, p.orcamento = ?, p.risco = ?, p.idgerente = ?";
    
    public static int insert(Projeto projeto) {
        return 1;
    }
    
    public static int update(Projeto projeto) {
        return 1;
    }
    
    public static int delete(Projeto projeto) {
        return 1;
    }
    
    public static Projeto get(BigInteger id) {
        return null;
    }
    
    public static List<Projeto> list(int limit, int offset) {
        return new ArrayList();
    }
    
    public static List<Projeto> find(String q, int limit, int offset) {
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