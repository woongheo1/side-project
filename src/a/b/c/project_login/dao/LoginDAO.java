package a.b.c.project_login.dao;

import java.util.List;

import a.b.c.com.project.member.vo.MemberVO;
import a.b.c.project_login.vo.LoginVO;

public interface LoginDAO {
	

	List<MemberVO> loginCheck(MemberVO mvo);

}
