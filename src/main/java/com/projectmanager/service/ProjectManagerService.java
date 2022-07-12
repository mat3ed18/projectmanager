package com.projectmanager.service;

import com.projectmanager.database.postgresql.dao.PessoaDAO;
import com.projectmanager.database.postgresql.dao.ProjetoDAO;
import com.projectmanager.model.Pessoa;
import com.projectmanager.model.Projeto;
import java.sql.SQLException;
import java.util.List;
import org.springframework.stereotype.Service;

@Service("ProjectManager")
public class ProjectManagerService {
    
    // Table: projectmanager.pessoa
    
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
    
    public List<Pessoa> getPessoas(String coluna, String ordem, long page, long limit) throws SQLException {
        long offset = (page - 1) * limit;
        return PessoaDAO.list(coluna, ordem, limit, offset);
    }
    
    public List<Pessoa> buscarPessoas(String q, String coluna, String ordem, long page, long limit) throws SQLException {
        long offset = (page - 1) * limit;
        return PessoaDAO.find(q, coluna, ordem, limit, offset);
    }
    
    // Table: projectmanager.projeto
    
    public long create(Projeto projeto) throws SQLException {
        return ProjetoDAO.insert(projeto);
    }
    
    public int update(Projeto projeto) throws SQLException {
        return ProjetoDAO.update(projeto);
    }
    
    public int delete(Projeto projeto) throws SQLException {
        if (!projeto.getStatus().matches("iniciado|em andamento|encerrado")) return ProjetoDAO.delete(projeto);
        else return 0;
    }
    
    public Projeto getProjeto(String id) throws SQLException {
        return ProjetoDAO.get(Long.getLong(id));
    }
    
    public List<Projeto> getProjetos(String coluna, String ordem, long page, long limit) throws SQLException {
        long offset = (page - 1) * limit;
        return ProjetoDAO.list(coluna, ordem, limit, offset);
    }
    
    public List<Projeto> buscarProjetos(String q, String coluna, String ordem, long page, long limit) throws SQLException {
        long offset = (page - 1) * limit;
        return ProjetoDAO.find(q, coluna, ordem, limit, offset);
    }
    
    // Table: projectmanager.membros
    
    public long associate(long idProjeto, long idPessoa) throws SQLException {
        return ProjetoDAO.adicionarMembro(idProjeto, idPessoa);
    }
    
    public int disassociate(long idProjeto, long idPessoa) throws SQLException {
        return ProjetoDAO.removerMembro(idProjeto, idPessoa);
    }
    
    public List<Pessoa> getMembers(long projetoId, String coluna, String ordem, long page, long limit) throws SQLException {
        long offset = (page - 1) * limit;
        return ProjetoDAO.listarMembros(ProjetoDAO.get(projetoId), coluna, ordem, limit, offset);
    }
    
    public List<Projeto> getProjects(long pessoaId, String coluna, String ordem, long page, long limit) throws SQLException {
        long offset = (page - 1) * limit;
        return ProjetoDAO.listarProjetos(PessoaDAO.get(pessoaId), coluna, ordem, limit, offset);
    }
    
    public List<Pessoa> findMembers(String q, long projetoId, String coluna, String ordem, long page, long limit) throws SQLException {
        long offset = (page - 1) * limit;
        return ProjetoDAO.buscarMembros(q, ProjetoDAO.get(projetoId), coluna, ordem, limit, offset);
    }
    
    public List<Projeto> findProjects(String q, long pessoaId, String coluna, String ordem, long page, long limit) throws SQLException {
        long offset = (page - 1) * limit;
        return ProjetoDAO.buscarProjetos(q, PessoaDAO.get(pessoaId), coluna, ordem, limit, offset);
    }
}
