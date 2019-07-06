package com.test.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.theme.SessionThemeResolver;

import com.test.dao.TestDAO;
import com.test.vo.TestVO;

/**
 * Handles requests for the application home page.
 */
@SessionAttributes("testVO")
@Controller
public class HomeController {

	public HomeController() {
	}

	TestDAO test_dao;

	public HomeController(TestDAO test_dao) {
		System.out.println("생성자님 등장해주세요");
		this.test_dao = test_dao;
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {

		return "main";
	}

	// 회원가입
	@RequestMapping(value = "joinpage.do", method = RequestMethod.POST)
	public String joinp(TestVO vo) {
		System.out.println("joinpage");
		
		test_dao.insert(vo);
		
		return "redirect:/";
	}

	// 아이디 중복체크
	@RequestMapping(value = "test_checkId.do", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map<String, String> checkId(@RequestParam("id") String paramId) {

		// 초기값 설정
		String msg = "사용할 수 없는 아이디 입니다.";
		String textColor = "red";

		boolean res;

		// 아아디 유효성 검사 후 중복 체크
		if (paramId != "" && !(paramId.indexOf(" ") >= 0) && !(paramId.length() < 4 || paramId.length() > 12)) {

			// 아아디 중복체크
			res = test_dao.checkId(paramId);

			// 결과(res)가 True면
			if (res) {
				msg = "사용 가능한 아이디입니다.";
				textColor = "blue";
			}
		}
		System.out.println("msg= " + msg);
		Map<String, String> map = new HashMap<String, String>();
		map.put("msg", msg);
		map.put("textColor", textColor);

		return map;
	}

	// 로그인
	@RequestMapping(value = "login", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public String login(Model model, @RequestParam("test_id") String id, @RequestParam("test_pwd") String pwd) {
		System.out.println("로그인");

		String msg = "no";
		Map<String, String> inputData = new HashMap<String, String>();
		inputData.put("id", id);
		inputData.put("pwd", pwd);

		TestVO testVO = test_dao.getData(inputData);

		if (testVO != null) {
			msg = "yes";

			model.addAttribute("testVO", testVO);

		}

		return msg;
	}
	
	//회원리스트
	@RequestMapping(value="mbrList")
	public ModelAndView mbrList() {
		System.out.println("회원 CT");
		
		ModelAndView mv = new ModelAndView();
		List<TestVO> mbr_list = test_dao.mbr_list();
	
		mv.addObject("mbr_list", mbr_list);
		mv.setViewName("mbrList");

		
		return mv;
	}

	// 회원 탈퇴
	@RequestMapping("delete")
	public String delete(@RequestParam("test_idx") int test_idx) {
		System.out.println("delete" + test_idx);

		test_dao.delete(test_idx);

		return "redirect:/";
	}

	// 회원정보 업데이트
	@RequestMapping(value = "upd", method = RequestMethod.POST)
	public String upd(HttpSession s, @RequestParam("test_pwd") String test_pwd,
			@RequestParam("test_mail") String test_mail, @RequestParam("test_phone") String test_phone) {
		System.out.println("업데이트");

		TestVO vo = (TestVO) s.getAttribute("testVO");

		vo.setTest_pwd(test_pwd);
		vo.setTest_mail(test_mail);
		vo.setTest_phone(test_phone);
		test_dao.update(vo);

		return "login";
	}

	// 페이지 이동 - 로그인완료
	@RequestMapping("test.login_page")
	public String login_page() {
		System.out.println("로그인완료");

		return "login";
	}

	// 페이지 이동 - 회원정보 수정
	@RequestMapping("update")
	public String update() {

		return "update";
	}

	// 페이지 이동 - 회원가입
	@RequestMapping("join.do")
	public String join() {
		System.out.println("join.do");

		return "join";
	}

	@RequestMapping("logout")
	public String logout(HttpSession s) {

		// 세션 삭제

		return "redirect:/";
		/* return "logout"; - 세션 미삭제 */
	}
}
