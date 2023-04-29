package kr.co.softsoldesk.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/ma")
public class WeatherApiController {
    
    @GetMapping("/weather")
    public ModelAndView restApiGetWeather() throws Exception {
        
    	LocalDateTime now = LocalDateTime.now();
        DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyyMMdd");

        String currentDate = now.format(dateFormatter);

        int hour = now.getHour()-1;
        String currentTime=Integer.toString(hour)+"00";
        
    	System.out.println(currentDate);
    	System.out.println(currentTime);
        String url = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtFcst"
            + "?ServiceKey=w7W2jmwy6hLkrOH8Qlv1KDXJEiCypcgxGzBcuMjM57%2BTE4zpFfJaX%2F5%2F1CkHtrOOWpRTt6toiq32c%2BuHxuwbiQ%3D%3D"
            + "&pageNo=1"                 // 페이지 번호
            + "&numOfRows=40"             // 페이지 ROWS
            + "&dataType=JSON"            // JSON, XML
            + "&base_date="+currentDate   // 발표일자
            + "&base_time="+currentTime   // 발표시각
            + "&nx=60"                    // 예보지점 X 좌표
            + "&ny=127";                  // 예보지점 Y 좌표
        
        HashMap<String, Object> resultMap= getDataFromJson(url, "UTF-8", "get", "");
        
        System.out.println("# RESULT : " + resultMap);

        ObjectMapper objectMapper = new ObjectMapper();

        LinkedHashMap<String, Object> response = (LinkedHashMap<String, Object>) resultMap.get("response");
        LinkedHashMap<String, Object> body = (LinkedHashMap<String, Object>) response.get("body");
        LinkedHashMap<String, Object> itemsContainer = (LinkedHashMap<String, Object>) body.get("items");
        List<Object> items = (List<Object>) itemsContainer.get("item");

        LinkedHashMap<String, Object> filteredItems = new LinkedHashMap<>();

        filteredItems.put("currentTime", currentTime);

        for (Object item : items) {
            LinkedHashMap<String, Object> jsonItem = (LinkedHashMap<String, Object>) item;
            String category = (String) jsonItem.get("category");

            if (category.equals("SKY") || category.equals("T1H") || category.equals("PTY") || category.equals("RN1") || category.equals("REH")) {
                filteredItems.put(category, jsonItem.get("fcstValue"));
            }
        }

        String jsonString = objectMapper.writeValueAsString(filteredItems);

        ModelAndView modelAndView = new ModelAndView("weather");
        modelAndView.addObject("weatherData", jsonString);
        return modelAndView;
    



    }
    
    public HashMap<String, Object> getDataFromJson(String url, String encoding, String type, String jsonStr) throws Exception {
        boolean isPost = false;

        if ("post".equals(type)) {
            isPost = true;
        } else {
            url = "".equals(jsonStr) ? url : url + "?request=" + jsonStr;
        }

        return getStringFromURL(url, encoding, isPost, jsonStr, "application/json");
    }
    
    public HashMap<String, Object> getStringFromURL(String url, String encoding, boolean isPost, String parameter, String contentType) throws Exception {
        URL apiURL = new URL(url);

        HttpURLConnection conn = null;
        BufferedReader br = null;
        BufferedWriter bw = null;

        HashMap<String, Object> resultMap = new HashMap<String, Object>();

        try {
            conn = (HttpURLConnection) apiURL.openConnection();
            conn.setConnectTimeout(5000);
            conn.setReadTimeout(5000);
            conn.setDoOutput(true);

            if (isPost) {
                conn.setRequestMethod("POST");
                conn.setRequestProperty("Content-Type", contentType);
                conn.setRequestProperty("Accept", "*/*");
            } else {
                conn.setRequestMethod("GET");
            }

            conn.connect();

            if (isPost) {
                bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream(), "UTF-8"));
                bw.write(parameter);
                bw.flush();
                bw = null;
            }

            br = new BufferedReader(new InputStreamReader(conn.getInputStream(), encoding));

            String line = null;

            StringBuffer result = new StringBuffer();

            while ((line=br.readLine()) != null) result.append(line);

            ObjectMapper mapper = new ObjectMapper();

            resultMap = mapper.readValue(result.toString(), HashMap.class);
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception(url + " interface failed" + e.toString());
        } finally {
            if (conn != null) conn.disconnect();
            if (br != null) br.close();
            if (bw != null) bw.close();
        }

        return resultMap;
    }
}
