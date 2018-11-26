package com.ecmis.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/main")
public class MainController {
	@RequestMapping(value="/index.html")
	public String index(){
		return "index1";
	}
	
	@RequestMapping(value="/dev.html")
	public String dev(){
		return "dev";
	}
}
