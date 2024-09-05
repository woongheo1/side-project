package a.b.c.com.project.recipe.service;

import java.util.List;





import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;



import a.b.c.com.project.recipe.dao.RecipeDAO;
import a.b.c.com.project.recipe.vo.RecipeVO;

@Service
@Transactional
public class RecipeServiceImpl implements RecipeService {
	Logger logger = LogManager.getLogger(RecipeServiceImpl.class);
	
	
	@Autowired(required=false)		
	private RecipeDAO recipeDAO;

	@Override
	public int recipeInsert(RecipeVO kcvo) {
		// TODO Auto-generated method stub
		logger.info("recipeInsert 함수 진입 >>> : ");			
		return recipeDAO.recipeInsert(kcvo);
	}

	@Override
	public List<RecipeVO> recipeSelectAll(RecipeVO kcvo) {
		// TODO Auto-generated method stub
		logger.info("recipeSelectAll 함수 진입 >>> : ");			
		return recipeDAO.recipeSelectAll(kcvo);
	}

	@Override
	public List<RecipeVO> recipeSelect(RecipeVO kcvo) {
		// TODO Auto-generated method stub
		logger.info("recipeSelect 함수 진입 >>> : ");			
		return recipeDAO.recipeSelect(kcvo);
	}


	@Override
	public int recipeBhit(RecipeVO kcvo) {
		// TODO Auto-generated method stub
		logger.info("recipeBhit 함수 진입 >>> : ");			
		return recipeDAO.recipeBhit(kcvo);
	}

	@Override
	public int recipeUpdate(RecipeVO kcvo) {
		// TODO Auto-generated method stub
		logger.info("recipeUpdate 함수 진입 >>> : ");			
		return recipeDAO.recipeUpdate(kcvo);
	}

	@Override
	public int recipeDelete(RecipeVO kcvo) {
		// TODO Auto-generated method stub
		logger.info("recipeDelete 함수 진입 >>> : ");			
		return recipeDAO.recipeDelete(kcvo);
	}
	
	@Override
	public int recipeLikeInsert(RecipeVO kcvo) {
		// TODO Auto-generated method stub
		logger.info("recipeLikeInsert 함수 진입 >>> : ");			
		return recipeDAO.recipeLikeInsert(kcvo);
	}
	
	@Override
	public int recipeLikeUpdate(RecipeVO kcvo) {
		// TODO Auto-generated method stub
		logger.info("recipeLikeUpdate 함수 진입 >>> : ");			
		return recipeDAO.recipeLikeUpdate(kcvo);
	}
	
	@Override
	public List<RecipeVO> recipeLikeSelectAll(RecipeVO kcvo) {
		// TODO Auto-generated method stub
		logger.info("recipeLikeSelectAll 함수 진입 >>> : ");			
		return recipeDAO.recipeLikeSelectAll(kcvo);
	}

	@Override
	public List<RecipeVO> recipeLikeSelect(RecipeVO kcvo) {
		// TODO Auto-generated method stub
		logger.info("recipeLikeSelect 함수 진입 >>> : ");			
		return recipeDAO.recipeLikeSelect(kcvo);
	}

}
