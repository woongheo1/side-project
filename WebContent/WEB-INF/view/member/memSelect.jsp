<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="org.apache.log4j.LogManager" %>  
<%@ page import="org.apache.log4j.Logger" %>    
    
<%@ page import="a.b.c.com.project.member.vo.MemberVO" %> 
<%@ page import="a.b.c.com.common.CodeUtil" %> 
<%@page import="a.b.c.com.common.EncryptAES"%>   
<%@ page import="java.util.List" %>

<% request.setCharacterEncoding("UTF-8");%> 
<%
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("memSelect.jsp >>> : ");
%>
<%
	Object obj = request.getAttribute("listS");
	if (obj == null) return;
	
	List<MemberVO> list = (List<MemberVO>)obj;
	int nCnt = list.size();
	
	String mpw = "";
	String mbirth = "";
	String mbirth0 = "";
	String mbirth1 = "";
	String mbirth2 = "";
	String mhp = "";
	String mhp0 = "";
	String mhp1 = "";
	String mhp2 = "";
	String memail = "";	
	String memails[] = null;
	
	MemberVO _mvo = null;
	_mvo = list.get(0);
	
	// 패스워드 
	EncryptAES ase = EncryptAES.getInstance();
	mpw = ase.aesDecode(_mvo.getMpw());
	logger.info("mpw >>> : " + mpw);	
	
	// 생년월일 
	mbirth = CodeUtil.birth(_mvo.getMbirth());
	String birth[] = mbirth.split("-");
	mbirth0 = birth[0];
	mbirth1 = birth[1];
	mbirth2 = birth[2];
	
	// 핸드폰
	mhp = CodeUtil.hp(_mvo.getMhp());
	String hp[] = mhp.split("-");
	mhp0 = hp[0];
	mhp1 = hp[1];
	mhp2 = hp[2];
	
	// 이메일
	memail = _mvo.getMemail();
	memails = memail.split("@");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>