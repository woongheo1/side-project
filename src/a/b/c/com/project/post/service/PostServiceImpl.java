package a.b.c.com.project.post.service;

import java.util.List;


import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import a.b.c.com.project.post.dao.PostDAO;
import a.b.c.com.project.post.vo.PostVO;

@Service
@Transactional
public class PostServiceImpl implements PostService {
	Logger logger = LogManager.getLogger(PostServiceImpl.class);
	
	// 서비스에서 DAO 연결하기 
	// 필드 @Autowired 어노테이션으로  DI (의존성 주입하기)
	@Autowired(required=false)		
	private PostDAO postDAO;

	@Override
	public int postInsert(PostVO pbvo) {
		// TODO Auto-generated method stub
		logger.info("PostInsert 함수 진입 >>> : ");			
		return postDAO.postInsert(pbvo);
	}

	@Override
	public List<PostVO> postSelectAll(PostVO pbvo) {
		// TODO Auto-generated method stub
		logger.info("PostSelectAll 함수 진입 >>> : ");			
		return postDAO.postSelectAll(pbvo);
	}

	@Override
	public List<PostVO> postSelect(PostVO pbvo) {
		// TODO Auto-generated method stub
		logger.info("PostSelect 함수 진입 >>> : ");			
		return postDAO.postSelect(pbvo);
	}

	@Override
	public List<PostVO> postPwCheck(PostVO pbvo) {
		// TODO Auto-generated method stub
		logger.info("PostPwCheck 함수 진입 >>> : ");			
		return postDAO.postPwCheck(pbvo);
	}

	@Override
	public int postBhit(PostVO pbvo) {
		// TODO Auto-generated method stub
		logger.info("kobBoardBhit 함수 진입 >>> : ");			
		return postDAO.postBhit(pbvo);
	}

	@Override
	public int postUpdate(PostVO pbvo) {
		// TODO Auto-generated method stub
		logger.info("PostUpdate 함수 진입 >>> : ");			
		return postDAO.postUpdate(pbvo);
	}

	@Override
	public int postDelete(PostVO pbvo) {
		// TODO Auto-generated method stub 
		logger.info("PostDelete 함수 진입 >>> : ");			
		return postDAO.postDelete(pbvo);
	}
	
	
	@Override
	public int postLikeInsert(PostVO pbvo) {
		// TODO Auto-generated method stub
		logger.info("kobBoardBhit 함수 진입 >>> : ");			
		return postDAO.postLikeInsert(pbvo);
	}

	
	@Override
	public int postLikeUpdate(PostVO pbvo) {
		// TODO Auto-generated method stub
		logger.info("PostLikeUpdate 함수 진입 >>> : ");			
		return postDAO.postLikeUpdate(pbvo);
	}
	
	@Override
	public List<PostVO> postLikeSelectAll(PostVO pbvo) {
		// TODO Auto-generated method stub
		logger.info("PostLikeSelectAll 함수 진입 >>> : ");			
		return postDAO.postLikeSelectAll(pbvo);
	}

	@Override
	public List<PostVO> postLikeSelect(PostVO pbvo) {
		// TODO Auto-generated method stub
		logger.info("PostLikeSelect 함수 진입 >>> : ");			
		return postDAO.postLikeSelect(pbvo);
	}

}
