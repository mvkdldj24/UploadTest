package com.test.dao;

import java.util.HashMap;
import java.util.Map;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.test.vo.BoardVO;
import com.test.vo.ProductVO;
import com.test.vo.TestVO;

public class TestDAO {

	SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		System.out.println("dao생성");
		this.sqlSession = sqlSession;
	}

	// 회원가입
	public void insert(TestVO testVO) {
		System.out.println("insert dao");

		sqlSession.insert("mapper.insertData", testVO);

	}

	public TestVO getData(Map<String, String> inputData) {
		System.out.println("testDAO" + inputData);
		TestVO vo = (TestVO) sqlSession.selectOne("mapper.getData", inputData);

		return vo;
	}

	public void delete(int test_idx) {
		System.out.println("dao delete" + test_idx);
		sqlSession.delete("mapper.delete", test_idx);

	}

	public void update(TestVO vo) {
		sqlSession.update("mapper.update", vo);

	}

	// 아이디 중복체크
	public boolean checkId(String paramId) {

		System.out.println("아이디중복체크 dao");
		boolean res = false;
		System.out.println("paramId=" + paramId);

		String id = sqlSession.selectOne("mapper.checkId", paramId.toLowerCase());
		System.out.println("test id = " + id);

		if (id == null) {
			res = true;
		}
		System.out.println(res);
		return res;
	}

	// 글등록
	public void writ_insert(BoardVO boardVO) {
		System.out.println("writ_insert_dao");
		sqlSession.insert("mapper.w_insert", boardVO);

	}

	// 글 리스트
	public List<BoardVO> w_list() {
		List<BoardVO> list = null;

		list = sqlSession.selectList("mapper.w_list");

		return list;
	}

	// 글 상세정보
	public List<BoardVO> w_dt(int w_no) {
		List<BoardVO> list = null;

		list = sqlSession.selectList("mapper.w_dt", w_no);

		return list;
	}

	// 회원목록
	public List<TestVO> mbr_list() {
		System.out.println("회원DAO");
		List<TestVO> list = null;

		list = sqlSession.selectList("mapper.mbr_list");

		return list;
	}

	// 차량 등록
	public void p_insert(ProductVO productVO) {
		System.out.println("차량등록DAO등장");

		sqlSession.insert("product.pinsert", productVO);

	}

	// 차량 정보 조회
	public List<ProductVO> p_select() {
		System.out.println("차량정보조회 DAO");
		List<ProductVO> list = null;
		list = sqlSession.selectList("product.select");

		return list;
	}

}
