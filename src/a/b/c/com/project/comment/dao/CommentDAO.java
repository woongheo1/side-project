package a.b.c.com.project.comment.dao;

import java.util.List;



import a.b.c.com.project.comment.vo.CommentVO;

public interface CommentDAO {
	
	public int commentInsert(CommentVO cvo);
	public List<CommentVO> commentSelectAll(CommentVO cvo);
	public int commentDelete(CommentVO cvo);
	
	
	//좋아요
	public List<CommentVO> commentLikeSelect(CommentVO cvo);
	public List<CommentVO> commentLikeSelectAll(CommentVO cvo);
	
	public int commentLikeInsert(CommentVO cvo);
	
	public int commentLikeUpdate(CommentVO cvo);

}
