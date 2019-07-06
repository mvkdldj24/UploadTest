package com.test.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.test.dao.TestDAO;
import com.test.vo.BoardVO;
import com.test.vo.TestVO;

@SessionAttributes("testVO")
@Controller
public class WritingController {

	TestDAO test_dao;

	public WritingController() {

	}

	public WritingController(TestDAO test_dao) {
		System.out.println("생성자님 등장해주세요");
		this.test_dao = test_dao;
	}

	// 글 등록
	@RequestMapping(value = "writ_ins", method = RequestMethod.POST)
	public String writing(HttpSession s, @RequestParam("w_title") String w_title,
			@RequestParam("w_content") String w_content, @RequestParam("w_time") String w_time,
			@RequestParam("w_date") String w_date) {
		System.out.println("writ_insert");

		TestVO vo = (TestVO) s.getAttribute("testVO");
		int test_idx = vo.getTest_idx();

		String test_id = vo.getTest_id();

		BoardVO boardVO = new BoardVO();

		boardVO.setTest_idx(test_idx);
		boardVO.setW_date(w_date);
		boardVO.setW_time(w_time);
		boardVO.setW_title(w_title);
		boardVO.setW_content(w_content);
		boardVO.setW_writer(test_id);

		test_dao.writ_insert(boardVO);

		return "redirect:wl";
	}

	// 글 목록
	@RequestMapping("wl")
	public ModelAndView writing_list() {
		ModelAndView mv = new ModelAndView();

		List<BoardVO> boardList = test_dao.w_list();

		mv.addObject("boardList", boardList);

		mv.setViewName("writingList");

		return mv;
	}

	// 글 상세보기
	@RequestMapping("w_dt")
	public ModelAndView w_dt(@RequestParam("w_no") int w_no) {
		ModelAndView mv = new ModelAndView();

		List<BoardVO> boardList = test_dao.w_dt(w_no);

		mv.addObject("boardList", boardList);
		mv.setViewName("writingDt");

		return mv;
	}

	// 이동 컨트롤러
	@RequestMapping("wr")
	public String wr() {
		return "writing";
	}

}
