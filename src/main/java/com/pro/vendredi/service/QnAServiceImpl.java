package com.pro.vendredi.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pro.vendredi.dao.QnADao;
import com.pro.vendredi.dto.QnA;
import com.pro.vendredi.util.Paging;
@Service
public class QnAServiceImpl implements QnAService {
	@Autowired
	private QnADao qnaDao;
	
	//QNA 리스트
	@Override
	public List<QnA> qnaList(String pageNum) {
		Paging paging = new Paging(qnaDao.qnaTotCnt(), pageNum);
		QnA qna = new QnA();
		qna.setStartRow(paging.getStartRow());
		qna.setEndRow(paging.getEndRow());
		return qnaDao.qnaList(qna);
	}
	//QNA 글 개수
	@Override
	public int qnaTotCnt() {
		return qnaDao.qnaTotCnt();
	}
	//QNA 글 쓰기
	@Override
	public int qnaWrite(QnA qna) {
		System.out.println("저장할 글 : " + qna);
		return qnaDao.qnaWrite(qna);
	}
	//QNA 상세보기
	@Override
	public QnA qnaDetail(int qno) {
		qnaDao.qnaHitup(qno);
		return qnaDao.qnaDetail(qno);
	}
	//QNA 수정
	@Override
	public int qnaModify(QnA qna) {
		return qnaDao.qnaModify(qna);
	}
	//QNA 삭제 
	@Override
	public int qnaDelete(int qno) {
		return qnaDao.qnaDelete(qno);
	}
	//QNA 답변글 처리(관리자)
	@Override
	public int qnaReply(QnA qna, HttpServletRequest request) {
		qnaDao.qnaReplyPre(qna);
		return qnaDao.qnaReply(qna);
	}
	//QNA 답변글 뷰(관리자)
	@Override
	public QnA qnaModifyReplyView(int qno) {
		return qnaDao.qnaDetail(qno);
	}

}
