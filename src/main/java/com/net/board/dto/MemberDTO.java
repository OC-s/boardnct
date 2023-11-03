package com.net.board.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MemberDTO {
	
	private int mno;
	private String id;
	private String password;
	private String nickname;
	private String created_time;


}
