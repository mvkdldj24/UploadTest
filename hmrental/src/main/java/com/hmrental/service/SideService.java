package com.hmrental.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.commons.Paging;
import com.hmrental.dao.SDao;

@Service
public class SideService {
	@Autowired
	SDao dao;
	/* 리스트 */
	// 가전 냉장고
	public ArrayList<HashMap<String, String>> ref_page(String c, Integer pnum, HttpServletRequest r) {
		// 페이지 어트리뷰트값 추가
		Paging.procPaging(c, pnum, r);
		return dao.ref_page(pnum);
	}
	// 가전 김치냉장고
	public ArrayList<HashMap<String, String>> kref_page(String c, Integer pnum, HttpServletRequest r) {
		Paging.procPaging(c, pnum, r);
		return dao.kref_page(pnum);
	}
	// 가전 세탁기 페이지
	public ArrayList<HashMap<String, String>> wm_page(String c, Integer pnum, HttpServletRequest r) {
		Paging.procPaging(c, pnum, r);
		return dao.wm_page(pnum);
	}
	// 가전 TV 페이지
	public ArrayList<HashMap<String, String>> tv_page(String c, Integer pnum, HttpServletRequest r) {
		Paging.procPaging(c, pnum, r);
		return dao.tv_page(pnum);
	}
	
	/* 가구 */
	// 침대
	public ArrayList<HashMap<String, String>> b_page(String c, Integer pnum, HttpServletRequest r) {
		Paging.procPaging(c, pnum, r);
		return dao.b_page(pnum);
	}
	// 쇼파
	public ArrayList<HashMap<String, String>> s_page(String c, Integer pnum, HttpServletRequest r) {
		Paging.procPaging(c, pnum, r);
		return dao.s_page(pnum);
	}
	// 식탁
	public ArrayList<HashMap<String, String>> k_page(String c, Integer pnum, HttpServletRequest r) {
		Paging.procPaging(c, pnum, r);
		return dao.k_page(pnum);
	}
	
	/* 헬스 */
	// 의자
	public ArrayList<HashMap<String, String>> ch_page(String c, Integer pnum, HttpServletRequest r) {
		Paging.procPaging(c, pnum, r);
		return dao.ch_page(pnum);
	}
	// 마스크
	public ArrayList<HashMap<String, String>> ma_page(String c, Integer pnum, HttpServletRequest r) {
		Paging.procPaging(c, pnum, r);
		return dao.ma_page(pnum);
	}
	// 사우나
	public ArrayList<HashMap<String, String>> sa_page(String c, Integer pnum, HttpServletRequest r) {
		Paging.procPaging(c, pnum, r);
		return dao.sa_page(pnum);
	}
	// 매트
	public ArrayList<HashMap<String, String>> mt_page(String c, Integer pnum, HttpServletRequest r) {
		Paging.procPaging(c, pnum, r);
		return dao.mt_page(pnum);
	}
	/* 상세 페이지 */
	/* 가전 */
	// 냉장고
	public HashMap<String, String> ref_list(Integer pnum){
		return dao.ref_list(pnum);	
	}
	// 김치 냉장고
	public HashMap<String, String> kref_list(Integer pnum) {
		return dao.kref_list(pnum);
	}
	// 세탁기
	public HashMap<String, String> wm_list(Integer pnum) {
		return dao.wm_list(pnum);
	}
	// TV
	public HashMap<String, String>  tv_list(Integer pnum) {
		return dao.tv_list(pnum);
	}
	
	/* 가구 */
	// 침대
	public HashMap<String, String> b_list(Integer pnum){
		return dao.b_list(pnum);	
	}
	// 쇼파
	public HashMap<String, String> s_list(Integer pnum) {
		return dao.s_list(pnum);
	}
	// 식탁
	public HashMap<String, String> k_list(Integer pnum) {
		return dao.k_list(pnum);
	}
	
	/* 헬스 */
	// 의자
	public HashMap<String, String> ch_list(Integer pnum){
		return dao.ch_list(pnum);	
	}
	// 마스크
	public HashMap<String, String> ma_list(Integer pnum) {
		return dao.ma_list(pnum);
	}
	// 사우나
	public HashMap<String, String> sa_list(Integer pnum) {
		return dao.sa_list(pnum);
	}
	// 매트
	public HashMap<String, String>  mt_list(Integer pnum) {
		return dao.mt_list(pnum);
	}
	
	// 장바구니
	public ArrayList<HashMap<String, String>> basket(HttpSession s) {
		return dao.basket(s);
	}
	// 아이디 세션 확인
	public HashMap<String, String> dtm(HttpSession s) {
		return dao.dtmember(s);
	}
	// 장바구니 36개월 등록
	public void dtin36(HashMap<String, String> m, HashMap<String, String> dtm) {
		 dao.dtinsert36(m, dtm);
	}
	// 장바구니 48개월 등록
	public void dtin48(HashMap<String, String> m, HashMap<String, String> dtm) {
		dao.dtinsert48(m, dtm);
	}
	// 장바구니 60개월 등록
	public void dtin60(HashMap<String, String> m, HashMap<String, String> dtm) {
		dao.dtinsert60(m, dtm);
	}
	
	
	/* 내정보 */
	// 내정보 목록
	public ArrayList<HashMap<String, String>> mypage(HttpSession s) {
		return dao.mypage(s);
	}

	// 연락처 수정
	public void myp_phone(HashMap<String, String> my, HttpSession s) {
		dao.myp_phone(my, s);
	}

	// 이메일 수정
	public void myp_email(HashMap<String, String> my, HttpSession s) {
		dao.myp_email(my, s);
	}

	// 주소 수정
	public void myp_addr(HashMap<String, String> my, HttpSession s) {
		dao.myp_addr(my, s);
	}

	// 비밀번호 수정
	public void myp_pwd(HashMap<String, String> my, HttpSession s) {
		dao.myp_pwd(my, s);
	}
	// 장바구니 제거
	public void delb(Map<String, String> m, HttpSession s) {
		dao.delb(m, s);
	}
	
	// 상품 제거
	public void p_del(HashMap<String, String> m) {
		dao.p_del(m);
	}
	
	// 주문 내역 수정
	public void up_state(HashMap<String, String> hm) {
		dao.up_state(hm);	
	}
	
	// 장바구니 번호 조회
	public HashMap<String, String> b_Search(HashMap<String, String> hm){
		return dao.b_Search(hm);
	}
		
	
}
