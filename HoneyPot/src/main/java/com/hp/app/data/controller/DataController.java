package com.hp.app.data.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.core.io.ClassPathResource;
import org.springframework.expression.common.TemplateAwareExpressionParser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("data")
public class DataController {
	@GetMapping("breakFast")
	public String breakFast(HttpServletRequest req, Model model) {
		ObjectMapper objectMapper = new ObjectMapper();
		try {
			String root = req.getServletContext().getRealPath("/resources/data/diet.json");
			File jsonFile = new File(root);
			Object jsonData = objectMapper.readValue(jsonFile, Object.class);
			String jsonString = objectMapper.writeValueAsString(jsonData);
			model.addAttribute("jsonString", jsonString);
		} catch (IOException e) {
			e.printStackTrace();
		}

		return "data/breakFast";
	}

	@GetMapping("weather")
	@ResponseBody
	public String weather() throws Exception {
		String apiUrl = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst";
		String serviceKey = "Wyz5uylLIJYn%2BM7ddwH5EvX2ksfqBveLSQbOvXf%2Bb%2F0UdcgJRFVwGU3qj%2FLOkQoLdho99BTsY8e9RLq5WzxLFA%3D%3D";
		String numOfRows = "12";
		String nx = "60";
		String ny = "125";
		String baseDate = "20230715";
		String baseTime = "0500";
		String type = "json";

		StringBuilder urlBuilder = new StringBuilder(apiUrl);
		urlBuilder.append("?" + URLEncoder.encode("ServiceKey", "UTF-8") + "=" + serviceKey);
		urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode(numOfRows, "UTF-8"));
		urlBuilder.append("&" + URLEncoder.encode("nx", "UTF-8") + "=" + URLEncoder.encode(nx, "UTF-8"));
		urlBuilder.append("&" + URLEncoder.encode("ny", "UTF-8") + "=" + URLEncoder.encode(ny, "UTF-8"));
		urlBuilder.append("&" + URLEncoder.encode("base_date", "UTF-8") + "=" + URLEncoder.encode(baseDate, "UTF-8"));
		urlBuilder.append("&" + URLEncoder.encode("base_time", "UTF-8") + "=" + URLEncoder.encode(baseTime, "UTF-8"));
		urlBuilder.append("&" + URLEncoder.encode("dataType", "UTF-8") + "=" + URLEncoder.encode(type, "UTF-8"));

		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");

		BufferedReader rd;
		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}

		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			sb.append(line);
		}
		rd.close();
		conn.disconnect();

		String result = sb.toString();

		// 파싱
		JSONObject jsonObj_1 = new JSONObject(result);
		JSONObject response = jsonObj_1.getJSONObject("response");
		JSONObject body = response.getJSONObject("body");
		JSONObject items = body.getJSONObject("items");
		JSONArray jsonArray = items.getJSONArray("item");

		String sky = "하늘상태 : ";
		String pty = "강수형태 : ";
		String pop = "강수확률 : ";
		String reh = "습도 : ";
		String tmp = "기온 : ";
		
		for (int i = 0; i < jsonArray.length(); i++) {
			items = jsonArray.getJSONObject(i);
			String fcstValue = items.getString("fcstValue");
			String category = items.getString("category");

			switch (category) {
				case "SKY":
					switch (fcstValue) {
						case "1": sky += "맑음";	break;
						case "3": sky += "구름 많음";	break;
						case "4": sky += "흐림";	break;
					}
					break;
				case "PTY":
					switch (fcstValue) {
						case "0": pty += "없음";	break;
						case "1": pty += "비";	break;
						case "2": pty += "비/눈";		break;
						case "3": pty += "눈";	break;
						case "4": pty += "소나기";	break;
					}
					break;
				case "POP": pop += fcstValue; break;
				case "REH": reh += fcstValue; break;
				case "TMP": tmp += fcstValue; break;
			}
		}
		
		String weather = sky + "\n" + pty + "\n" + pop + "\n" + reh + "\n" + tmp + "\n EncodingError (o.o)";
		System.out.println(weather);
		return weather;
	}
}