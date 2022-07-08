package com.projectmanager.util;

import com.projectmanager.database.postgresql.dao.PessoaDAO;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.util.Date;
import java.util.Locale;

public class Util {
    public static void main(String[] args) throws SQLException {
        System.out.println(PessoaDAO.get(3));
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
    
    public static String buildQuery(String q, String table, String[] columns) {
        String fullQuery = "";
        switch (table) {
            case "pessoa":
                for (int i = 0; i < columns.length; i++) {
                    if (columns[i].equals("datanascimento")) fullQuery += (isDate(q)) ? "p.datanascimento LIKE ?" : "";
                    else if (columns[i].equals("cpf")) fullQuery += (isCpf(q)) ? "p.cpf LIKE ?" : "";
                    else fullQuery += "p." + columns[i] + " LIKE ?";
                    
                    if (i < columns.length - 1) fullQuery += " AND";
                }
            break;
            case "projeto":
                for (int i = 0; i < columns.length; i++) {
                    if (columns[i].equals("data_inicio")) fullQuery += (isDate(q)) ? "p.data_inicio LIKE ?" : "";
                    else if (columns[i].equals("data_previsao_fim")) fullQuery += (isDate(q)) ? "p.data_previsao_fim LIKE ?" : "";
                    else if (columns[i].equals("data_fim")) fullQuery += (isDate(q)) ? "p.data_fim LIKE ?" : "";
                    else fullQuery += "p." + columns[i] + " LIKE ?";
                    
                    if (i < columns.length - 1) fullQuery += " AND";
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
    
}
