<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!--<%@ page import="a.b.c.com.project.post.vo.PostVO" %> -->
<%@ page import="a.b.c.com.project.comment.vo.CommentVO" %> 
<%@ page import="a.b.c.com.project.member.vo.MemberVO" %> 
<%@ page import = "java.util.List" %>
<%@ page import = "java.util.ArrayList" %>

<%@ page import=" org.apache.log4j.LogManager" %>
<%@ page import="org.apache.log4j.Logger" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		
		//rkbcontent 길이 제한 200byte
		$("#commentcontent").keyup(function(){
			cut_200(this); 
		});
		
		// 댓글 전체 불러오기 
		selectAll();
		
		// 댓글 등록
		$(document).on("click", "#insertBtn", function(){
			console.log("insertBtn >>> : ");
			
			let insertURL = "commentInsert.k";		
			let method = "POST";
			let dataParam = {
				pnum: $("#pnum").val(),
				mnick: $("#mnick").val(),
				ccontent: $("#commentContent").val(),
			};
			dataParam = $("#commentForm").serialize();
			console.log("dataParam >>> : " + dataParam);
			
			$.ajax({
				url: insertURL,
				type: method,
				data: dataParam,
				success: whenSuccess,
				error: whenError
			});
			
			function whenSuccess(resData){	
				alert("resData >>> : " + resData);	
				if ("OK" == resData){
					// 입력데이터 초기화 함수호출 
					commentFormData();
					location.reload();
					selectAll();
				}
			}
			function whenError(e){
				alert("e >>> : " + e.responseText);
			}
			
			// selectAll();
		});
		
		// 댓글 삭제		
		$(document).on("click", ".deleteBtn", function(){
			console.log("D >>> : ");
			
			var rbnumV = $(this).parents("li").attr("dataNum");
			alert("pnumV >>> : " + pnumV);
			var target = $(this).parents(".commentItem");
			console.log("target >>> : " + target);
			
			let deleteURL = "commentDelete.k";
			let method = "POST";
			let dataParam = {
				cnum: $('#cnum').val(cnumV),				
			};		
			dataParam = $("#commentForm").serialize();
			console.log("dataParam >>> : " + dataParam);
			
			$.ajax({
				url: deleteURL,
				type: method,
				data: dataParam,
				success: whenSuccess,
				error: whenError
			});
			
			function whenSuccess(resData){					
				console.log("resData >>> : " + resData);				
				if ("OK" == resData){
					alert("댓글이 삭제되었습니다.");
					target.remove();
				}	
			}
			function whenError(e){
				console.log("e >>> : " + e.responseText);
			}
		});
	});
	
	
	// 게시글 번호로 댓글 전체조회 ============================================
	function selectAll(){
					
		console.log("SALL >>> : ");
		
		let selectAllURL = "CommentSelectAll.k";
		let method = "POST";
		let dataParam = {
			pnum: $("#pnum").val(),				
		};		
		dataParam = $("#commentForm").serialize();
		console.log("dataParam >>> : " + dataParam);
		
		$.ajax({
			url: selectAllURL,
			type: method,
			data: dataParam,
			success: whenSuccess,
			error: whenError
		});
		
		function whenSuccess(resData){	
			console.log("resData >>> : " + resData);
			console.log("whenSuccess commentSelectAll resData >>> : " + resData);
			
			if(isEmpty(resData)){
				return false;
			}
			
			
			let v = resData.split("&");
			for(let i=0; i < v.length; i++){
				console.log(v[i]);
				let vv = v[i].split(",");
				let j=0
				for (; j < vv.length-1; j++){
					console.log("vv[0] >>> : " + vv[0]);
					console.log("vv[1] >>> : " + vv[1]);
					console.log("vv[2] >>> : " + vv[2]);
					console.log("vv[3] >>> : " + vv[3]);					
				}
				addNewItem(vv[0], vv[1], vv[2], vv[3]);
			}
		}
		function whenError(e){
			console.log("e >>> : " + e.responseText);
		}	
	}
	// 게시글 번호로 댓글 전체조회 ============================================
		
	//새로운 글 화면에 추가	=================================================
	function addNewItem(num, writer, content, datetime){
		
		//데이터 체크
		if(isEmpty(num)) return false;
		
		// 새로운 글이 추가될 li태그 
		var newLi = $("<li>");
		newLi.attr("dataNum", num);
		newLi.addClass("commentItem");
		// 작성자 정보가 지정될 <p> 태그 
		var writerP = $("<p>");
		writerP.addClass("writer");
		// 작성자 정보의 이름 
		var nameSpan = $("<span>");
		nameSpan.addClass("name");
		nameSpan.html(decodeURIComponent(writer) + "님");
		// 작성일시 
		var dateSpan = $("<span>");
		dateSpan.html(" / " + datetime + " ");
		// 삭제 버튼 
		var delInput = $("<input>");
		delInput.attr({"type":"button", "value":"삭제하기"});
		delInput.addClass("deleteBtn");
		// 내용
		var contentP = $("<p>");
		contentP.html(decodeURIComponent(content));
		
		// 조립하기
		writerP.append(nameSpan).append(dateSpan).append(delInput);
		newLi.append(writerP).append(contentP);
		$("#commentlist").append(newLi);
	}
	// 새로운 글 화면에 추가	=================================================
	
	// 댓글 길이 체크  ========================================================
	//한글 포함 문자열 길이
	
	
	function getTextLength(s){
		var len = 0;
		for(var i=0; i < s.length; i++){
			if(escape(s.charAt(i)).length == 6){
				len++;
			}
			len++;
		}
		return len;
	}
	function cut_200(obj){
		var t = $(obj).val();
		var l = t.length;
		while(getTextLength(t) > 200){
			l--;
			t= t.substring(0, l);
		}
		$(obj).val(t);
		$('.bytes').text(getTextLength(t));
	}
	// 댓글 길이 체크  ========================================================
	
	//댓글 등록 후 입력창 초기화
	function commentFormData(){
		$("#mnick").val("");
		$("#pcontent").val("");
	}
	
	//데이터 체크
	function isEmpty(val){
		if(typeof val=="undefined" || val==null || val==""){
			return true;
		}else{
			return false;
		}
	}

</script>
</head>
<body>
<h3 style="text-align:center">댓글</h3>
<hr>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("commentForm.jsp 페이지 >>> : ");

	String pnum = request.getParameter("pnum");
	
	MemberVO mvo = (MemberVO) request.getAttribute("user");
	
	logger.info("commentForm.jsp pnum >>> : " + pnum);
%>
<div id="rbwriterdiv">
<form name="commentForm" id="commentForm">
<table>
<tr>
	<td>작성자</td>
	<td>
		<input type="text" name="mnick" id="mnick" value="<%= mvo.getMnick() %>" readonly/> 
		<input type="text" name="pnum" id="pnum" readonly>
		<input type="hidden" name="cnum" id="cnum">
	    <input type="button" value="저장하기" id="insertBtn">
	</td>
</tr>
<tr>
	<td>덧글 내용</td>
	<td>
		<textarea name="commentContent" id="commentContent" rows="5" cols="50" style="resize: none"></textarea>	
		<div><span class="bytes">0</span>bytes</div>
	</td>	
</tr>
</table>
<hr>
<ul name="commentlist" id="commentlist">
	<!-- 여기에 동적 생성 요소가 들어온다. -->
</ul>
</form>
</div>
</body>
</html>