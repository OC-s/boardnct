package com.net.board.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.net.board.dto.BoardDTO;
import com.net.board.dto.StartEnd;

@Repository
@Mapper
public interface BoardDAO {
	
	List<BoardDTO> getAll(StartEnd se);
	int getTotal();
	int getTotal(String keyword);
	
	BoardDTO getOne(int bno); // 한명 상세조회
	
	public void insertOne(BoardDTO dto); // 추가
	public void updateOne(BoardDTO dto); // 업데이트
	public void deleteOne(int bno); 	 // 삭제
	

}
