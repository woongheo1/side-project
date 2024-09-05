package a.b.c.com.project.recipe.service;

import java.util.List;





import a.b.c.com.project.recipe.vo.RecipeVO;

public interface RecipeService {
	

	
	public int recipeInsert(RecipeVO rcvo);
	public List<RecipeVO> recipeSelectAll(RecipeVO rcvo);
	public List<RecipeVO> recipeSelect(RecipeVO rcvo);	
	
	
	// 게시글 조회 수 
	public int recipeBhit(RecipeVO rcvo);
	
	// 20221111 수정 삭제 추가 eunbh
	public int recipeUpdate(RecipeVO rcvo);
	public int recipeDelete(RecipeVO rcvo);

	
	public List<RecipeVO> recipeLikeSelect(RecipeVO rcvo);
	public List<RecipeVO> recipeLikeSelectAll(RecipeVO rcvo);
	
	public int recipeLikeInsert(RecipeVO rcvo);
	
	public int recipeLikeUpdate(RecipeVO rcvo);
}
