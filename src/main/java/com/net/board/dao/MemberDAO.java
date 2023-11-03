package com.net.board.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.net.board.dto.MemberDTO;

@Repository
@Mapper
public interface MemberDAO {
	
	MemberDTO getIdOne(String id); // 아이디
	public void insertOne(MemberDTO dto); // 가입
	int checkId(MemberDTO dto); 
	int checkName(MemberDTO dto); 

}
