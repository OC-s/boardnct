package com.net.board.control;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.net.board.dto.ReplyDTO;
import com.net.board.service.ReplyService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/reply")
public class ReplyController {
	
	@Autowired
	ReplyService rService;
	
	@ResponseBody
	@RequestMapping("/list")
	public List<ReplyDTO> list(@RequestParam("bno")int bno){
		return rService.getList(bno); 
	}
	
	@PostMapping("/insert")
	@ResponseBody
	public void insert(@ModelAttribute("params")ReplyDTO dto, HttpSession session) {
		String no = (String) session.getAttribute("mno");
		int mno;
		if (no != null) {
			mno = Integer.parseInt(no);
			dto.setMno(mno);
		}
		rService.write(dto);
	}
	
	@PostMapping("/modifyOk")
	@ResponseBody
	public void modify(@ModelAttribute("dto")ReplyDTO dto) {
		rService.modify(dto);
	}
	
	@PostMapping("/delete/{reno}")
	@ResponseBody
	public void delete(@PathVariable int reno) {
		rService.remove(reno);	
	}
	
	
	@GetMapping("/deleteAll")
	@ResponseBody
	public void deleteAll(@RequestParam("bno")int bno) {
		rService.removeAll(bno);
	}
	

}

