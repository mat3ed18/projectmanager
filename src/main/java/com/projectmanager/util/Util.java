package com.projectmanager.util;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.projectmanager.config.Config;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.Iterator;
import java.util.Locale;
import java.util.Map;
import java.util.Map.Entry;

public class Util {
    
    public static void main(String[] args) throws SQLException {
        
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
    
    public static ObjectNode formatSQLException(SQLException ex) {
        ObjectNode json = new ObjectMapper().createObjectNode();
        
        json.put("code", ex.getErrorCode());
        json.put("location", ex.getLocalizedMessage());
        json.put("message", ex.getMessage());
        json.put("state", ex.getSQLState());
        
        ex.printStackTrace();
        
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
    
    public static String buildQuery(String q, String table, String[] columns) {
        String fullQuery = "";
        switch (table) {
            case "pessoa":
                for (int i = 0; i < columns.length; i++) {
                    if (columns[i].equals("datanascimento")) fullQuery += (isDate(q)) ? "p.datanascimento LIKE ? OR " : "";
                    else if (columns[i].equals("cpf")) fullQuery += (isCpf(q)) ? "p.cpf LIKE ? OR " : "";
                    else fullQuery += "p." + columns[i] + " LIKE ?";
                }
            break;
            case "projeto":
                for (int i = 0; i < columns.length; i++) {
                    if (columns[i].equals("data_inicio")) fullQuery += (isDate(q)) ? "p.data_inicio LIKE ? OR " : "";
                    else if (columns[i].equals("data_previsao_fim")) fullQuery += (isDate(q)) ? "p.data_previsao_fim LIKE ? OR " : "";
                    else if (columns[i].equals("data_fim")) fullQuery += (isDate(q)) ? "p.data_fim LIKE ? OR " : "";
                    else {
                        fullQuery += "p." + columns[i] + " LIKE ?" + ((i < columns.length) ? " OR " : "");
                    }
                }
            break;
            default:
                fullQuery = "id LIKE ?"; // só pra não dar erro
            break;
            
        }
        return fullQuery;
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
    
}
