package com.net.board.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ReplyDTO {
	
	private int reno;
	private int bno;
	private int mno;
	private String nickname;
	private String recontents;
	private String redate;
	
}
