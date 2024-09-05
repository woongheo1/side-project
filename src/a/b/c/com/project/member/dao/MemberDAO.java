package a.b.c.com.project.member.dao;

import java.util.List;



import a.b.c.com.project.member.vo.MemberVO;

public interface MemberDAO {

	int MemberInsert(MemberVO mvo);
	List<MemberVO> MemberSelectAll(MemberVO mvo);
	List<MemberVO> MemberSelect(MemberVO mvo);
	
	List<MemberVO> kosIdCheck(MemberVO mvo);
	List<MemberVO> NickCheck(MemberVO mvo);
	
	int MemberUpdate(MemberVO mvo);
	int MemberDelete(MemberVO mvo);
	
	
}
