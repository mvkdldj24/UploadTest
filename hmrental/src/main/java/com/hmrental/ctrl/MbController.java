package com.hmrental.ctrl;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.hmrental.service.MbService;

@org.springframework.stereotype.Controller
@RequestMapping("/main")
public class MbController {
	@Autowired
	MbService mbs;
	
	// 회원가입폼
	@GetMapping("/signup")
	public String signupform() {
		return "/main/signup";
	}
	// 회원 가입
	@PostMapping("/signup")
	public String signup(@RequestParam Map<String, String> m) {
		mbs.mbinsert(m);
		return "/main/login";
	}
	
	// 회원 리스트
	@RequestMapping(value="/m_list/{pnum}", method= RequestMethod.GET)
	public ModelAndView listSelect(@PathVariable(value="pnum") Integer pnum, HttpServletRequest r) {
		ModelAndView mv = new ModelAndView();
		ArrayList<HashMap<String, String>> user_list = mbs.mlist(pnum, r); 
		mv.addObject("user_list", user_list);
		mv.setViewName("/main/member_list");
		
		return mv;
	}
	
	// 로그인
	@GetMapping("/login")
	public String login() {
		return "main/login";
	}
	
	// 로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession s) {
		s.invalidate();
		return "redirect:/main/login";
	}
	
	// 아이디 체크
	@GetMapping("/idcheck")
	public String idCheckform(@RequestParam String si_id) {	
		int result = mbs.idCheck(si_id);
		String redirect = null;
		try {
			redirect = String.format("redirect:/commons/idcheck.jsp?result=%s&si_id=%s", result, URLEncoder.encode(si_id, "UTF-8"));
		} catch (UnsupportedEncodingException e) {
			System.out.println("idcheck err : " + e.getMessage());
		}
		return redirect;
	}
	
	// 아이디 찾기 페이지
	@GetMapping("/idsearchform")
	public String idSearchform() {
		return "redirect:/commons/idsearch.jsp";
	}
	
	// 아이디 찾기
	@PostMapping("/idsearch")
	public ModelAndView idSearch(@RequestParam Map<String, String> m) {	
		ModelAndView mv = new ModelAndView();
		if(mbs.idSearch(m).size() == 1) {
			String id = mbs.idSearch(m).get("SI_ID");
			mv.addObject("id", id);
			mv.addObject("result", "1");
		} else if(mbs.idSearch(m).size() == 0) {
			mv.addObject("result", "0");	
		}
		mv.setViewName("redirect:/commons/idsearch.jsp");
		return mv;
	}
	
	// 비밀번호 찾기 페이지
	@GetMapping("/pwdsearchform")
	public String pwdSearchform() {
		return "redirect:/commons/pwdsearch.jsp";
	}
	
	// 비밀번호 찾기
	@PostMapping("/pwdsearch")
	public ModelAndView pwdSearch(@RequestParam Map<String, String> m) {	
		ModelAndView mv = new ModelAndView();
		if(mbs.pwdSearch(m).size() == 1) {
			String pwd = mbs.pwdSearch(m).get("SI_PASS");
			mv.addObject("pwd", pwd);
			mv.addObject("result", "1");
		} else if(mbs.pwdSearch(m).size() == 0) {
			mv.addObject("result", "0");
		}	
		mv.setViewName("redirect:/commons/pwdsearch.jsp");
		return mv;
	}
	
	// 제품등록페이지
	@GetMapping("/dtinsert")
	public String dtinsertfrom() {
		return "/main/dtinsert";
	}
	
	// 재품 등록
	@PostMapping("/dtinsert")
	public String dtinsert(@RequestParam Map<String, String> m, @RequestParam MultipartFile mf, @RequestParam ArrayList<MultipartFile> f_file) {
		mbs.dtinsert(m, mf);
		Map<String, String> mp = mbs.pdnum(); 
		String p_num = mp.get("P_NUM");
		String c = m.get("category1");
		mbs.upload(f_file, p_num, c);

		return "redirect:/index.jsp";
	}

}
