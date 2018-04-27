package min.edu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import min.edu.comm.DataBase;
import min.edu.dtos.Answerboard_Dto;

public class AnswerBoardDaoImpl extends DataBase implements IAnswerBoardDao {

	@Override
	public List<Answerboard_Dto> selectAll() {
		/*
		 * SELECT seq, id,LPAD(' ', "DEPTH"*10) || content 제목, content, password,"REF",
		 * STEP, "DEPTH", READCOUNT, REGDATE FROM ANSWERBOARD ORDER BY step, REF DESC;
		 */
		List<Answerboard_Dto> lists = new ArrayList<Answerboard_Dto>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "SELECT SEQ, ID, TITLE, CONTENT, PASSWORD, REF, STEP, DEPTH, READCOUNT, REGDATE "
				+ "FROM ANSWERBOARD ORDER BY REF DESC, STEP";

		try {
			conn = getConnection();

			stmt = conn.prepareStatement(sql);
			System.out.println("selectAll query ok");

			rs = stmt.executeQuery();
			System.out.println("selectAll query success");

			while (rs.next()) {
				Answerboard_Dto dto = new Answerboard_Dto();
				dto.setSEQ(rs.getInt("SEQ"));
				dto.setID(rs.getString("ID"));
				dto.setTITLE(rs.getString("TITLE"));
				dto.setREF(rs.getInt("REF"));
				dto.setSTEP(rs.getInt("STEP"));
				dto.setDEPTH(rs.getInt("DEPTH"));
				dto.setREADCOUNT(rs.getInt("READCOUNT"));
				dto.setREGDATE(rs.getString("REGDATE"));
				lists.add(dto);
			}

		} catch (SQLException e) {
			System.out.println("SELECT ALL fail");
			e.printStackTrace();
		} finally {
			closed(rs, stmt, conn);
		}
		return lists;
	}

	@Override
	public Answerboard_Dto selectOne(String seq) {
		Answerboard_Dto dto = new Answerboard_Dto();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "SELECT SEQ, ID, TITLE, CONTENT, REGDATE " + "FROM ANSWERBOARD " + "WHERE SEQ = ?";
		try {
			conn = getConnection();

			stmt = conn.prepareStatement(sql);
			System.out.println("selectOne query ok");
			stmt.setInt(1, Integer.parseInt(seq));

			rs = stmt.executeQuery();
			System.out.println("selectOne query success");

			while (rs.next()) {
				dto.setSEQ(rs.getInt("SEQ"));
				dto.setID(rs.getString("ID"));
				dto.setTITLE(rs.getString("TITLE"));
				dto.setCONTENT(rs.getString("CONTENT"));
				dto.setREGDATE(rs.getString("REGDATE"));
			}
		} catch (SQLException e) {
			System.out.println("SelectOne fail");
			e.printStackTrace();
		} finally {
			closed(rs, stmt, conn);
		}
		return dto;
	}

	@Override
	public boolean insertBoard(Answerboard_Dto dto) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "INSERT INTO ANSWERBOARD (SEQ, ID, TITLE, CONTENT, PASSWORD, REF, STEP, DEPTH, READCOUNT, REGDATE) "
				+ "VALUES(ANSWERBOARD_SEQ.NEXTVAL, ?,?,?,?, (SELECT NVL(MAX(REF),0)+1 FROM ANSWERBOARD),0,0,0,SYSDATE)";
		int n = 0;
		try {
			conn = getConnection();

			stmt = conn.prepareStatement(sql);
			System.out.println("insertBoard query ok");
			stmt.setString(1, dto.getID());
			stmt.setString(2, dto.getTITLE());
			stmt.setString(3, dto.getCONTENT());
			stmt.setInt(4, dto.getPASSWORD());

			n = stmt.executeUpdate();
			System.out.println("insertBoard query success");
		} catch (SQLException e) {
			System.out.println("SelectOne fail");
			e.printStackTrace();
		} finally {
			closed(rs, stmt, conn);
		}
		return (n > 0) ? true : false;
	}

	@Override
	public boolean updateBoard(Answerboard_Dto dto) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "UPDATE ANSWERBOARD SET CONTENT = ? WHERE SEQ = ? AND PASSWORD = ?";
		int n = 0;
		try {
			conn = getConnection();

			stmt = conn.prepareStatement(sql);
			System.out.println("updateBoard query success");
			stmt.setString(1, dto.getCONTENT());
			stmt.setInt(2, dto.getSEQ());
			stmt.setInt(3, dto.getPASSWORD());

			n = stmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SelectOne fail");
			e.printStackTrace();
		} finally {
			closed(rs, stmt, conn);
		}
		return (n > 0) ? true : false;
	}

	@Override
	public boolean deleteBoardOne(String seq) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "DELETE ANSWERBOARD WHERE SEQ = ?";
		int n = 0;
		try {
			conn = getConnection();

			stmt = conn.prepareStatement(sql);
			System.out.println("deleteBoardOne query ok");
			stmt.setInt(1, Integer.parseInt(seq));

			n = stmt.executeUpdate();
			System.out.println("deleteBoardOne query success");
		} catch (SQLException e) {
			System.out.println("deleteBoardOne fail");
			e.printStackTrace();
		} finally {
			closed(rs, stmt, conn);
		}
		return (n > 0) ? true : false;
	}

	@Override
	public boolean deleteBoardMulti(String[] seqs) {
		boolean isc = true;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "DELETE ANSWERBOARD WHERE SEQ = ?";
		int[] n = null;
		try {
			conn = getConnection();
			
			conn.setAutoCommit(false);
			System.out.println("deleteBoardMulti Transaction start");

			stmt = conn.prepareStatement(sql);
			System.out.println("deleteBoardMulti query ok");
			for (int i = 0; i < seqs.length; i++) {
				stmt.setInt(1, Integer.parseInt(seqs[i]));
				stmt.addBatch();
			}
			System.out.println("deleteBoardMulti bactch ok");
			
			n = stmt.executeBatch();
			System.out.println("deleteBoardMulti batch success");
			
			conn.commit();
		} catch (SQLException e) {
			System.out.println("deleteBoardMulti fail");
			try {
				conn.rollback();
				System.out.println("deleteBoardMulti rollback");
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				conn.setAutoCommit(true);
				System.out.println("deleteBoardMulti Transaction end");
			} catch (SQLException e) {
				e.printStackTrace();
			}
			closed(rs, stmt, conn);
		}
		for (int i = 0; i < n.length; i++) {
			if(n[i]!= -2) {
				isc = false;
				break;
			}
		}
		return isc;
	}

	@SuppressWarnings("resource")
	@Override
	public boolean replyBoard(Answerboard_Dto dto) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sqlOne = "UPDATE answerboard SET step = step + 1 "
				+ "WHERE REF = (SELECT DEPTH FROM answerboard WHERE seq = ?) AND step > (SELECT DEPTH FROM answerboard WHERE seq = ?)";
		String sqlTwo = "INSERT INTO ANSWERBOARD(seq, id, TITLE, CONTENT, PASSWORD, REF, step, DEPTH, READCOUNT, REGDATE) " + 
				"VALUES(answerboard_seq.nextval, ?, ?, ?, ?," + 
				"	(SELECT REF FROM ANSWERBOARD WHERE SEQ=?), (SELECT STEP +1 FROM ANSWERBOARD WHERE seq=?), " + 
				"	(SELECT DEPTH+1 FROM ANSWERBOARD WHERE SEQ=?),0,SYSDATE)";
		int n = 0;
		try {
			conn = getConnection();
			
			conn.setAutoCommit(false);
			System.out.println("replyBoard Transaction start");

			// REF, SEQ 부모의
			stmt = conn.prepareStatement(sqlOne);
			stmt.setInt(1, dto.getSEQ());
			stmt.setInt(2, dto.getSEQ());
			n = stmt.executeUpdate();
			stmt.clearParameters();
			System.out.println("replyBoard Update query success");
			
			// ID, TITLE, CONTENT, PASSWORD 내꺼, SEQ 부모꺼 x3
			stmt = conn.prepareStatement(sqlTwo);
			stmt.setString(1, dto.getID());
			stmt.setString(2, dto.getTITLE());
			stmt.setString(3, dto.getCONTENT());
			stmt.setInt(4, dto.getPASSWORD());
			stmt.setInt(5, dto.getSEQ());
			stmt.setInt(6, dto.getSEQ());
			stmt.setInt(7, dto.getSEQ());
			n += stmt.executeUpdate();
			System.out.println("replyBoard Insert query success");
			
			conn.commit();
		} catch (SQLException e) {
			try {
				conn.rollback();
				System.out.println("replyBoard rollback");
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			System.out.println("replyBoard fail");
			e.printStackTrace();
		} finally {
			try {
				conn.setAutoCommit(true);
				System.out.println("replyBoard Transaction end");
			} catch (SQLException e) {
				e.printStackTrace();
			}
			closed(rs, stmt, conn);
		}
		return (n > 0) ? true: false;
	}
}
