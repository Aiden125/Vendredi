package com.pro.vendredi.service;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;

import com.pro.vendredi.dao.MemberDao;
import com.pro.vendredi.dto.Member;
@Service
public class MemberServiceImpl implements MemberService {
	@Autowired 
	public MemberDao memberDao;
	@Autowired
	private JavaMailSenderImpl mailSender;
	
	@Override
	public int memberIdConfirm(String mid) {
		return memberDao.memberIdConfirm(mid);
	}

	@Override
	public int memberJoin(final Member member, HttpSession httpSession) {
		MimeMessagePreparator message = new MimeMessagePreparator() {
			String content = "<div style=\"width:500px; margin: 0 auto; text-align: center\">\n" + 
					"	<h1 style=\"color:blue;\">"+ member.getMname() +"님 회원가입 감사합니다</h1>\n" + 
					"	<div>\n" + 
					"		<p>감사쿠폰을 드립니다</p>\n" + 
					"		<p>\n" + 
					"			<img src=\"http://localhost:8081/Vendredi/img/coupon.jpg\">\n" + 
					"		</p>\n" + 
					"	</div>\n" + 
					"	<div>\n" + 
					"		<p style=\"color:red;\">빨간 글씨 부분</p>\n" + 
					"		<p style=\"color:blue;\">파란 글씨 부분</p>\n" + 
					"		<img src=\"https://t1.daumcdn.net/daumtop_chanel/op/20200723055344399.png\">\n" + 
					"	</div>\n" + 
					"	<p>서울시 어떤구 XX로 00 **빌딩 402</p>\n" + 
					"</div>"; 
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				mimeMessage.setRecipient(Message.RecipientType.TO, 
											new InternetAddress(member.getMemail())); // 받는 메일
				mimeMessage.setFrom(new InternetAddress("spacenyi0@gmail.com")); // 보내는 메일
				mimeMessage.setSubject(member.getMname()+"님 회원가입 감사합니다(쿠폰 동봉)");
				mimeMessage.setText(content, "utf-8", "html");
			}
		};
		mailSender.send(message); // 메일 발송
		httpSession.setAttribute("mid", member.getMid()); // 세션에 mid 속성 추가
		
		return memberDao.memberJoin(member);
	}

	@Override
	public String memberLogin(String mid, String mpw, HttpSession httpSession) {
		String result  = "로그인 성공";
		Member member = memberDao.memberGetDetail(mid);
		if(member ==null) {
			result = "로그인 해주세요";
		}else if (! mpw.equals(member.getMpw())) {
			result = "비밀번호가 틀렸습니다.";
			
		}else {
			//로그인 성공
			httpSession.setAttribute("member", member);
			httpSession.setAttribute("mid", mid);
		}
		return result;
	}

	@Override
	public Member memberGetDetail(String mid) {
		return memberDao.memberGetDetail(mid);
	}

	@Override
	public Member memberSearchId(String mname, String memail) {
		return null;
	}

	@Override
	public Member memberSearchPw(String mid, String mname) {
		return null;
	}

	@Override
	public int memberModify(Member member) {
		return memberDao.memberModify(member);
	}

	@Override
	public int memberTotCnt() {
		return memberDao.memberTotCnt();
	}

	@Override
	public int memberWithdrawal(String mid) {
		return memberDao.memberWithdrawal(mid);
	}

	@Override
	public String memberEmailConfirm(String memail) {
		return memberDao.memberEmailConfirm(memail);
	}

}
