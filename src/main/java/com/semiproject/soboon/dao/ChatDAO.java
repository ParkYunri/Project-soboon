package com.semiproject.soboon.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.semiproject.soboon.vo.ChatVO;

@Mapper
@Repository
public interface ChatDAO {
	public List<ChatVO> getLastMessage(String myNickname);
	public List<ChatVO> getAllMessage(String myUserid, String oppNickname);
	public int updateChatRead(String myNickname);
	public List<ChatVO> searchNickname(String myNickname, String nickNameKeyword);
}
