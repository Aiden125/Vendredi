package com.pro.vendredi.service;

import java.util.List;

import com.pro.vendredi.dto.Reservation;

public interface ReservationService {
	public int reservation(Reservation res);
	public int reservationCancel(int rno);
	public List<Reservation> reservationChk(int sno);
}
