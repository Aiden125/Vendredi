package com.pro.vendredi.dao;

import org.apache.ibatis.annotations.Mapper;

import com.pro.vendredi.dto.Reservation;

@Mapper
public interface ReservationDao {
	public Reservation reservation(Reservation res);
	public int reservationCancel(int rno);
}
