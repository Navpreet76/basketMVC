package com.basketMVC.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	@RequestMapping("/")
	public String displayCrudHome() {
		return "index";
	}
	
	@RequestMapping("/crud")
	public String redirect() {
		return "viewpage";
	}
	
	@RequestMapping("/helloagain")
	public String display() {
		return "final";
	}
	
	@RequestMapping("/home")
	public String displayHome() {
		return "home";
	}
	
	@RequestMapping("/form_process")
	public String displayFormSubmit() {
		return "form_process";
	}
	
	@RequestMapping("/playermanagement")
	public String displayPlayerManagement() {
		return "playerManagement";
	}
}
