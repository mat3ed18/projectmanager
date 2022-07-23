package com.projectmanager.service;

import com.projectmanager.database.postgresql.dao.PessoaDAO;
import com.projectmanager.database.postgresql.dao.ProjetoDAO;
import com.projectmanager.model.Pessoa;
import com.projectmanager.model.Projeto;
import com.projectmanager.util.Request;
import com.projectmanager.util.RequestResponse;
import static com.projectmanager.util.Util.disableLogs;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import org.apache.commons.codec.binary.Base64;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

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
        ProjetoDAO.removerTodos(pessoa);
        return PessoaDAO.delete(pessoa);
    }
    
    public Pessoa getPessoa(String id) throws SQLException {
        return PessoaDAO.get(Long.parseLong(id));
    }
    
    public Pessoa getPessoaPorCpf(String cpf) throws SQLException {
        return PessoaDAO.get(cpf);
    }
    
    public List<Pessoa> getPessoas(String coluna, String ordem, String page, String limit) throws SQLException {
        long offset = (page != null && limit != null) ? (Long.parseLong(page) - 1) * Long.parseLong(limit) : 0;
        return PessoaDAO.list((coluna != null) ? coluna : "id", (ordem != null) ? ordem : "ASC", (limit != null) ? Long.parseLong(limit) : PessoaDAO.qtdPessoas() + 1, offset);
    }
    
    public List<Pessoa> getFuncionarios(String coluna, String ordem, String page, String limit) throws SQLException {
        long offset = (page != null && limit != null) ? (Long.parseLong(page) - 1) * Long.parseLong(limit) : 0;
        return PessoaDAO.funcionarios((coluna != null) ? coluna : "id", (ordem != null) ? ordem : "ASC", (limit != null) ? Long.parseLong(limit) : PessoaDAO.qtdFuncionarios() + 1, offset);
    }
    
    public List<Pessoa> buscarPessoas(String q, String coluna, String ordem, String page, String limit) throws SQLException {
        long offset = (page != null && limit != null) ? (Long.parseLong(page) - 1) * Long.parseLong(limit) : 0;
        return PessoaDAO.find(q, (coluna != null) ? coluna : "id", (ordem != null) ? ordem : "ASC", (limit != null) ? Long.parseLong(limit) : PessoaDAO.qtdPessoas() + 1, offset);
    }
    
    // Table: projectmanager.projeto
    
    public long create(Projeto projeto) throws SQLException {
        return ProjetoDAO.insert(projeto);
    }
    
    public int update(Projeto projeto) throws SQLException {
        return ProjetoDAO.update(projeto);
    }
    
    public int update(long idProjeto, String status) throws SQLException {
        return ProjetoDAO.update(idProjeto, status);
    }
    
    public int delete(Projeto projeto) throws SQLException {
        if (!projeto.getStatus().matches("iniciado|em andamento|encerrado")) {
            ProjetoDAO.removerTodos(projeto);
            return ProjetoDAO.delete(projeto);
        }
        else return 0;
    }
    
    public Projeto getProjeto(String id) throws SQLException {
        return ProjetoDAO.get(Long.parseLong(id));
    }
    
    public List<Projeto> getProjetos(String coluna, String ordem, String page, String limit) throws SQLException {
        long offset = (page != null && limit != null) ? (Long.parseLong(page) - 1) * Long.parseLong(limit) : 0;
        return ProjetoDAO.list((coluna != null) ? coluna : "id", (ordem != null) ? ordem : "ASC", (limit != null) ? Long.parseLong(limit) : ProjetoDAO.qtdProjetos(), offset);
    }
    
    public List<Projeto> buscarProjetos(String q, String coluna, String ordem, String page, String limit) throws SQLException {
        long offset = (page != null && limit != null) ? (Long.parseLong(page) - 1) * Long.parseLong(limit) : 0;
        return ProjetoDAO.find(q, (coluna != null) ? coluna : "id", (ordem != null) ? ordem : "ASC", (limit != null) ? Long.parseLong(limit) : ProjetoDAO.qtdProjetos(), offset);
    }
    
    // Table: projectmanager.membros
    
    public long associate(long idProjeto, long idPessoa) throws SQLException {
        if (!ProjetoDAO.isMembro(idProjeto, idPessoa) && (ProjetoDAO.get(idProjeto) != null && PessoaDAO.get(idPessoa) != null)) {
            return ProjetoDAO.adicionarMembro(idProjeto, idPessoa);
        } else {
            return 0;
        }
    }
    
    public int disassociate(long idProjeto, long idPessoa) throws SQLException {
        return ProjetoDAO.removerMembro(idProjeto, idPessoa);
    }
    
    public int disassociateAllProjeto(long idProjeto) throws SQLException {
        return ProjetoDAO.removerTodos(ProjetoDAO.get(idProjeto));
    }
    
    public int disassociateAllPessoa(long idPessoa) throws SQLException {
        return ProjetoDAO.removerTodos(PessoaDAO.get(idPessoa));
    }
    
    public List<Pessoa> getMembers(String projetoId, String coluna, String ordem, String page, String limit) throws SQLException {
        long offset = (page != null && limit != null) ? (Long.parseLong(page) - 1) * Long.parseLong(limit) : 0;
        return ProjetoDAO.listarMembros(ProjetoDAO.get(Long.parseLong(projetoId)), (coluna != null) ? coluna : "id", (ordem != null) ? ordem : "ASC", (limit != null) ? Long.parseLong(limit) : ProjetoDAO.totalMembrosProjeto(Long.parseLong(projetoId)), offset);
    }
    
    public List<Projeto> getProjects(String pessoaId, String coluna, String ordem, String page, String limit) throws SQLException {
        long offset = (page != null && limit != null) ? (Long.parseLong(page) - 1) * Long.parseLong(limit) : 0;
        return ProjetoDAO.listarProjetos(PessoaDAO.get(Long.parseLong(pessoaId)), (coluna != null) ? coluna : "id", (ordem != null) ? ordem : "ASC", (limit != null) ? Long.parseLong(limit) : ProjetoDAO.totalProjetos(Long.parseLong(pessoaId)), offset);
    }
    
    public List<Pessoa> findMembers(String q, String projetoId, String coluna, String ordem, String page, String limit) throws SQLException {
        long offset = (page != null && limit != null) ? (Long.parseLong(page) - 1) * Long.parseLong(limit) : 0;
        return ProjetoDAO.buscarMembros(q, ProjetoDAO.get(Long.parseLong(projetoId)), (coluna != null) ? coluna : "id", (ordem != null) ? ordem : "ASC", (limit != null) ? Long.parseLong(limit) : ProjetoDAO.totalMembrosProjeto(Long.parseLong(projetoId)), offset);
    }
    
    public List<Projeto> findProjects(String q, String pessoaId, String coluna, String ordem, String page, String limit) throws SQLException {
        long offset = (page != null && limit != null) ? (Long.parseLong(page) - 1) * Long.parseLong(limit) : 0;
        return ProjetoDAO.buscarProjetos(q, PessoaDAO.get(Long.parseLong(pessoaId)), (coluna != null) ? coluna : "id", (ordem != null) ? ordem : "ASC", (limit != null) ? Long.parseLong(limit) : ProjetoDAO.totalProjetos(Long.parseLong(pessoaId)), offset);
    }
    
    public String recognition(MultipartFile audio) throws IOException {
        disableLogs();
        Request request = new Request();
        byte[] encodedAudio = Base64.encodeBase64(audio.getBytes());
        
        request.setCharsetUTF8();
        
        request.addHeader("Content-Type", "application/json; charset=utf-8");
        request.addHeader("Authorization", "Bearer ");
        
        request.setBody("{\"config\": {\"encoding\":\"FLAC\",\"sampleRateHertz\":16000,\"languageCode\":\"pt-BR\"},\"audio\": {\"content\": \"" + encodedAudio + "\"}}");
        
        RequestResponse requestResponse = request.execPostRequest("https://speech.googleapis.com/v1/speech:recognize");
        
        return requestResponse.getBody();
    }
}
