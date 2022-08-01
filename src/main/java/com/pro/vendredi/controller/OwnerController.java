package com.pro.vendredi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class OwnerController {
	@RequestMapping(value="ownerJoin", method = RequestMethod.GET)
	public String ownerjoin() {
		
		return "owner/ownerJoin";
	}
}
