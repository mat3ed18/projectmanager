package com.projectmanager.database.postgresql.dao;

import com.projectmanager.config.Config;
import com.projectmanager.model.Pessoa;
import com.projectmanager.model.Projeto;
import com.projectmanager.util.Util;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import lombok.Cleanup;

public class ProjetoDAO {
    private static final String COLUNAS_TABELA = "nome, data_inicio, data_previsao_fim, data_fim, descricao, orcamento, idgerente"; // 7
    private static final String COLUNAS_UPDATE = "p.nome = ?, p.data_inicio = ?, p.data_previsao_fim = ?, p.data_fim = ?, p.descricao = ?, p.status = ?, p.orcamento = ?, p.risco = ?, p.idgerente = ?"; // 9
    
    public static long insert(Projeto projeto) throws SQLException {
        try (
            java.sql.Connection conn = DriverManager.getConnection(Config.URL);
            PreparedStatement stmt = conn.prepareStatement("INSERT INTO projeto (" + COLUNAS_TABELA + ") VALUES (?, ?, ?, ?, ?, ?, ?)", Statement.RETURN_GENERATED_KEYS);
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
            java.sql.Connection conn = DriverManager.getConnection(Config.URL);
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
            java.sql.Connection conn = DriverManager.getConnection(Config.URL);
            PreparedStatement stmt = conn.prepareStatement("DELETE FROM projeto WHERE id = ?");
        ) {
            stmt.setLong(1, projeto.getId());
            return stmt.executeUpdate();
        }
    }
    
    public static Projeto get(long id) throws SQLException {
        try (
            java.sql.Connection conn = DriverManager.getConnection(Config.URL);
            PreparedStatement stmt = conn.prepareStatement("SELECT p.id, " + Util.formatarColunas(COLUNAS_TABELA, "p") + ", p.status FROM projeto p WHERE p.id = ?");
        ) {
            stmt.setLong(1, id);
            return getProjeto(stmt);
        }
    }
    
    public static List<Projeto> list(String coluna, String ordem, long limit, long offset) throws SQLException {
        try (
            java.sql.Connection conn = DriverManager.getConnection(Config.URL);
            PreparedStatement stmt = conn.prepareStatement(String.format("SELECT p.id, %s, p.status FROM projeto p ORDER BY p.%s %s LIMIT ? OFFSET ?", Util.formatarColunas(COLUNAS_TABELA, "p"), coluna, ordem));
        ) {
            stmt.setLong(1, limit);
            stmt.setLong(2, offset);
            
            Config.ROWS = Util.countQuery(stmt);
            return getProjetos(stmt);
        }
    }
    
    public static List<Projeto> find(String q, String coluna, String ordem, long limit, long offset) throws SQLException {
        try (
            java.sql.Connection conn = DriverManager.getConnection(Config.URL);
            PreparedStatement stmt = conn.prepareStatement(String.format("SELECT p.id, %s, p.status FROM projeto p WHERE %s ORDER BY p.%s %s LIMIT ? OFFSET ?", Util.formatarColunas(COLUNAS_TABELA, "p"), Util.buildQuery(q, "projeto", new String[]{"nome", "descricao", "data_inicio", "data_previsao_fim", "data_fim"}), coluna, ordem));
        ) {
            int index = 1;
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
            stmt.setLong(index, limit);
            index++;
            stmt.setLong(index, offset);
            
            Config.ROWS = Util.countQuery(stmt);
            return getProjetos(stmt);
        }
    }
    
    public static long adicionarMembro(long projetoId, long pessoaId) throws SQLException {
        try (
            java.sql.Connection conn = DriverManager.getConnection(Config.URL);
            PreparedStatement stmt = conn.prepareStatement("INSERT INTO membros (idprojeto, idpessoa) VALUES (?, ?)");
        ) {
            stmt.setLong(1, projetoId);
            stmt.setLong(2, pessoaId);
            
            return stmt.executeUpdate();
        }
    }
    
    public static int removerMembro(long projetoId, long pessoaId) throws SQLException {
        try (
            java.sql.Connection conn = DriverManager.getConnection(Config.URL);
            PreparedStatement stmt = conn.prepareStatement("DELETE FROM membros WHERE idprojeto = ? AND idpessoa = ?");
        ) {
            stmt.setLong(1, projetoId);
            stmt.setLong(2, pessoaId);
            return stmt.executeUpdate();
        }
    }
    
    public static boolean isMembro(long projetoId, long pessoaId) throws SQLException {
        try (
            java.sql.Connection conn = DriverManager.getConnection(Config.URL);
            PreparedStatement stmt = conn.prepareStatement("SELECT true AS valid FROM membros m WHERE m.idprojeto = ? AND m.idpessoa = ?");
        ) {
            stmt.setLong(1, projetoId);
            stmt.setLong(2, pessoaId);
            @Cleanup ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getBoolean("valid");
            }
        }
        return false;
    }
    
    public static int removerTodos(Projeto projeto) throws SQLException {
        try (
            java.sql.Connection conn = DriverManager.getConnection(Config.URL);
            PreparedStatement stmt = conn.prepareStatement("DELETE FROM membros WHERE idprojeto = ?");
        ) {
            stmt.setLong(1, projeto.getId());
            return stmt.executeUpdate();
        }
    }
    
    public static int removerTodos(Pessoa pessoa) throws SQLException {
        try (
            java.sql.Connection conn = DriverManager.getConnection(Config.URL);
            PreparedStatement stmt = conn.prepareStatement("DELETE FROM membros WHERE idpessoa = ?");
        ) {
            stmt.setLong(2, pessoa.getId());
            return stmt.executeUpdate();
        }
    }
    
    public static List<Pessoa> listarMembros(Projeto projeto, String coluna, String ordem, long limit, long offset) throws SQLException {
        try (
            java.sql.Connection conn = DriverManager.getConnection(Config.URL);
            PreparedStatement stmt = conn.prepareStatement(String.format("SELECT ps.* FROM pessoa ps, projeto pr, membros m WHERE %s ORDER BY ps.%s %s LIMIT ? OFFSET ?", Util.formatarWhere(new ArrayList<Map<String, Object>>(){{
                add(new HashMap<String, Object>(){{
                    put("column", "m.idpessoa");
                    put("value", "ps.id");
                    put("relation", true);
                }});
                add(new HashMap<String, Object>(){{
                    put("column", "m.idprojeto");
                    put("value", "pr.id");
                    put("relation", true);
                }});
                add(new HashMap<String, Object>(){{
                    put("column", "pr.id");
                    put("value", "?");
                    put("statement", true);
                }});
            }}), coluna, ordem));
        ) {
            stmt.setLong(1, projeto.getId());
            stmt.setLong(2, limit);
            stmt.setLong(3, offset);
            
            Config.ROWS = Util.countQuery(stmt);
            return PessoaDAO.getPessoas(stmt);
        }
    }
    
    public static int get(long projetoId, long pessoaId) throws SQLException {
        try (
            java.sql.Connection conn = DriverManager.getConnection(Config.URL);
            PreparedStatement stmt = conn.prepareStatement(String.format("SELECT m.* FROM membros m WHERE %s", Util.formatarWhere(new ArrayList<Map<String, Object>>(){{
                add(new HashMap<String, Object>(){{
                    put("column", "m.idpessoa");
                    put("value", "?");
                    put("statement", true);
                }});
                add(new HashMap<String, Object>(){{
                    put("column", "m.idprojeto");
                    put("value", "?");
                    put("statement", true);
                }});
                
            }})));
        ) {
            stmt.setLong(1, projetoId);
            stmt.setLong(2, pessoaId);
            
            @Cleanup ResultSet rs = stmt.executeQuery();
            rs.next();
            Util.countQuery(stmt);
            return rs.getRow();
        }
    }
    
    public static List<Projeto> listarProjetos(Pessoa pessoa, String coluna, String ordem, long limit, long offset) throws SQLException {
        try (
            java.sql.Connection conn = DriverManager.getConnection(Config.URL);
            PreparedStatement stmt = conn.prepareStatement(String.format("SELECT pr.* FROM pessoa ps, projeto pr, membros m WHERE %s ORDER BY ps.%s %s LIMIT ? OFFSET ?", Util.formatarWhere(new ArrayList<Map<String, Object>>(){{
                add(new HashMap<String, Object>(){{
                    put("column", "m.idpessoa");
                    put("value", "ps.id");
                    put("relation", true);
                }});
                add(new HashMap<String, Object>(){{
                    put("column", "m.idprojeto");
                    put("value", "pr.id");
                    put("relation", true);
                }});
                add(new HashMap<String, Object>(){{
                    put("column", "ps.id");
                    put("value", "?");
                    put("statement", true);
                }});
            }}), coluna, ordem));
        ) {
            stmt.setLong(1, pessoa.getId());
            stmt.setLong(2, limit);
            stmt.setLong(3, offset);
            
            Config.ROWS = Util.countQuery(stmt);
            return getProjetos(stmt);
        }
    }
    
    public static List<Pessoa> buscarMembros(String q, Projeto projeto, String coluna, String ordem, long limit, long offset) throws SQLException {
        try (
            java.sql.Connection conn = DriverManager.getConnection(Config.URL);
            PreparedStatement stmt = conn.prepareStatement(String.format("SELECT ps.* FROM pessoa ps, projeto pr, membros m WHERE %s AND %s ORDER BY ps.%s %s LIMIT ? OFFSET ?", Util.formatarWhere(new ArrayList<Map<String, Object>>(){{
                add(new HashMap<String, Object>(){{
                    put("column", "m.idpessoa");
                    put("value", "ps.id");
                    put("relation", true);
                }});
                add(new HashMap<String, Object>(){{
                    put("column", "m.idprojeto");
                    put("value", "pr.id");
                    put("relation", true);
                }});
                add(new HashMap<String, Object>(){{
                    put("column", "pr.id");
                    put("value", "?");
                    put("statement", true);
                }});
            }}), Util.buildQuery(q, "pessoa", new String[]{"nome", "datanascimento", "cpf"}).replace("p.", "ps."), coluna, ordem));
        ) {
            int index = 1;
            stmt.setLong(index, projeto.getId());
            index++;
            stmt.setString(index, "%" + q + "%");
            
            if (Util.isDate(q)) { // para a data de nascimento
                index++;
                stmt.setString(index, "%" + q + "%");
            }
            
            if (Util.isCpf(q)) { // para o cpf
                index++;
                stmt.setString(index, "%" + q + "%");
            }
            
            index++;
            stmt.setLong(index, limit);
            index++;
            stmt.setLong(index, offset);
            
            Config.ROWS = Util.countQuery(stmt);
            return PessoaDAO.getPessoas(stmt);
        }
    }
    
    public static List<Projeto> buscarProjetos(String q, Pessoa pessoa, String coluna, String ordem, long limit, long offset) throws SQLException {
        try (
            java.sql.Connection conn = DriverManager.getConnection(Config.URL);
            PreparedStatement stmt = conn.prepareStatement(String.format("SELECT pr.* FROM pessoa ps, projeto pr, membros m WHERE %s AND %s ORDER BY pr.%s %s LIMIT ? OFFSET ?", Util.formatarWhere(new ArrayList<Map<String, Object>>(){{
                add(new HashMap<String, Object>(){{
                    put("column", "m.idpessoa");
                    put("value", "ps.id");
                    put("relation", true);
                }});
                add(new HashMap<String, Object>(){{
                    put("column", "m.idprojeto");
                    put("value", "pr.id");
                    put("relation", true);
                }});
                add(new HashMap<String, Object>(){{
                    put("column", "ps.id");
                    put("value", "?");
                    put("statement", true);
                }});
            }}), Util.buildQuery(q, "projeto", new String[]{"nome", "descricao", "orcamento", "data_inicio", "data_previsao_fim", "data_fim"}).replace("p.", "pr."), coluna, ordem));
        ) {
            int index = 1;
            stmt.setLong(index, pessoa.getId());
            index++;
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
            stmt.setLong(index, limit);
            index++;
            stmt.setLong(index, offset);
            
            Config.ROWS = Util.countQuery(stmt);
            return getProjetos(stmt);
        }
    }
    
    public static long qtdProjetos() throws SQLException {
        try (
            java.sql.Connection conn = DriverManager.getConnection(Config.URL);
            PreparedStatement stmt = conn.prepareStatement(String.format("SELECT COUNT(p.id) AS qtd FROM projeto p"))
        ) {
            @Cleanup ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getLong("qtd");
            }
        }
        return 0;
    }
    
    public static long totalProjetosMembro(long idPessoa) throws SQLException {
        try (
            java.sql.Connection conn = DriverManager.getConnection(Config.URL);
            PreparedStatement stmt = conn.prepareStatement(String.format("SELECT COUNT(m.idprojeto) AS qtd FROM membros m WHERE m.idpessoa = ?"))
        ) {
            stmt.setLong(1, idPessoa);
            @Cleanup ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getLong("qtd");
            }
        }
        return 0;
    }
    
    public static long totalMembrosProjeto(long idProjeto) throws SQLException {
        try (
            java.sql.Connection conn = DriverManager.getConnection(Config.URL);
            PreparedStatement stmt = conn.prepareStatement(String.format("SELECT COUNT(m.idpessoa) AS qtd FROM membros m WHERE m.idprojeto = ?"))
        ) {
            stmt.setLong(1, idProjeto);
            @Cleanup ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getLong("qtd");
            }
        }
        return 0;
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
        Config.ROWS = Util.countQuery(stmt);
        return projetos;
    }
}