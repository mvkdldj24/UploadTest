package com.test.controller;

import java.io.File;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.test.dao.TestDAO;
import com.test.vo.ProductVO;

@Controller
public class ProductController {

	TestDAO test_dao;

	public ProductController(TestDAO testdao) {
		System.out.println("상품 생성자 등장");
		this.test_dao = testdao;
	}

	// 페이지 이동
	@RequestMapping("product_insert")
	public String pinsertm() {
		System.out.println("상품등록페이지 이동");

		return "product/productInsert";
	}

	// 차량 상세페이지
	@RequestMapping("product_dt")
	public String pinserdt() {
		System.out.println("차량 상세페이지 이동");

		return "product/productDt";
	}

	// 차량 등록페이지
	@RequestMapping(value = "P_insert", method = RequestMethod.POST)
	public String pinsert(MultipartHttpServletRequest request, MultipartHttpServletRequest multifile) {
		System.out.println("차량 등록합니다.");
		
		MultipartFile mf = request.getFile("p_mname");
		String path = request.getRealPath("/resources");

		
		System.out.println(path);
		String imgname = mf.getOriginalFilename();
		File file = new File(path + imgname);

		try {
			mf.transferTo(file);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		ProductVO productVO = new ProductVO();

		productVO.setP_company(request.getParameter("p_company"));
		productVO.setP_model(request.getParameter("p_model"));
		productVO.setP_title(request.getParameter("p_title"));
		productVO.setP_myear(request.getParameter("p_myear"));
		productVO.setP_drive(request.getParameter("p_drive"));
		productVO.setP_fuel(request.getParameter("p_fuel"));
		productVO.setP_color(request.getParameter("p_color"));
		productVO.setP_price(request.getParameter("p_price"));
		productVO.setP_mname(imgname);

		test_dao.p_insert(productVO);

		return "redirect:product_insert";
	}

	// 차량 정보 select
	@RequestMapping(value = "p_dt", method = RequestMethod.POST)
	public ModelAndView pdetail() {
		System.out.println("차량정보 select");
		ModelAndView mv = new ModelAndView();

		List<ProductVO> list = test_dao.p_select();

		mv.addObject("list", list);
		mv.setViewName("product/productList");

		return mv;
	}

	@RequestMapping("upload")
	public String upload() {
		System.out.println("upload");
		return "product/upload";
	}

	@RequestMapping("upload.do")
	public String load(@RequestParam("name") String name, @RequestParam("img") MultipartFile img) {
		System.out.println("upload.do");
		System.out.println(name);
		System.out.println(img);

		return "product/upload";

	}

}
