package com.projectmanager.util;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

public class JSON {
    public static ObjectMapper objectMapper = new ObjectMapper();

    static {
        objectMapper.registerModule(new JavaTimeModule());
        objectMapper.configure(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS, false);
    }

    // convert JSON into List of Objects
    
    public static <T> List<T> convertFromJsonToList(String json, TypeReference<List<T>> var) throws JsonParseException, JsonMappingException, IOException {
        return objectMapper.readValue(json, var);
    }
    
    /*
        convert JSON into List of Objects
        exemplo: List<Pessoa> list = JSONUtils.convertFromJsonToList(response.getBody(), new TypeReference<List<Pessoa>>() {
        });
    */
    
    public static <T> List<T> convertFromJsonToList(String json) throws JsonParseException, JsonMappingException, IOException {
        return objectMapper.readValue(json, new TypeReference<List<T>>() {
        });
    }

    // convert JSON into List of Objects
    
    public static <T> HashMap<T, Object> convertFromJsonToMap(String json) throws JsonParseException, JsonMappingException, IOException {
        TypeReference<HashMap<T,Object>> typeRef = new TypeReference<HashMap<T,Object>>() {};
        return objectMapper.readValue(json, typeRef);
    }

    // Generic Type Safe Method – convert JSON into Object
    
    public static <T> T covertFromJsonToObject(String json, Class<T> var) throws IOException {
        return objectMapper.readValue(json, var);//Convert Json into object of Specific Type
    }

    // convert Object into JSON
    
    public static String covertFromObjectToJson(Object obj) throws JsonProcessingException {
        return objectMapper.writeValueAsString(obj);
    }
}
