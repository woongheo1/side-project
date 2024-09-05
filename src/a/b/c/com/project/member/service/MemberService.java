package a.b.c.com.project.member.service;

import java.util.List;



import a.b.c.com.project.member.vo.MemberVO;

public interface MemberService {

	int MemberInsert(MemberVO mvo);
	List<MemberVO> MemberSelectAll(MemberVO mvo);
	List<MemberVO> MemberSelect(MemberVO mvo);
	
	List<MemberVO> IdCheck(MemberVO mvo);
	List<MemberVO> NickCheck(MemberVO mvo);
	
	// 20221111 업데이트 추가 eunbh
	int MemberUpdate(MemberVO mvo);
	int MemberDelete(MemberVO mvo);
}
