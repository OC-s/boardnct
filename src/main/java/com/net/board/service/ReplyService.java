package com.net.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.net.board.dao.ReplyDAO;
import com.net.board.dto.ReplyDTO;

@Service
public class ReplyService {
	
	@Autowired
	private ReplyDAO rdao;
	
	// 댓글 목록
	public List<ReplyDTO> getList(int bno){
		List<ReplyDTO> list = rdao.getAll(bno);
		return list;
	}
	
	// 총 댓글 수
	public int getTotal(int bno) {
		int recnt = rdao.getCount(bno);
		return recnt;
	}
	
	// 댓글 작성
	public void write(ReplyDTO dto) {
		rdao.insertOne(dto);
	}
	
	// 댓글 수정
	public void modify(ReplyDTO dto) {
		rdao.updateOne(dto);
	}
	
	// 댓글 삭제
	public void remove(int reno) {
		rdao.deleteOne(reno);
	}
	
	// 댓글 전체삭제
	public void removeAll(int bno) {
		rdao.deleteAll(bno);
	}
	

}
