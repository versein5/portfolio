package kr.co.acomp.hello.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.acomp.hello.dao.vo.Board;
import kr.co.acomp.hello.dao.vo.BoardReply;



@Repository("boardDao")
public class BoardDaoImpl implements BoardDao{
	
	@Autowired
    private SqlSession sqlSession;
 
//    public void setSqlSession(SqlSession sqlSession){
//        this.sqlSession = sqlSession;
//    }
    
	@Override
	public int regContent(Map<String, Object> paramMap) {
		return sqlSession.insert("mappers.Board-Mapper.insertContent", paramMap);
	}
	
	@Override
	public int modifyContent(Map<String, Object> paramMap) {
		return sqlSession.update("mappers.Board-Mapper.updateContent", paramMap);
	}

	@Override
	public int getContentCnt(Map<String, Object> paramMap) {
		return sqlSession.selectOne("mappers.Board-Mapper.selectContentCnt", paramMap);
	}
	
	@Override
	public List<Board> getContentList(Map<String, Object> paramMap) {
		return sqlSession.selectList("mappers.Board-Mapper.selectContent", paramMap);
	}

	@Override
	public Board getContentView(Map<String, Object> paramMap) {
		return sqlSession.selectOne("mappers.Board-Mapper.selectContentView", paramMap);
	}

	@Override
	public int regReply(Map<String, Object> paramMap) {
		return sqlSession.insert("mappers.Board-Mapper.insertBoardReply", paramMap);
	}

	@Override
	public List<BoardReply> getReplyList(Map<String, Object> paramMap) {
		return sqlSession.selectList("mappers.Board-Mapper.selectBoardReplyList", paramMap);
	}

	@Override
	public int delReply(Map<String, Object> paramMap) {
		if(paramMap.get("r_type").equals("main")) {
			//부모부터 하위 다 지움
			return sqlSession.delete("mappers.Board-Mapper.deleteBoardReplyAll", paramMap);
		}else {
			//자기 자신만 지움
			return sqlSession.delete("mappers.Board-Mapper.deleteBoardReply", paramMap);
		}
		
		
	}

	@Override
	public int getBoardCheck(Map<String, Object> paramMap) {
		return sqlSession.selectOne("mappers.Board-Mapper.selectBoardCnt", paramMap);
	}

	@Override
	public int delBoard(Map<String, Object> paramMap) {
		return sqlSession.delete("mappers.Board-Mapper.deleteBoard", paramMap);
	}

	@Override
	public boolean checkReply(Map<String, Object> paramMap) {
		int result = sqlSession.selectOne("mappers.Board-Mapper.selectReplyPassword", paramMap);
				
		if(result>0) {
			return true;
		}else {
			return false;
		}
		
	}

	@Override
	public boolean updateReply(Map<String, Object> paramMap) {
		int result = sqlSession.update("mappers.Board-Mapper.updateReply", paramMap);
		
		if(result>0) {
			return true;
		}else {
			return false;
		}
	}
	
}
