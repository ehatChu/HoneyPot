package com.hp.app.data.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
}
