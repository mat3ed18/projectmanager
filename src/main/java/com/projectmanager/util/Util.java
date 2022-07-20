package com.projectmanager.util;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.projectmanager.config.Config;
import com.projectmanager.database.postgresql.dao.PessoaDAO;
import com.projectmanager.database.postgresql.dao.ProjetoDAO;
import com.projectmanager.model.Pessoa;
import com.projectmanager.model.Projeto;
import jakarta.servlet.http.HttpServletRequest;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import static java.time.temporal.ChronoUnit.DAYS;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Random;
import java.util.Scanner;
import org.springframework.http.HttpStatus;

public class Util {
    
    public static void main(String[] args) {
        fazerInsercoes();
    }
    
    public static ArrayList<String> getKeys(ObjectNode json) {
        Iterator<Entry<String, JsonNode>> nodes = json.fields();
        ArrayList<String> keys = new ArrayList() {{
            while (nodes.hasNext()) {
                Map.Entry<String, JsonNode> entry = (Map.Entry<String, JsonNode>) nodes.next();
                add(entry.getKey());
            }
        }};
        Collections.sort(keys);
        return keys;
    }
    
    public static ObjectNode formatException(Exception ex) {
        ObjectNode json = new ObjectMapper().createObjectNode();
        
        if (ex instanceof SQLException) {
            SQLException sqlEx = (SQLException) ex;
            json.put("code", sqlEx.getErrorCode());
            json.put("location", sqlEx.getLocalizedMessage());
            json.put("message", sqlEx.getMessage());
            json.put("state", sqlEx.getSQLState());
        } 
        
        else if (ex instanceof JsonProcessingException) {
            JsonProcessingException jsonEx = (JsonProcessingException) ex;
            json.put("code", jsonEx.hashCode());
            json.put("location", jsonEx.getLocalizedMessage());
            json.put("message", jsonEx.getMessage());
        } 
        
        else if (ex instanceof NullPointerException) {
            NullPointerException jsonNull = (NullPointerException) ex;
            json.put("code", jsonNull.hashCode());
            json.put("location", jsonNull.getLocalizedMessage());
            if (jsonNull.getMessage().indexOf("\"com.projectmanager.model.Projeto.getId()\" because \"projeto\" is null") >= 0) json.put("message", "O projeto não foi encontrado");
            else if (jsonNull.getMessage().indexOf("\"com.projectmanager.model.Pessoa.getId()\" because \"pessoa\" is null") >= 0) json.put("message", "O usuário não foi encontrado");
            else json.put("message", jsonNull.getMessage());
        } 
        
        else {
            json.put("code", ex.hashCode());
            json.put("location", ex.getLocalizedMessage());
            json.put("message", ex.getMessage());
        }
        
        return json;
    }
    
    public static boolean isCpf(String str) {
        if ((str.length() == 11 || str.length() == 14) && isNumeric(str.replaceAll("[.-]", ""))) {
            return true;
        } else {
            return false;
        }
    }
    
    public static boolean isDate(String str) {
        if (str.length() == 10 && isNumeric(str.replaceAll("[/]", ""))) {
            return true;
        } else {
            return false;
        }
    }
    
    public static String parseCpf(long cpf) {
        return Long.toString(cpf).replaceFirst("(\\d{3})(\\d{3})(\\d{3})(\\d{2})", "$1.$2.$3-$4");
    }
    
    public static String parseCnpj(long cnpj) {
        return Long.toString(cnpj).replaceFirst("(\\d{2})(\\d{3})(\\d{3})(\\d{4})(\\d{2})", "$1.$2.$3/$4-$5");
    }
    
    public static String parseCel(long num) {
        return Long.toString(num).replaceFirst("(\\d{2})(\\d{1})(\\d{4})(\\d{4})", "($1) $2$3-$4");
    }
    
    public static String parseTel(long num) {
        return Long.toString(num).replaceFirst("(\\d{2})(\\d{4})(\\d{4})", "($1) $2-$3");
    }
    
    public static String parseDate(long date) {
        return Long.toString(date).replaceFirst("(\\d{2})(\\d{2})(\\d{4})", "$1/$2/$3");
    }
    
    public static String parseCpf(String cpf) {
        return cpf.replaceFirst("(\\d{3})(\\d{3})(\\d{3})(\\d{2})", "$1.$2.$3-$4");
    }
    
    public static String parseCnpj(String cnpj) {
        return cnpj.replaceFirst("(\\d{2})(\\d{3})(\\d{3})(\\d{4})(\\d{2})", "$1.$2.$3/$4-$5");
    }
    
    public static String parseCel(String num) {
        return num.replaceFirst("(\\d{2})(\\d{1})(\\d{4})(\\d{4})", "($1) $2$3-$4");
    }
    
    public static String parseTel(String num) {
        return num.replaceFirst("(\\d{2})(\\d{4})(\\d{4})", "($1) $2-$3");
    }
    
    public static String parseDate(String date) {
        return date.replaceFirst("(\\d{2})(\\d{2})(\\d{4})", "$1/$2/$3");
    }
    
    
    public static String buildQuery(String q, String table, String[] columns) {
        String fullQuery = "";
        switch (table) {
            case "pessoa":
                for (int i = 0; i < columns.length; i++) {
                    switch (columns[i]) {
                        case "datanascimento" -> {
                            fullQuery += (isDate(q)) ? "TO_CHAR(p.datanascimento, 'dd/mm/yyyy') LIKE ?" : "";
                            fullQuery += ((i < columns.length - 1 && isDate(q)) ? " OR " : "");
                        }
                        case "cpf" -> {
                            fullQuery += (isCpf(q)) ? "p.cpf LIKE ?" : "";
                            fullQuery += ((i < columns.length - 1 && isCpf(q)) ? " OR " : "");
                        }
                        default -> {
                            fullQuery += "p." + columns[i] + " LIKE ?";
                            fullQuery += ((i < columns.length - 1) ? " OR " : "");
                        }
                    }
                }
            break;
            case "projeto":
                for (int i = 0; i < columns.length; i++) {
                    switch (columns[i]) {
                        case "data_inicio" -> {
                            fullQuery += (isDate(q)) ? "TO_CHAR(p.data_inicio, 'dd/mm/yyyy') LIKE ?" : "";
                            fullQuery += ((i < columns.length - 1 && isDate(q)) ? " OR " : "");
                        }
                        case "data_previsao_fim" -> {
                            fullQuery += (isDate(q)) ? "TO_CHAR(p.data_previsao_fim, 'dd/mm/yyyy') LIKE ?" : "";
                            fullQuery += ((i < columns.length - 1 && isDate(q)) ? " OR " : "");
                        }
                        case "data_fim" -> {
                            fullQuery += (isDate(q)) ? "TO_CHAR(p.data_fim, 'dd/mm/yyyy') LIKE ?" : "";
                            fullQuery += ((i < columns.length - 1 && isDate(q)) ? " OR " : "");
                        }
                        case "orcamento" -> {
                            fullQuery += "CAST(p.orcamento as text) LIKE ?";
                            fullQuery += ((i < columns.length - 1) ? " OR " : "");
                        }
                        default -> {
                            fullQuery += "p." + columns[i] + " LIKE ?";
                            fullQuery += ((i < columns.length - 1) ? " OR " : "");
                        }
                    }
                }
            break;
            default:
                fullQuery = "id LIKE ?"; // só pra não dar erro
            break;
        }
        
        // removendo o último OR
        
        if (!isDate(q) && !isCpf(q)) {
            int start = fullQuery.lastIndexOf(" OR ");
            StringBuilder builder = new StringBuilder();
            if (start > 0) {
                builder.append(fullQuery.substring(0, start));
                builder.append("");
                builder.append(fullQuery.substring(start + " OR ".length()));
                return builder.toString();
            } else {
                return fullQuery;
            }
        } else {
            return fullQuery;
        }
        
        
    }
    
    public static boolean isNumeric(String str) {
        try {
            Long.parseLong(str);
            return true;
        } catch (NumberFormatException ex) {
            return false;
        }
    }
    
    public static String formatarColunas(String colunas, String apelido) {
        String[] columns = colunas.replaceAll("\\s+","").split(",");
        String cols = "";
        
        for (int i = 0; i < columns.length; i++) {
            cols += apelido + "." + columns[i];
            if (i < columns.length - 1) cols += ", ";
        }
        
        return cols;
    }
    
    public static String formatarWhere(ArrayList<Map<String, Object>> condition) {
        String cols = "";
        
        for (int i = 0; i < condition.size(); i++) {
            if (condition.get(i).get("relation") != null || condition.get(i).get("statement") != null) cols += condition.get(i).get("column") + " = " + condition.get(i).get("value");
            else cols += condition.get(i).get("column") + " = " + ((condition.get(i).get("value") != null) ? queryValue(condition.get(i).get("value")) : "?");
            
            if (i < condition.size() - 1) cols += " AND ";
        }
        
        return cols;
    }
    
    public static String queryValue(Object value) {
        if (value instanceof String || value instanceof Float || value instanceof Double || value instanceof Boolean || value instanceof Date) {
            return "'" + value + "'";
        } else if (value instanceof Integer || value instanceof Long) {
            return value.toString();
        } else {
            return null;
        }
    }

    public static String limitarTamanhoDaString(String txt, int tamanho) {
        return (txt.length() > tamanho) ? txt.substring(0, tamanho) + "..." : txt;
    }

    public static String getDataFormatada() {
        Date data = new Date();
        Locale local = new Locale("pt", "BR");
        DateFormat formato = new SimpleDateFormat("dd 'de' MMMM 'de' yyyy", local);
        return formato.format(data);
    }

    public static String getDataFormatadaComHora() {
        Date data = new Date();
        Locale local = new Locale("pt", "BR");
        DateFormat formato = new SimpleDateFormat("dd 'de' MMMM 'de' yyyy 'às' HH:mm:ss", local);
        return formato.format(data);
    }

    public static String getDataFormatada(Date data) {
        Locale local = new Locale("pt", "BR");
        DateFormat formato = new SimpleDateFormat("dd 'de' MMMM 'de' yyyy", local);
        return formato.format(data);
    }
    
    public static String getDataFormatada(LocalDateTime dt) {
        Locale local = new Locale("pt", "BR");
        DateFormat formato = new SimpleDateFormat("dd 'de' MMMM 'de' yyyy", local);
        ZonedDateTime zdt = dt.atZone(ZoneId.of("America/Sao_Paulo"));
        Date data = new Date(zdt.toInstant().toEpochMilli());
        return formato.format(data);
    }

    public static String getDataFormatadaComHora(Date data) {
        Locale local = new Locale("pt", "BR");
        DateFormat formato = new SimpleDateFormat("dd 'de' MMMM 'de' yyyy 'às' HH:mm:ss", local);
        return formato.format(data);
    }
    
    public static String getDataFormatadaComHora(LocalDateTime dt) {
        Locale local = new Locale("pt", "BR");
        DateFormat formato = new SimpleDateFormat("dd 'de' MMMM 'de' yyyy 'às' HH:mm:ss", local);
        ZonedDateTime zdt = dt.atZone(ZoneId.of("America/Sao_Paulo"));
        Date data = new Date(zdt.toInstant().toEpochMilli());
        return formato.format(data);
    }

    public static String getDataFormatadaComHoraNaoExtenso(Date data) {
        Locale local = new Locale("pt", "BR");
        DateFormat formato = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss", local);
        return formato.format(data);
    }
    
    public static String getDataFormatadaComHoraNaoExtenso(LocalDateTime dt) {
        Locale local = new Locale("pt", "BR");
        DateFormat formato = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss", local);
        ZonedDateTime zdt = dt.atZone(ZoneId.of("America/Sao_Paulo"));
        Date data = new Date(zdt.toInstant().toEpochMilli());
        return formato.format(data);
    }
    
    public static long countQuery(PreparedStatement stmt) throws SQLException {
        String columns = stmt.toString().replaceAll(".*SELECT | FROM.*", "");
        String query = stmt.toString().replace("SELECT " + columns + " FROM", "SELECT COUNT(*) AS qtd FROM");
        
        if (query.indexOf("ORDER BY") >= 0) {
            query = query.split("ORDER BY")[0];
        }

        return qtdRows(query);
    }
    
    public static long qtdRows(String sql) throws SQLException {
        try (
            java.sql.Connection conn = DriverManager.getConnection(Config.URL);
            PreparedStatement stmt = conn.prepareStatement(sql);
        ) {
            ResultSet rs = stmt.executeQuery();
            rs.next();
            return rs.getLong("qtd");
        }
    }
    
    public static String formatResponse(HttpStatus request, Map<String, String> data, List<?> response) throws JsonProcessingException {
        Map<String, Object> json = new HashMap(){{
            put("status", request.value());
            put("request", data);
            put("results", response);
            put("total", Config.ROWS);
            put("rows", response.size());
        }};
        return JSON.convertFromObjectToJson(json);
    }
    
    public static void cadastrarPessoa() {
        try {
            Scanner sc = new Scanner(System.in, "ISO-8859-2");
            Pessoa pessoa = new Pessoa();
            System.out.println("Digite o nome do usuário: ");
            pessoa.setNome(sc.nextLine());
            System.out.println("Digite o CPF do usuário (apenas nº): ");
            pessoa.setCpf(Util.parseCpf(sc.nextLine()));
            System.out.println("Digite a data de nascimento do usuário (apenas nº):");
            pessoa.setDataNascimento(LocalDate.parse(Util.parseDate(sc.nextLine()), DateTimeFormatter.ofPattern("dd'/'MM'/'yyyy")));
            System.out.println("Ele é um funcionário ? 1-Sim e 0-Não");
            pessoa.setFuncionario((sc.nextInt() == 1));
            
            long id = PessoaDAO.insert(pessoa);
            
            System.out.println("ID do usuário cadastrado: " + id);
            System.out.println((id > 0) ? "Parabéns! O usuário foi cadastrado com sucesso!" : "Houve um erro aí! iiiiiiiiiih");
        } catch (SQLException ex) {
            System.out.println(Util.formatException(ex));
        }
    }
    
    public static void cadastrarProjeto() {
        try {
            Scanner sc = new Scanner(System.in, "ISO-8859-2");
            Projeto projeto = new Projeto();
            System.out.println("Digite o nome do projeto: ");
            projeto.setNome(sc.nextLine());
            System.out.println("Digite a data de início do projeto (apenas nº):");
            projeto.setDataInicio(LocalDate.parse(Util.parseDate(sc.nextLine()), DateTimeFormatter.ofPattern("dd'/'MM'/'yyyy")));
            System.out.println("Digite a data de previsão do fim do projeto (apenas nº):");
            projeto.setDataPrevisaoFim(LocalDate.parse(Util.parseDate(sc.nextLine()), DateTimeFormatter.ofPattern("dd'/'MM'/'yyyy")));
            System.out.println("Digite a data final do projeto (apenas nº):");
            projeto.setDataFim(LocalDate.parse(Util.parseDate(sc.nextLine()), DateTimeFormatter.ofPattern("dd'/'MM'/'yyyy")));
            System.out.println("Digite a descrição do projeto: ");
            projeto.setDescricao(sc.nextLine());
            System.out.println("Digite o valor do orçamento do projeto: ");
            projeto.setOrcamento(sc.nextFloat());
            System.out.println("Digite o ID do gerente responsável pelo projeto: ");
            projeto.setGerente(PessoaDAO.get(sc.nextLong()));
            
            long id = ProjetoDAO.insert(projeto);
            
            System.out.println("ID do projeto cadastrado: " + id);
            System.out.println((id > 0) ? "Parabéns! O projeto foi cadastrado com sucesso!" : "Houve um erro aí! iiiiiiiiiih");
        } catch (SQLException ex) {
            System.out.println(Util.formatException(ex));
        }
    }
    
    public static void adicionarMembro() {
        try {
            Scanner sc = new Scanner(System.in, "ISO-8859-2");
            
            System.out.println("Digite o ID do projeto:");
            long projetoId = sc.nextLong();
            System.out.println("Digite o ID do membro:");
            long pessoaId = sc.nextLong();
            if (!ProjetoDAO.isMembro(projetoId, pessoaId) && (ProjetoDAO.get(projetoId) != null && PessoaDAO.get(pessoaId) != null)) {
                long id = ProjetoDAO.adicionarMembro(projetoId, pessoaId);
                System.out.println("ID da associação: " + id);
                System.out.println("Parabéns! O membro foi adicionado com sucesso!");
            } else {
                System.out.println(">>> ID'S NÃO CORRESPONDEM OU JÁ EXISTE");
            }
            
        } catch (SQLException ex) {
            System.out.println(Util.formatException(ex));
            ex.printStackTrace();
        }
    }
    
    public static void fazerInsercoes() {
        Scanner sc = new Scanner(System.in);
        System.out.println(" \n--- I N S E R Ç Õ E S  no  PostgreSQL ---\n ");
        System.out.println("Vamos iniciar (1 - Sim / 2 - Não) ?");

        while (sc.nextInt() == 1) {
            System.out.println("Selecione uma opção: \n1 - Adicionar Usuário \n2 - Adicionar Projeto \n3 - Adicionar Membro");
            switch (sc.nextInt()) {
                case 1: 
                    cadastrarPessoa();
                break;
                case 2: 
                    cadastrarProjeto();
                break;
                case 3: 
                    adicionarMembro();
                break;
            }

            System.out.println(" \n--- I N S E R Ç Õ E S  no  PostgreSQL ---\n ");
            System.out.println("Deseja continuar (1 - Sim / 2 - Não) ?");
        }
        System.out.println("encerrado");
    }
    
    public static String getURL(HttpServletRequest request) {
        String url = request.getRequestURL().toString();
        String baseURL = url.substring(0, url.length() - request.getRequestURI().length());
        return baseURL;
    }
    
    public static int randomNumber(int min, int max) {
        Random random = new Random();
        return random.nextInt(max + 1 - min) + min;
    }
    
    public static String randomCharacter() {
        String[] letras = ("abcdefghijklmnopqrstuvwxyz" + "0123456789" + "abcdefghijklmnopqrstuvwxyz".toUpperCase()).split("");
        return letras[randomNumber(0, letras.length - 1)];
    }
    
    public static String gerarCodigo(int size) {
        String codigo = "";
        
        for (int i = 0; i < size; i++) {
            codigo += randomCharacter();
        }
        
        return codigo;
    }
    
    public static String calcularRisco(LocalDate dataFinal) {
        long dias = DAYS.between(LocalDate.now(), dataFinal);
        if ((dias >= 0 && dias <= 14) || dias < 0) return "ALTO RISCO";
        else if (dias >= 14 && dias <= 30) return "MÉDIO RISCO"; 
        else return "BAIXO RISCO";
    }
}
