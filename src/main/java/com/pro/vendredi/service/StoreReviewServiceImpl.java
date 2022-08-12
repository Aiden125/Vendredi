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
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.pro.vendredi.dao.StoreReviewDao;
import com.pro.vendredi.dto.StoreReview;
import com.pro.vendredi.util.Paging;

@Repository
public class StoreReviewServiceImpl implements StoreReviewService {
	
	@Autowired
	public StoreReviewDao storeReviewDao;
	
	String backupPath="D:/webPro_ryu/source/Vendredi/Vendredi/src/main/webapp/storeReviewImgFileUpload/";
	
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
	public int reviewWrite(StoreReview storeReview, MultipartHttpServletRequest mRequest) {
		String uploadPath = mRequest.getRealPath("storeImgFileUpload/");
		Iterator<String> params = mRequest.getFileNames(); // tempsrimg1, temptsrimg2
		String srimg = ""; 
		while (params.hasNext()) {
			String param = params.next(); // 마라미터의 다음 객체
			MultipartFile mFile = mRequest.getFile(param);// 파라미터에 첨부된 파일 객체
			srimg = mFile.getOriginalFilename();
			if(srimg!=null && !srimg.equals("")) {
				if(new File(uploadPath + srimg).exists()) {
					srimg = System.currentTimeMillis() + "_" + srimg;
					
				}// if
				try {
					mFile.transferTo(new File(uploadPath + srimg));
					System.out.println("서버파일 : "+ uploadPath + srimg);
					System.out.println("백업파일 : "+ backupPath + srimg);
					Boolean result = fileCopy(uploadPath + srimg, backupPath + srimg);
					System.out.println(result ? "번째 백업 성공": "번째 백업 실패");
				} catch (Exception e) {
					System.out.println(e.getMessage()+"StoreReviewService write error");
				}  
			} else {
				
			}// if 
		}//while - srimg 배열에 파일 이름 저장 
		storeReview.setSrimage1(srimg);// 첫번째 청구할 파일 이름
		System.out.println("reviewWrite 서비스 저장 전 : " + storeReview);
		int result = storeReviewDao.reviewWrite(storeReview);
		System.out.println("reviewWrite 서비스 저장 후 : " + storeReview);
		return result; // DB INSERT 
	}

	@Override
	public int addScore(StoreReview storeReview) { 
		return storeReviewDao.addScore(storeReview);
	}

	@Override
	public List<StoreReview> storeReviewList(StoreReview storeReview, String pageNum, int sno) {
		Paging paging = new Paging(storeReviewDao.reviewCnt(sno), pageNum, 3, 1);
		storeReview.setStartRow(paging.getStartRow());
		storeReview.setEndRow(paging.getEndRow());
		return storeReviewDao.storeReviewList(storeReview);
	}

	@Override
	public int reviewModify(StoreReview storeReview, MultipartHttpServletRequest mRequest) {
		String uploadPath = mRequest.getRealPath("storeImgFileUpload/");
		Iterator<String> params = mRequest.getFileNames(); // tempsrimg1, temptsrimg2
		String srimg = ""; 
		while (params.hasNext()) {
			String param = params.next(); // 마라미터의 다음 객체
			MultipartFile mFile = mRequest.getFile(param);// 파라미터에 첨부된 파일 객체
			srimg = mFile.getOriginalFilename();
			if(srimg!=null && !srimg.equals("")) {
				if(new File(uploadPath + srimg).exists()) {
					srimg = System.currentTimeMillis() + "_" + srimg;
					
				}// if
				try {
					mFile.transferTo(new File(uploadPath + srimg));
					System.out.println("서버파일 : "+ uploadPath + srimg);
					System.out.println("백업파일 : "+ backupPath + srimg);
					Boolean result = fileCopy(uploadPath + srimg, backupPath + srimg);
					System.out.println(result ? "번째 백업 성공": "번째 백업 실패");
				} catch (Exception e) {
					System.out.println(e.getMessage()+"StoreReviewService write error");
				}  
			} else {
				
			}// if 
		}//while - srimg 배열에 파일 이름 저장 
		storeReview.setSrimage1(srimg);// 첫번째 청구할 파일 이름
		System.out.println("reviewModify 서비스 저장 전 : " + storeReview);
		int result = storeReviewDao.reviewModify(storeReview);
		System.out.println("reviewModify 서비스 저장 후 : " + storeReview);
		return result;
	}

	@Override
	public int reviewDelete(int srno) { 
		return storeReviewDao.reviewDelete(srno);
	}

	@Override
	public int reviewCnt(int sno) { 
		return storeReviewDao.reviewCnt(sno);
	}

	@Override
	public StoreReview reviewDetail(int srno) { 
		return storeReviewDao.reviewDetail(srno) ;
	}

}
