package main.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import main.service.MemberService;
import main.service.MemberVO;

@Controller
public class MemberController {
	
	@Resource(name="memberService")
	private MemberService memberService;
	
	/*
	 * 회원등록화면
	 */
	
	@RequestMapping("/memberWrite.do")
	public String memberWrite() {
		
		return "member/memberWrite";
	}
	
	/*
	 * 회원등록처리(저장)
	 */
	@RequestMapping("/member/memberWriteSave.do")
	@ResponseBody
	public String insertMember(MemberVO vo) throws Exception{
		String message="";
		
		String result = memberService.insertMember(vo);
		//String result =null (성공)
		
		if(result == null) {
			message="ok";
		}
		return message;
	}
	
	
	@RequestMapping("/member/idcheck.do")
	@ResponseBody //비동기방식일 때 필요
	public String selectMemberIdCheck(String userid) throws Exception{
		String message="";
		int count= memberService.selectMemberIdCheck(userid);
		if(count==0)
		{
			message="ok";
		}
	
		
		return message;
	}
	
	@RequestMapping("/member/post1.do")
	public String post1() {
		
		return "member/post1";
	}
	
	
	
	@RequestMapping("/member/post2.do")
	public String post2(String dong, ModelMap model) throws Exception {
		
		List<?> list= memberService.selectPostList(dong);
		model.addAttribute("resultList",list);
		
		return "member/post2";
	}
	
	@RequestMapping("/member/loginWrite.do")
	public String loginWrite() {
		return "member/loginWrite";
	}
	

	@RequestMapping("/member/loginWriteSub.do")
	@ResponseBody
	public String loginProcessing(MemberVO vo, HttpSession session)throws Exception {
		String message="";
		int count=memberService.selectMemberCount(vo);		
		if(count==1) {
			//session생성
			session.setAttribute("SessionUserID", vo.getUserid());
			
			//message 처리
			message="ok";
		}
		
		return message;
	}
	
	
	@RequestMapping("/member/logout.do")
	public String logout(HttpSession session) {
		session.removeAttribute("SessionUserID");
		
		return "member/loginWrite";
	}
	
	
}
