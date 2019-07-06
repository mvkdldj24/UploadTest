package com.ex_project.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Component;

import commons.Db;

@Component
public class Ex_Dao {

	// mbr_insert
	public void insert(Map<String, String> d) {
		String sql = String.format("INSERT INTO MBR_INFO values(mbr_seq.nextval, '%s', '%s', '%s', '%s', '%s')",
				d.get("mbr_id"), d.get("mbr_nm"), d.get("mbr_pw"), d.get("mbr_tel"), d.get("mbr_addr"));
		Db.executeUpdate(sql);
	}

	// sale_insert
	public void sale_insert(Map<String, String> d) {
		String sql = String.format("INSERT INTO STORE_INFO values(sale_seq.nextval, '%s', %s, %s)", d.get("sale_time"), d.get("goods_no"),  d.get("mbr_no"));
		Db.executeUpdate(sql);
	}

	// 회원목록 조회
	public ArrayList<HashMap<String, String>> mbr_list() {
		return Db.selectListMap("SELECT * FROM mbr_info");
	}

	// 판매 현황 조회
	public ArrayList<HashMap<String, String>> sale_list() {
		return Db.selectListMap(
				"SELECT * FROM STORE_INFO S, GOODS_INFO G, MBR_INFO M WHERE S.MBR_NO = M.MBR_NO AND S.GOODS_NO = G.GOODS_NO order by s.store_no asc");
	}

	// 회원, 상품 조회
	public ArrayList<HashMap<String, String>> m_select() {
		return Db.selectListMap("select * from mbr_info");
	}
	
	// 상품 조회 
	public ArrayList<HashMap<String, String>> g_select() {
		return Db.selectListMap("select * from goods_info order by goods_no asc");
	}
	
	//회원 상세 페이지
	public ArrayList<HashMap<String, String>> mbr_dt(String mbr_no){
		System.out.println("dao" + mbr_no);
		return Db.selectListMap("select * from mbr_info where mbr_no="+ mbr_no);
	}
	
	//제품 상세 페이지
	public ArrayList<HashMap<String, String>> goods_dt(String goods_no){
		return Db.selectListMap("SELECT * FROM GOODS_INFO where GOODS_NO = " + goods_no);
	}
	
	//제품 등록
	public void g_insert(Map<String, String> d) {
		System.out.println("dao" + d);
		String sql = String.format("INSERT INTO GOODS_INFO VALUES(goods_seq.nextval,'%s','%s','%s')",d.get("goods_nm"),d.get("goods_pr"),d.get("goods_co"));
		Db.executeUpdate(sql); 
	}
	
	public ArrayList<HashMap<String, String>> goodslist(){
		return Db.selectListMap("select * from goods_info order by GOODS_NO");
	}
	
	//로그인
	public ArrayList<HashMap<String, String>> login(String mbr_nm){
		System.out.println("login"+ mbr_nm);
		return Db.selectListMap("select * from mbr_info where mbr_id = '"+mbr_nm+"'");
	}
	
}
