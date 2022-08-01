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
	@Override
	public int oidConfirm(String oid) {
		
		return ownerDao.oidConfirm(oid);
	}

	@Override
	public int ownerJoin(Owner owner, HttpSession session) {
		session.setAttribute("oid", owner.getOname());
		return ownerDao.ownerJoin(owner);
	}

	@Override
	public String ownerLogin(String oid, String opw, HttpSession session) {
		String result = "로그인 성공";
		Owner owner = ownerDao.getOwner(oid);
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

	@Override
	public String schOwnerId(final Owner owner) {
		MimeMessagePreparator message = new MimeMessagePreparator() {
			String content = "<h1>"+owner.getOname()+"님의 ID는</h1>\r\n" + 
					"	<h2>"+owner.getOid()+"입니다.</h2>";
			
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(owner.getOemail()));
				mimeMessage.setFrom(new InternetAddress("dlwlsdn5244@gmail.com"));
				mimeMessage.setSubject("회원 ID정보");
				mimeMessage.setText(content, "utf-8", "html");
			}
		};
		mailSender.send(message);
		return ownerDao.schOwnerId(owner);
	}

	@Override
	public String schOwnerPw(final Owner owner) {
		MimeMessagePreparator message = new MimeMessagePreparator() {
			String content = "<h1>"+owner.getOname()+"님의 비밀번호는</h1>\r\n" + 
					"	<h2>"+owner.getOpw()+"입니다.</h2>";
			
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(owner.getOemail()));
				mimeMessage.setFrom(new InternetAddress("dlwlsdn5244@gmail.com"));
				mimeMessage.setSubject("회원 비밀번호정보");
				mimeMessage.setText(content, "utf-8", "html");
			}
		};
		mailSender.send(message);
		return ownerDao.schOwnerPw(owner);
	}

	@Override
	public Owner getOwner(String oid) {
		return ownerDao.getOwner(oid);
	}

	@Override
	public int ownerModify(Owner owner) {
		return ownerDao.ownerModify(owner);
	}

}
