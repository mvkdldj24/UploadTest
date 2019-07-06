package com.hmrental.ctrl;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

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

import com.hmrental.service.SideService;

@org.springframework.stereotype.Controller
@RequestMapping("/sidemain")
public class SideController {
	@Autowired
	SideService ss;
	
	// 가전 리스트
	@RequestMapping(value="/HA/{ha}/{pnum}", method= RequestMethod.GET)
	public ModelAndView HA(@PathVariable(value="ha") String ha, @PathVariable(value="pnum") Integer pnum, HttpServletRequest r) {
		ModelAndView mv = new ModelAndView();
		ArrayList<HashMap<String, String>> ha_list = null;
		if(ha.equals("ref")) {
			ha_list = ss.ref_page(ha, pnum, r);
		} else if(ha.equals("kref")) {
			ha_list = ss.kref_page(ha, pnum, r);
		} else if(ha.equals("wm")) {
			ha_list = ss.wm_page(ha, pnum, r);
		} else if(ha.equals("tv")) {
			ha_list = ss.tv_page(ha, pnum, r);
		} 
		mv.addObject("ha_list", ha_list);
		mv.setViewName("/sidemain/ha_view");

		return mv;
	}
	
	// 가구 리스트
	@RequestMapping(value="/FT/{ft}/{pnum}", method= RequestMethod.GET)
	public ModelAndView furniture(@PathVariable(value="ft") String ft, @PathVariable(value="pnum") Integer pnum, HttpServletRequest r) {
		ModelAndView mv = new ModelAndView();
		ArrayList<HashMap<String, String>> ft_list = null;
		if(ft.equals("b")) {
			ft_list = ss.b_page(ft, pnum, r);
		} else if(ft.equals("s")) {
			ft_list = ss.s_page(ft, pnum, r);
		} else if(ft.equals("k")) {
			ft_list = ss.k_page(ft, pnum, r);
		}
		mv.addObject("ft_list", ft_list);
		mv.setViewName("/sidemain/f_view");

		return mv;
	}
	
	// 헬스 리스트
	@RequestMapping(value="/H/{h}/{pnum}", method= RequestMethod.GET)
	public ModelAndView health(@PathVariable(value="h") String h, @PathVariable(value="pnum") Integer pnum, HttpServletRequest r) {
		ModelAndView mv = new ModelAndView();
		ArrayList<HashMap<String, String>> h_list = null;
		if(h.equals("ch")) {
			h_list = ss.ch_page(h, pnum, r);
		} else if(h.equals("ma")) {
			h_list = ss.ma_page(h, pnum, r);
		} else if(h.equals("sa")) {
			h_list = ss.sa_page(h, pnum, r);
		} else if(h.equals("mt")) {
			h_list = ss.mt_page(h, pnum, r);
		} 
		mv.addObject("h_list", h_list);
		mv.setViewName("/sidemain/h_view");

		return mv;
	}
	
	// 가전 상세 페이지
	@RequestMapping(value="/dtview/ha/{pnum}", method= RequestMethod.GET)
	public ModelAndView dtview(@PathVariable(value="pnum") Integer pnum, @RequestParam HashMap<String , String> m) {
		ModelAndView mv = new ModelAndView();
		ArrayList<HashMap<String, String>> dtli = new ArrayList<HashMap<String, String>>();
		HashMap<String, String> dt_list = null;
		if(m.get("HA_CODE").equals("1")) {
			// 냉장고
			dt_list = ss.ref_list(pnum);
		} else if(m.get("HA_CODE").equals("2")) {
			// 김치 냉장고
			dt_list = ss.kref_list(pnum);
		} else if(m.get("HA_CODE").equals("3")) {
			// 세탁기
			dt_list = ss.wm_list(pnum);
		} else if(m.get("HA_CODE").equals("4")) {
			// tv
			dt_list = ss.tv_list(pnum);
		} 
		 
		dtli.add(dt_list);
		mv.addObject("dt_list", dt_list);
		mv.addObject("list",dtli);
		mv.setViewName("/sidemain/dt_view");
		
		return mv;
	}
	
	// 가구 상세 페이지
	@RequestMapping(value="/dtview/ft/{pnum}", method= RequestMethod.GET)
	public ModelAndView dtftview(@PathVariable(value="pnum") Integer pnum, @RequestParam HashMap<String , String> m) {
		ModelAndView mv = new ModelAndView();
		ArrayList<HashMap<String, String>> dtli = new ArrayList<HashMap<String, String>>();
		HashMap<String, String> dt_list = null;
		if(m.get("FT_CODE").equals("1")) {
			// 침대
			dt_list = ss.b_list(pnum);
		} else if(m.get("FT_CODE").equals("2")) {
			// 쇼파
			dt_list = ss.s_list(pnum);
		} else if(m.get("FT_CODE").equals("3")) {
			// 식탁
			dt_list = ss.k_list(pnum);
		}
		dtli.add(dt_list);
		mv.addObject("dt_list", dt_list);
		mv.addObject("list",dtli);
		mv.setViewName("/sidemain/dt_view");
		
		return mv;
	}
	
	// 헬스 상세 페이지
	@RequestMapping(value="/dtview/h/{pnum}", method= RequestMethod.GET)
	public ModelAndView dthview(@PathVariable(value="pnum") Integer pnum, @RequestParam HashMap<String , String> m) {
		ModelAndView mv = new ModelAndView();
		ArrayList<HashMap<String, String>> dtli = new ArrayList<HashMap<String, String>>();
		HashMap<String, String> dt_list = null;
		System.out.println(m.get("H_CODE"));
		if(m.get("H_CODE").equals("1")) {
			// 의자
			dt_list = ss.ch_list(pnum);
		} else if(m.get("H_CODE").equals("2")) {
			// 마스크
			dt_list = ss.ma_list(pnum);
		} else if(m.get("H_CODE").equals("3")) {
			// 사우나
			dt_list = ss.sa_list(pnum);
		} else if(m.get("H_CODE").equals("4")) {
			// 매트
			dt_list = ss.mt_list(pnum);
		} 
		dtli.add(dt_list);
		mv.addObject("dt_list", dt_list);
		mv.addObject("list",dtli);
		mv.setViewName("/sidemain/dt_view");
		
		return mv;
	}

	// 마이페이지 select
	@GetMapping("/mypage")
	public ModelAndView mypage(HttpSession s) {
		ModelAndView mv = new ModelAndView();
		ArrayList<HashMap<String, String>> list = ss.mypage(s);
		mv.addObject("list", list);
		mv.setViewName("/sidemain/mypage");
		
		return mv;

	}

	// 마이페이지 update 연락처
	@PostMapping("/myp_phone")
	public String myp_phone(@RequestParam HashMap<String, String> my, HttpSession s) {
		ss.myp_phone(my, s);
		
		return "redirect:/sidemain/mypage";
	}

	// 마이페이지 update 이메일
	@PostMapping("/myp_email")
	public String myp_email(@RequestParam HashMap<String, String> my, HttpSession s) {
		ss.myp_email(my, s);
		
		return "redirect:/sidemain/mypage";
	}

	// 마이페이지 update 주소
	@PostMapping("/myp_addr")
	public String myp_addr(@RequestParam HashMap<String, String> my, HttpSession s) {
		ss.myp_addr(my, s);

		return "redirect:/sidemain/mypage";
	}

	// 마이페이지 update 비밀번호
	@PostMapping("/myp_pwd")
	public String myp_pwd(@RequestParam HashMap<String, String> my, HttpSession s, HttpServletResponse res)
			throws IOException {
		if (my.get("existing_pwd").equals(s.getAttribute("password"))) {
			ss.myp_pwd(my, s);
			s.setAttribute("password", my.get("si_pass"));
			
			return "redirect:/sidemain/mypage";
		} else {
			try {
				res.setContentType("text/html; charset=UTF-8");
				PrintWriter out;
				out = res.getWriter();
				out.print("<script>");
				out.print("alert('현재 비밀번호가 맞지 않습니다.');");
				out.print("history.go(-1);");
				out.print("</script>");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return null;
	}
	// 약관 동의
	@GetMapping("/agree")
	public String agreeform() {
		return "/sidemain/agr";
	}
   
	@GetMapping("/pripol")
	public String privateform() {
		return "/sidemain/pri";
	}
}
