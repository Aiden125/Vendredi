package com.pro.vendredi.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.pro.vendredi.dto.QnA;

public interface QnAService {
	public List<QnA> qnaList(String pageNum);
	public int qnaTotCnt();
	public int qnaWrite(QnA qna);
	public QnA qnaDetail(int qno);
	public QnA qnaModifyReplyView(int qno);
	public int qnaModify(QnA qna);
	public int qnaDelete(int qno);
	public int qnaReply(QnA qna , HttpServletRequest request);
	
	// 관리자 단에 필요해서 추가
	public List<QnA> qnaQuestionList(String pageNum);
	public int qnaQuestionTotCnt();
	public List<QnA> qnaReplyYetList(String pageNum);
	public int qnaReplyYetTotCnt();
	public List<QnA> qnaReplyList(String pageNum);
	public int qnaReplyTotCnt();
	public int qnaStateUpdate(int qno);
	public QnA qnaReplyDetail(int qno);
}
