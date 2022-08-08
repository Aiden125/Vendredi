package com.pro.vendredi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pro.vendredi.service.ReservationService;

@Controller
public class ReservationController {
	@Autowired
	private ReservationService reservationService;
	
	@RequestMapping(value="reservationForm", method = RequestMethod.GET)
	public String reservationForm() {
		return "owner/reservation";
	}
}
