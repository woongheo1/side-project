package a.b.c.com.project.post.controller;

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
import a.b.c.com.project.post.service.PostService;
import a.b.c.com.project.comment.vo.CommentVO;
import a.b.c.com.project.member.service.MemberService;
import a.b.c.com.project.comment.service.CommentService;
import a.b.c.com.project.post.vo.PostVO;
import a.b.c.com.project.member.vo.MemberVO;


@Controller
public class PostController {
	Logger logger = LogManager.getLogger(PostController.class);
	

	
	// 컨트롤러에서 회원 서비스 연결 
	@Autowired(required=false)
	private PostService postService;
	
	// 컨트롤러에서 회원 서비스 연결 
	@Autowired(required=false)
	private MemberService memberService;
	
	// 컨트롤러에서 회원 서비스 연결 
	@Autowired(required=false)
	private CommentService commentService;

	   @GetMapping("commentForm")
	   public String commentForm() {
	      logger.info("commentForm 함수 진입 >>> : ");   
	      return "comment/postComment";
	   }
	   
	// 댓글 등록
	   @PostMapping("commentInsert")
	   @ResponseBody
	   public String CommentInsert(CommentVO cvo) {   
	   
	      logger.info("CommentInsert cvo) .getPnum() >>> : " + cvo.getPnum());
	                     
     
	      
	      int nCnt = commentService.commentInsert(cvo);
	      logger.info("CommentInsert nCnt >>> : " + nCnt);
	      
	      if (1 == nCnt) { return "OK"; }
	      else { return "NO"; }
	   }
	   
	// 댓글 전체 조회   
	   @PostMapping("CommentSelectAll")
	   @ResponseBody
	   public String commentSelectAll(CommentVO cvo) {   
	      
	      
	      logger.info("CommentSelectAll cvo.getPnum() >>> : " + cvo.getPnum());
	      
	      List<CommentVO> list  = commentService.commentSelectAll(cvo);
	      logger.info("CommentSelectAll list >>> : " + list);
	      
	      String ss = "";
	      String listStr = "";
	      for (int i=0; i < list.size(); i++) {
	         CommentVO _cvo = list.get(i);
	         String s0 = _cvo.getCnum();
	         String s1 = _cvo.getMnick();
	         String s2 = _cvo.getCcontent();
	         String s3 = _cvo.getInsertdate();
	         ss = s0+","+s1+","+s2+","+s3;
	         listStr += ss+"&";
	      }
	      return listStr;
	   }
	
	@GetMapping("postForm")
	public String postForm(MemberVO mvo, Model model) {
	    logger.info("PostForm 함수 진입 >>> : ");
	    logger.info("PostSelect 함수 진입  mvo.getMnick() >>> : " + mvo.getMnick());
	    logger.info("PostSelect 함수 진입  mvo.getMnum >>> : " + mvo.getMnum());

	    // PostVO 객체에서 mnick 값을 가져와서 모델에 추가
	    model.addAttribute("mnick", mvo.getMnick());
	    model.addAttribute("mnum", mvo.getMnum());
	    
	    PostVO pvo = new PostVO();
	    pvo.setMnick(mvo.getMnick());
	    pvo.setMnum(mvo.getMnum());
	    
	    logger.info("pvo.getMnum() >>> : " + pvo.getMnum());
	    
	    
	    return "post/postForm";
	}
	
	
	// 게시판 글쓰기 
	@PostMapping("postInsert")
	public String postInsert(HttpServletRequest req) {
		logger.info("PostInsert 함수 진입 >>> : ");	
		
			
		// 이미지 업로드 
		FileUploadUtil fu = new FileUploadUtil(	 CommonUtils.POST_IMG_UPLOAD_PATH
								                ,CommonUtils.POST_IMG_FILE_SIZE
								                ,CommonUtils.POST_EN_CODE);
		
		// 이미지 파일 원본 사이즈 
		boolean bool = fu.imgfileUpload(req);
		logger.info("PostInsert bool >>> : " + bool);

		PostVO _kbvo = null;
		_kbvo = new PostVO();
			
		_kbvo.setPnum(fu.getParameter("pnum"));
		_kbvo.setPtitle(fu.getParameter("ptitle"));
		_kbvo.setMnum(fu.getParameter("mnum"));
		_kbvo.setPcontent(fu.getParameter("pcontent"));
		_kbvo.setPphoto(fu.getFileName("pphoto"));
		// 취미 				
		String pcategory = "";
		String hobby[] = fu.getParameterValues("pcategory");
		if (hobby.length > 0) {
			for (int i=0; i < hobby.length; i++) {
				pcategory += hobby[i] + ",";
			}	
		}		
		_kbvo.setPcategory(pcategory);
		
		_kbvo.setMnick(fu.getParameter("mnick"));
		
		// 서비스 호출
		int nCnt = postService.postInsert(_kbvo);
		if (nCnt > 0) { 
			logger.info("PostInsert nCnt >>> : " + nCnt);
			return "post/postInsert";
		}
		return "post/postForm";
	}
	
	
	@GetMapping("postLoginSelectAll")
	public String postLoginSelectAll(HttpServletRequest req, MemberVO mvo, PostVO pbvo, Model model) {
		logger.info("postLoginSelectAll 함수 진입 >>> : ");
		
		  String mphoto = req.getParameter("mphoto");
	      String mnick = req.getParameter("mnick");
		
		
		mvo.setMphoto(String.valueOf(mphoto));
		mvo.setMnick(String.valueOf(mnick));
		
		logger.info("mvo.getMphoto() >>> : " + mvo.getMphoto());
		logger.info("mvo.getMnick() >>> : " + mvo.getMnick());
	
		
		
		// 페이징 처리 ====================================================================
		int pageSize = CommonUtils.BOARD_PAGE_SIZE;
		int groupSize = CommonUtils.BOARD_GROUP_SIZE;
		int curPage = CommonUtils.BOARD_CUR_PAGE;
		int totalCount = CommonUtils.BOARD_TOTAL_COUNT;
		
		if (pbvo.getCurPage() !=null){
			curPage = Integer.parseInt(pbvo.getCurPage());
		}
		
		pbvo.setPageSize(String.valueOf(pageSize));
		pbvo.setGroupSize(String.valueOf(groupSize));
		pbvo.setCurPage(String.valueOf(curPage));
		pbvo.setTotalCount(String.valueOf(totalCount));

		logger.info("kosSpringFileUploadSelectAll kbvo.getPageSize() >>> : 	" + pbvo.getPageSize());
		logger.info("kosSpringFileUploadSelectAll kbvo.getGroupSize() >>> : 	" + pbvo.getGroupSize());
		logger.info("kosSpringFileUploadSelectAll kbvo.getCurPage() >>> : 	" + pbvo.getCurPage());
		logger.info("kosSpringFileUploadSelectAll kbvo.getTotalCount() >>> : " + pbvo.getTotalCount());
		// 페이징 처리 ======================================================================================
		
					
		
		// 서비스 호출0
		List<PostVO> listAll = postService.postSelectAll(pbvo);		
		List<MemberVO> _mvo = memberService.MemberSelectAll(mvo);
		if (listAll.size() > 0) { 
			logger.info("PostSelectAll listAll.size() >>> : " + listAll.size());
			
			MemberVO user = _mvo.get(0); 
			
			model.addAttribute("user", user);	
			model.addAttribute("pagingKBVO", pbvo);				
			model.addAttribute("listAll", listAll);
			return "post/postLoginSelectAll_1";
		}		
		return "post/postLoginSelectAll";
	}
	
	// 게시판 전체 조회 
	@GetMapping("postSelectAll")
	public String postSelectAll(PostVO pbvo, Model model) {
		logger.info("PostSelectAll 함수 진입 >>> : ");
		
		// 페이징 처리 ====================================================================
		int pageSize = CommonUtils.BOARD_PAGE_SIZE;
		int groupSize = CommonUtils.BOARD_GROUP_SIZE;
		int curPage = CommonUtils.BOARD_CUR_PAGE;
		int totalCount = CommonUtils.BOARD_TOTAL_COUNT;
		
		if (pbvo.getCurPage() !=null){
			curPage = Integer.parseInt(pbvo.getCurPage());
		}
		
		pbvo.setPageSize(String.valueOf(pageSize));
		pbvo.setGroupSize(String.valueOf(groupSize));
		pbvo.setCurPage(String.valueOf(curPage));
		pbvo.setTotalCount(String.valueOf(totalCount));

		logger.info("kosSpringFileUploadSelectAll kbvo.getPageSize() >>> : 	" + pbvo.getPageSize());
		logger.info("kosSpringFileUploadSelectAll kbvo.getGroupSize() >>> : 	" + pbvo.getGroupSize());
		logger.info("kosSpringFileUploadSelectAll kbvo.getCurPage() >>> : 	" + pbvo.getCurPage());
		logger.info("kosSpringFileUploadSelectAll kbvo.getTotalCount() >>> : " + pbvo.getTotalCount());
		// 페이징 처리 ======================================================================================
		
		// 서비스 호출
		List<PostVO> listAll = postService.postSelectAll(pbvo);		
		if (listAll.size() > 0) { 
			logger.info("PostSelectAll listAll.size() >>> : " + listAll.size());
			
			model.addAttribute("pagingKBVO", pbvo);				
			model.addAttribute("listAll", listAll);
			return "post/postSelectAll";
		}		
		return "post/postSelectAll";
	}
	
	// 게시글 조회 
	@GetMapping("postSelect")
	public String postSelect(PostVO pbvo, Model model) {
		logger.info("postSelect 함수 진입 >>> : ");
		
		logger.info("PostSelect 함수 진입  pbvo.getPnum() >>> : " + pbvo.getPnum());
		
		// 서비스 호출
		List<PostVO> listS = postService.postSelect(pbvo);		
		if (listS.size() == 1) { 
			logger.info("PostSelect listS.size() >>> : " + listS.size());
			
			int bhitCnt = postService.postBhit(pbvo);
			logger.info("PostSelect bhitCnt >>> : " + bhitCnt);
					
			model.addAttribute("listS", listS);
			return "post/postSelect";
		}		
		return "post/postSelectAll";
	}
	
	@GetMapping("postLoginSelectContents")
	public String postLoginSelectContents(MemberVO mvo, PostVO pbvo, Model model) {
		
		logger.info("postLoginSelectContents 함수 진입 >>> : ");
		logger.info("PostSelecContents 함수 진입  pbvo.getpnum() >>> : " + pbvo.getPnum());
		logger.info("PostSelecContents 함수 진입  pbvo.getpnum() >>> : " + mvo.getMphoto());
		logger.info("PostSelecContents 함수 진입  pbvo.getpnum() >>> : " + mvo.getMnick());
		
		model.addAttribute("user", mvo);
		// 서비스 호출
		List<PostVO> listP = postService.postSelect(pbvo);		
		if (listP.size() == 1) { 
			logger.info("PostSelect listS.size() >>> : " + listP.size());
			
			int bhitCnt = postService.postBhit(pbvo);
			logger.info("PostSelect bhitCnt >>> : " + bhitCnt);
					
			model.addAttribute("listP", listP);
			return "post/postLoginSelectContents_1";
		}		
		return "post/postLoginSelectContents";
	}
	
	// 게시글 내용보기  
	@GetMapping("postSelectContents")
	public String postSelecContents(PostVO pbvo, Model model) {
		
		logger.info("PostSelecContents 함수 진입 >>> : ");
		logger.info("PostSelecContents 함수 진입  pbvo.getpnum() >>> : " + pbvo.getPnum());
		
		// 서비스 호출
		List<PostVO> listP = postService.postSelect(pbvo);		
		if (listP.size() == 1) { 
			logger.info("PostSelect listS.size() >>> : " + listP.size());
			
			int bhitCnt = postService.postBhit(pbvo);
			logger.info("PostSelect bhitCnt >>> : " + bhitCnt);
					
			model.addAttribute("listP", listP);
			return "post/postSelectContents";
		}		
		return "post/postSelectAll";
	}
	
	// 게시글 수정 
	@GetMapping("postUpdate")
	public String postUpdate(PostVO pbvo, Model model) {
		logger.info("PostUpdate 함수 진입 >>> : ");
		logger.info("PostDelete 함수 진입 pbvo.getPnum() >>> : " + pbvo.getPnum());
		
		int nCnt = postService.postUpdate(pbvo);
		
		if (nCnt > 0) { 
			logger.info("PostUpdate nCnt >>> : " + nCnt);
			return "post/postUpdate";
		}
		return "#";		
	}
	
	// 게시글 삭제
	@GetMapping("postDelete")
	public String postDelete(PostVO pbvo, Model model) {
		logger.info("PostDelete 함수 진입 >>> : ");
		logger.info("PostDelete 함수 진입 pbvo.getBnum() >>> : " + pbvo.getPnum());
		
		int nCnt = postService.postDelete(pbvo);
		
		if (nCnt > 0) { 
			logger.info("PostDelete nCnt >>> : " + nCnt);
			return "post/postDelete";
		}
		return "#";		
	}
	
	@Autowired(required=false)
	private PostService PostLikeService;
	
	// like_1 등록
	@GetMapping("like_cnt_1")
	@ResponseBody
	public String kosLikecnt_1(PostVO pbvo) {	
		logger.info("Plikes >>> : ");
		
		logger.info("Plikes blvo.getPlikes() >>> : " + pbvo.getPlikes());
		logger.info("Plikes blvo.getMnum() >>> : " + pbvo.getMnum());
		logger.info("Plikes blvo.getPnum() >>> : " + pbvo.getPnum());
		
		List<PostVO> listCnt = postService.postSelect(pbvo);
		logger.info("kosLikecnt_1 listCnt >>> : " + listCnt);
		
		int nCnt = 0;
		if (listCnt !=null && listCnt.size() > 0) {
			nCnt = postService.postLikeUpdate(pbvo);
			logger.info("kosLikecnt_1 nCnt >>> : " + nCnt);			
		}else {
			nCnt = PostLikeService.postLikeInsert(pbvo);
			logger.info("kosLikecnt_1 nCnt >>> : " + nCnt);		
		}
							
		String blike_cnt_1 = "";
		List<PostVO> listAll = postService.postLikeSelect(pbvo);
		if (listAll !=null && listAll.size() > 0) {
			blike_cnt_1 = listAll.get(0).getPlikes();
			logger.info("kosLikecnt_1 blike_cnt_1 >>> : " + blike_cnt_1);		
		}
				
		return blike_cnt_1;
	}
	


}
