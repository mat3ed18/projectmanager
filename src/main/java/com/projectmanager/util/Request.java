package com.projectmanager.util;

import lombok.Cleanup;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.http.HttpEntity;
import org.apache.http.HttpHeaders;
import org.apache.http.NameValuePair;
import org.apache.http.client.config.CookieSpecs;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpRequestBase;
import org.apache.http.client.utils.URIBuilder;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.BasicCookieStore;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;

import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;
import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.cert.X509Certificate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.commons.io.IOUtils;

@Data
@NoArgsConstructor
public class Request {

    private BasicCookieStore cookieStore = new BasicCookieStore();

    private int timeoutSeconds = 60;
    private int qtdTentativas = 3;
    private int pausaEntreTentativas = 0;
    private boolean redirect = true;
    private boolean useCookieStore = true;
    private Charset charset = StandardCharsets.ISO_8859_1;
    private HttpEntity body;

    private Map<String, String> headers = new HashMap<>();
    private Map<String, String> queryString = new HashMap<>();


    public RequestResponse execGetRequest(String url) throws IOException {
        HttpGet httpGet = new HttpGet(montarURI(url));
        return tentarFazerRequisicao(httpGet);
    }

    public RequestResponse execPostRequest(String url) throws IOException {
        HttpPost httpPost = new HttpPost(montarURI(url));
        if (body != null)
        httpPost.setEntity(body);
        return tentarFazerRequisicao(httpPost);
    }

    public CloseableHttpResponse go(String url) throws IOException {
        HttpGet httpRequest = new HttpGet(montarURI(url));
        CloseableHttpClient httpClient = getHttpClient();
        headers.forEach(httpRequest::setHeader);
        return execute(httpClient, httpRequest);
    }

    private CloseableHttpResponse execute(CloseableHttpClient httpClient, HttpRequestBase httpRequest) throws IOException {
        int qtd = 1;
        while (qtd <= qtdTentativas) {
            try {
                return httpClient.execute(httpRequest);
            } catch (IOException e) {
                if (qtdTentativas <= qtd) throw e;
                qtd++;
            }
        }
        return null;
    }

    private RequestResponse tentarFazerRequisicao(HttpRequestBase httpRequest) throws IOException {
        CloseableHttpClient httpClient = getHttpClient();
        addHeader("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36");
        headers.forEach(httpRequest::setHeader);

        int contador = 0;
        @Cleanup CloseableHttpResponse response = null;
        RequestResponse requestResponse;
        do {
            contador++;
            try {
                response = httpClient.execute(httpRequest);
                requestResponse = treatResponse(response, httpRequest);
                if (requestResponse.getBody().contains("429 Too Many Requests")) {
                    System.out.printf("[%d] 429 Too Many Requests%n", contador);
                    pausa(1);
                    throw new IOException("429 Too Many Requests");
                }
            } catch (IOException e) {
                if (pausaEntreTentativas > 0)
                    pausa(pausaEntreTentativas);
                requestResponse = null;
                if (contador >= qtdTentativas) {
                    System.out.println("Esgotadas as " + qtdTentativas + " tentativas (" + httpRequest.getURI() + ")");
                    throw e;
                }
            }
        } while (contador <= qtdTentativas && requestResponse == null);

        return requestResponse;
    }

    public static void pausa(int seconds) {
        try {
            Thread.sleep(seconds * 1000);
        } catch (InterruptedException e) {
            System.out.println("ERRO NO Thread.sleep: " + e.getMessage());
        }
    }

    public URI montarURI(String url) {
        try {
            URIBuilder builder = new URIBuilder(url);
            queryString.forEach(builder::setParameter);
            return builder.build();
        } catch (URISyntaxException e) {
            e.printStackTrace();
            return URI.create(url);
        }
    }

    public void setBody(HttpEntity httpEntity) {
        this.body = httpEntity;
    }
    
    public void setBody(List<NameValuePair> nvps) {
        this.body = new UrlEncodedFormEntity(nvps, charset);
    }

    public void setBody(String json) {
        this.body = new StringEntity(json, ContentType.APPLICATION_JSON);
    }

    public void setBodyFormUrlEncode(String body) {
        this.body = new StringEntity(body, ContentType.APPLICATION_FORM_URLENCODED);
    }

    public void addHeader(String name, String value) {
        this.headers.put(name, value);
    }

    public void addQueryString(String name, String value) {
        this.queryString.put(name, value);
    }

    public void setBearerAutorization(String token) {
        this.headers.put(HttpHeaders.AUTHORIZATION, token);
    }

    public void setContentTypeJson() {
        this.headers.put(HttpHeaders.CONTENT_TYPE, "application/json");
    }

    public void setCharsetUTF8() {
        this.charset = StandardCharsets.UTF_8;
    }

    public void setCharsetISO88591() {
        this.charset = StandardCharsets.ISO_8859_1;
    }

    private CloseableHttpClient getHttpClient() {
        RequestConfig requestConfig = RequestConfig.custom()
                .setConnectTimeout(timeoutSeconds * 1000)
                .setConnectionRequestTimeout(timeoutSeconds * 1000)
                .setSocketTimeout(timeoutSeconds * 1000)
                .setCookieSpec(CookieSpecs.STANDARD)
                .build();

        HttpClientBuilder httpClientBuilder = HttpClients.custom()
                .setSSLContext(getSSLContext());
        if (useCookieStore)
            httpClientBuilder.setDefaultCookieStore(cookieStore);
        httpClientBuilder.setDefaultRequestConfig(requestConfig);

        if (!redirect)
            httpClientBuilder.disableRedirectHandling();

        return httpClientBuilder.build();
    }

    private RequestResponse treatResponse(CloseableHttpResponse response, HttpRequestBase httpRequestBase) throws IOException {
        int statusCode = response.getStatusLine().getStatusCode();
        HttpEntity entity = response.getEntity();
        String result = entity != null ? IOUtils.toString(entity.getContent(), charset) : "";
        RequestResponse requestResponse = new RequestResponse(statusCode, result, response.getAllHeaders());
        EntityUtils.consume(entity);
        response.close();
        httpRequestBase.releaseConnection();
        return requestResponse;
    }

    public static SSLContext getSSLContext() {
        TrustManager[] trustAllCerts = new TrustManager[]{new X509TrustManager() {
            public X509Certificate[] getAcceptedIssuers() {
                return null;
            }

            public void checkClientTrusted(X509Certificate[] certs, String authType) {
            }

            public void checkServerTrusted(X509Certificate[] certs, String authType) {
            }
        }};

        SSLContext sc = null;
        try {
            sc = SSLContext.getInstance("TLS");
            sc.init(null, trustAllCerts, new SecureRandom());
        } catch (NoSuchAlgorithmException | KeyManagementException e) {
            e.printStackTrace();
        }
        return sc;
    }


}
