package a.b.c.com.project.comment.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;

import a.b.c.com.common.CommonUtils;
import a.b.c.com.common.FileUploadUtil;
import a.b.c.com.project.comment.service.CommentService;
import a.b.c.com.project.comment.vo.CommentVO;

public class CommentController {
	 Logger logger = LogManager.getLogger( CommentController.class);
	   

	   

	   @Autowired(required=false)
	   private CommentService commentService;
	   
	   
	   @GetMapping("commentForm")
	   public String commentForm() {
	      logger.info("commentForm 함수 진입 >>> : ");   
	      return "#";
	   }
	   
	   // 댓글 등록
	   @PostMapping("CommentInsert")
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
	   
	   // 댓글 삭제   
	   @PostMapping("CommentDelete")
	   @ResponseBody
	   public String commentDelete(CommentVO cvo) {   
	      
	      logger.info("CommentDelete cvo.getCnum() >>> : " + cvo.getCnum());
	   
	      int nCnt  = commentService.commentDelete(cvo);
	      logger.info("CommentDelete nCnt >>> : " + nCnt);
	      
	      if (1 == nCnt) { return "OK"; }
	      else { return "NO"; }
	   }

	}

