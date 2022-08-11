package com.pro.vendredi.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.pro.vendredi.dto.Reservation;

@Mapper
public interface ReservationDao {
	public int reservation(Reservation res);
	public List<Reservation> reservationChk(int sno);
	public int reservationCancel(int rno);
}
