package com.hmrental.ctrl;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hmrental.service.MbService;
import com.hmrental.service.SideService;

@org.springframework.stereotype.Controller
@RequestMapping("/company")
public class MController {
	@Autowired
	MbService mbs;
	@Autowired
	SideService ss;
	
	// 로그인
	@PostMapping("/login")
	public ModelAndView login() {
		ModelAndView mv = new ModelAndView();
		/* mv.setViewName("../index"); */
		mv.setViewName("redirect:/main.jsp");
		return mv;
	}
	
	// 상품 제거
	@PostMapping("/p_del")
	public String p_del(@RequestParam HashMap<String , String> m) {
		ss.p_del(m);
		return "redirect:/main.jsp";
	}
	
	// 장바구니
	@GetMapping("/cart")
	public ModelAndView cart(HttpSession s) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("b_list", ss.basket(s));
		mv.setViewName("/company/cart");
		
		return mv;
	}
	// 전체 주문내역
	@RequestMapping(value="/olist/{pnum}", method= RequestMethod.GET)
	public ModelAndView o_list(@PathVariable(value="pnum") Integer pnum, @RequestParam HashMap<String , String> m, HttpSession s, HttpServletRequest r) {
	ModelAndView mv = new ModelAndView();
	System.out.println(m);
	if(s.getAttribute("loginUser").equals("admin")) {
		mv.addObject("list", mbs.o_list(pnum, r));
	}
	mv.setViewName("/sidemain/order_list");
	
	return mv;
	}
	
	// 주문내역
	@RequestMapping(value="/administrator/{pnum}", method= RequestMethod.GET)
	public ModelAndView adlist(@PathVariable(value="pnum") Integer pnum, @RequestParam HashMap<String , String> m, HttpSession s, HttpServletRequest r) {
	ModelAndView mv = new ModelAndView();
	System.out.println(m);
	if(s.getAttribute("loginUser").equals("admin")) {	
		if(m.isEmpty()) {
			m.put("SI_ID", (String) s.getAttribute("GuestId"));
		} else {
			s.setAttribute("GuestId", m.get("SI_ID"));
		}
		//System.out.println("guestid : " + s.getAttribute("GuestId"));
		
		mv.addObject("m_list", mbs.m_list(m));
		mv.addObject("list", mbs.ad_select(m, pnum, r));
	} else {
		mv.addObject("list", mbs.adselect(s, pnum, r));
	}
	mv.setViewName("/sidemain/admininistor");
	System.out.println(mv);
	return mv;
	}
	
	// 주문내역 수정
	@PostMapping("/state")
	public ModelAndView up_state(@RequestParam HashMap<String, String> hm, HttpServletRequest r) {
		ModelAndView mv = new ModelAndView();
		// 배송 정보 수정
		ss.up_state(hm);
		// 장바구니 번호로 정보 조회
		HashMap<String, String> m = ss.b_Search(hm);
		// 페이지 번호
		Integer pnum = 1;
		
		mv.addObject("m_list", mbs.m_list(m));
		mv.addObject("list", mbs.ad_select(m, pnum, r));
		mv.setViewName("/sidemain/admininistor");
		
		return mv;
	}
	
	// 장바구니 등록
	@PostMapping("/dtinsert")
	public ModelAndView basket(HttpSession s, @RequestParam HashMap<String , String> m) {
		ModelAndView mv = new ModelAndView();
		HashMap<String , String> dtm = ss.dtm(s);
		if(m.get("price").equals(m.get("p_36"))) {
			ss.dtin36(m, dtm);
		} else if(m.get("price").equals(m.get("p_48"))) {
			ss.dtin48(m, dtm);
		} else if(m.get("price").equals(m.get("p_60"))) {
			ss.dtin60(m, dtm);
		}
		if(m.get("bp").equals("basket")) {		
			mv.setViewName("redirect:/company/cart");
		} else if(m.get("bp").equals("pay")) {
			String p_num = m.get("p_num");
			String price = m.get("sum");
			ArrayList<HashMap<String, String>> b_l = ss.basket(s);
			mv.addObject("b_list", b_l);
			mv.addObject("p_num",p_num);
			mv.addObject("price", price);
			mv.setViewName("/company/r_view");
		}

		return mv;
	}
	
	// 장바구니 제거
	@PostMapping("/delb")
	public String delb(@RequestParam HashMap<String, String> m, HttpSession s) {
		ss.delb(m, s);
		return "redirect:/company/cart";
	}
	
	// 주문 페이지
	@PostMapping("/order")
	public ModelAndView orderform(@RequestParam HashMap<String, String> m, HttpSession s) {
		ModelAndView mv = new ModelAndView();
		ArrayList<HashMap<String, String>> b_l = ss.basket(s);
		mv.addObject("b_list", b_l);	
		mv.setViewName("/company/r_view");
		
		return mv;
	}
	
	// 결제창 보기
	@GetMapping("/pay")
	public ModelAndView paypage(@RequestParam HashMap<String, String> mb, HttpSession s) {
		ModelAndView mv = new ModelAndView();
		s.setAttribute("order_date", mb);
		ArrayList<HashMap<String, String>> b_l = ss.basket(s);
		String bk = "basket";
		int price = 0;
		for ( HashMap<String, String> m : b_l) {
			price += Integer.valueOf(m.get("B_SUM")); 
		}
	
		mv.addObject("p_num",bk);
		mv.addObject("price",price);
		mv.setViewName("/company/pay");

		return mv;
	}


	// 결제
	@PostMapping("/pay")
	public String pay(@RequestParam HashMap<String, String> m, HttpSession s
			, HttpServletResponse res) throws IOException {
		res.setContentType("text/html; charset=UTF-8");
	    PrintWriter out = res.getWriter();
		if(mbs.payinsert(m).size() == 0) {	
			try {				
				out = res.getWriter();
				out.print("<script>");
			    out.print("alert('결제 실패다!!!!!!!');");
			    out.print("history.go(-1);");
			    out.print("</script>");		   
			} catch (IOException e) {
				System.out.println("pay결제 에러 : " + e.getMessage());
			}
		} else if(mbs.payinsert(m).size() == 1 && ss.dtm(s).size() == 1){
			try {
				ArrayList<HashMap<String, String>> b_l = ss.basket(s);
				if(m.get("p_num").equals("basket")) {
					 for ( HashMap<String, String> mm : b_l) {
						 mbs.r_pay(mm, s);			 
					 }
				} else {
					mbs.pay(m, s);
				}
				out = res.getWriter();
				out.print("<script>");
			    out.print("alert('결제완료~~~');");
			    out.print("location.href='/hmrental/company/administrator/1'");
			    out.print("</script>");	
			} catch (IOException e) {
				System.out.println("pay결제 에러 : " + e.getMessage());
			}
		}
		return null;
	}
	
	
}
