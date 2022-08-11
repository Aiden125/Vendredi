package com.pro.vendredi.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pro.vendredi.dao.ReservationDao;
import com.pro.vendredi.dto.Reservation;
@Service
public class ReservationServiceImpl implements ReservationService {
	
	@Autowired
	private ReservationDao reDao;
	@Override
	public int reservation(Reservation res) {
		return reDao.reservation(res);
	}

	@Override
	public int reservationCancel(int rno) {
		return reDao.reservationCancel(rno);
	}

	@Override
	public List<Reservation> reservationChk(int sno) {
		return reDao.reservationChk(sno);
	}


}
