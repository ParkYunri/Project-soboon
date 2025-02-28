package com.semiproject.soboon.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.semiproject.soboon.dao.EditDAO;
import com.semiproject.soboon.vo.BoardVO;
import com.semiproject.soboon.vo.MemberVO;
import com.semiproject.soboon.vo.PagingVO;

@Service
public class EditServiceImpl implements EditService {
	@Inject
	EditDAO dao;

	@Override
	public MemberVO selectEdit(String userid) {
		return dao.selectEdit(userid);
	}

	@Override
	public int nicknameCheck(String nickname) {
		return dao.nicknameCheck(nickname);
	}

	@Override
	public int editUpdate(MemberVO vo) {
		return dao.editUpdate(vo);
	}

	@Override
	public int delMember(String userid) {
		return dao.delMember(userid);
	}

	@Override
	public List<BoardVO> mypostList(String userid, PagingVO pVO) {
		return dao.mypostList(userid, pVO);
	}

	@Override
	public int mypostCount(String userid) {
		return dao.mypostCount(userid);
	}

	@Override
	public int myreplyCount(String userid) {
		return dao.myreplyCount(userid);
	}

	@Override
	public List<BoardVO> mypostList2(String userid) {
		return dao.mypostList2(userid);
	}

	
}
