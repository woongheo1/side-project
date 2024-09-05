package a.b.c.com.project.comment.service;

import java.util.List;


import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import a.b.c.com.project.comment.dao.CommentDAO;
import a.b.c.com.project.comment.vo.CommentVO;

@Service("commentServiceImpl")
@Transactional
public class CommentServiceImpl implements CommentService {
	Logger logger = LogManager.getLogger(CommentServiceImpl.class);
	
	// 서비스에서 DAO 연결하기 
	// 필드 @Autowired 어노테이션으로  DI (의존성 주입하기)
	@Autowired(required=false)	
	private CommentDAO commentDAO;

	@Override
	public int commentInsert(CommentVO cvo) {
		// TODO Auto-generated method stub
		logger.info("CommentInsert 함수 진입 >>> : ");			
		return commentDAO.commentInsert(cvo);
	}

	@Override
	public List<CommentVO> commentSelectAll(CommentVO cvo) {
		// TODO Auto-generated method stub
		logger.info("CommentSelectAll 함수 진입 >>> : ");			
		return commentDAO.commentSelectAll(cvo);
	}

	@Override
	public int commentDelete(CommentVO cvo) {
		// TODO Auto-generated method stub
		logger.info("CommentDelete 함수 진입 >>> : ");			
		return commentDAO.commentDelete(cvo);
	}
	
	@Override
	public int commentLikeInsert(CommentVO cvo) {
		// TODO Auto-generated method stub
		logger.info("CommentLikeInsert 함수 진입 >>> : ");			
		return commentDAO.commentLikeInsert(cvo);
	}
	
	@Override
	public int commentLikeUpdate(CommentVO cvo) {
		// TODO Auto-generated method stub
		logger.info("CommentLikeUpdate 함수 진입 >>> : ");			
		return commentDAO.commentLikeUpdate(cvo);
	}
	
	@Override
	public List<CommentVO> commentLikeSelectAll(CommentVO cvo) {
		// TODO Auto-generated method stub
		logger.info("CommentLikeSelectAll 함수 진입 >>> : ");			
		return commentDAO.commentLikeSelectAll(cvo);
	}

	@Override
	public List<CommentVO> commentLikeSelect(CommentVO cvo) {
		// TODO Auto-generated method stub
		logger.info("CommentLikeSelect 함수 진입 >>> : ");			
		return commentDAO.commentLikeSelect(cvo);
	}

}
