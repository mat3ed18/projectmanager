package com.projectmanager.database.postgresql.dao;

import com.projectmanager.database.postgresql.Connection;
import com.projectmanager.model.Pessoa;
import java.math.BigInteger;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import lombok.Cleanup;

public class PessoaDAO {
    private static final String colunasTabela = "nome, datanascimento, cpf, funcionario";
    private static final String colunasUpdate = "p.nome = ?, p.datanascimento = ?, p.cpf = ?, p.funcionario = ?";
    
    public static int insert(Pessoa pessoa) throws SQLException {
        int id = 0;
        System.out.println(pessoa.getDataNascimento().toString());
        
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
                if (generatedKeys.next()) {
                    id = (int) generatedKeys.getLong(1);
                }
            }
        }
        return id;
    }
    
    
    public static int update(Pessoa pessoa) {
        return 1;
    }
    
    public static int delete(Pessoa pessoa) {
        return 1;
    }
    
    
    public static Pessoa get(BigInteger id) {
        return null;
    }
    
    public static List<Pessoa> list(int limit, int offset) {
        return new ArrayList();
    }
    
    public static List<Pessoa> find(String q, int limit, int offset) {
        return new ArrayList();
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