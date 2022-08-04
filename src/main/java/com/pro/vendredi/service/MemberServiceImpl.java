package com.pro.vendredi.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Iterator;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.pro.vendredi.dao.MemberDao;
import com.pro.vendredi.dto.Member;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	public MemberDao memberDao;
	String backupPath = "C:\\Carlos_Java\\webPro\\source\\09_TeamProject\\Vendredi\\src\\main\\webapp\\memberImg/";
	@Autowired
	private JavaMailSenderImpl mailSender;

	// 아이디 중복 체크
	@Override
	public int memberIdConfirm(String mid) {
		int cnt = memberDao.memberIdConfirm(mid);
		return cnt;
	}

	// 회원가입 + 메일발송
	@Override
	public int memberJoin(final Member member, HttpSession httpSession) {
		MimeMessagePreparator message = new MimeMessagePreparator() {
			String content = "<div style=\"width:500px; margin: 0 auto; text-align: center\">\n"
					+ "	<h1 style=\"color:blue;\">" + member.getMname() + "님 회원가입 감사합니다</h1>\n" + "	<div>\n"
					+ "		<p>감사쿠폰을 드립니다</p>\n" + "		<p>\n"
					+ "			<img src=\"http://localhost:8081/Vendredi/img/coupon.jpg\">\n" + "		</p>\n"
					+ "	</div>\n" + "	<div>\n" + "		<p style=\"color:red;\">빨간 글씨 부분</p>\n"
					+ "		<p style=\"color:blue;\">파란 글씨 부분</p>\n"
					+ "		<img src=\"https://t1.daumcdn.net/daumtop_chanel/op/20200723055344399.png\">\n"
					+ "	</div>\n" + "	<p>서울시 어떤구 XX로 00 **빌딩 402</p>\n" + "</div>";

			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(member.getMemail())); // 받는 메일
				mimeMessage.setFrom(new InternetAddress("spacenyi0@gmail.com")); // 보내는 메일
				mimeMessage.setSubject(member.getMname() + "님 회원가입 감사합니다(쿠폰 동봉)");
				mimeMessage.setText(content, "utf-8", "html");
			}
		};
		mailSender.send(message); // 메일 발송
		httpSession.setAttribute("mid", member.getMid()); // 세션에 mid 속성 추가

		return memberDao.memberJoin(member);
	}

	// 로그인
	@Override
	public String memberLogin(String mid, String mpw, HttpSession httpSession) {
		System.out.println("넘어온 rj : " + mid + " / " + mpw);
		String result = "로그인 성공";
		Member member = memberDao.memberGetDetail(mid);
		if (member == null) {
			result = "로그인 해주세요";
		} else if (!mpw.equals(member.getMpw())) {
			result = "비밀번호가 틀렸습니다.";

		} else {
			// 로그인 성공
			httpSession.setAttribute("member", member);
			httpSession.setAttribute("mid", mid);
		}
		return result;
	}

	// 회원 상세보기
	@Override
	public Member memberGetDetail(String mid) {
		return memberDao.memberGetDetail(mid);
	}

	// 아이디 찾기 - 메일발송
	@Override
	public Member memberSearchId(final Member member) {
		Member mid = memberDao.memberSearchId(member);
		if (mid != null) {
			MimeMessagePreparator message = new MimeMessagePreparator() {
				Member mid = memberDao.memberSearchId(member);
				String content = "<h1>" + member.getMname() + "님의 ID는</h1>\r\n" + "	<h2>" + member.getMid()
						+ "입니다.</h2>";

				@Override
				public void prepare(MimeMessage mimeMessage) throws Exception {
					mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(member.getMemail()));
					mimeMessage.setFrom(new InternetAddress("dlwlsdn5244@gmail.com"));
					mimeMessage.setSubject("회원 ID정보");
					mimeMessage.setText(content, "utf-8", "html");
				}
			};
			mailSender.send(message);
		}
		return mid;
	}

	// 비밀번호 찾기 - 메일발송
	@Override
	public Member memberSearchPw(final Member member) {
		Member mpw = memberDao.memberSearchPw(member);
		if (mpw != null) {
			MimeMessagePreparator message = new MimeMessagePreparator() {
				String content = "<h1>" + member.getMname() + "님의 비밀번호는</h1>\r\n" + "	<h2>" + member.getMpw()
						+ "입니다.</h2>";
				@Override
				public void prepare(MimeMessage mimeMessage) throws Exception {
					mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(member.getMemail()));
					mimeMessage.setFrom(new InternetAddress("dlwlsdn5244@gmail.com"));
					mimeMessage.setSubject("회원 비밀번호정보");
					mimeMessage.setText(content, "utf-8", "html");
				}
			};
			mailSender.send(message);
		}
		return null;
	}

	// 회원 정보 수정 - 사진변경
	@Override
	public int memberModify(Member member, MultipartHttpServletRequest mRequest) {
		String uploadPath = mRequest.getRealPath("memberImg/");
		Iterator<String> params = mRequest.getFileNames();
		String mimg = "";
		while (params.hasNext()) {
			String param = params.next();
			MultipartFile mFile = mRequest.getFile(param); // 파라미터에 첨부된 파일 객체
			mimg = mFile.getOriginalFilename();
			if (mimg != null && !mimg.equals("")) { // 첨부함
				if (new File(uploadPath + mimg).exists()) {
					// 서버에 같은 파일이름이 있을 경우(첨부파일과)
					mimg = System.currentTimeMillis() + "_" + mimg;
				} // if
				try {
					mFile.transferTo(new File(uploadPath + mimg)); // 서버에 저장
					System.out.println("서버파일 : " + uploadPath + mimg);
					System.out.println("백업파일 : " + backupPath + mimg);
					boolean result = fileCopy(uploadPath + mimg, backupPath + mimg);
					System.out.println(result ? "번째 백업성공" : "번째 백업실패");
				} catch (IOException e) {
					System.out.println(e.getMessage());
				}
			} else {

			} // if
		} // while
		member.setMprofile(mimg); // 첫번째 첨부한 파일 이름
		System.out.println("변경할 회원 정보 : " + member);
		return memberDao.memberModify(member);

	}

	private boolean fileCopy(String serverFile, String backupFile) {
		boolean isCopy = false;
		InputStream is = null;
		OutputStream os = null;
		try {
			File file = new File(serverFile);
			is = new FileInputStream(file);
			os = new FileOutputStream(backupFile);
			byte[] buff = new byte[(int) file.length()];
			while (true) {
				int nReadByte = is.read(buff);
				if (nReadByte == -1)
					break;
				os.write(buff, 0, nReadByte);
			}
			isCopy = true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (os != null)
					os.close();
				if (is != null)
					is.close();
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
		}
		return isCopy;
	}

	// 회원 수
	@Override
	public int memberTotCnt() {
		return memberDao.memberTotCnt();
	}

	// 회원 탈퇴
	@Override
	public int memberWithdrawal(String mid) {
		return memberDao.memberWithdrawal(mid);
	}

	// 이메일 중복
	@Override
	public int memberEmailConfirm(String memail) {
		return memberDao.memberEmailConfirm(memail);
	}

}
