package com.pro.vendredi.service;

import com.pro.vendredi.dto.Reservation;

public interface ReservationService {
	public Reservation reservation(Reservation res);
	public int reservationCancel(int rno);
}
