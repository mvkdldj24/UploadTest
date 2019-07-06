package com.commons;

import javax.servlet.http.HttpServletRequest;

import com.hmrental.dao.PDao;

public class Paging {
	
	// 페이징 : 페이징처리
	public static void procPaging(String c, int pnum, HttpServletRequest r) {
		//  페이지그룹의 갯수
		double gpage = 5;  // 페이지 그룹의 개수
		r.setAttribute("gpage", (int)gpage);
		// 전체글의 개수
		r.setAttribute("rcounts", PDao.getCount(c).get("CT"));
		// 전체페이지 개수
		int all_epage = Integer.parseInt((PDao.getCount(c).get("CC")));
		r.setAttribute("all_epage", all_epage);
		r.setAttribute("pcounts", PDao.getCount(c).get("CC"));
		// 그룹의 시작페이지번호 : pnum(현재페이지)
		// Math.floor : 소수점이하 절삭
		int group_spage = (int)Math.floor((pnum-1)/gpage)*(int)gpage + 1;
		r.setAttribute("group_spage", group_spage);
		// 현재 페이지
		r.setAttribute("group_npage", pnum);
		// 그룹의 마지막페이지번호 : 
		int group_epage = group_spage + ((int)gpage -1);
		// 마지막그룹 처리
		group_epage =  group_epage > all_epage ?  all_epage : group_epage;
		r.setAttribute("group_epage", group_epage);
   }
}
