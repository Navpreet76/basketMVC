package com.basketMVC.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	@RequestMapping("/hello")
	public String redirect() {
		return "viewpage";
	}
	
	@RequestMapping("/helloagain")
	public String display() {
		return "final";
	}
	
}
