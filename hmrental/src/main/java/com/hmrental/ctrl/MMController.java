package com.hmrental.ctrl;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MMController {
	
	@GetMapping({"/","/home"})
	public ModelAndView main() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/main.jsp");;
		return mv;
	}
}
