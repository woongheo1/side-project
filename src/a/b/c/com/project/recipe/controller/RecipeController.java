package a.b.c.com.project.recipe.controller;

import java.util.List;



import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import a.b.c.com.project.member.service.MemberService;
import a.b.c.com.common.CommonUtils;
import a.b.c.com.common.FileUploadUtil;
import a.b.c.com.project.recipe.service.RecipeService;
import a.b.c.com.project.recipe.vo.RecipeVO;
import a.b.c.com.project.member.vo.MemberVO;


@Controller
public class RecipeController {
	
	
	Logger logger = LogManager.getLogger(RecipeController.class);
	
	// 컨트롤러에서 회원 서비스 연결 
	@Autowired(required=false)
	private RecipeService recipeService;


	 // 컨트롤러에서 회원 서비스 연결 
    @Autowired(required=false)
    private MemberService memberService;

	
	@GetMapping("recipeForm")
	public String RecipeForm() {
		logger.info("RecipeForm 함수 진입 >>> : ");
		
		
		return "recipe/recipeForm";
	}
	@GetMapping("recipePage")
	public String RecipePage() {
		logger.info("RecipePage 함수 진입 >>> : ");
		
		
		return "recipe/recipePage";
	}

	// 게시판 글쓰기 
		@PostMapping("recipeInsert")
		public String RecipeInsert(HttpServletRequest req) {
			logger.info("RecipeInsert 함수 진입 >>> : ");	
			

				
			// 이미지 업로드 
			FileUploadUtil fu = new FileUploadUtil(	 CommonUtils.RECIPE_IMG_UPLOAD_PATH
									                ,CommonUtils.RECIPE_IMG_FILE_SIZE
									                ,CommonUtils.RECIPE_EN_CODE);
			
			// 이미지 파일 원본 사이즈 
			boolean bool = fu.imgfileUpload(req);
			logger.info("RecipeInsert bool >>> : " + bool);
			
			
			RecipeVO _rcvo = null;
			_rcvo = new RecipeVO();
				
			_rcvo.setRnum(fu.getParameter("rnum"));
			_rcvo.setRtitle(fu.getParameter("rtitle"));
			_rcvo.setRcontent(fu.getParameter("mnum"));
			_rcvo.setRcategory(fu.getParameter("rcategory"));
			_rcvo.setRcontent(fu.getParameter("rcontent"));
			_rcvo.setRphoto(fu.getFileName("rphoto"));
			
			// 서비스 호출
			int nCnt = recipeService.recipeInsert(_rcvo);
			if (nCnt > 0) { 
				logger.info("RecipeInsert nCnt >>> : " + nCnt);
				return "recipe/recipeInsert";
			}
			return "recipe/recipeForm";
		}
		
		// 게시판 전체 조회 
		@GetMapping("recipeSelectAll")
		public String RecipeSelectAll(RecipeVO rcvo, Model model) {
			logger.info("RecipeSelectAll 함수 진입 >>> : ");
			logger.info("kosSpringFileUploadSelectAll rcvo.getPageSize() >>> : 	" + rcvo.getPageSize());
			logger.info("kosSpringFileUploadSelectAll rcvo.getGroupSize() >>> : 	" + rcvo.getGroupSize());
			logger.info("kosSpringFileUploadSelectAll rcvo.getCurPage() >>> : 	" + rcvo.getCurPage());
			logger.info("kosSpringFileUploadSelectAll rcvo.getTotalCount() >>> : " + rcvo.getTotalCount());
			// 페이징 처리 ======================================================================================
			
			// 서비스 호출
			List<RecipeVO> listAll = recipeService.recipeSelectAll(rcvo);
			int nCnt = listAll.size();
			logger.info("boardSelectAll nCnt >>> : " + nCnt);
			if (listAll != null && listAll.size() > 0) { 
			    logger.info("RecipeSelectAll listAll.size() >>> : " + listAll.size());
			    model.addAttribute("listAll", listAll);
			    return "recipe/recipeSelectAll";
			}
			return "recipe/recipeSelectAll";
		}
		@GetMapping("recipeLoginSelectAll")
		   public String recipeLoginSelectAll(HttpServletRequest req,MemberVO mvo, RecipeVO rbvo, Model model) {
		      logger.info("recipeLoginSelectAll 함수 진입 >>> : ");
		      
		     
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
		      
		     
		      if (rbvo.getCurPage() !=null){
		         curPage = Integer.parseInt(rbvo.getCurPage());
		      }
		      
		      rbvo.setPageSize(String.valueOf(pageSize));
		      rbvo.setGroupSize(String.valueOf(groupSize));
		      rbvo.setCurPage(String.valueOf(curPage));
		      rbvo.setTotalCount(String.valueOf(totalCount));

		      
		      // 페이징 처리 ======================================================================================
		      
		          
		      
		      // 서비스 호출0
		      List<RecipeVO> listAll = recipeService.recipeSelectAll(rbvo);   
		      List<MemberVO> _mvo = memberService.MemberSelectAll(mvo);	
		      if (listAll.size() > 0) { 
		         logger.info("RecipeSelectAll listAll.size() >>> : " + listAll.size());
		         MemberVO user = _mvo.get(0); 
		         
		         model.addAttribute("user", user);            
		         model.addAttribute("pagingKBVO", rbvo);            
		         model.addAttribute("listAll", listAll);
		         return "recipe/recipeLoginSelectAll";
		      }      
		      return "recipe/recipeLoginSelectAll";
		   }

		
		// 레시피 게시글 조회 
		@GetMapping("recipeSelect")
		public String RecipeSelect(RecipeVO rcvo, Model model) {
			logger.info("RecipeSelect 함수 진입 >>> : ");
			
			logger.info("RecipeSelect 함수 진입  rcvo.getRnum() >>> : " + rcvo.getRnum());
			
			// 서비스 호출
			List<RecipeVO> listS = recipeService.recipeSelect(rcvo);		
			if (listS.size() == 1) { 
				logger.info("RecipeSelect listS.size() >>> : " + listS.size());
				
						
				model.addAttribute("listS", listS);
				return "recipe/recipeSelect";
			}		
			return "recipe/recipeSelectAll";
		}
			
		// 레시피 내용보기  
		@GetMapping("recipeSelectContents")
		public String recipeSelectContents(RecipeVO rcvo, Model model) {
			logger.info("recipeSelectContents 함수 진입 >>> : ");
			
			logger.info("recipeSelectContents 함수 진입  rcvo.getRnum() >>> : " + rcvo.getRnum());
			
			// 서비스 호출
			List<RecipeVO> listS = recipeService.recipeSelect(rcvo);		
			if (listS.size() == 1) { 
				logger.info("RecipeSelect listS.size() >>> : " + listS.size());
				
						
				model.addAttribute("listS", listS);
				return "recipe/recipeSelectContents";
			}		
			return "recipe/recipeSelectAll";
		}
		
		// 게시글 수정 
		@GetMapping("recipeUpdate")
		public String RecipeUpdate(RecipeVO rcvo, Model model) {
			logger.info("RecipeUpdate 함수 진입 >>> : ");
			logger.info("RecipeUpdate 함수 진입 rcvo.getRnum() >>> : " + rcvo.getRnum());
			
			int nCnt = recipeService.recipeUpdate(rcvo);
			
			if (nCnt > 0) { 
				logger.info("RecipeUpdate nCnt >>> : " + nCnt);
				return "recipe/recipeUpdate";
			}
			return "recipe/recipeSelectAll";		
		}
		
		// 게시글 삭제
		@GetMapping("recipeDelete")
		public String RecipeDelete(RecipeVO rcvo, Model model) {
			logger.info("RecipeDelete 함수 진입 >>> : ");
			logger.info("RecipeDelete 함수 진입 rcvo.getRnum() >>> : " + rcvo.getRnum());
			
			int nCnt = recipeService.recipeDelete(rcvo);
			
			if (nCnt > 0) { 
				logger.info("kosBoardDelete nCnt >>> : " + nCnt);
				return "recipe/recipeDelete";
			}
			return "recipe/recipeSelectAll";		
		}
	
	
	
	
}
