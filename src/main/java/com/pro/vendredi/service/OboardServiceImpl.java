package com.pro.vendredi.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.pro.vendredi.dao.OwnerBoardDao;
import com.pro.vendredi.dto.OwnerBoard;
import com.pro.vendredi.util.Paging;
@Service
public class OboardServiceImpl implements OboardService {
	@Autowired
	private OwnerBoardDao oboardDao;
	String backupPath = "F:/Vendredi/Vendredi/src/main/webapp/oboardImg";
	
	// 오너게시판 글목록
	@Override
	public List<OwnerBoard> oboardList(String pageNum) {
		Paging paging = new Paging(oboardDao.oboardtotCnt(), pageNum, 10, 10);
		OwnerBoard oboard = new OwnerBoard();
		oboard.setStartRow(paging.getStartRow());
		oboard.setEndRow(paging.getEndRow());
		return oboardDao.oboardList(oboard);
	}
	
	// 오너게시판 등록글수
	@Override
	public int oboardtotCnt() {
		return oboardDao.oboardtotCnt();
	}
	
	// 오너게시판 조회수 올리기
	@Override
	public int oboardHitup(int bno) {
		return oboardDao.oboardHitup(bno);
	}
	
	// 오너게시판 상세보기
	@Override
	public OwnerBoard oboardContent(int bno) {
		return oboardDao.oboardContent(bno);
	}
	
	// 오너게시판 글작성
	@Override
	public int oboardWrite(MultipartHttpServletRequest mRequest, OwnerBoard oboard) {
		String uploadPath = mRequest.getRealPath("oboardImg/");
		Iterator<String> params = mRequest.getFileNames();
		String[] oimg = new String[5];
		int idx = 0;
		while(params.hasNext()) {
			String param = params.next();
			MultipartFile mFile = mRequest.getFile(param);
			oimg[idx] = mFile.getOriginalFilename();
			if(oimg[idx]!=null && !oimg[idx].equals("")) {
				if(new File(uploadPath + oimg[idx]).exists()) {
					oimg[idx] = System.currentTimeMillis()+"_"+oimg[idx];
				}// if
				try {
					mFile.transferTo(new File(uploadPath + oimg[idx])); // 서버저장
					System.out.println("서버파일 : "+uploadPath+oimg[idx]);
					System.out.println("백업파일 : "+backupPath+oimg[idx]);
					boolean result = fileCopy(uploadPath + oimg[idx], backupPath + oimg[idx]);
					System.out.println(result ? idx+"번째 백업성공":idx+"번쨰 백업실패");
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}
			}else {
				// 파일첨부 안하면 oimg[idx] = ""
				// oimg[idx] ="";
			} // if
			idx++;
		}// while - oimg배열에 파일이름 저장
		oboard.setBphoto1(oimg[0]);
		oboard.setBphoto2(oimg[1]);
		oboard.setBphoto3(oimg[2]);
		oboard.setBphoto4(oimg[3]);
		oboard.setBphoto5(oimg[4]);
		return oboardDao.oboardWrite(oboard);
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
			while(true) {
				int nReadByte = is.read(buff);
				if(nReadByte == -1) break;
				os.write(buff, 0, nReadByte);
			}
			isCopy = true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(os!=null) os.close();
				if(is!=null) is.close();
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
		}
		return isCopy;
	}
	@Override
	public int oboardModify(MultipartHttpServletRequest mRequest, OwnerBoard oboard) {
		String uploadPath = mRequest.getRealPath("oboardImg/");
		Iterator<String> params = mRequest.getFileNames();
		String[] oimg = new String[5];
		int idx = 0;
		while(params.hasNext()) {
			String param = params.next();
			MultipartFile mFile = mRequest.getFile(param);
			oimg[idx] = mFile.getOriginalFilename();
			if(oimg[idx]!=null && !oimg[idx].equals("")) {
				if(new File(uploadPath + oimg[idx]).exists()) {
					oimg[idx] = System.currentTimeMillis()+"_"+oimg[idx];
				}// if
				try {
					mFile.transferTo(new File(uploadPath + oimg[idx])); // 서버저장
					System.out.println("서버파일 : "+uploadPath+oimg[idx]);
					System.out.println("백업파일 : "+backupPath+oimg[idx]);
					boolean result = fileCopy(uploadPath + oimg[idx], backupPath + oimg[idx]);
					System.out.println(result ? idx+"번째 백업성공":idx+"번쨰 백업실패");
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}
			}else {
				// 파일첨부 안하면 oimg[idx] = ""
				// oimg[idx] ="";
			} // if
			idx++;
		}// while - oimg배열에 파일이름 저장
		oboard.setBphoto1(oimg[0]);
		oboard.setBphoto2(oimg[1]);
		oboard.setBphoto3(oimg[2]);
		oboard.setBphoto4(oimg[3]);
		oboard.setBphoto5(oimg[4]);
		return oboardDao.oboardModify(oboard);
	}

	@Override
	public int oboardDelete(int bno) {
		return oboardDao.oboardDelete(bno);
	}

	@Override
	public void dummyDataInsert() {
		OwnerBoard oboard = new OwnerBoard();
		for(int i=10; i <110; i++) {
			oboard.setBno(i);
			oboard.setOid("dlwlsdn11");
			oboard.setSname("실험가게"+i);
			oboard.setBloc("서울");
			oboard.setBtitle("가게문닫아요"+i);
			oboard.setBcontent("TEST"+i);
			oboard.setBphoto1("");
			oboard.setBphoto2("");
			oboard.setBphoto3("");
			oboard.setBphoto4("");
			oboard.setBphoto5("");
			oboard.setBhit(0);
			int result = oboardDao.oboardWrite(oboard);
			System.out.println(result == 1? i+"번째 성공" : i+"실패");
		}
	}

}
