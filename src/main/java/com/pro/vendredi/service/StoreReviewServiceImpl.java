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
		Iterator<String> params = mRequest.getFileNames(); // tempBimg1, temptBimg2
		String[] bimg = new String[4];
		int idx  = 0;
		while (params.hasNext()) {
			String param = params.next(); // 마라미터의 다음 객체
			MultipartFile mFile = mRequest.getFile(param);// 파라미터에 첨부된 파일 객체
			bimg[idx] = mFile.getOriginalFilename();
			if(bimg[idx]!=null && !bimg[idx].equals("")) {
				if(new File(uploadPath + bimg[idx]).exists()) {
					bimg[idx] = System.currentTimeMillis() + "_" + bimg[idx];
					
				}// if
				try {
					mFile.transferTo(new File(uploadPath + bimg[idx]));
					System.out.println("서버파일 : "+ uploadPath + bimg[idx]);
					System.out.println("백업파일 : "+ backupPath + bimg[idx]);
					Boolean result = fileCopy(uploadPath + bimg[idx], backupPath + bimg[idx] );
					System.out.println(result ? idx+"번째 백업 성공": idx+"번째 백업 실패");
				} catch (Exception e) {
					System.out.println(e.getMessage()+"StoreReviewService write error");
				}  
			} else {
				
			}// if
			idx++;
		}//while - bimg 배열에 파일 이름 저장
		storeReview.setSrimage1(bimg[0]);
		storeReview.setSrimage1(bimg[1]);
		storeReview.setSrimage1(bimg[2]);
		storeReview.setSrimage1(bimg[3]);
		storeReview.setSrimage1(bimg[4]);// 첫번째 청구할 파일 이름
		System.out.println("서비스 저장 전 : " + storeReview);
		int result = storeReviewDao.reviewWrite(storeReview);
		System.out.println("서비스 저장 후 : " + storeReview);
		return result; // DB INSERT 
	}

	@Override
	public int addScore(int sno) { 
		return storeReviewDao.addScore(sno);
	}

	@Override
	public List<StoreReview> storeReviewList(StoreReview storeReview, String pageNum, int sno) {
		Paging paging = new Paging(storeReviewDao.reviewCnt(sno), pageNum, 10, 5);
		storeReview.setStartRow(paging.getStartRow());
		storeReview.setEndRow(paging.getEndRow());
		return storeReviewDao.storeReviewList(storeReview);
	}

	@Override
	public int reviewModify(StoreReview storeReview, MultipartHttpServletRequest mRequest) {
		String uploadPath = mRequest.getRealPath("storeImgFileUpload/");
		Iterator<String> params = mRequest.getFileNames(); // tempBimg1, temptBimg2
		String[] bimg = new String[4];
		int idx  = 0;
		while (params.hasNext()) {
			String param = params.next(); // 마라미터의 다음 객체
			MultipartFile mFile = mRequest.getFile(param);// 파라미터에 첨부된 파일 객체
			bimg[idx] = mFile.getOriginalFilename();
			if(bimg[idx]!=null && !bimg[idx].equals("")) {
				if(new File(uploadPath + bimg[idx]).exists()) {
					bimg[idx] = System.currentTimeMillis() + "_" + bimg[idx];
					
				}// if
				try {
					mFile.transferTo(new File(uploadPath + bimg[idx]));
					System.out.println("서버파일 : "+ uploadPath + bimg[idx]);
					System.out.println("백업파일 : "+ backupPath + bimg[idx]);
					Boolean result = fileCopy(uploadPath + bimg[idx], backupPath + bimg[idx] );
					System.out.println(result ? idx+"번째 백업 성공": idx+"번째 백업 실패");
				} catch (Exception e) {
					System.out.println(e.getMessage()+"StoreReviewService modify error");
				}  
			} else {
				
			}// if
			idx++;
		}//while - bimg 배열에 파일 이름 저장
		storeReview.setSrimage1(bimg[0]);
		storeReview.setSrimage1(bimg[1]);
		storeReview.setSrimage1(bimg[2]);
		storeReview.setSrimage1(bimg[3]);
		storeReview.setSrimage1(bimg[4]);// 첫번째 청구할 파일 이름
		System.out.println("서비스 저장 전 : " + storeReview);
		int result = storeReviewDao.reviewModify(storeReview);
		System.out.println("서비스 저장 후 : " + storeReview);
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
