package a.b.c.project_login.service;

import java.util.List;

import a.b.c.com.project.member.vo.MemberVO;
import a.b.c.project_login.vo.LoginVO;

public interface LoginService {

	List<LoginVO> loginCheck(LoginVO lvo);
	
}
