package a.b.c.com.project.member.dao;

import java.util.List;



import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import a.b.c.com.project.member.vo.MemberVO;

@Repository
@Qualifier("memberDAO")
public class MemberDAOImpl implements MemberDAO {
	Logger logger = LogManager.getLogger(MemberDAOImpl.class);
	
	@Autowired(required=false)
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public int MemberInsert(MemberVO mvo) {
		// TODO Auto-generated method stub
		logger.info("kosSpringInsert 함수 진입 >>> : ");	
		
		return sqlSession.insert("MemberInsert", mvo);
	}


	@Override
	public List<MemberVO> MemberSelectAll(MemberVO mvo) {
		// TODO Auto-generated method stub
		logger.info("MemberSelectAll 함수 진입 >>> : ");	
		
		return sqlSession.selectList("MemberSelectAll", mvo);
	}
	
	@Override
	public List<MemberVO> MemberSelect(MemberVO mvo) {
		// TODO Auto-generated method stub
		logger.info("MemberSelect 함수 진입 >>> : ");	
		
		return sqlSession.selectList("MemberSelect", mvo);
	}


	@Override
	public List<MemberVO> kosIdCheck(MemberVO mvo) {
		// TODO Auto-generated method stub
		logger.info("kosIdCheck 함수 진입 >>> : ");	
		
		return sqlSession.selectList("kosIdCheck", mvo);
	}
	@Override
	public List<MemberVO> NickCheck(MemberVO mvo) {
		// TODO Auto-generated method stub
		logger.info("NickCheck 함수 진입 >>> : ");	
		
		return sqlSession.selectList("NickCheck", mvo);
	}


	@Override
	public int MemberUpdate(MemberVO mvo) {
		// TODO Auto-generated method stub
		logger.info("MemberUpdate 함수 진입 >>> : ");	
		
		return sqlSession.update("MemberUpdate", mvo);
	}


	@Override
	public int MemberDelete(MemberVO mvo) {
		// TODO Auto-generated method stub
		logger.info("MemberDelete 함수 진입 >>> : ");	
		
		return sqlSession.update("MemberDelete", mvo);
	}

}
