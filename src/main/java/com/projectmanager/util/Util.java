package com.projectmanager.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.util.Date;
import java.util.Locale;

public class Util {
//    public static void main(String[] args) throws SQLException, JsonProcessingException {
//        int pessoa = PessoaDAO.insert(new Pessoa(new BigInteger("0"), "Renato dos Santos", "88.888.888-88", LocalDate.parse("2000-01-01"), true));
//        System.out.println(pessoa);
//    }
    
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
