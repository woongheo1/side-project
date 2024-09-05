package a.b.c.project_login.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import a.b.c.com.project.member.vo.MemberVO;


import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;


@Qualifier("LoginDAO")
@Repository
public class LoginDAOImpl implements LoginDAO{

	Logger logger = LogManager.getLogger(LoginDAOImpl.class);
	@Autowired(required=false)
	private SqlSessionTemplate sqlSession;
	
	

	@Override
	public List<MemberVO> loginCheck(MemberVO mvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("loginCheck", mvo);
	}
}
