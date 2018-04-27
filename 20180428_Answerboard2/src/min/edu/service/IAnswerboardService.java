package min.edu.service;

import java.util.List;

import min.edu.dtos.Answerboard_Dto;

public interface IAnswerboardService {
	// 조회 (다중)
	public List<Answerboard_Dto> selectAll();
	
	// 조회 (단일)
	public Answerboard_Dto selectOne(String seq);
	
	// 입력
	public boolean insertBoard(Answerboard_Dto dto);
	
	// 수정
	public boolean updateBoard(Answerboard_Dto dto);
	
	// 삭제
	public boolean deleteBoardOne(String seq);
	
	// 삭제(다중)
	public boolean deleteBoardMulti(String[] seqs);
	
	// 답글
	public boolean replyBoard(Answerboard_Dto dto);
}
