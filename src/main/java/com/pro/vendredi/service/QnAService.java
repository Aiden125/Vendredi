package com.pro.vendredi.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.pro.vendredi.dto.QnA;

public interface QnAService {
	public List<QnA> qnaList(String pageNum);
	public int qnaTotCnt();
	public int qnaWrite(QnA qna, HttpServletRequest request);
	public QnA qnaDetail(int qno);
	public QnA qnaModifyReplyView(int qno);
	public int qnaModify(QnA qna, HttpServletRequest request);
	public int qnaDelete(int qno);
	public int qnaReply(QnA qna , HttpServletRequest request);
}
