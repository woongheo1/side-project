package a.b.c.project_login.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import a.b.c.com.project.member.vo.MemberVO;
import a.b.c.project_login.dao.LoginDAO;

public class LoginServiceImpl {

	@Autowired(required=false)	
	private LoginDAO loginDAO;

	public List<MemberVO> loginSelect(MemberVO mvo) {
		// TODO Auto-generated method stub
		
		return loginDAO.loginCheck(mvo);
	}
	
}
 