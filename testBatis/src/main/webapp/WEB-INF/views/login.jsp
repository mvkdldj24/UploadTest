<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
	function del(test_idx) {
		if (confirm("정말 탈퇴하시겠습니까??")) {
			location.href = "delete?test_idx=" + test_idx;
			alert("완료되었습니다.?");
			self.close();
		}
	}
	
</script>

</head>
<body>
	<div id="login">
		<form action="p_dt" method="post">
			<h3>${ sessionScope.testVO.test_id }님로그인완료</h3>
			<table>
				<tr>
					<th>아이디</th>
					<th>${ sessionScope.testVO.test_id}</th>
				</tr>
				<tr>
					<th>비밀번호</th>
					<th>${ sessionScope.testVO.test_pwd }</th>
				</tr>
				<tr>
					<th>이메일</th>
					<th>${ sessionScope.testVO.test_mail }</th>
				</tr>
				<tr>
					<th>전화번호</th>
					<th>${ sessionScope.testVO.test_phone }</th>
				</tr>
			</table>
			<table>
				<tr>
					<td><input type="button" value="회원정보수정"
						onclick="location.href='update'"></td>
					<td><input type="button" value="회원탈퇴"
						onclick="del('${sessionScope.testVO.test_idx}')"></td>
					<td><input type="button" value="로그아웃"
						onclick="location.href='logout'"></td>
				</tr>
				<tr>
					<td><input type="button" value="글쓰기" onclick="location.href ='wr'"></td>
					<td><input type="button" value="글목록" onclick="location.href ='wl'"></td>
					<td><input type="button" value="회원목록" onclick="location.href = 'mbrList'"></td>
				</tr>
				<tr>
				<td><input type="button" value="상품등록" onclick="location.href='product_insert'"></td>
				<td><input type="button" value="파일업로드용" onclick="location.href='upload'"></td>
				<td><input type="submit" value="ex 확인용" ></td>
				</tr>
			</table>


		</form>
	</div>
</body>
</html>