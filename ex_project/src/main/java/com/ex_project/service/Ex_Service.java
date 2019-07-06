package com.ex_project.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import com.ex_project.dao.Ex_Dao;

@org.springframework.stereotype.Service
public class Ex_Service {

	@Autowired
	Ex_Dao dao;

	// 회원 가입
	public void insert(Map<String, String> d) {

		dao.insert(d);
	}

	// 상품 판매
	public void sale_insert(Map<String, String> d) {
		System.out.println("상품 SEr" + d);
		dao.sale_insert((Map<String, String>) d);
	}

	// 회원 목록 조회
	public ArrayList<HashMap<String, String>> mbr_select(Model m) {
		return dao.mbr_list();
	}

	// 판매 목록 조회
	public ArrayList<HashMap<String, String>> sale_select(Model m) {
		return dao.sale_list();
	}

	// 회원, 상품 조회
	public ArrayList<HashMap<String, String>> mselect(Model m) {
		return dao.m_select();
	}

	// 회원, 상품 조회
	public ArrayList<HashMap<String, String>> gselect(Model m) {
		return dao.g_select();
	}

	// 특정 회원 조회
	public ArrayList<HashMap<String, String>> mbr_dt(String mbr_no) {
		return dao.mbr_dt(mbr_no);
	}

	// 제품 상세
	public ArrayList<HashMap<String, String>> goods_dt(String goods_no) {
		return dao.goods_dt(goods_no);
	}

	// 상품등록 페이지
	public void g_insert(Map<String, String> d) {
		System.out.println("ser" + d);
		dao.g_insert(d);
	}

	// 상품 조회
	public ArrayList<HashMap<String, String>> goodslist() {
		return dao.goodslist();
	}

	// 로그인
	public ArrayList<HashMap<String, String>> login(String mbr_nm) {
		return dao.login(mbr_nm);
	}

}
