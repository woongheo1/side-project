package a.b.c.com.project.comment.dao;

import java.util.List;


import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;


import a.b.c.com.project.comment.vo.CommentVO;

@Repository
@Qualifier("commentDAO")
public class CommentDAOImpl implements CommentDAO {
	Logger logger = LogManager.getLogger(CommentDAOImpl.class);
	
	@Autowired(required=false)
	private SqlSessionTemplate sqlSession;

	@Override
	public int commentInsert(CommentVO cvo) {
		// TODO Auto-generated method stub
		logger.info("CommentInsert 함수 진입 >>> : ");			
		return sqlSession.insert("CommentInsert", cvo);
	}

	@Override
	public List<CommentVO> commentSelectAll(CommentVO cvo) {
		// TODO Auto-generated method stub
		logger.info("CommentSelectAll 함수 진입 >>> : ");	
		return sqlSession.selectList("CommentSelectAll", cvo);
	}

	@Override
	public int commentDelete(CommentVO cvo) {
		// TODO Auto-generated method stub
		logger.info("CommentDelete 함수 진입 >>> : ");			
		return sqlSession.update("CommentDelete", cvo);
	}
	
	@Override
	public int commentLikeInsert(CommentVO cvo) {
		// TODO Auto-generated method stub
		logger.info("CommentLikeInsert 함수 진입 >>> : ");	
		
		return sqlSession.insert("CommentLikeInsert", cvo);
	}
	@Override
	public int commentLikeUpdate(CommentVO cvo) {
		// TODO Auto-generated method stub
		logger.info("CommentLikeUpdate 함수 진입 >>> : ");	
		
		return sqlSession.insert("CommentLikeUpdate", cvo);
	}
	
	@Override
	public List<CommentVO> commentLikeSelectAll(CommentVO cvo) {
		// TODO Auto-generated method stub
		logger.info("CommentLikeSelectAll 함수 진입 >>> : ");	
		
		return sqlSession.selectList("CommentLikeSelectAll", cvo);
	}

	@Override
	public List<CommentVO> commentLikeSelect(CommentVO cvo) {
		// TODO Auto-generated method stub
		logger.info("CommentLikeSelect 함수 진입 >>> : ");	
		
		return sqlSession.selectList("CommentLikeSelect", cvo);
	}

}
