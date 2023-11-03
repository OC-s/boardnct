package com.net.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.net.board.dao.MemberDAO;
import com.net.board.dto.MemberDTO;

@Service
public class MemberService {
	
	@Autowired 
	private MemberDAO dao;
	
	public MemberDTO getIdOne(String id) {
		return dao.getIdOne(id);
	}
	
	public void insertOne(MemberDTO dto) {
		dao.insertOne(dto);
	}
	
	public int checkId(MemberDTO dto) {
		return dao.checkId(dto);
	}
	
	public int checkName(MemberDTO dto) {
		return dao.checkName(dto);
	}
	
}
