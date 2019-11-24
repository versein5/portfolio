package kr.co.acomp.hello.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.acomp.hello.dao.vo.user;

@Repository
public class UserDAO {
	@Autowired
	SqlSession sqlSession;
		
	public Integer login(user user) {
		int cnt=sqlSession.selectOne("mappers.User-Mapper.login",user);
		return cnt;		
	}


}
