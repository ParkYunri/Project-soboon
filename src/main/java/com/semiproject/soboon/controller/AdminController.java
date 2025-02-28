package com.semiproject.soboon.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.semiproject.soboon.service.MemberService;
import com.semiproject.soboon.vo.MemberVO;
import com.semiproject.soboon.vo.PagingVO;

@RestController
@RequestMapping("/")
public class AdminController {

	@Inject
	MemberService service;
	
	@GetMapping("admin")
	public ModelAndView admin(PagingVO pVO) {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("admin/admin_page");
		return mav;
	}
	@GetMapping("admin/memberMgr")
	public Map<String, Object> adminMgr(PagingVO pVO) {
		pVO.setRecordPerPage(10); // 출력수 jsp랑 동일하게 설정
		pVO.calc(); //페이지 연산 처리
		Map<String, Object> map=new HashMap<>();
		//전체 회원수 가져오기
		int cnt = service.getMembercnt();
		//페이지에 해당하는 회원 목록
		List<MemberVO> list=service.memberList(pVO);
		
		map.put("cnt", cnt);
		map.put("userList", list);
		
		return map;
	}
}