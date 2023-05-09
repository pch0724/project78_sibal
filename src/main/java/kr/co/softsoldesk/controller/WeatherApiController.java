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
       // 현재 날짜와 시간을 가져옵니다.
       LocalDateTime now = LocalDateTime.now();
        DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyyMMdd");

        String currentDate = now.format(dateFormatter);
        
        int hour = now.getHour()-1;
        String currentTime = String.format("%04d", hour * 100);
        
       //System.out.println(currentDate); //API서버로 전송하는 날짜값 출력
       //System.out.println(currentTime); //API서버로 전송하는 시간값 출력
        String url = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtFcst"
            + "?ServiceKey=w7W2jmwy6hLkrOH8Qlv1KDXJEiCypcgxGzBcuMjM57%2BTE4zpFfJaX%2F5%2F1CkHtrOOWpRTt6toiq32c%2BuHxuwbiQ%3D%3D"
            + "&pageNo=1"                 // 페이지 번호
            + "&numOfRows=40"             // 페이지 ROWS
            + "&dataType=JSON"            // JSON, XML
            + "&base_date="+currentDate   // 발표일자
            + "&base_time="+currentTime   // 발표시각
            + "&nx=60"                    // 예보지점 X 좌표
            + "&ny=127";                  // 예보지점 Y 좌표
        // JSON 데이터를 가져와서 해시맵에 저장합니다.
        HashMap<String, Object> resultMap= getDataFromJson(url, "UTF-8", "get", "");
        
        //System.out.println("# RESULT : " + resultMap); //서버에서 데이터 잘 받아와지는지 출력
        // JSON 객체를 사용하여 response, body, items를 추출합니다.
        ObjectMapper objectMapper = new ObjectMapper();
        
        LinkedHashMap<String, Object> response = (LinkedHashMap<String, Object>) resultMap.get("response");
        LinkedHashMap<String, Object> body = (LinkedHashMap<String, Object>) response.get("body");
        LinkedHashMap<String, Object> itemsContainer = (LinkedHashMap<String, Object>) body.get("items");
        List<Object> items = (List<Object>) itemsContainer.get("item");
        // 필터링 된 항목을 저장할 LinkedHashMap을 생성합니다.
        LinkedHashMap<String, Object> filteredItems = new LinkedHashMap<>();

        filteredItems.put("currentTime", currentTime);
        // items의 각 객체에서 원하는 카테고리 값(SKY, T1H, PTY, RN1, REH)을 추출하고 filteredItems에 저장합니다.
        for (Object item : items) {
            LinkedHashMap<String, Object> jsonItem = (LinkedHashMap<String, Object>) item;
            String category = (String) jsonItem.get("category");

            if (category.equals("SKY") || category.equals("T1H") || category.equals("PTY") || category.equals("RN1") || category.equals("REH")) {
                filteredItems.put(category, jsonItem.get("fcstValue"));
            }
        }
        // 필터링 된 항목들을 JSON 문자열로 변환합니다.
        String jsonString = objectMapper.writeValueAsString(filteredItems);
        // ModelAndView 객체를 생성하고, weather 뷰를 렌더링합니다. 그리고 weatherData를 추가합니다.
        ModelAndView modelAndView = new ModelAndView("weather");
        modelAndView.addObject("weatherData", jsonString);
        return modelAndView;
    



    }
    // JSON 데이터로부터 값을 가져오는 메소드입니다.
    public HashMap<String, Object> getDataFromJson(String url, String encoding, String type, String jsonStr) throws Exception {
        boolean isPost = false;

        if ("post".equals(type)) {
            isPost = true;
        } else {
            url = "".equals(jsonStr) ? url : url + "?request=" + jsonStr;
        }

        return getStringFromURL(url, encoding, isPost, jsonStr, "application/json");
    }
    // URL에서 문자열을 가져오는 메소드입니다.
    public HashMap<String, Object> getStringFromURL(String url, String encoding, boolean isPost, String parameter, String contentType) throws Exception {
        URL apiURL = new URL(url);

        HttpURLConnection conn = null;
        BufferedReader br = null;
        BufferedWriter bw = null;

        HashMap<String, Object> resultMap = new HashMap<String, Object>();

        try {
           // URL에 대한 연결을 설정합니다.
            conn = (HttpURLConnection) apiURL.openConnection();
            conn.setConnectTimeout(5000);
            conn.setReadTimeout(5000);
            conn.setDoOutput(true);
            // 요청 방식을 설정하고 (GET 또는 POST), 필요한 경우 Content-Type 및 Accept 헤더를 설정합니다.
            if (isPost) {
                conn.setRequestMethod("POST");
                conn.setRequestProperty("Content-Type", contentType);
                conn.setRequestProperty("Accept", "*/*");
            } else {
                conn.setRequestMethod("GET");
            }

            conn.connect();
            // POST 요청인 경우, 파라미터를 전송합니다.
            if (isPost) {
                bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream(), "UTF-8"));
                bw.write(parameter);
                bw.flush();
                bw = null;
            }
            // 응답을 읽어 들입니다.
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