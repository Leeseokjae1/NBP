package com.study.nbnb;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.json.JSONObject;




@Service
public class AddressService {
	private final String clientId = "qir54st3tf";
    private final String clientSecret = "8ybYaUmcqFZgnYoKEcLXKGsUwD0yDzYil5MRHFS2";

    public JSONObject getCoordinates(String address) {
        String apiUrl = "https://openapi.naver.com/v1/map/geocode?query=" + address;

        RestTemplate restTemplate = new RestTemplate();
        HttpHeaders headers = new HttpHeaders();
        headers.add("X-Naver-Client-Id", clientId);
        headers.add("X-Naver-Client-Secret", clientSecret);
        HttpEntity<String> entity = new HttpEntity<>(headers);

        ResponseEntity<String> response = restTemplate.exchange(apiUrl, HttpMethod.GET, entity, String.class);
        JSONObject jsonObject = new JSONObject(response.getBody());

        return jsonObject.getJSONArray("result").getJSONObject(0).getJSONObject("point");
    }
}