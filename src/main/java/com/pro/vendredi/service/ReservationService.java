package com.pro.vendredi.service;

import com.pro.vendredi.dto.Reservation;

public interface ReservationService {
	public int reservation(Reservation res);
	public int reservationChk(int sno);
	public int reservationCancel(int rno);
}
