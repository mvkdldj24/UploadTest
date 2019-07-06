package com.ex_project.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ex_project.service.Ex_Service;

@org.springframework.stereotype.Controller
@RequestMapping("/ctr")
public class Ex_Controller {

	@Autowired
	Ex_Service es;

	@RequestMapping("/home")
	public String home() {
		System.out.println("여기냐");
		return "redirect/webapp/index.jsp";
	
	}
	
	/* test */
	@RequestMapping("/ex")
	public String daotestGet2(Model m) {
		m.addAttribute("message", "HELLO");
		return "/showMessage";
	}

	// 회원 가입
	@RequestMapping(value = "/sign_up", method = RequestMethod.POST)
	public String signup(@RequestParam Map<String, String> pm) {
		System.out.println("CTR" + pm);
		es.insert(pm);
		return "redirect:/view/files/login.jsp";
	}

	// 상품 판매
	@RequestMapping(value = "/sale_insert", method = RequestMethod.POST)
	public String saleinsert(@RequestParam Map<String, String> pm) {
		System.out.println("slae_insert" + pm);
		es.sale_insert(pm);
		return "redirect:sale_list";
	}

	// 회원목록
	@RequestMapping(value = "/mbrlist", method = RequestMethod.GET)
	public ModelAndView mbrlist(Model m) {
		ModelAndView mv = new ModelAndView();
		ArrayList<HashMap<String, String>> list = es.mbr_select(m);
		mv.addObject("list", list);
		mv.setViewName("/files/Mblist");
		return mv;
	}

	// 판매목록
	@RequestMapping(value = "sale_list", method = RequestMethod.GET)
	public ModelAndView salelist(Model m) {
		ModelAndView mv = new ModelAndView();
		ArrayList<HashMap<String, String>> list = es.sale_select(m);
		mv.addObject("list", list);
		mv.setViewName("files/Sale_list");
		return mv;
	}

	// 회원명, 상품명 조회
	@RequestMapping(value = "m_g_select", method = RequestMethod.GET)
	public ModelAndView mgselect(Model m) {
		ModelAndView mv = new ModelAndView();
		ArrayList<HashMap<String, String>> m_list = es.mselect(m);
		ArrayList<HashMap<String, String>> g_list = es.gselect(m);
		mv.addObject("mlist", m_list);
		mv.addObject("glist", g_list);
		mv.setViewName("files/sale_insert");
		return mv;
	}

	// 회원 상세 조회
	@RequestMapping(value = "mbr_dt", method = RequestMethod.GET)
	public ModelAndView mbrdt(String mbr_no) {
		ModelAndView mv = new ModelAndView();
		ArrayList<HashMap<String, String>> list = es.mbr_dt(mbr_no);
		mv.addObject("list", list);
		System.out.println("가지고왔니?" + mv);
		System.out.println("list는?" + list);
		mv.setViewName("/files/mbr_dt");

		return mv;
	}

	// 상품 상세 조회
	@RequestMapping(value = "/goods_dt", method = RequestMethod.GET)
	public ModelAndView goodsdt(String goods_no) {
		ModelAndView mv = new ModelAndView();
		ArrayList<HashMap<String, String>> list = es.goods_dt(goods_no);
		mv.addObject("list", list);
		System.out.println("상품상세조회" + mv);
		mv.setViewName("/files/goods_dt");
		return mv;
	}

	// 상품 등록
	@RequestMapping(value = "/g_insert", method = RequestMethod.GET)
	public String ginsert(@RequestParam Map<String, String> d) {
	System.out.println("상품등록 ct" + d);
	es.g_insert(d);	
	return "redirect:goods_list";
	}

	// 상품리스트
	@RequestMapping(value="/goods_list", method=RequestMethod.GET)
	public ModelAndView goodslist(){
	ModelAndView mv = new ModelAndView();
	ArrayList<HashMap<String, String>> list = es.goodslist();
	System.out.println(list);
	mv.addObject("list", list);
	mv.setViewName("/files/goods_list");
	
	return mv;
		
	}
	
	
	
	//로그인 
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public ModelAndView login(String mbr_nm, String mbr_pw) {
	System.out.println(mbr_nm);
	System.out.println(mbr_pw);
	ModelAndView mv = new ModelAndView();
	ArrayList<HashMap<String, String>> list = es.login(mbr_nm);
	System.out.println("돌아오는" + list);
	
	mv.addObject("list", list);
	mv.setViewName("files/extest");
	
	return mv;
	}
	
	//로그인 확인
	@RequestMapping(value="/login_ch", method=RequestMethod.GET)
	public ModelAndView loginch(String mbr_id, String mbr_pw) {
		ModelAndView mv = new ModelAndView();
		System.out.println(mbr_id);
		System.out.println(mbr_pw);
		
		return mv;
	}
	

	
	
	//이동 컨트롤러
	@RequestMapping(value = "/mv_goods", method = RequestMethod.GET)
	public String mv_goods() {
	return "redirect:/view/files/goods_insert.jsp";
	}
	
	@RequestMapping(value = "/mv_login", method = RequestMethod.GET)
	public String mv_login() {
	return "redirect:/view/files/login.jsp";
	}
		
	@RequestMapping(value = "/mv_signup", method = RequestMethod.GET)
	public String mv_signup() {
	return "redirect:/view/files/signup.jsp";
	}
}
