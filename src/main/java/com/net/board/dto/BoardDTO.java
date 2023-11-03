package com.net.board.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class BoardDTO {
	private int bno;
	private String nickname;
	private String title;
	private String contents;
	private String created_time;
	private String updated_time;
	private boolean deleted = Boolean.FALSE; // 삭제여부
	
	private String keyword;

}
