package a.b.c.com.project.member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import a.b.c.com.common.CommonUtils;
import a.b.c.com.common.FileUploadUtil;
import a.b.c.com.project.member.service.MemberService;
import a.b.c.com.project.member.vo.MemberVO;

@Controller
public class MemberController {
    Logger logger = LogManager.getLogger(MemberController.class);

    @Autowired(required=false)
    
    private MemberService MemberService;

    // 회원 입력 폼
    @GetMapping("memForm")
    public String MemberInsertForm() {
    	
        logger.info("MemberInsertForm 함수 진입 >>> : ");
        return "member/memForm";
    }

    // 회원 등록
    @PostMapping("memInsert")
    public String MemberInsert(HttpServletRequest req) {
        logger.info("MemberInsert 함수 진입 >>> : ");

        // 이미지 업로드 
        FileUploadUtil fu = new FileUploadUtil(CommonUtils.MEM_IMG_UPLOAD_PATH,
                                                CommonUtils.MEM_IMG_FILE_SIZE,
                                                CommonUtils.MEM_EN_CODE);
        boolean bool = fu.imgfileUpload(req);
        logger.info("MemberInsert bool >>> : " + bool);

        MemberVO mvo = new MemberVO();
        mvo.setMnum(fu.getParameter("mnum"));
        mvo.setMname(fu.getParameter("mname"));
        mvo.setMid(fu.getParameter("mid"));
        mvo.setMnick(fu.getParameter("mnick"));
        mvo.setMpw(fu.getParameter("mpw"));

        String mbirth = fu.getParameter("mbirth");
        String mbirth1 = fu.getParameter("mbirth1");
        String mbirth2 = fu.getParameter("mbirth2");
        mvo.setMbirth((mbirth != null ? mbirth : "") + 
                      (mbirth1 != null ? mbirth1 : "") + 
                      (mbirth2 != null ? mbirth2 : ""));

        String mhp = fu.getParameter("mhp");
        String mhp1 = fu.getParameter("mhp1");
        String mhp2 = fu.getParameter("mhp2");
        mvo.setMhp((mhp != null ? mhp : "") + 
                   (mhp1 != null ? mhp1 : "") + 
                   (mhp2 != null ? mhp2 : ""));

        String memail = fu.getParameter("memail");
        String memail1 = fu.getParameter("memail1");
        mvo.setMemail((memail != null ? memail : "") + 
                      "@" + 
                      (memail1 != null ? memail1 : ""));

        mvo.setMzonecode(fu.getParameter("mzonecode"));
        mvo.setMroadaddr(fu.getParameter("mroadaddr"));
        mvo.setMroaddetail(fu.getParameter("mroaddetail"));
        mvo.setMjibunaddr(fu.getParameter("mjibunaddr"));
        mvo.setMphoto(fu.getFileName("mphoto"));

        logger.info("회원 정보 >>> : " + mvo.toString());

        if (MemberService != null) {
            int nCnt = MemberService.MemberInsert(mvo);
            if (nCnt > 0) {
                logger.info("MemberInsert 함수 nCnt >>> : " + nCnt);
                return "member/memInsert";
            }
        } else {
            logger.error("MemberService가 주입되지 않았습니다.");
        }

        return "member/memForm";
    }

    // 회원 목록
    @GetMapping("memSelectAll")
    public String MemberSelectAll(MemberVO mvo, Model model) {
        logger.info("MemberSelectAll 함수 진입 >>> : ");

        List<MemberVO> listAll = MemberService.MemberSelectAll(mvo);
        if (listAll.size() > 0) {
            logger.info("MemberSelectAll listAll.size() >>> : " + listAll.size());
            model.addAttribute("listAll", listAll);
            model.addAttribute("search_mvo", mvo);
            return "member/memSelectAll";
        }

        return "member/memForm";
    }

    // 회원 조회
    @PostMapping("memSelect")
    public String MemberSelect(MemberVO mvo, Model model) {
        logger.info("MemberSelect 함수 진입 >>> : ");
        logger.info("MemberSelect 함수 진입 mvo >>> : " + mvo);
        logger.info("MemberSelect 함수 진입 mvo >>> : " + mvo.getMnum());

        List<MemberVO> listS = MemberService.MemberSelect(mvo);
        if (listS.size() > 0) {
            logger.info("MemberSelectAll listS.size() >>> : " + listS.size());
            model.addAttribute("listS", listS);
            return "mem/memSelect";
        }

        return "mem/memSelectAll";
    }

    // 아이디 중복 체크하기
    @GetMapping("IdCheck")
    @ResponseBody
    public Object IdCheck(MemberVO mvo) {
        logger.info("IdCheck 함수 진입 >>> :");
        
        if (mvo == null) {
            logger.error("MemberVO 객체가 null입니다.");
            return "ID_NO";
        }

        if (mvo.getMid() == null) {
            logger.error("MemberVO의 mid 값이 null입니다.");
            return "ID_NO";
        }

        logger.info("MemberService mvo.getMid() >>> : " + mvo.getMid());

        if (MemberService == null) {
            logger.error("MemberService가 주입되지 않았습니다.");
            return "서비스를 사용할 수 없습니다.";
        }

        List<MemberVO> list = MemberService.IdCheck(mvo);

        if (list == null) {
            logger.error("MemberService.IdCheck가 null을 반환했습니다.");
            return "ID_NO";
        }

        logger.info("IdCheck list.size() >>> : " + list.size());

        String msg;
        if (list.size() == 0) {
            msg = "ID_YES";
        } else {
            msg = "ID_NO";
        }

        return msg;
    }
    
    @GetMapping("NickCheck")
    @ResponseBody
    public Object nickCheck(MemberVO mvo) {
    	logger.info("nickCheck 함수 진입 >>> :");
    	
    	if (mvo == null) {
    		logger.error("MemberVO 객체가 null입니다.");
    		return "NICK_NO";
    	}
    	
    	if (mvo.getMnick() == null) {
    		logger.error("MemberVO의 mid 값이 null입니다.");
    		return "NICK_NO";
    	}
    	
    	logger.info("MemberService mvo.getMnick() >>> : " + mvo.getMnick());
    	
    	if (MemberService == null) {
    		logger.error("MemberService가 주입되지 않았습니다.");
    		return "서비스를 사용할 수 없습니다.";
    	}
    	
    	List<MemberVO> list = MemberService.NickCheck(mvo);
    	
    	if (list == null) {
    		logger.error("MemberService.IdCheck가 null을 반환했습니다.");
    		return "NICK_NO";
    	}
    	
    	logger.info("NickCheck list.size() >>> : " + list.size());
    	
    	String msg;
    	if (list.size() == 0) {
    		msg = "NICK_YES";
    	} else {
    		msg = "NICK_NO";
    	}
    	
    	return msg;
    }

    // 수정
    @GetMapping("memUpdate")
    public String MemberUpdate(HttpServletRequest req, MemberVO mvo) {
        logger.info("MemberUpdate 함수 진입 >>> :"); 
        logger.info("MemberService mvo.getMnum() >>> : " + mvo.getMnum());

        String mhp = req.getParameter("mhp");
        String mhp1 = req.getParameter("mhp1");
        String mhp2 = req.getParameter("mhp2");
        mvo.setMhp((mhp != null ? mhp : "") + 
                   (mhp1 != null ? mhp1 : "") + 
                   (mhp2 != null ? mhp2 : ""));

        String memail = req.getParameter("memail");
        String memail1 = req.getParameter("memail1");
        mvo.setMemail((memail != null ? memail : "") + 
                      "@" + 
                      (memail1 != null ? memail1 : ""));

        mvo.setMzonecode(req.getParameter("mzonecode"));
        mvo.setMroadaddr(req.getParameter("mroadaddr"));
        mvo.setMroaddetail(req.getParameter("mroaddetail"));
        mvo.setMjibunaddr(req.getParameter("mjibunaddr"));

        int nCnt = MemberService.MemberUpdate(mvo);

        if (nCnt == 1) {
            logger.info("MemberUpdate 함수 nCnt >>> : " + nCnt);
            return "member/memUpdate";            
        }

        return "";
    }

    // 삭제
    @GetMapping("memDelete")
    public String MemberDelete(MemberVO mvo) {
        logger.info("MemberDelete 함수 진입 >>> :");
        logger.info("MemberDelete 함수 진입 mvo.getMnum() >>> : " + mvo.getMnum());

        int nCnt = MemberService.MemberDelete(mvo);

        if (nCnt == 1) {
            logger.info("MemberDelete 함수 nCnt >>> : " + nCnt);
            return "member/memUpdate";    
        }

        return "";
    }
}
