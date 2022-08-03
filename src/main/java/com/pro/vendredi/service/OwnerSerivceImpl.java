package com.pro.vendredi.service;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;

import com.pro.vendredi.dao.OwnerDao;
import com.pro.vendredi.dto.Owner;
@Service
public class OwnerSerivceImpl implements OwnerService {
	@Autowired
	private OwnerDao ownerDao;
	@Autowired
	private JavaMailSenderImpl mailSender;
	
	// ID중복체크
	@Override
	public int owneridConfirm(String oid) {
		return ownerDao.owneridConfirm(oid);
	}
	
	// E-MAIL중복체크
	@Override
	public int owneremailConfirm(String oemail) {
		return ownerDao.owneremailConfirm(oemail);
	}
	
	// 오너 회원가입
	@Override
	public int ownerJoin(Owner owner, HttpSession session) {
		session.setAttribute("oid", owner.getOid());
		return ownerDao.ownerJoin(owner);
	}
	
	// 오너 로그인
	@Override
	public String ownerLogin(String oid, String opw, HttpSession session) {
		String result = "로그인 성공";
		Owner owner = ownerDao.ownerInfo(oid);
		if(owner == null) {
			// 아이디없음
			result = "존재하지 않는 ID입니다.";
		}else if(! opw.equals(owner.getOpw())) {
			// 비밀번호 불일치
			result = "비밀번호가 일치하지 않습니다.";
		}else {
			// 로그인 성공
			session.setAttribute("owner", owner);
			session.setAttribute("oid", oid);
		}
		return result;
	}
	// 오너 아이디 찾기
	@Override
	public Owner ownerSearchId(final Owner owner) {
		MimeMessagePreparator message = new MimeMessagePreparator() {
			Owner oid = ownerDao.ownerSearchId(owner);
			String content = "<h1>"+oid.getOname()+"님의 ID는</h1>\r\n" + 
					"	<h2>"+oid.getOid()+"입니다.</h2>";
			
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(oid.getOemail()));
				mimeMessage.setFrom(new InternetAddress("dlwlsdn5244@gmail.com"));
				mimeMessage.setSubject("회원 ID정보");
				mimeMessage.setText(content, "utf-8", "html");
			}
		};
		mailSender.send(message);
		return ownerDao.ownerSearchId(owner);
	}
	// 오너 비밀번호 찾기
	@Override
	public Owner ownerSearchPw(final Owner owner) {
		MimeMessagePreparator message = new MimeMessagePreparator() {
			Owner opw = ownerDao.ownerSearchPw(owner);
			String content = "<h1>"+opw.getOname()+"님의 비밀번호는</h1>\r\n" + 
					"	<h2>"+opw.getOpw()+"입니다.</h2>";
			
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(opw.getOemail()));
				mimeMessage.setFrom(new InternetAddress("dlwlsdn5244@gmail.com"));
				mimeMessage.setSubject("회원 비밀번호정보");
				mimeMessage.setText(content, "utf-8", "html");
			}
		};
		mailSender.send(message);
		return ownerDao.ownerSearchPw(owner);
	}
	
	// 오너 정보
	@Override
	public Owner ownerInfo(String oid) {
		return ownerDao.ownerInfo(oid);
	}
	
	// 오너 정보수정
	@Override
	public int ownerModify(Owner owner) {
		return ownerDao.ownerModify(owner);
	}

	

}
