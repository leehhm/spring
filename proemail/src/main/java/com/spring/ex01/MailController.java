package com.spring.ex01;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@EnableAsync
public class MailController {
	@Autowired
	private MailService mailService;
	@RequestMapping(value= "/sendMail.do" , method = RequestMethod.GET)
	public void sendSimpleMail(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		StringBuffer sb = new StringBuffer();
		sb.append("<html><body>");
		sb.append("<meta http-equiv = 'Content-Type' content = 'text/html; charset = euc-kr'>");
		sb.append("<h1>"+ "제품소개" + "<h1><br>");
		sb.append("신간 도서를 소개합니다.<br><br>");
		sb.append("<a href = 'http://www.kyobobook.co.kr/product/detailViewKor.laf?ejkGb=KOR&mallGb = KOR & barcode = 9788956746425&orderClick = LAG&Kc=#N'>");
		sb.append("<img src = 'http://image.ktobobook.co.kr/images/book/xlarge/425/x9788956746425.jsp' /></a><br>");
		sb.append("</br>");
		sb.append("<a href = 'http://www.kyobobook.co.kr/images/book/xlarge/425/x9788956746425.jpg' />");
		sb.append("</body></html>");
		String str = toString();
		mailService.sendMail("leehm0311@naver.com","테스트메일","안녕하세요");

		out.print("메일을 보냈습니다.");
	}
}
