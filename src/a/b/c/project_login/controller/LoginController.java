package a.b.c.project_login.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import a.b.c.com.project.member.service.MemberService;
import a.b.c.com.project.member.vo.MemberVO;
import a.b.c.project_login.service.LoginService;
import a.b.c.project_login.vo.LoginVO;

@Controller
public class LoginController {
    Logger logger = LogManager.getLogger(LoginController.class);
    
    @Autowired(required=false)
    private LoginService loginService;
    
    @Autowired(required=false)
    private MemberService memberService;




    @RequestMapping("login")
    public String loginForm() {
        return "login";
    }

 
    @PostMapping("loginGo")
    public String login(HttpServletRequest req, MemberVO mvo, Model model) {
        String mid = req.getParameter("mid");
        String mpw = req.getParameter("mpw");

        logger.info("mid>>>>>>>>>>" + mid);
        logger.info("mpw>>>>>>>>>>" + mpw);

        List<MemberVO> memberList = memberService.MemberSelectAll(mvo);

        logger.info("users >>> : " + memberList);
        for (MemberVO user : memberList) {
            logger.info("getMid >>> : " + user.getMid());

            if (user.getMid().equals(mid) && user.getMpw().equals(mpw)) {
                model.addAttribute("user", user);
                return "mainPage_1";
            }
        }
        return "login";
    }

    
    @RequestMapping("logout")
    public String logout(HttpServletRequest req) {
    	
    	HttpSession session = req.getSession(false); 
        
		if(session != null) {
			session.invalidate();
		}
        return "main";
    }

   
}
