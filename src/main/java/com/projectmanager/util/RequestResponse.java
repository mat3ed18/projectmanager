package com.projectmanager.util;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.ToString;
import org.apache.http.Header;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;


@Data
@AllArgsConstructor
@ToString
public class RequestResponse {

    private int status;
    private String body = "";
    private Header[] headers;

    public Map<String, String> getHeadersMap() {
        Map<String, String> map = new HashMap<>();
        for (Header header : headers) {
            map.put(header.getName(), header.getValue());
        }
        return map;
    }

    public Map<String, Object> getBodyAsJson() throws IOException {
        return JSON.convertFromJsonToMap(body);
    }

}
