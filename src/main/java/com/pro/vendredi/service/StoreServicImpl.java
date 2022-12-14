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
 
import com.pro.vendredi.dao.StoreDao; 
import com.pro.vendredi.dto.Store;
import com.pro.vendredi.util.Paging;

@Repository
public class StoreServicImpl implements StoreService {

	@Autowired
	public StoreDao storeDao; 
	
	String backupPath="D:/webPro_ryu/source/Vendredi/Vendredi/src/main/webapp/storeImgFileUpload/";
	
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
	public int storeRegister(Store store, MultipartHttpServletRequest mRequest) {
		String uploadPath = mRequest.getRealPath("storeImgFileUpload/");
		Iterator<String> params = mRequest.getFileNames(); // tempsimg1, temptsimg2
		String[] simg = new String[3];
		int idx = 0;
		while (params.hasNext()) {
			String param = params.next(); // 마라미터의 다음 객체
			MultipartFile mFile = mRequest.getFile(param);// 파라미터에 첨부된 파일 객체
			simg[idx] = mFile.getOriginalFilename();
			if(simg[idx]!=null && !simg[idx].equals("")) {
				if(new File(uploadPath + simg[idx]).exists()) {
					simg[idx] = System.currentTimeMillis() + "_" + simg[idx];
					
				}// if
				try {
					mFile.transferTo(new File(uploadPath + simg));
					System.out.println("서버파일 : "+ uploadPath + simg);
					System.out.println("백업파일 : "+ backupPath + simg);
					Boolean result = fileCopy(uploadPath + simg, backupPath + simg );
					System.out.println(result ? "번째 백업 성공": "번째 백업 실패");
				} catch (Exception e) {
					System.out.println(e.getMessage()+"StoreService register error");
				}  
			} else {
				
			}// if
			idx++; 
		}//while - simg 배열에 파일 이름 저장
		store.setSimage1(simg[0]); // 첫번째 청구할 파일 이름
		store.setSimage2(simg[1]); // 두번째 청구할 파일 이름
		store.setSimage3(simg[2]); // 세번째 청구할 파일 이름
		System.out.println("서비스 저장 전 : " + store);
		int result = storeDao.storeRegister(store);
		System.out.println("서비스 저장 후 : " + store);
		return result; // DB INSERT 
	}

	@Override
	public int storeModify(Store store, MultipartHttpServletRequest mRequest) {
		String uploadPath = mRequest.getRealPath("storeImgFileUpload/");
		Iterator<String> params = mRequest.getFileNames(); // tempsimg1, temptsimg2
		String[] simg = new String[3];
		int idx = 0;
		while (params.hasNext()) {
			String param = params.next(); // 마라미터의 다음 객체
			MultipartFile mFile = mRequest.getFile(param);// 파라미터에 첨부된 파일 객체
			simg[idx] = mFile.getOriginalFilename();
			if(simg[idx]!=null && !simg[idx].equals("")) {
				if(new File(uploadPath + simg[idx]).exists()) {
					simg[idx] = System.currentTimeMillis() + "_" + simg[idx];
					
				}// if
				try {
					mFile.transferTo(new File(uploadPath + simg));
					System.out.println("서버파일 : "+ uploadPath + simg);
					System.out.println("백업파일 : "+ backupPath + simg);
					Boolean result = fileCopy(uploadPath + simg, backupPath + simg );
					System.out.println(result ? "번째 백업 성공": "번째 백업 실패");
				} catch (Exception e) {
					System.out.println(e.getMessage()+"StoreService register error");
				}  
			} else {
				
			}// if
			idx++; 
		}//while - simg 배열에 파일 이름 저장
		store.setSimage1(simg[0]); // 첫번째 청구할 파일 이름
		store.setSimage2(simg[1]); // 두번째 청구할 파일 이름
		store.setSimage3(simg[2]); // 세번째 청구할 파일 이름
		System.out.println("서비스 저장 전 : " + store);
		int result = storeDao.storeModify(store);
		System.out.println("서비스 수정 후 : " + store);
		return result;
	}

	 

	@Override
	public List<Store> storeListSearch(String pageNum, String ssearchtag, Store store) {
		Paging paging = new Paging(storeDao.storeCntSearch(ssearchtag), pageNum, 4, 1);
		store.setStartRow(paging.getStartRow());
		store.setEndRow(paging.getEndRow());
		return storeDao.storeListSearch(store);
	}

	@Override
	public Store storeDetail(int sno) { 
		return storeDao.storeDetail(sno);
	}

	@Override
	public int storeCntSearch(String ssearchtag) {
		  return storeDao.storeCntSearch(ssearchtag);
	}

	@Override
	public Store storeScore(int sno) { 
		return storeDao.storeScore(sno);
	}

	@Override
	public List<Store> storeList(String pageNum, Store store) {
		Paging paging = new Paging(storeDao.storeCnt(store), pageNum, 4, 1);
		store.setStartRow(paging.getStartRow());
		store.setEndRow(paging.getEndRow());
		return storeDao.storeList(store);
	}

	@Override
	public int storeCnt(Store store) { 
		return storeDao.storeCnt(store);
	}

	@Override 
	public List<Store> myStoreList(String pageNum, Store store, String oid) {
		Paging paging = new Paging(storeDao.storeCntMy(oid), pageNum, 4, 1);
		store.setStartRow(paging.getStartRow());
		store.setEndRow(paging.getEndRow());
		return storeDao.myStoreList(store);
	}

	@Override
	public int storeCntMy(String oid) {
		return storeDao.storeCntMy(oid);
	}

}
