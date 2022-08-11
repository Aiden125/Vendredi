package com.pro.vendredi.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pro.vendredi.dao.ReservationDao;
import com.pro.vendredi.dto.Reservation;
import com.pro.vendredi.service.ReservationService;
import com.pro.vendredi.service.StoreService;

@Controller
public class ReservationController {
	@Autowired
	private ReservationService reservationService;
	
	@Autowired
	private StoreService storeService;
	
	@RequestMapping(value="reservationForm", method = RequestMethod.GET)
	public String reservationForm(int sno, Model model) {
		List<Reservation> resList = reservationService.reservationChk(sno);
		model.addAttribute("resList", resList);
		model.addAttribute("store", storeService.storeDetail(sno));
		return "reservation/reservation";
	}
	@RequestMapping(value="reservation", method= RequestMethod.GET)
	public String reservation(Reservation res, Model model) {
		model.addAttribute("reservation", reservationService.reservation(res));
		return "forward:store/storeDetail.do";
	}

}
