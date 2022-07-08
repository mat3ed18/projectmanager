package com.projectmanager.service;

import com.projectmanager.database.postgresql.dao.PessoaDAO;
import com.projectmanager.database.postgresql.dao.ProjetoDAO;
import com.projectmanager.model.Pessoa;
import com.projectmanager.model.Projeto;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Service;

@Service("ProjectManager")
public class ProjectManagerService {
    
    public long create(Pessoa pessoa) throws SQLException {
        Pessoa p = PessoaDAO.get(pessoa);
        if (p == null) return PessoaDAO.insert(pessoa);
        else return 0;
    }
    
    public int update(Pessoa pessoa) throws SQLException {
        return PessoaDAO.update(pessoa);
    }
    
    public int delete(Pessoa pessoa) throws SQLException {
        return PessoaDAO.delete(pessoa);
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
    
    public long create(Projeto projeto) throws SQLException {
        return ProjetoDAO.insert(projeto);
    }
    
    public int update(Projeto projeto) throws SQLException {
        return ProjetoDAO.update(projeto);
    }
    
    public int delete(Projeto projeto) throws SQLException {
        return ProjetoDAO.delete(projeto);
    }
    
    public Projeto getProjeto(String id) throws SQLException {
        return ProjetoDAO.get(Long.getLong(id));
    }
    
    public int associate(Projeto projeto, Pessoa pessoa) {
        return 0;
    }
    
    public int disassociate(Projeto projeto, Pessoa pessoa) {
        return 0;
    }
    
    public List<Pessoa> getMembers(long page, long limit) {
        return new ArrayList();
    }
    
    public List<Pessoa> findMembers(String q, long page, long limit) {
        return new ArrayList();
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
