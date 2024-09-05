<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member Form</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- 디바이스에 최적화된 크기로 출력됨 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0
     	maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>     	
     	   
<script  src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script src="/project/js/validation.js"></script>

<script type="text/javascript">
$(document).ready(function() {	
    // 아이디 중복체크 Ajax 비동기 방식  시작  ================================================= 				
		$(document).on("click", "#midbtn", function(){

			let idCheckURL = "IdCheck.k";
			let reqType = "GET";
			let dataParam = { mid: $("#mid").val(), };
			
			$.ajax({
				url: idCheckURL,
				type: reqType,								
				data: dataParam,	            
				success: whenSuccess,
				error: whenError
			});
			
			function whenSuccess(resData){	
				if ("ID_YES" == resData){
					alert("사용가능한 아이디 입니다");														
					$("#mkid").css('background-color','yellow');	
					$("#mid").attr("readonly", true);
					$("#mpw").focus();	
				}else if ("ID_NO" == resData){
					alert("이미 사용중인 아이디 입니다");
					$("#mid").val('');
					$("#mid").focus();
				};				
			}
			function whenError(e){
				alert("e >>> : " + e.responseText);
			}
		});
		
		
		$(document).on("click", "#mnickbtn", function(){

			let nickCheckURL = "NickCheck.k";
			let reqType = "GET";
			let dataParam = { mnick: $("#mnick").val(), };
			
			$.ajax({
				url: nickCheckURL,
				type: reqType,								
				data: dataParam,	            
				success: whenSuccess,
				error: whenError
			});
			
			function whenSuccess(resData){	
				if ("NICK_YES" == resData){
					alert("사용가능한 닉네임 입니다");														
					$("#mnick").attr("readonly", true);
					$("#mid").focus();	
				}else if ("NICK_NO" == resData){
					alert("이미 사용중인 닉네임 입니다");
					$("#mnick").val('');
					$("#mnick").focus();
				};				
			}
			function whenError(e){
				alert("e >>> : " + e.responseText);
			}
		});
		
		
		$("#mpw").on('change', function(){
			let pVal = $("#mpw").val();
			let pBool = pwValidation(pVal);
			alert(pBool);
		});

    // 비밀번호 확인 로직 추가
    $("#pwCheck").click(function(){
        let password = $("#mpw").val();
        let passwordConfirm = $("#mpw_r").val();
        
        if (password === passwordConfirm) {
            alert("비밀번호가 일치합니다.");
        } else {
            alert("비밀번호가 일치하지 않습니다.");
            $("#mpw_r").val(''); // 비밀번호 확인 필드 초기화
            $("#mpw_r").focus();  // 비밀번호 확인 필드에 포커스
        }
    });

    // 생년월일
    $("#mbirth").on("input", function(){
        var m = $("#mbirth");
        if (m.val().length > m.maxlength){
            m.val = m.val.slice(0, m.maxlength);
        }
    });

    // 월 
    $("#mbirth1").append("<option value=''>월--- </option>");
    for(var i = 1; i <= 12; i++){
        if (i < 10){ i = '0' + i; }
        $("#mbirth1").append("<option value='"+ i +"'>"+ i + "</option>");
    }

    // 일 
    $("#mbirth2").append("<option value=''>일 ---</option>");
    for(var i = 1; i <= 31; i++){
        if (i < 10){ i = '0' + i; }
        $("#mbirth2").append("<option value='"+ i +"'>"+ i + "</option>");
    }

    // 우편번호
    $("#mzonecode").prop('readonly', true);
    $("#mroadaddr").prop('readonly', true);
    $("#mgibunaddr").prop('readonly', true);		
    $("#zonecode").click(function(){
        console.log("zonecode >>> : ");
        new daum.Postcode({
            oncomplete: function(data) {
                $("#mzonecode").val(data.zonecode); // 5자리 새우편번호 사용
                $("#mroadaddr").val(data.roadAddress); // 도로명 주소
                $("#mjibunaddr").val(data.jibunAddress); // 지번주소			
            }
        }).open();
    });

    // 이메일 
    $('#memail2').change(function(){	
        $("#memail2 option:selected").each(function () {
            if($(this).val() == '1'){ // 직접입력일 경우 
                var aa = $("#memail1").val();					
                $("#memail1").val(''); // 값 초기화 
                $("#memail1").attr("readonly", false); // 활성화 				
            } else { // 직접입력이 아닐경우 
                $("#memail1").val($(this).text()); // 선택값 입력 
                $("#memail1").attr("readonly", true); // 비활성화 
            }
        }); 
    });

    // 폼태그 데이터 콘트롤러에 보내기 
    $(document).on("click", "#btn", function(){
        alert("btn 버튼 블럭 진입 >>> : ");			
        console.log("btn >>> : ");	
                        
        $('#memForm').attr({
            'action': 'memInsert.k',
            'method': 'POST',
            'enctype': 'multipart/form-data'
        }).submit();
    });
}); 
</script>

<style type="text/css">
    /* 전체 컨테이너 정렬 */
    div {
        margin: 0 auto;
        padding: 20px;
        max-width: 600px; 
        border: 2px solid rgb(234, 198, 155); 
        border-radius: 10px; 
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
    }

    /* 테이블 스타일 */
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }

    th, td {
        padding: 10px;
        border: 1px solid #ddd;
        text-align: left;
    }

    th {
        background-color: rgb(234, 198, 155);
        color: white;
    }

    /* 제목 스타일 */
    h3 {
        text-align: center;
        color: rgb(234, 198, 155);
    }

    /* 입력 필드 스타일 */
    input[type="text"], input[type="password"], select {
        width: 100%;
        padding: 10px;
        margin: 5px 0;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-sizing: border-box;
    }

    /* 버튼 스타일 */
    button {
        width: 49%;
        background-color: rgb(234, 198, 155);
        color: white;
        padding: 15px 0;
        margin: 10px 0;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

    button:hover {
        background-color: rgb(116, 65, 3);;
    }

    /* 툴팁 스타일 */
    .tooltip {
        position: relative;
        display: inline-block;
    }

    .tooltip .tooltiptext {
        visibility: hidden;
        width: 260px;
        background-color: white;
        color: rgb(234, 198, 155);
        text-align: left;
        border-radius: 6px;
        padding: 5px 10px;
        font-size: 14px;
        border: 1px solid rgb(234, 198, 155);
        position: absolute;
        bottom: 140%;
        left: 50%;
        margin-left: -130px;
        z-index: 1;
    }

    .tooltip:hover .tooltiptext {
        visibility: visible;
    }
</style>



</head>
<body>
<h3><font size="5" style="color:rgb(116, 65, 3);"> 회원가입</font></h3>
<hr>
<div>
<form name="memForm" id="memForm">
<table>
<tr>
<td>번호</td>
<td><input type="text" name="mnum" id="mnum" readonly></td>
</tr>
<tr>
<td>이름</td>
<td><input type="text" name="mname" id="mname" style="width:150px"/></td>
</tr>
<tr>
<td>닉네임</td>
<td><input type="text" name="mnick" id="mnick" style="width:150px"/>
	<input type="button" name="mnickbtn" id="mnickbtn" value="닉네임중복확인"  />
</td>

</tr>
<tr>
<td>아이디</td>
<td>
	<input type="text" name="mid" id="mid" placeholder="아이디" style="width:100px" />
	<input type="button" name="midbtn" id="midbtn" value="아이디중복확인"  />
</td>
</tr>
<tr>
<td>비밀번호</td>
<td>
	<input type="password" class="imf" name="mpw" id="mpw" placeholder="비밀번호 8자리 이상" style="width:100px" maxlength="16"/>
	<input type="password" name="mpw_r" id="mpw_r" placeholder="비밀번호확인" style="width:100px" maxlength="16"/>
	<input type="button" value="비밀번호확인" id="pwCheck"/><br/>
</td>
</tr>
<tr>
<td>생년월일</td>
<td>		
	<input type="text" name="mbirth" id=mbirth 
	       placeholder="년(4자)" maxlength="4" style="width:80px"/>
	<select name="mbirth1" id="mbirth1" style="width:80px"></select>
       <select name="mbirth2" id="mbirth2" style="width:80px"></select>
</td>
</tr>
<tr>
<td>전화번호</td>
<td>
	<select name="mhp" id="mhp" style="width:80px">
		<option value="010">010</option>
		<option value="011">011</option>
		<option value="016">016</option>
		<option value="017">017</option>		        	
	</select>
	- <input type="text" name="mhp1" id="mhp1" size="2" style="width:80px"/>
	- <input type="text" name="mhp2" id="mhp2" size="2" style="width:80px"/>
</td>
</tr>
<tr>
<td>이메일</td>
<td>		
	<input type="text" name="memail" id="memail" style="width:100px" />
	@ <input type="text" name="memail1" id="memail1" style="width:100px" placeholder="직접입력" />
	<select name="memail2" id="memail2" style="width:100px;margin-right:10px">
		<option value="1" selected>직접입력</option>
		<option value="naver.com">naver.com</option>	       	   
		<option value="gmail.com">gmail.com</option>
		<option value="daum.net">daum.net</option>	       	   
	</select>
</td>
</tr>
<tr>
<td>우편번호</td>
<td>
	<input type="text" name="mzonecode" id="mzonecode" placeholder="우편번호" style="width:80px">
	<input type="button" name="zonecode" id="zonecode" value="우편번호 찾기"><br>	 	
	<input type="text" name="mroadaddr" id="mroadaddr" placeholder="도로명주소" style="width:250px"><br>	 	
	<input type="text" name="mroaddetail" id="mroaddetail" placeholder="도로명주소 상세주소" style="width:250px"><br>	 	
	<input type="text" name="mjibunaddr" id="mjibunaddr" placeholder="지번주소" style="width:250px">
</td>
</tr>
<tr>
<td>프로필사진</td>
<td><input type="file" name="mphoto"  />
<br></td>
</tr>
<tr>

<tr>
<td colspan="2"> 			
	<button type="button" id="btn">회원가입</button>
	<button type="reset">리셋</button>
</td>				
</tr>
</table>
</form>
</div>
</body>
</html>
