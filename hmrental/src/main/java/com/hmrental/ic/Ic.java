package com.hmrental.ic;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.hmrental.dao.MDao;

/* 공통기능구현 클래스 :  */
public class Ic implements HandlerInterceptor {
	@Autowired
	MDao dao;

	@Override // 특정 범위 패키지에 있는 메서드가 실행되기 전에 실행될 공통 메서드
	public boolean preHandle(HttpServletRequest rq, HttpServletResponse res, Object h) throws Exception {
		HttpSession s = rq.getSession();
		String id = rq.getParameter("si_id");
		String pw = rq.getParameter("si_pass");
		String hs = (String) s.getAttribute("loginUser");

		if (id == null && hs == null) {
			res.sendRedirect("/hmrental/main/login");
			return false;
		} else if (id != null && hs == null) {
			for (int i = 0; i < dao.select().size(); i++) {
				if (id.equals(dao.select().get(i).get("SI_ID"))) {
					if (pw.equals(dao.select().get(i).get("SI_PASS"))) {
						HttpSession session = rq.getSession();
						session.setAttribute("loginUser", id);
						session.setAttribute("password", pw);

						return true;
					}
				}
			}
			res.setContentType("text/html; charset=UTF-8");
			PrintWriter out = res.getWriter();
			out.print("<script> alert('아이디와 비밀번호를 확인해 주세요.'); history.go(-1);</script>");

			return false;
		}
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
	}
}
