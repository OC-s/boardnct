package com.net.board.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class StartEnd {
	private int startNo;
	private int endNo;
	private String keyword; // 검색 키워드
	private String type; //타입

	public StartEnd(int startNo, int endNo) {
		super();
		this.startNo = startNo;
		this.endNo = endNo;
	}
	
}

