package com.hmrental.dao;

import java.util.HashMap;

import org.springframework.stereotype.Component;

import com.commons.Db;

@Component
public class PDao {
	// 냉장고 총글의수 / 페이지수 가져오기 
	public static HashMap<String, String> getCount(String c) {
		String sql = null;
		if(c.equals("ref")) {
			// 냉장고
			sql = String.format("SELECT * FROM V_REF_PAGE");
		} else if(c.equals("kref")) {
			// 김치 냉장고
			sql = String.format("SELECT * FROM V_KREF_PAGE");
		} else if(c.equals("wm")) {
			// 세탁기
			sql = String.format("SELECT * FROM V_WM_PAGE");
		} else if(c.equals("tv")) {
			// tv
			sql = String.format("SELECT * FROM V_TV_PAGE");
		} else if(c.equals("mem")) {
			// 회원
			sql = String.format("SELECT * FROM V_MEM_PAGE");
		}else if(c.equals("b")) {
			// 침대
			sql = String.format("SELECT * FROM V_B_PAGE");
		} else if(c.equals("s")) {
			// 쇼파
			sql = String.format("SELECT * FROM V_S_PAGE");
		} else if(c.equals("k")) {
			// 식탁
			sql = String.format("SELECT * FROM V_K_PAGE");
		} else if(c.equals("ch")) {
			// 의자
			sql = String.format("SELECT * FROM V_CH_PAGE");
		} else if(c.equals("ma")) {
			// 마스크
			sql = String.format("SELECT * FROM V_MA_PAGE");
		} else if(c.equals("sa")) {
			// 사우나
			sql = String.format("SELECT * FROM V_SA_PAGE");
		} else if(c.equals("mt")) {
			// 매트
			sql = String.format("SELECT * FROM V_MT_PAGE");
		} else if(c.equals("ad")) {
			// 주문내역
			sql = String.format("SELECT * FROM V_I_PAGE");
		} else if(c.equals("oall")) {
			// 전체 주문내역
			sql = String.format("SELECT * FROM V_ALL_I_PAGE");
		}
		return Db.selectListMap(sql).get(0);
	}
}
