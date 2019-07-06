package com.hmrental.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.commons.Paging;
import com.hmrental.dao.MDao;


@Service
public class MbService {
	@Autowired
	String ha_upath;
	
	@Autowired
	String f_upath;
	
	@Autowired
	String h_upath;
	
	@Autowired
	MDao dao;
	
	// 회원 등록
	public void mbinsert(Map<String, String> m) {
		dao.mbinsert(m);	
	}
	
	// 회원 리스트
	public ArrayList<HashMap<String, String>> mlist(Integer pnum, HttpServletRequest r) {
		String c = "mem";
		Paging.procPaging(c, pnum, r);
		return dao.select();
	}
	
	// 회원 정보
	public ArrayList<HashMap<String, String>> m_list(HashMap<String, String> m) {
		return dao.m_list(m);
	}
	
	// 로그인
	public void login(Map<String, String> m) {
		dao.login(m);
	}
	
	// 아이디 중복 체크
	public int idCheck(String m) {
		if(dao.confirmID(m).size() == 0) {
			return -1;		
		} else {
			return 1;
		}
	}
	
	// 아이디 찾기
	public HashMap<String, String> idSearch(Map<String, String> m) {
		return dao.idSearch(m);
	}
	
	// 비밀번호 찾기
	public HashMap<String, String> pwdSearch(Map<String, String> m) {
		return dao.pwdSearch(m);
	}

	
	// 제품 등록
	public void dtinsert(Map<String, String> m, MultipartFile mf) {
		UUID uid = UUID.randomUUID();
		String p_photo = mf.getOriginalFilename();
		File file = null;
		// 파일 처리
		if(m.get("category1").equals("1")) {
			file = new File(ha_upath, p_photo);
		} else if(m.get("category1").equals("2")) {
			file = new File(f_upath, p_photo);
		} else if(m.get("category1").equals("3")) {
			file = new File(h_upath, p_photo);
		}
		
		dao.dtinsert(m,p_photo);
		try {
			FileCopyUtils.copy(mf.getBytes(), file);
		} catch (Exception e) {
			System.out.println("파일 처리 예외 : " + e.getMessage());
		}
		
	}

	public HashMap<String, String> pdnum() {
		return dao.dtnum();
	}
	// 파일 업로드 관리
	public void upload(ArrayList<MultipartFile> f_file, String p_num, String c){
		// 정보 출력
		/* System.out.printf("파일 이름 : %s\n", mf.getOriginalFilename()); */
		for(MultipartFile m : f_file) {
			// 초기
			UUID uid = UUID.randomUUID();
			String f_name = m.getOriginalFilename();
			File file = null;
			// 파일 처리
			if(c.equals("1")) {
				file = new File(ha_upath, f_name);
			} else if(c.equals("2")) {
				file = new File(f_upath, f_name);
			} else if(c.equals("3")) {
				file = new File(h_upath, f_name);
			}
			dao.fInsert(p_num, f_name);
			try {
				FileCopyUtils.copy(m.getBytes(), file);
			} catch (Exception e) {
				System.out.println("파일 처리 예외 : " + e.getMessage());
			}
		}
	}
	
	// 결제
	public ArrayList<HashMap<String, String>> payinsert(Map<String, String> m) {	
		return dao.payinsert(m);
	}

	// 바로 결제
	public void pay(HashMap<String, String> m, HttpSession s) {
		dao.pay(m);
		HashMap<String, String> mm = dao.p_s(s);
		dao.p_ad(mm, s);
	}
	
	// 장바구니 결제
	public void r_pay(HashMap<String, String> mm, HttpSession s) {
		dao.r_pay(mm);
		dao.r_p_ad(mm, s);
	}

	// 주문내역
	public ArrayList<HashMap<String, String>> adselect(HttpSession s, int pnum, HttpServletRequest r) {	
		String c = "ad";
		Paging.procPaging(c, pnum, r);
		return dao.adselect(pnum, s);
	}
	// 관리자 주문내역
	public ArrayList<HashMap<String, String>> ad_select(HashMap<String, String> m, int pnum, HttpServletRequest r) {
		String c = "ad";
		Paging.procPaging(c, pnum, r);
		return dao.ad_select(pnum, m);
	}

	// 관리자 전체 주문내역
	public ArrayList<HashMap<String, String>> o_list(int pnum, HttpServletRequest r) {
		String c = "oall";
		Paging.procPaging(c, pnum, r);
		return dao.o_list();
	}
}
