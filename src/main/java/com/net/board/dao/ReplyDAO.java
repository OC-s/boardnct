package com.net.board.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.net.board.dto.ReplyDTO;

@Repository
@Mapper
public interface ReplyDAO {
	
	List<ReplyDTO> getAll(int bno);
	int getCount(int bno);
	void insertOne(ReplyDTO dto);
	void updateOne(ReplyDTO dto);
	void deleteOne(int reno);
	void deleteAll(int bno);
	
}
