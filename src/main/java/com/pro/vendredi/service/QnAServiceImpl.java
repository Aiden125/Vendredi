package com.pro.vendredi.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

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
		qnaDao.qnaStateUpdate(qna.getQno());
		return qnaDao.qnaReply(qna);
	}
	//QNA 답변글 뷰(관리자)
	@Override
	public QnA qnaModifyReplyView(int qno) {
		return qnaDao.qnaDetail(qno);
	}
	//QNA 질문글 리스트(희석추가)
	@Override
	public List<QnA> qnaQuestionList(String pageNum) {
		Paging paging = new Paging(qnaDao.qnaQuestionTotCnt(), pageNum);
		QnA qna = new QnA();
		qna.setStartRow(paging.getStartRow());
		qna.setEndRow(paging.getEndRow());
		return qnaDao.qnaQuestionList(qna);
	}
	//QNA 질문글 갯수(희석추가)
	@Override
	public int qnaQuestionTotCnt() {
		return qnaDao.qnaQuestionTotCnt();
	}
	//QNA 답변대기 질문 리스트(희석추가)
	@Override
	public List<QnA> qnaReplyYetList(String pageNum) {
		Paging paging = new Paging(qnaDao.qnaReplyYetTotCnt(), pageNum);
		QnA qna = new QnA();
		qna.setStartRow(paging.getStartRow());
		qna.setEndRow(paging.getEndRow());
		return qnaDao.qnaReplyYetList(qna);
	}
	//QNA 답변대기 질문 총 갯수(희석추가)
	@Override
	public int qnaReplyYetTotCnt() {
		return qnaDao.qnaReplyYetTotCnt();
	}
	//QNA 답변글 리스트(희석추가)
	@Override
	public List<QnA> qnaReplyList(String pageNum) {
		Paging paging = new Paging(qnaDao.qnaReplyTotCnt(), pageNum);
		QnA qna = new QnA();
		qna.setStartRow(paging.getStartRow());
		qna.setEndRow(paging.getEndRow());
		return qnaDao.qnaReplyList(qna);
	}
	//QNA 답변글 총 갯수(희석추가)
	@Override
	public int qnaReplyTotCnt() {
		return qnaDao.qnaReplyTotCnt();
	}
	//QNA 답변 받으면 상태변경(희석추가)
	@Override
	public int qnaStateUpdate(int qno) {
		return qnaDao.qnaStateUpdate(qno);
	}
	//QNA 답변 상세보기
	@Override
	public QnA qnaReplyDetail(int qno) {
		return qnaDao.qnaReplyDetail(qno);
	}

}
