package com.hmrental.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;

import com.commons.Db;

@Component
public class MDao {
	// 회원 리스트
	public ArrayList<HashMap<String, String>> select(){
		return Db.selectListMap("SELECT * FROM signup");
	}
	
	// 아이디 중복체크
	public ArrayList<HashMap<String, String>> confirmID(String m){
		String sql = String.format("SELECT SI_ID FROM SIGNUP WHERE SI_ID = '%s'", m);
		return Db.selectListMap(sql);
	}
	// 아이디 찾기
	public HashMap<String, String> idSearch(Map<String, String> m){
		String sql = String.format("SELECT si_id FROM SIGNUP WHERE SI_NAME='%s' AND si_birth = '%s'", m.get("si_name"), m.get("si_birth"));
		return Db.selectList(sql);
	}	
	// 비밀번호 찾기
		public HashMap<String, String> pwdSearch(Map<String, String> m){
			String sql = String.format("SELECT si_pass FROM SIGNUP WHERE SI_ID='%s' AND SI_NAME='%s' AND si_birth = '%s'", m.get("si_id"), m.get("si_name"), m.get("si_birth"));
			return Db.selectList(sql);
		}
	// 회원가입
	public void mbinsert(Map<String, String> m) {
		String sql = String.format("INSERT INTO SIGNUP VALUES (si_num.NEXTVAL, '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s')", m.get("si_id"), m.get("si_pass"), m.get("si_name"), m.get("si_birth"), m.get("si_gender"), m.get("si_addr"), m.get("si_phone"), m.get("si_email"));
		// System.out.println(sql);
		Db.executeUpdate(sql);
	}
	
	// 로그인
	public ArrayList<HashMap<String, String>> login(Map<String, String> m) {
		String sql = String.format("SELECT * FROM signup WHERE si_id = '%s' AND si_pass = '%s'", m.get("si_id"), m.get("si_pass"));
		return Db.selectListMap(sql);
	}
	
	// 제품 등록
	public void dtinsert(Map<String, String> m, String photo) {
		String hacode = "0";String ftcode = "0"; String hcode = "0";
		if(m.get("category1").equals("1")) {
			hacode = m.get("category2");
		} else if(m.get("category1").equals("2")) {
			ftcode = m.get("category2");
		} else if(m.get("category1").equals("3")) {
			hcode = m.get("category2");
		}
		String sql = String.format("INSERT INTO product VALUES (p_num.NEXTVAL, '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s','%s', '%s', '%s', '%s')", m.get("p_name"), m.get("p_mname"), m.get("p_size"), m.get("p_company"), m.get("p_color"), m.get("p_36"), m.get("p_48"), m.get("p_60"), hacode, ftcode, hcode, photo);
		Db.executeUpdate(sql);
	}
	
	// 제품 파일등록
	public HashMap<String, String> dtnum() {
		return Db.selectList("SELECT * FROM V_P_NUM");
	}
	// file insert
	public void fInsert(String p_num, String f_name){
		String sql = String.format("INSERT INTO FILES VALUES (f_num.NEXTVAL, '%s', '%s')", p_num, f_name);
		Db.executeUpdate(sql);
	}
	
	// 결제
	public ArrayList<HashMap<String, String>> payinsert(Map<String, String> m) {
		String pa_cnum = m.get("pa_cnum1") + m.get("pa_cnum2") + m.get("pa_cnum3") + m.get("pa_cnum4");
		String pa_cdate = m.get("pa_cdate1") + m.get("pa_cdate2");
		String sql = String.format("SELECT * FROM PAYMENT WHERE PA_CNUM = '%s' AND PA_PASS = '%s' AND PA_CDATE = '%s' AND PA_NAME = '%s' AND PA_COMP = '%s'", pa_cnum , m.get("pa_pass"), pa_cdate, m.get("pa_name"),  m.get("pa_comp"));
		return Db.selectListMap(sql);
	}
	// 회원 정보
	public ArrayList<HashMap<String, String>> m_list(HashMap<String, String> m) {
		String sql = String.format("SELECT * FROM SIGNUP si WHERE si.SI_ID = '%s'", m.get("SI_ID"));
		return Db.selectListMap(sql);
	}
	
	// 주문 내역 페이지
	public ArrayList<HashMap<String, String>> ad_select_page(Integer pnum) {
		String sql = String.format("SELECT * FROM V_R_I WHERE f_page(R, %s, %s)=1", pnum, 5);
		return Db.selectListMap(sql);
	}
	
	// 주문내역
	public ArrayList<HashMap<String, String>> adselect(Integer pnum, HttpSession s){
		String sql = String.format("SELECT * FROM (SELECT ROWNUM R,I.* FROM V_I I WHERE SI_ID = '%s') P WHERE f_page(P.R, '%s', 5)=1", s.getAttribute("loginUser"), pnum);
		return Db.selectListMap(sql);
	}
	// 관리자 주문내역
	public ArrayList<HashMap<String, String>> ad_select(Integer pnum, HashMap<String, String> m) {
		String sql = String.format("SELECT * FROM (SELECT ROWNUM R,I.* FROM V_I I WHERE SI_ID = '%s') P WHERE f_page(P.R, '%s', 5)=1", m.get("SI_ID"), pnum);
		return Db.selectListMap(sql);
	}
	
	// 전체 주문내역
	public ArrayList<HashMap<String, String>> o_list() {
		return Db.selectListMap("SELECT ROWNUM R, P.* FROM V_ALL_I P");
	}
	
	// 바로 결제
	public void pay(HashMap<String, String> m) {
		String sql = String.format("UPDATE BASKET b SET B_S = 1 WHERE P_NUM = '%s'", m.get("p_num"));
		Db.executeUpdate(sql);
	}
	
	// 바로 결제 장바구니 불러오기
	public HashMap<String, String> p_s(HttpSession s) {
		String sql = String.format("SELECT * FROM V_R_B_1 WHERE SI_ID = '%s' AND R = 1", s.getAttribute("loginUser"));
		return Db.selectList(sql);
	}
	
	// 바로 결제 -> 주문내역
	public void p_ad(HashMap<String, String> mm, HttpSession s) {
		HashMap<String, String> mb = (HashMap<String, String>) s.getAttribute("order_date");
		String i_phone = mb.get("tel_1") + "-" + mb.get("tel_2") + "-" + mb.get("tel_3");
		String sql = String.format("INSERT INTO INCANTATION VALUES (i_num.NEXTVAL, '%s', '%s', '%s', '%s', '결제완료')",
				mm.get("B_NUM"), mb.get("i_name"), i_phone, mb.get("i_addr"));
		Db.executeUpdate(sql);
	}
	
	// 주문내역으로 담기
	public void r_pay(HashMap<String, String> mm) {		
		String sql = String.format("UPDATE BASKET b SET B_S = 1 WHERE P_NUM = '%s'", mm.get("P_NUM"));
		Db.executeUpdate(sql);
	}
	
	// 주문내역으로 담기
	public void r_p_ad(HashMap<String, String> mm, HttpSession s) {
		HashMap<String, String> mb = (HashMap<String, String>) s.getAttribute("order_date");
		String i_phone = mb.get("tel_1") + "-" + mb.get("tel_2") + "-" + mb.get("tel_3");
		String sql = String.format("INSERT INTO INCANTATION VALUES (i_num.NEXTVAL, '%s', '%s', '%s', '%s', '결제완료')",
				mm.get("B_NUM"), mb.get("i_name"), i_phone, mb.get("i_addr"));
		Db.executeUpdate(sql);
	}
	
	
}
