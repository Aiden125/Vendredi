package com.pro.vendredi.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.pro.vendredi.dto.QnA;

public interface QnAService {
	public List<QnA> qnaList(String pageNum);
	public int qnaTotCnt();
	public int qnaWrite(QnA qna);
	public QnA qnaDetail(int qno); // 상세보기(조회수 올림)
	public QnA qnaModifyReplyView(int qno); // 상세보기(조회수 안올림)
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
	public QnA qnaReplyDetail(int qgroup);
	public QnA qnaOnlyReplyDetail(int qno); // 답변글만 관리하기용도
}
