package a.b.c.com.project.post.dao;

import java.util.List;


import a.b.c.com.project.post.vo.PostVO;

public interface PostDAO {
	
	public int postInsert(PostVO pbvo);
	public List<PostVO> postSelectAll(PostVO pbvo);
	public List<PostVO> postSelect(PostVO pbvo);	
	
	public List<PostVO> postPwCheck(PostVO pbvo);
	
	// 게시글 조회 수 
	public int postBhit(PostVO pbvo); 
	
	// 20221111 수정 삭제 추가 eunbh
	public int postUpdate(PostVO pbvo);
	public int postDelete(PostVO pbvo);

	public List<PostVO> postLikeSelect(PostVO pbvo);
	public List<PostVO> postLikeSelectAll(PostVO pbvo);
	
	public int postLikeInsert(PostVO pbvo);
	
	public int postLikeUpdate(PostVO pbvo);
}
