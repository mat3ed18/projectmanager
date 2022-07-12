package com.projectmanager.database.postgresql.dao;

import com.projectmanager.config.Config;
import com.projectmanager.model.Pessoa;
import com.projectmanager.util.Util;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import lombok.Cleanup;

public class PessoaDAO {
    private static final String COLUNAS_TABELA = "nome, datanascimento, cpf, funcionario"; // 4
    private static final String COLUNAS_UPDATE = "p.nome = ?, p.datanascimento = ?, p.cpf = ?, p.funcionario = ?"; // 4
    
    public static long insert(Pessoa pessoa) throws SQLException {
        try (
            java.sql.Connection conn = DriverManager.getConnection(Config.URL);
            PreparedStatement stmt = conn.prepareStatement("INSERT INTO pessoa (" + COLUNAS_TABELA + ") VALUES (?, ?, ?, ?)", Statement.RETURN_GENERATED_KEYS);
        ) {
            stmt.setString(1, pessoa.getNome());
            stmt.setDate(2, Date.valueOf(pessoa.getDataNascimento().toString()));
            stmt.setString(3, pessoa.getCpf());
            stmt.setBoolean(4, pessoa.isFuncionario());
            stmt.executeUpdate();
            
            try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
                if (generatedKeys.next()) return generatedKeys.getLong(1);
            }
        }
        return 0;
    }
    
    public static int update(Pessoa pessoa) throws SQLException {
        try (
            java.sql.Connection conn = DriverManager.getConnection(Config.URL);
            PreparedStatement stmt = conn.prepareStatement("UPDATE pessoa p SET " + COLUNAS_UPDATE + " WHERE p.id = ?");
        ) {
            stmt.setString(1, pessoa.getNome());
            stmt.setDate(2, Date.valueOf(pessoa.getDataNascimento().toString()));
            stmt.setString(3, pessoa.getCpf());
            stmt.setBoolean(4, pessoa.isFuncionario());
            stmt.setLong(5, pessoa.getId());
            return stmt.executeUpdate();
        }
    }
    
    public static int delete(Pessoa pessoa) throws SQLException {
        try (
            java.sql.Connection conn = DriverManager.getConnection(Config.URL);
            PreparedStatement stmt = conn.prepareStatement("DELETE FROM pessoa WHERE id = ?");
        ) {
            stmt.setLong(1, pessoa.getId());
            return stmt.executeUpdate();
        }
    }
    
    public static Pessoa get(long id) throws SQLException {
        try (
            java.sql.Connection conn = DriverManager.getConnection(Config.URL);
            PreparedStatement stmt = conn.prepareStatement("SELECT p.id, " + Util.formatarColunas(COLUNAS_TABELA, "p") + " FROM pessoa p WHERE p.id = ?");
        ) {
            stmt.setLong(1, id);
            return getPessoa(stmt);
        }
    }
    
    /**
        * Retorna o objeto da pessoa encontrada através de seu CPF
        *
        * @param pessoa Objeto da pessoa criada
        * @return o objeto do tipo Pessoa
        * @throws java.sql.SQLException
    */
    
    public static Pessoa get(Pessoa pessoa) throws SQLException {
        try (
            java.sql.Connection conn = DriverManager.getConnection(Config.URL);
            PreparedStatement stmt = conn.prepareStatement("SELECT p.id, " + Util.formatarColunas(COLUNAS_TABELA, "p") + " FROM pessoa p WHERE p.cpf = ?");
        ) {
            stmt.setString(1, pessoa.getCpf());
            return getPessoa(stmt);
        }
    }
        
    public static List<Pessoa> list(String coluna, String ordem, long limit, long offset) throws SQLException {
        try (
            java.sql.Connection conn = DriverManager.getConnection(Config.URL);
            PreparedStatement stmt = conn.prepareStatement(String.format("SELECT p.id, %s FROM pessoa p ORDER BY p.%s %s LIMIT ? OFFSET ?", Util.formatarColunas(COLUNAS_TABELA, "p"), "p." + coluna, ordem));
        ) {
            stmt.setLong(1, limit);
            stmt.setLong(2, offset);
            Config.ROWS = Util.countQuery(stmt);
            return getPessoas(stmt);
        }
    }
    
    public static List<Pessoa> find(String q, String coluna, String ordem, long limit, long offset) throws SQLException {
        try (
            java.sql.Connection conn = DriverManager.getConnection(Config.URL);
            PreparedStatement stmt = conn.prepareStatement(String.format("SELECT DISTINCT(p.id) as cd, p.id, %s FROM pessoa p WHERE %s ORDER BY p.%s %s LIMIT ? OFFSET ?", Util.formatarColunas(COLUNAS_TABELA, "p"), Util.buildQuery(q, "pessoa", new String[]{"nome", "datanascimento", "cpf"}), coluna, ordem));
        ) {
            int index = 1;
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
            
            return getPessoas(stmt);
        }
    }
    
    public static Pessoa getPessoa(PreparedStatement stmt) throws SQLException {
        @Cleanup ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            return Pessoa.parse(rs);
        }
        return null;
    }
    
    public static List<Pessoa> getPessoas(PreparedStatement stmt) throws SQLException {
        @Cleanup ResultSet rs = stmt.executeQuery();
        List<Pessoa> pessoas = new ArrayList<>();
        while (rs.next()) {
            pessoas.add(Pessoa.parse(rs));
        }
        Config.ROWS = Util.countQuery(stmt);
        return pessoas;
    }
}