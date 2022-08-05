package com.pro.vendredi.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.pro.vendredi.dto.QnA;

@Mapper
public interface QnADao {
	public List<QnA> qnaList(QnA qna);
	public int qnaTotCnt();
	public int qnaWrite(QnA qna);
	public QnA qnaDetail(int qno);
	public int qnaModify(QnA qna);
	public int qnaHitup(int qno);
	public int qnaDelete(int qno);
	public int qnaReplyPre(QnA qna);
	public int qnaReply(QnA qna);
	
	// 관리자 단에 필요해서 추가
	public List<QnA> qnaQuestionList(QnA qna);
	public int qnaQuestionTotCnt();
	public List<QnA> qnaReplyYetList(QnA qna);
	public int qnaReplyYetTotCnt();
	public List<QnA> qnaReplyList(QnA qna);
	public int qnaReplyTotCnt();
	public int qnaStateUpdate(int qno);
}
