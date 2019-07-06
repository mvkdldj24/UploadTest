package com.hmrental.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;

import com.commons.Db;

@Component
public class SDao {
	/* 리스트 */
	// 냉장고 페이지 리스트
	public ArrayList<HashMap<String, String>> ref_page(Integer pnum) {
		String sql = String.format("SELECT * FROM V_R_HA_REF WHERE f_page(R, %s, %s)=1", pnum, 8);
		return Db.selectListMap(sql);
	}
	
	// 김치 냉장고 페이지 리스트
	public ArrayList<HashMap<String, String>> kref_page(Integer pnum) {
		String sql = String.format("SELECT * FROM V_R_HA_KREF WHERE f_page(R, %s, %s)=1", pnum, 8);
		return Db.selectListMap(sql);
	}
	
	// 세탁기 페이지 리스트
	public ArrayList<HashMap<String, String>> wm_page(Integer pnum) {
		String sql = String.format("SELECT * FROM V_R_HA_WM WHERE f_page(R, %s, %s)=1", pnum, 8);
		return Db.selectListMap(sql);
	}
	
	// TV 페이지 리스트
	public ArrayList<HashMap<String, String>> tv_page(Integer pnum) {
		String sql = String.format("SELECT * FROM V_R_HA_TV WHERE f_page(R, %s, %s)=1", pnum, 8);
		return Db.selectListMap(sql);
	}
	
	/* 가구 */
	// 침대
	public ArrayList<HashMap<String, String>> b_page(Integer pnum) {
		String sql = String.format("SELECT * FROM V_R_FT_B WHERE f_page(R, %s, %s)=1", pnum, 8);
		return Db.selectListMap(sql);
	}
	
	// 쇼파
	public ArrayList<HashMap<String, String>> s_page(Integer pnum) {
		String sql = String.format("SELECT * FROM V_R_FT_S WHERE f_page(R, %s, %s)=1", pnum, 8);
		return Db.selectListMap(sql);
	}

	// 식탁
	public ArrayList<HashMap<String, String>> k_page(Integer pnum) {
		String sql = String.format("SELECT * FROM V_R_FT_K WHERE f_page(R, %s, %s)=1", pnum, 8);
		return Db.selectListMap(sql);
	}
	
	/* 헬스 */
	// 의자
	public ArrayList<HashMap<String, String>> ch_page(Integer pnum) {
		String sql = String.format("SELECT * FROM V_R_H_CH WHERE f_page(R, %s, %s)=1", pnum, 8);
		return Db.selectListMap(sql);
	}
	
	// 마스크
	public ArrayList<HashMap<String, String>> ma_page(Integer pnum) {
		String sql = String.format("SELECT * FROM V_R_H_MA WHERE f_page(R, %s, %s)=1", pnum, 8);
		return Db.selectListMap(sql);
	}
	
	// 사우나
	public ArrayList<HashMap<String, String>> sa_page(Integer pnum) {
		String sql = String.format("SELECT * FROM V_R_H_SA WHERE f_page(R, %s, %s)=1", pnum, 8);
		return Db.selectListMap(sql);
	}
	
	// 매트
	public ArrayList<HashMap<String, String>> mt_page(Integer pnum) {
		String sql = String.format("SELECT * FROM V_R_H_MT WHERE f_page(R, %s, %s)=1", pnum, 8);
		return Db.selectListMap(sql);
	}
	
	/* 상세 페이지*/
	/* 가전 */
	// 냉장고
	public HashMap<String, String> ref_list(Integer pnum) {
		String sql = String.format("SELECT * FROM PRODUCT p, HA_TABLE ha, FILES f WHERE p.HA_CODE = ha.HA_CODE AND p.P_NUM = f.P_NUM AND p.HA_CODE = 1 AND p.P_NUM = '%s'", pnum);
		return Db.selectList(sql);
	}
	
	// 김치 냉장고
	public HashMap<String, String> kref_list(Integer pnum) {
		String sql = String.format("SELECT * FROM PRODUCT p, HA_TABLE ha, FILES f WHERE p.HA_CODE = ha.HA_CODE AND p.P_NUM = f.P_NUM AND p.HA_CODE = 2 AND p.P_NUM = '%s'", pnum);
		return Db.selectList(sql);
	}
	
	// 세탁기
	public HashMap<String, String> wm_list(Integer pnum) {
		String sql = String.format("SELECT * FROM PRODUCT p, HA_TABLE ha, FILES f WHERE p.HA_CODE = ha.HA_CODE AND p.P_NUM = f.P_NUM AND p.HA_CODE = 3 AND p.P_NUM = '%s'", pnum);
		return Db.selectList(sql);
	}
	
	// tv
	public HashMap<String, String> tv_list(Integer pnum) {
		String sql = String.format("SELECT * FROM PRODUCT p, HA_TABLE ha, FILES f WHERE p.HA_CODE = ha.HA_CODE AND p.P_NUM = f.P_NUM AND p.HA_CODE = 4 AND p.P_NUM = '%s'", pnum);
		System.out.println(sql);
		return Db.selectList(sql);
	}
	
	/* 가구 */
	// 침대
	public HashMap<String, String> b_list(Integer pnum) {
		String sql = String.format("SELECT * FROM PRODUCT p, FURNITURE ft, FILES f WHERE p.FT_CODE = ft.FT_CODE AND p.P_NUM = f.P_NUM AND p.FT_CODE = 1 AND p.P_NUM = '%s'", pnum);
		return Db.selectList(sql);
	}
	
	// 쇼파
	public HashMap<String, String> s_list(Integer pnum) {
		String sql = String.format("SELECT * FROM PRODUCT p, FURNITURE ft, FILES f WHERE p.FT_CODE = ft.FT_CODE AND p.P_NUM = f.P_NUM AND p.FT_CODE = 2 AND p.P_NUM = '%s'", pnum);
		return Db.selectList(sql);
	}
	
	// 식탁
	public HashMap<String, String> k_list(Integer pnum) {
		String sql = String.format("SELECT * FROM PRODUCT p, FURNITURE ft, FILES f WHERE p.FT_CODE = ft.FT_CODE AND p.P_NUM = f.P_NUM AND p.FT_CODE = 3 AND p.P_NUM = '%s'", pnum);
		return Db.selectList(sql);
	}
	
	/* 헬스 */
	// 의자
	public HashMap<String, String> ch_list(Integer pnum) {
		String sql = String.format("SELECT * FROM PRODUCT p, HEALTH h, FILES f WHERE p.H_CODE = h.H_CODE AND p.P_NUM = f.P_NUM AND p.H_CODE = 1 AND p.P_NUM = '%s'", pnum);
		System.out.println(sql);
		return Db.selectList(sql);
	}
	
	// 마스크
	public HashMap<String, String> ma_list(Integer pnum) {
		String sql = String.format("SELECT * FROM PRODUCT p, HEALTH h, FILES f WHERE p.H_CODE = h.H_CODE AND p.P_NUM = f.P_NUM AND p.H_CODE = 2 AND p.P_NUM = '%s'", pnum);
		return Db.selectList(sql);
	}
	
	// 사우나
	public HashMap<String, String> sa_list(Integer pnum) {
		String sql = String.format("SELECT * FROM PRODUCT p, HEALTH h, FILES f WHERE p.H_CODE = h.H_CODE AND p.P_NUM = f.P_NUM AND p.H_CODE = 3 AND p.P_NUM = '%s'", pnum);
		return Db.selectList(sql);
	}
	
	// 매트
	public HashMap<String, String> mt_list(Integer pnum) {
		String sql = String.format("SELECT * FROM PRODUCT p, HEALTH h, FILES f WHERE p.H_CODE = h.H_CODE AND p.P_NUM = f.P_NUM AND p.H_CODE = 4 AND p.P_NUM = '%s'", pnum);
		return Db.selectList(sql);
	}
	
	// 장바구니
	public ArrayList<HashMap<String, String>> basket(HttpSession s) {
		String sql = String.format("SELECT ROWNUM R, B.* FROM V_B B WHERE B.SI_ID = '%s'", s.getAttribute("loginUser"));
		return Db.selectListMap(sql);
	}
	
	// 아이디 세션 확인
	public HashMap<String, String> dtmember(HttpSession s) {
		String sql = String.format("SELECT SI_NUM FROM SIGNUP WHERE SI_ID = '%s'", s.getAttribute("loginUser"));
		return Db.selectList(sql);
	}
	
	// 장바구니 36개월 등록  
	public void dtinsert36(HashMap<String, String> m, HashMap<String, String> dtm) {
		String sql = String.format("INSERT INTO basket VALUES(b_num.NEXTVAL, '%s', '%s', 0, '%s', 36, '%s')", dtm.get("SI_NUM"), m.get("p_num"), m.get("b_quant"), m.get("sum"));
		Db.executeUpdate(sql);
	}
	// 장바구니 48개월 등록
	public void dtinsert48(HashMap<String, String> m, HashMap<String, String> dtm) {
		String sql = String.format("INSERT INTO basket VALUES(b_num.NEXTVAL, '%s', '%s', 0, '%s', 48, '%s')", dtm.get("SI_NUM"), m.get("p_num"), m.get("b_quant"), m.get("sum"));
		Db.executeUpdate(sql);
	}
	// 장바구니 60개월 등록
	public void dtinsert60(HashMap<String, String> m, HashMap<String, String> dtm) {
		String sql = String.format("INSERT INTO basket VALUES(b_num.NEXTVAL, '%s', '%s', 0, '%s', 60, '%s')", dtm.get("SI_NUM"), m.get("p_num"), m.get("b_quant"), m.get("sum"));
		Db.executeUpdate(sql);
	}
	
	
	/* 내정보 */
	// 내정보 list
	public ArrayList<HashMap<String, String>> mypage(HttpSession s) {
		String sql = String.format("select * from SIGNUP S where SI_ID ='%s'", s.getAttribute("loginUser"));
		return Db.selectListMap(sql);
	}

	// 내 정보 연락처 수정
	public void myp_phone(HashMap<String, String> my, HttpSession s) {
		String sql = String.format("update SIGNUP SET SI_PHONE = '%s' where SI_ID='%s'", my.get("si_phone"),
				s.getAttribute("loginUser"));
		Db.executeUpdate(sql);
	}

	// 내정보 이메일 수정
	public void myp_email(HashMap<String, String> my, HttpSession s) {
		String sql = String.format("update SIGNUP SET SI_EMAIL = '%s' where SI_ID = '%s'", my.get("si_email"),
				s.getAttribute("loginUser"));
		Db.executeUpdate(sql);
	}

	// 내정보 주소 수정
	public void myp_addr(HashMap<String, String> my, HttpSession s) {
		String sql = String.format("update SIGNUP SET SI_ADDR = '%s' where SI_ID = '%s'", my.get("si_addr"),
				s.getAttribute("loginUser"));
		Db.executeUpdate(sql);
	}

	// 내정보 비밀번호 수정
	public void myp_pwd(HashMap<String, String> my, HttpSession s) {
		String sql = String.format("update SIGNUP SET SI_PASS = '%s' where SI_ID = '%s'AND SI_PASS = '%s'",
				my.get("si_pass"), s.getAttribute("loginUser"), my.get("existing_pwd"));
		Db.executeUpdate(sql);
	}
	
	// 장바구니 제거
	public void delb(Map<String, String> m, HttpSession s) {
		System.out.println(m.get("b_num"));
		String sql = String.format("DELETE FROM BASKET WHERE B_NUM = '%s'", m.get("b_num"));
		Db.executeUpdate(sql);
	}
	
	// 상품제거
	public void p_del(HashMap<String, String> m) {
		String sql = String.format("DELETE FROM PRODUCT WHERE P_NUM = '%s'", m.get("p_num"));
		Db.executeUpdate(sql);
	}
	
	// 배송상태 수정
	public void up_state(HashMap<String, String> hm) {
		String sql = String.format("UPDATE INCANTATION SET I_STATE = '%S' WHERE B_NUM = '%s'", hm.get("i_state"), hm.get("b_num"));
		Db.executeUpdate(sql);
	}
	
	// 장바구니 번호 조회
	public HashMap<String, String> b_Search(HashMap<String, String> hm){
		String sql = String.format("SELECT * FROM V_B_1 WHERE B_NUM = '%s'", hm.get("b_num"));
		return Db.selectList(sql);
	}
}
