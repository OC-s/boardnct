package com.net.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.net.board.dao.BoardDAO;
import com.net.board.dao.MemberDAO;
import com.net.board.dto.BoardDTO;
import com.net.board.dto.StartEnd;

@Service
public class BoardService {
	
	@Autowired 
	private MemberDAO dao;
	
	@Autowired
	private BoardDAO bdao;
	
	public List<BoardDTO> getAll(int startno, int endno, String keyword, String type){
		StartEnd se = new StartEnd(startno, endno, keyword, type);
		return bdao.getAll(se);
	}
	
	public int getTotal() {
		return bdao.getTotal();
	}
	public int getTotal(String keyword) {
		return bdao.getTotal(keyword);
	}
	
	
	public BoardDTO getOne(int bno) {
		return bdao.getOne(bno);
	}
	
	public void updateOne(BoardDTO dto) {
		bdao.updateOne(dto);
	}
	
	public void insertOne(BoardDTO dto) {
		bdao.insertOne(dto);
	}


	public void deleteOne(int bno) {
		bdao.deleteOne(bno);
	}
	
	
}
