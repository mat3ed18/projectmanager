package com.projectmanager.service;

import com.projectmanager.database.postgresql.dao.PessoaDAO;
import com.projectmanager.database.postgresql.dao.ProjetoDAO;
import com.projectmanager.model.Pessoa;
import com.projectmanager.model.Projeto;
import java.sql.SQLException;
import java.util.List;

public class ProjectManagerService {
    
    public int create(Pessoa pessoa) {
        return 0;
    }
    
    public int update(Pessoa pessoa) {
        return 0;
    }
    
    public boolean delete(Pessoa pessoa) {
        return true;
    }
    
    public Pessoa getPessoa(String id) throws SQLException {
        return PessoaDAO.get(Long.parseLong(id));
    }
    
    public List<Pessoa> getPessoas(long page, long limit) throws SQLException {
        long offset = (page - 1) * limit;
        return PessoaDAO.list(limit, offset);
    }
    
    public List<Pessoa> buscarPessoas(String q, long page, long limit) throws SQLException {
        long offset = (page - 1) * limit;
        return PessoaDAO.find(q, limit, offset);
    }
    
    public int create(Projeto projeto) {
        return 0;
    }
    
    public int update(Projeto projeto) {
        return 0;
    }
    
    public boolean delete(Projeto projeto) {
        return true;
    }
    
    public Projeto getProjeto(String id) throws SQLException {
        return ProjetoDAO.get(Long.getLong(id));
    }
    
    public List<Projeto> getProjetos(long page, long limit) throws SQLException {
        long offset = (page - 1) * limit;
        return ProjetoDAO.list(limit, offset);
    }
    
    public List<Projeto> buscarProjetos(String q, long page, long limit) throws SQLException {
        long offset = (page - 1) * limit;
        return ProjetoDAO.find(q, limit, offset);
    }
}
