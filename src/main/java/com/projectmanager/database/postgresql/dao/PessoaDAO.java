package com.projectmanager.database.postgresql.dao;

import com.projectmanager.database.postgresql.Connection;
import com.projectmanager.model.Pessoa;
import com.projectmanager.util.Util;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import lombok.Cleanup;

public class PessoaDAO {
    private static final String colunasTabela = "nome, datanascimento, cpf, funcionario"; // 4
    private static final String colunasUpdate = "p.nome = ?, p.datanascimento = ?, p.cpf = ?, p.funcionario = ?"; // 4
    
    public static final String CRESCENTE = "ASC";
    public static final String DECRESCENTE = "DESC";
    
    public static long insert(Pessoa pessoa) throws SQLException {
        try (
            java.sql.Connection conn = Connection.getConnection();
            PreparedStatement stmt = conn.prepareStatement("INSERT INTO pessoa (" + colunasTabela + ") VALUES (?, ?, ?, ?)", Statement.RETURN_GENERATED_KEYS);
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
            java.sql.Connection conn = Connection.getConnection();
            PreparedStatement stmt = conn.prepareStatement("UPDATE pessoa p SET " + colunasUpdate + " WHERE p.id = ?");
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
            java.sql.Connection conn = Connection.getConnection();
            PreparedStatement stmt = conn.prepareStatement("DELETE FROM pessoa WHERE id = ?");
        ) {
            stmt.setLong(1, pessoa.getId());
            return stmt.executeUpdate();
        }
    }
    
    public static Pessoa get(long id) throws SQLException {
        try (
            java.sql.Connection conn = Connection.getConnection();
            PreparedStatement stmt = conn.prepareStatement("SELECT p.id, " + Util.formatarColunas(colunasTabela, "p") + " FROM pessoa p WHERE p.id = ?");
        ) {
            stmt.setLong(1, id);
            return getPessoa(stmt);
        }
    }
    
    public static List<Pessoa> list(String coluna, String ordem, long limit, long offset) throws SQLException {
        try (
            java.sql.Connection conn = Connection.getConnection();
            PreparedStatement stmt = conn.prepareStatement(String.format("SELECT p.id, %s FROM pessoa p ORDER BY %s %s LIMIT ?, ?", Util.formatarColunas(colunasTabela, "p"), "p." + coluna, ordem));
        ) {
            stmt.setLong(1, offset);
            stmt.setLong(2, limit);
            return getPessoas(stmt);
        }
    }
    
    public static List<Pessoa> list(long limit, long offset) throws SQLException {
        try (
            java.sql.Connection conn = Connection.getConnection();
            PreparedStatement stmt = conn.prepareStatement("SELECT p.id, " + Util.formatarColunas(colunasTabela, "p") + " FROM pessoa p LIMIT ?, ?");
        ) {
            stmt.setLong(1, offset);
            stmt.setLong(2, limit);
            return getPessoas(stmt);
        }
    }
    
    public static List<Pessoa> find(String q, long limit, long offset) throws SQLException {
        try (
            java.sql.Connection conn = Connection.getConnection();
            PreparedStatement stmt = conn.prepareStatement("SELECT DISTINCT(p.id) as cd, p.id, " + Util.formatarColunas(colunasTabela, "p") + " FROM pessoa p WHERE " + Util.buildQuery(q, "pessoa", new String[]{"nome", "datanascimento", "cpf"}) + " LIMIT ?, ?");
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
            stmt.setLong(index, offset);
            index++;
            stmt.setLong(index, limit);
            
            return getPessoas(stmt);
        }
    }
    
    private static Pessoa getPessoa(PreparedStatement stmt) throws SQLException {
        @Cleanup ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            return Pessoa.parse(rs);
        }
        return null;
    }
    
    private static List<Pessoa> getPessoas(PreparedStatement stmt) throws SQLException {
        @Cleanup ResultSet rs = stmt.executeQuery();
        List<Pessoa> pessoas = new ArrayList<>();
        while (rs.next()) {
            pessoas.add(Pessoa.parse(rs));
        }
        return pessoas;
    }
}