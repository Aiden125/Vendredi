package com.pro.vendredi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	@RequestMapping(value = "home")
	public String test() {
		return "test";
	}
}
