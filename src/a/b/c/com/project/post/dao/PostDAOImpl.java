package a.b.c.com.project.post.dao;

import java.util.List;


import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import a.b.c.com.project.post.vo.PostVO;
import a.b.c.com.project.post.dao.PostDAOImpl;

@Repository
public class PostDAOImpl implements PostDAO {
	Logger logger = LogManager.getLogger(PostDAOImpl.class);
	
	@Autowired(required=false)
	private SqlSessionTemplate sqlSession;

	@Override
	public int postInsert(PostVO pbvo) {
		// TODO Auto-generated method stub
		logger.info("PostInsert 함수 진입 >>> : ");	
		
		return sqlSession.insert("postInsert", pbvo);
	}

	@Override
	public List<PostVO> postSelectAll(PostVO pbvo) {
		// TODO Auto-generated method stub
		logger.info("PostSelectAll 함수 진입 >>> : ");	
		
		return sqlSession.selectList("postSelectAll", pbvo);
	}

	@Override
	public List<PostVO> postSelect(PostVO pbvo) {
		// TODO Auto-generated method stub
		logger.info("PostSelect 함수 진입 >>> : ");	
		
		return sqlSession.selectList("postSelect", pbvo);
	}

	@Override
	public List<PostVO> postPwCheck(PostVO pbvo) {
		// TODO Auto-generated method stub
		logger.info("PostPwCheck 함수 진입 >>> : ");	
		
		return sqlSession.selectList("postPwCheck", pbvo);
	}

	@Override
	public int postBhit(PostVO pbvo) {
		// TODO Auto-generated method stub
		logger.info("kobBoardBhit 함수 진입 >>> : ");	
		
		return sqlSession.update("postBhit", pbvo);
	}

	@Override
	public int postUpdate(PostVO pbvo) {
		// TODO Auto-generated method stub
		logger.info("PostUpdate 함수 진입 >>> : ");	
		
		return sqlSession.update("postUpdate", pbvo);
	}

	@Override
	public int postDelete(PostVO pbvo) {
		// TODO Auto-generated method stub
		logger.info("PostDelete 함수 진입 >>> : ");	
		
		return sqlSession.update("postDelete", pbvo);
	}
	
	@Override
	public int postLikeInsert(PostVO pbvo) {
		// TODO Auto-generated method stub
		logger.info("PostInsert 함수 진입 >>> : ");	
		
		return sqlSession.insert("postInsert", pbvo);
	}
	@Override
	public int postLikeUpdate(PostVO pbvo) {
		// TODO Auto-generated method stub
		logger.info("PostInsert 함수 진입 >>> : ");	
		
		return sqlSession.insert("postLikeUpdate", pbvo);
	}
	
	@Override
	public List<PostVO> postLikeSelectAll(PostVO pbvo) {
		// TODO Auto-generated method stub
		logger.info("PostLikeSelectAll 함수 진입 >>> : ");	
		
		return sqlSession.selectList("postLikeSelectAll", pbvo);
	}

	@Override
	public List<PostVO> postLikeSelect(PostVO pbvo) {
		// TODO Auto-generated method stub
		logger.info("PostLikeSelect 함수 진입 >>> : ");	
		
		return sqlSession.selectList("postLikeSelect", pbvo);
	}
	
	
}
