package com.pro.vendredi.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Iterator;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.pro.vendredi.dao.MemberDao;
import com.pro.vendredi.dto.Kakao;
import com.pro.vendredi.dto.Member;
import com.pro.vendredi.dto.Naver;
import com.pro.vendredi.util.NaverLoginBO;


@Service
public class MemberServiceImpl implements MemberService {
	
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
	//네이버 간편 로그인
	@Override
	public String naverLogin(Member member, HttpSession httpSession) {
		
		//4.파싱 닉네임 세션으로 저장
		httpSession.setAttribute("member",member); //세션 생성
		String result = memberDao.naverLogin(member);
		
		if(result.equals(member.getMid())) {
			return "redirect:../main.do";
		}else {
			int join = memberDao.naverJoin(member);
		}
	    
		return memberDao.naverLogin(member);
	}
	//네이버 간편 회원가입
	@Override
	public int naverJoin(Member member, HttpSession httpSession) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	// 회원 상세보기
	@Override
	public Member memberGetDetail(String mid) {
		return memberDao.memberGetDetail(mid);
	}

	// 아이디 찾기 - 메일발송
	@Override
	public String memberSearchId(final Member member) {
		final Member mid = memberDao.memberSearchId(member);
		if (mid != null) {
			MimeMessagePreparator message = new MimeMessagePreparator() {
				Member mid = memberDao.memberSearchId(member);
				String content = "<h1>" + mid.getMname() + "님의 ID는</h1>\r\n" + "	<h2>" + mid.getMid() + "입니다.</h2>";

				@Override
				public void prepare(MimeMessage mimeMessage) throws Exception {
					mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(mid.getMemail()));
					mimeMessage.setFrom(new InternetAddress("dlwlsdn5244@gmail.com"));
					mimeMessage.setSubject("회원 ID정보");
					mimeMessage.setText(content, "utf-8", "html");
				}
			};
			mailSender.send(message);
			String result = "가입하신 E-MAIL로 ID가 전송되었습니다.";
			return result;
		} else {
			String result = "가입한 이름과 E-MAIL을 확인해주세요";
			return result;
		}
	}

	// 비밀번호 찾기 - 메일발송
	@Override
	public String memberSearchPw(final Member member) {
		final Member mpw = memberDao.memberSearchPw(member);
		if (mpw != null) {
			MimeMessagePreparator message = new MimeMessagePreparator() {
				String content = "<h1>" + mpw.getMname() + "님의 비밀번호는</h1>\r\n" + "	<h2>" + mpw.getMpw() + "입니다.</h2>";

				@Override
				public void prepare(MimeMessage mimeMessage) throws Exception {
					mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(mpw.getMemail()));
					mimeMessage.setFrom(new InternetAddress("dlwlsdn5244@gmail.com"));
					mimeMessage.setSubject("회원 비밀번호정보");
					mimeMessage.setText(content, "utf-8", "html");
				}
			};
			mailSender.send(message);
			String result = "가입하신 E-MAIL로 비밀번호가 전송되었습니다.";
			return result;
			
		} else {
			String result = "가입한 ID와 이름을 확인해주세요";
			return result;
		}
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


//	//카카오 로그인 
//	@Override
//	//서비스에 토큰 요청 
//	public String getAccessToken(String authorize_code) throws ParseException {
//		String access_Token = "";
//		String refresh_Token = "";
//		String reqURL = "https://kauth.kakao.com/oauth/token";
//		try {
//			URL url = new URL(reqURL);
//			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
//			// POST 요청을 위해 기본값이 false인 setDoOutput을 true로
//           
//			conn.setRequestMethod("POST");
//			conn.setDoOutput(true);
//			// POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
//            
//			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
//			StringBuilder sb = new StringBuilder();
//			sb.append("grant_type=authorization_code");
//			sb.append("&client_id=9ab3a25c7202d038fb2c93a42fefcc2c"); //본인이 발급받은 key
//			sb.append("&redirect_uri=http://localhost:8081/vendredi/member/kakaoLogin.do"); // 본인이 설정한 주소
//			sb.append("&code=" + authorize_code);
//			bw.write(sb.toString());
//			bw.flush();
//            
//			// 결과 코드가 200이라면 성공
//			int responseCode = conn.getResponseCode();
//			System.out.println("responseCode : " + responseCode);
//            
//			// 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
//			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
//			String line = "";
//			String result = "";
//            
//			 while ((line = br.readLine()) != null) {
//	                result += line;
//	            }
//			System.out.println("response body : " + result);
//            
//			// Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
//			JSONParser parser = new JSONParser();
//			JsonElement element = (JsonElement) parser.parse(result);
//            
//			access_Token = element.getAsJsonObject().get("access_token").getAsString();
//			refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();
//            
//			System.out.println("access_token : " + access_Token);
//			System.out.println("refresh_token : " + refresh_Token);
//            
//			br.close();
//			bw.close();
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		return access_Token;
//	}
//	// 카카오 로그인 정보 저장
//		@Override
//		public Kakao getUserInfo (String access_Token) {
//
//	        //    요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
//	        HashMap<String, Object> userInfo = new HashMap<String, Object>();
//	        String reqURL = "https://kapi.kakao.com/v2/user/me";
//	        try {
//	            URL url = new URL(reqURL);
//	            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
//	            conn.setRequestMethod("GET");
//
//	            //    요청에 필요한 Header에 포함될 내용
//	            conn.setRequestProperty("Authorization", "Bearer " + access_Token);
//
//	            int responseCode = conn.getResponseCode();
//	            System.out.println("responseCode : " + responseCode);
//
//	            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
//
//	            String line = "";
//	            String result = "";
//
//	            while ((line = br.readLine()) != null) {
//	                result += line;
//	            }
//	            System.out.println("response body : " + result);
//
//	            JsonParser parser = new JsonParser();
//	            JsonElement element = parser.parse(result);
//
//	            JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
//	            JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
//
//	            String name = properties.getAsJsonObject().get("name").getAsString();
//	            String email = kakao_account.getAsJsonObject().get("email").getAsString();
//
//	            userInfo.put("name", name);
//	            userInfo.put("email", email);
//
//	        } catch (IOException e) {
//	            // TODO Auto-generated catch block
//	            e.printStackTrace();
//	        }
//	        
//	        Kakao result =  memberDao.kakaoLogin(userInfo);
//	        System.out.println("S:" + result);
//	        if(result==null) {
//	        	memberDao.kakaoLogin(userInfo);
//	        	return memberDao.kakaoLogin(userInfo);
//	        } else {
//	        	return result;
//	        }
//		}
}

	

