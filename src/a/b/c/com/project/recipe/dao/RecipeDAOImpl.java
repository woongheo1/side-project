package a.b.c.com.project.recipe.dao;

import java.util.List;






import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import a.b.c.com.project.recipe.vo.RecipeVO;
import a.b.c.com.project.recipe.dao.RecipeDAOImpl;


@Repository
public class RecipeDAOImpl implements RecipeDAO {
	Logger logger = LogManager.getLogger(RecipeDAOImpl.class);
	
	@Autowired(required=false)
	private SqlSessionTemplate sqlSession;

	@Override
	public int recipeInsert(RecipeVO rcvo) {
		// TODO Auto-generated method stub
		logger.info("RecipeInsert 함수 진입 >>> : ");	
		
		return sqlSession.insert("recipeInsert", rcvo);
	}

	@Override
	public List<RecipeVO> recipeSelectAll(RecipeVO rcvo) {
		// TODO Auto-generated method stub
		logger.info("RecipeSelectAll 함수 진입 >>> : ");	
		
		return sqlSession.selectList("recipeSelectAll", rcvo);
	}

	@Override
	public List<RecipeVO> recipeSelect(RecipeVO rcvo) {
		// TODO Auto-generated method stub
		logger.info("RecipeSelect 함수 진입 >>> : ");	
		
		return sqlSession.selectList("recipeSelect", rcvo);
	}

	
	@Override
	public int recipeBhit(RecipeVO rcvo) {
		// TODO Auto-generated method stub
		logger.info("kobCookBhit 함수 진입 >>> : ");	
		
		return sqlSession.update("recipeBhit", rcvo);
	}

	@Override
	public int recipeUpdate(RecipeVO rcvo) {
		// TODO Auto-generated method stub
		logger.info("recipeUpdate 함수 진입 >>> : ");	
		
		return sqlSession.update("recipeUpdate", rcvo);
	}

	@Override
	public int recipeDelete(RecipeVO rcvo) {
		// TODO Auto-generated method stub
		logger.info("RecipeDelete 함수 진입 >>> : ");	
		
		return sqlSession.update("RecipeDelete", rcvo);
	}
	
	@Override
	public int recipeLikeInsert(RecipeVO rcvo) {
		// TODO Auto-generated method stub
		logger.info("recipeLikeInsert 함수 진입 >>> : ");	
		
		return sqlSession.insert("recipeLikeInsert", rcvo);
	}
	@Override
	public int recipeLikeUpdate(RecipeVO rcvo) {
		// TODO Auto-generated method stub
		logger.info("RecipeLikeUpdate 함수 진입 >>> : ");	
		
		return sqlSession.insert("recipeLikeUpdate", rcvo);
	}
	
	@Override
	public List<RecipeVO> recipeLikeSelectAll(RecipeVO rcvo) {
		// TODO Auto-generated method stub
		logger.info("recipeLikeSelectAll 함수 진입 >>> : ");	
		
		return sqlSession.selectList("recipeLikeSelectAll", rcvo);
	}

	@Override
	public List<RecipeVO> recipeLikeSelect(RecipeVO rcvo) {
		// TODO Auto-generated method stub
		logger.info("recipeLikeSelect 함수 진입 >>> : ");	
		
		return sqlSession.selectList("recipeLikeSelect", rcvo);
	}
	
	
}
