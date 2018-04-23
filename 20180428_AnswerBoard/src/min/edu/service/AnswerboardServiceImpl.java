package min.edu.service;

import java.util.List;

import min.edu.dao.AnswerBoardDaoImpl;
import min.edu.dao.IAnswerBoardDao;
import min.edu.dtos.Answerboard_Dto;

public class AnswerboardServiceImpl implements IAnswerboardService {
	
	IAnswerBoardDao dao;
	
	public AnswerboardServiceImpl() {
		dao = new AnswerBoardDaoImpl();
	}

	@Override
	public List<Answerboard_Dto> selectAll() {
		return dao.selectAll();
	}

	@Override
	public Answerboard_Dto selectOne(String seq) {
		return dao.selectOne(seq);
	}

	@Override
	public boolean insertBoard(Answerboard_Dto dto) {
		return dao.insertBoard(dto);
	}

	@Override
	public boolean deleteBoardOne(String seq) {
		return dao.deleteBoardOne(seq);
	}

	@Override
	public boolean deleteBoardMulti(String[] seqs) {
		return dao.deleteBoardMulti(seqs);
	}

	@Override
	public boolean updateBoard(Answerboard_Dto dto) {
		return dao.updateBoard(dto);
	}

	@Override
	public boolean replyBoard(Answerboard_Dto dto) {
		return dao.replyBoard(dto);
	}

}
