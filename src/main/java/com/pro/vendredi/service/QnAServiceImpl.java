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
	
	@Override
	public List<QnA> qnaList(String pageNum) {
		Paging paging = new Paging(qnaDao.qnaTotCnt(), pageNum);
		QnA qna = new QnA();
		qna.setStartRow(paging.getStartRow());
		qna.setEndRow(paging.getEndRow());
		return qnaDao.qnaList(qna);
	}

	@Override
	public int qnaTotCnt() {
		return qnaDao.qnaTotCnt();
	}

	@Override
	public int qnaWrite(QnA qna, HttpServletRequest request) {
		return qnaDao.qnaWrite(qna);
	}

	@Override
	public QnA qnaDetail(int qno) {
		qnaDao.qnaHitup(qno);
		return qnaDao.qnaDetail(qno);
	}

	@Override
	public int qnaModify(QnA qna, HttpServletRequest request) {
		return qnaDao.qnaModify(qna);
	}

	@Override
	public int qnaDelete(int qno) {
		return qnaDao.qnaDelete(qno);
	}

	@Override
	public int qnaReply(QnA qna, HttpServletRequest request) {
		qnaDao.qnaReplyPre(qna);
		return qnaDao.qnaReply(qna);
	}

	@Override
	public QnA qnaModifyReplyView(int qno) {
		return qnaDao.qnaDetail(qno);
	}

}
